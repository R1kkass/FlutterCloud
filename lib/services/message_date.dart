class MessageDate {
  String date(DateTime time) {
    try {
      var difference = DateTime.now().toLocal().difference(time);

      if (difference.inDays ~/ 365 > 0) {
        return "${addZero(time.day)}.${addZero(time.month)}.${time.year.toString().substring(2)}";
      }

      if (difference.inDays ~/ 7 > 0) {
        return "${time.day} ${month[time.month]}";
      }

      if (difference.inDays > 0) {
        return "${weekDay[time.weekday]}";
      }

      return "${addZero(time.hour)}:${addZero(time.minute)}";
    } catch (e) {
      return "";
    }
  }

  String addZero(int number) {
    return "${number < 10 ? "0$number" : number}";
  }

  final weekDay = {
    1: "пн",
    2: "вт",
    3: "ср",
    4: "чт",
    5: "пт",
    6: "сб",
    7: "вс"
  };

  final month = {
    1: "янв.",
    2: "февр.",
    3: "мар.",
    4: "апр.",
    5: "мая",
    6: "июн.",
    7: "июл.",
    8: "авг.",
    9: "сент.",
    10: "окт.",
    11: "нояб.",
    12: "дек.",
  };
}
