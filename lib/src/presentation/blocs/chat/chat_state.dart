part of 'chat_bloc.dart';

class ChatState extends Equatable {
  final bool isLoading;
  final bool isFailure;
  final bool isVolumeOn;
  final bool isScrollToBottom;
  final String input;
  final List<MessageModel> messages;

  const ChatState({
    this.input = '',
    this.isFailure = false,
    this.isLoading = false,
    this.isVolumeOn = false,
    this.isScrollToBottom = false,
    required this.messages,
  });

  ChatState copyWith({
    bool? isFailure,
    bool? isVolumeOn,
    bool? isScrollToBottom,
    List<MessageModel>? messages,
    String? input,
    bool? isLoading,
  }) {
    return ChatState(
      isVolumeOn: isVolumeOn ?? this.isVolumeOn,
      messages: messages ?? this.messages,
      input: input ?? this.input,
      isLoading: isLoading ?? this.isLoading,
      isFailure: isFailure ?? this.isFailure,
      isScrollToBottom: isScrollToBottom ?? this.isScrollToBottom,
    );
  }

  @override
  List<Object?> get props =>
      [isVolumeOn, input, messages, isLoading, isFailure, isScrollToBottom];
}

class MessageModel {
  final String content;
  final bool isMe;

  const MessageModel({
    required this.content,
    required this.isMe,
  });
}
