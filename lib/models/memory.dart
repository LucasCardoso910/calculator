class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int bufferIndex = 0;
  String operation = '';
  String _value = '0';
  bool _wipeValue = true;

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
      return;
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }
  }

  _setOperation(String newOperation) {
    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == ',';
    if (isDot && _value.contains(',') && !_wipeValue) return;

    final emptyValue = isDot ? '0' : '';
    if (_wipeValue) _value = emptyValue;

    _value += digit;
    _wipeValue = false;

    _buffer[bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _allClear() {
    _value = '0';
    _wipeValue = true;
  }

  String get value => _value;
}
