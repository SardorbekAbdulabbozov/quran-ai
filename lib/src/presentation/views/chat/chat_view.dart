import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:quran_ai/src/config/themes/app_colors.dart';
import 'package:quran_ai/src/config/themes/app_text_styles.dart';
import 'package:quran_ai/src/presentation/blocs/chat/chat_bloc.dart';
import 'package:quran_ai/src/presentation/widgets/chat/message_item.dart';
import 'package:quran_ai/src/presentation/widgets/typing_animation.dart';
import 'package:quran_ai/src/utils/resources/icon/app_icons.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  final chatController = TextEditingController();
  final scrollController = ScrollController();
  late AnimationController _animationController;
  late AnimationController _typingAnimationController;
  late Animation<Offset> _animation;
  late Animation<int> _typingAnimation;
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _typingAnimationController = AnimationController(
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      duration: const Duration(milliseconds: 700),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, -0.7),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _typingAnimation = IntTween(begin: 0, end: 2).animate(
      _typingAnimationController,
    );

    _animationController.forward();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset != 0;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _animationController.dispose();
    _typingAnimationController.dispose();
    chatController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<ChatBloc>();
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) async {
        if (state.input.isEmpty) {
          chatController.text = '';
        }
        if (state.isScrollToBottom || state.isLoading) {
          if (state.isScrollToBottom) {
            await Future.delayed(const Duration(milliseconds: 500));
          }
          scrollController.animateTo(
            scrollController.position.maxScrollExtent * 2,
            duration: const Duration(milliseconds: 500),
            curve: Curves.linear,
          );
        }
        if (state.isLoading) {
          _typingAnimationController.repeat();
        } else {
          _typingAnimationController.stop();
        }
      },
      builder: (context, state) {
        return KeyboardDismisser(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Column(
              children: [
                Expanded(
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: ListView.builder(
                      controller: scrollController,
                      padding: EdgeInsets.zero,
                      physics: const ClampingScrollPhysics(),
                      itemCount: state.messages.length + 1,
                      itemBuilder: (_, i) {
                        GlobalKey queryKey = GlobalKey();
                        return i < state.messages.length
                            ? Padding(
                                padding: EdgeInsets.only(top: i == 0 ? 16 : 0),
                                child: SlideTransition(
                                  position: _animation,
                                  child: MessageItem(
                                    messageKey: queryKey,
                                    content: state.messages[i].content,
                                    isMe: state.messages[i].isMe,
                                    action: () {
                                      if (state.messages[i].isMe) {
                                        RenderBox renderBox = queryKey
                                            .currentContext!
                                            .findRenderObject() as RenderBox;
                                        final position = renderBox
                                            .localToGlobal(Offset.zero);
                                        showMenu(
                                          context: context,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          surfaceTintColor: Colors.white,
                                          position: RelativeRect.fromLTRB(
                                            position.dx,
                                            position.dy + renderBox.size.height,
                                            32,
                                            0,
                                          ),
                                          items: [
                                            PopupMenuItem(
                                              child: Row(
                                                children: [
                                                  const Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 8.0),
                                                    child: Icon(
                                                      Icons.copy,
                                                      size: 18,
                                                    ),
                                                  ),
                                                  Text(
                                                    "Copy",
                                                    style: AppTextStyles.s16w400
                                                        .copyWith(
                                                      color: AppColors.x000000,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              onTap: () async {
                                                await Clipboard.setData(
                                                  ClipboardData(
                                                    text: state
                                                        .messages[i].content,
                                                  ),
                                                );
                                              },
                                            ),
                                          ],
                                          elevation: 8.0,
                                        );
                                      }
                                    },
                                    isLastInMessageQueue: i != 0,
                                    isFailure: state.isFailure &&
                                        i == state.messages.length - 1,
                                  ),
                                ),
                              )
                            : Visibility(
                                visible: state.isLoading,
                                child: TypingAnimation(
                                  typingAnimation: _typingAnimation,
                                ),
                              );
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: isKeyboardVisible
                        ? [
                            const BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 0,
                              blurRadius: 30,
                            ),
                          ]
                        : null,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      left: 16,
                      right: 16,
                      bottom: 8,
                    ),
                    child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 40,
                              child: TextField(
                                style: AppTextStyles.s14w400.copyWith(
                                  color: AppColors.x000000,
                                ),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: AppColors.xFCFCFC,
                                  hintText: "Type your question here...",
                                  hintStyle: AppTextStyles.s14w400.copyWith(
                                    color: AppColors.x8B9298,
                                  ),
                                  focusedBorder: buildOutlineInputBorder(),
                                  disabledBorder: buildOutlineInputBorder(),
                                  enabledBorder: buildOutlineInputBorder(),
                                  errorBorder: buildOutlineInputBorder(
                                    color: Colors.red,
                                  ),
                                  focusedErrorBorder: buildOutlineInputBorder(
                                    color: Colors.red,
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                  ),
                                ),
                                cursorColor: AppColors.x004B40,
                                controller: chatController,
                                onChanged: (input) {
                                  bloc.add(
                                    OnChangedTextFieldEvent(input: input),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: SizedBox(
                              width: 40,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      AppColors.x004B40.withOpacity(0.9),
                                  elevation: 0,
                                  padding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                onPressed: state.input.isEmpty
                                    ? null
                                    : () {
                                        bloc.add(
                                          SendQueryEvent(query: state.input),
                                        );
                                      },
                                child: const RotatedBox(
                                  quarterTurns: 0,
                                  child: Icon(
                                    App.send,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.grey.shade300),
      borderRadius: BorderRadius.circular(6),
    );
  }
}
