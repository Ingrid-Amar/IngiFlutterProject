import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';

/// Example event class.
class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}


/// Example events.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(1, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item * 5),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
    ],
    DateTime(kToday.year, 12, 25):[
      Event('Christmas Day'),
    ],
    DateTime(kToday.year, 1, 1):[
      Event('New Year\'s Day'),
    ],
    DateTime(kToday.year, 12, 31):[
      Event('New Year\'s Eve Day'),
    ],
    DateTime(kToday.year, 1, 15):[
      Event('Martin Luther King, Jr. Day'),
    ],
    DateTime(kToday.year, 2, 19):[
      Event('President\'s Day'),
    ],
    DateTime(kToday.year, 2, 14):[
      Event('Valentine\'s Day'),
    ],
    DateTime(kToday.year, 2, 14):[
      Event('Ash Wednesday'),
    ],
    DateTime(kToday.year, 3, 17):[
      Event('St. Patrick\'s Day'),
    ],
    DateTime(kToday.year, 3, 31):[
      Event('Easter Sunday'),
    ],
    DateTime(kToday.year, 5, 4):[
      Event('Kentucky Derby'),
    ],
    DateTime(kToday.year, 5, 27):[
      Event('Memorial Day'),
    ],
    DateTime(kToday.year, 6, 19):[
      Event('Juneteenth'),
    ],
    DateTime(kToday.year, 7, 4):[
      Event('Indepence Day'),
    ],
    DateTime(kToday.year, 8, 2):[
      Event('Labor Day'),
    ],
    DateTime(kToday.year, 10, 14):[
      Event('Columbus Day'),
    ],
    DateTime(kToday.year, 10, 31):[
      Event('Halloween'),
    ],
    DateTime(kToday.year, 11, 11):[
      Event('Veterans Day'),
    ],
    DateTime(kToday.year, 11, 28):[
      Event('Thanksgiving Day'),
    ],
    DateTime(kToday.year, 12, 24):[
      Event('Christmas Eve'),
    ],
    DateTime(kToday.year, 4, 15):[
      Event('Project Due Date'),
    ],

  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 12, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 12, kToday.day);

