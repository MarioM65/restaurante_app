class Reservation {
  final int numberOfPeople;
  final DateTime date;
  final DateTime time;

  Reservation({
    required this.numberOfPeople,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'numberOfPeople': numberOfPeople,
      'date': date.toIso8601String().split('T').first, // YYYY-MM-DD
      'time': time.toUtc().toIso8601String(), // e.g., '18:30:00.000Z'
    };
  }
}