class MessageDate {
  String date(String time) {
    try {
      DateTime timeParse = DateTime.parse(time).toLocal();
      var difference = DateTime.now().toLocal().difference(timeParse);
      var day =
          DateTime.now().subtract(Duration(days: difference.inDays)).toLocal();
      if (difference.inDays ~/ 365 > 0) {
        return "${addZero(day.day)}.${addZero(day.month)}.${day.year.toString().substring(2)}";
      }

      if (difference.inDays ~/ 7 > 0) {
        return "${day.day} ${month[day.month]}";
      }

      if (difference.inDays > 0) {
        return "${weekDay[day.weekday]}";
      }

      return "${addZero(day.hour)}:${addZero(day.minute)}";
    } catch (e) {
      return "";
    }
  }

  addZero(int number) {
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
