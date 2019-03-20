import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();
class EventMessageEvent{
  String _message;

  EventMessageEvent(this._message);


}