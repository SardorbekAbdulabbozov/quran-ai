import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'chat_event.dart';

part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc()
      : super(
          const ChatState(
            messages: [
              MessageModel(
                content: 'Assalomu Alaykum, Sardorbek Abdulabbozov!',
                isMe: false,
              ),
              MessageModel(
                content: "How can I help you?",
                isMe: false,
              ),
            ],
          ),
        ) {
    on<OnChangedTextFieldEvent>(_onChanged);
    on<SendQueryEvent>(_sendQuery);
  }

  Future<void> _onChanged(
    OnChangedTextFieldEvent event,
    Emitter<ChatState> emit,
  ) async {
    emit(state.copyWith(input: event.input, isScrollToBottom: false));
  }

  Future<void> _sendQuery(
    SendQueryEvent event,
    Emitter<ChatState> emit,
  ) async {
    List<MessageModel> messages = List.from(state.messages);
    if (!event.isResendEvent) {
      messages.add(MessageModel(content: event.query, isMe: true));
    }
    emit(
      state.copyWith(
        messages: messages,
        input: '',
        isLoading: true,
      ),
    );

    int index = 0;
    await Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        index = 10;
      },
    );

    if (index == 10) {
      messages.add(
        const MessageModel(
          content:
              "This feature is under development, thanks for your patience!",
          isMe: false,
        ),
      );
      emit(
        state.copyWith(
          isLoading: false,
          messages: messages,
          input: '',
          isFailure: false,
          isScrollToBottom: true,
        ),
      );
    }
  }
}
