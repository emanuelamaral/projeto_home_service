enum DaysOfWeek {
  MONDAY,
  TUESDAY,
  WEDNESDAY,
  THURSDAY,
  FRIDAY,
  SATURDAY,
  SUNDAY,
}

DaysOfWeek parseDaysOfWeek(String value) {
  return DaysOfWeek.values
      .firstWhere((e) => e.toString().split('.').last == value);
}
