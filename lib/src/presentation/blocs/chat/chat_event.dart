part of 'chat_bloc.dart';

abstract class ChatEvent extends Equatable {
  const ChatEvent();
}

class OnChangedTextFieldEvent extends ChatEvent {
  final String input;

  const OnChangedTextFieldEvent({required this.input});

  @override
  List<Object?> get props => [input];
}

class SendQueryEvent extends ChatEvent {
  final String query;
  final bool isResendEvent;

  const SendQueryEvent({
    required this.query,
    this.isResendEvent = false,
  });

  @override
  List<Object?> get props => [query, isResendEvent];
}
