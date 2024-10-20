class DurationCustom {
  final int _milliseconds;

  DurationCustom.fromHours(int hours)
      : _milliseconds = _checkNonNegative(hours * 3600 * 1000);

  DurationCustom.fromMinutes(int minutes)
      : _milliseconds = _checkNonNegative(minutes * 60 * 1000);

  DurationCustom.fromSeconds(int seconds)
      : _milliseconds = _checkNonNegative(seconds * 1000);

  DurationCustom.fromMilliseconds(this._milliseconds);

  // Validate the duration is non-negative
  static int _checkNonNegative(int milliseconds) {
    if (milliseconds < 0) {
      throw ArgumentError('Duration cannot be negative.');
    }
    return milliseconds;
  }

  // Overloaded '>' operator for comparison
  bool operator >(DurationCustom other) => _milliseconds > other._milliseconds;

  // Overloaded '+' operator for addition
  DurationCustom operator +(DurationCustom other) {
    return DurationCustom.fromMilliseconds(_milliseconds + other._milliseconds);
  }

  // Overloaded '-' operator for subtraction
  DurationCustom operator -(DurationCustom other) {
    if (_milliseconds < other._milliseconds) {
      throw ArgumentError('Resulting duration is negative.');
    }
    return DurationCustom.fromMilliseconds(_milliseconds - other._milliseconds);
  }

  // Display duration in a human-readable format
  @override
  String toString() {
    int totalSeconds = (_milliseconds / 1000).round();
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;
    return '$hours h $minutes m $seconds s';
  }
}

void main() {
  var d1 = DurationCustom.fromHours(2); 
  var d2 = DurationCustom.fromMinutes(30);

  print(d1 + d2); 
  print(d1 > d2); 

  try {
    print(d2 - d1);
  } catch (e) {
    print('Error: $e');
  }
}
