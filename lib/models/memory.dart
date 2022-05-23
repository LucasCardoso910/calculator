class Memory {
  static const operations = ['%', '/', 'x', '-', '+', '='];

  final _buffer = [0.0, 0.0];
  int bufferIndex = 0;
  String operation = '';
  String _value = '0';
  bool _wipeValue = true;
  String lastCommand = '';

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
      return;
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    lastCommand = command;
  }

  _isReplacingOperation(String command) {
    return operations.contains(lastCommand) &&
        operations.contains(command) &&
        lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String newOperation) {
    bool isEqualSign = newOperation == '=';

    if (_isReplacingOperation(operation)) {
      operation = newOperation;
    }

    if (bufferIndex == 0) {
      if (isEqualSign) return;
      operation = newOperation;
      bufferIndex = 1;
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0;

      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      operation = isEqualSign ? '' : newOperation;
      bufferIndex = isEqualSign ? 0 : 1;
    }

    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    if (isDot && _value.contains('.') && !_wipeValue) return;

    final emptyValue = isDot ? '0' : '';
    if (_wipeValue) _value = emptyValue;

    _value += digit;
    _wipeValue = false;

    _buffer[bufferIndex] = double.tryParse(_value) ?? 0;
  }

  _allClear() {
    _value = '0';
    _buffer.setAll(0, [0, 0]);
    bufferIndex = 0;
    operation = '';
    _wipeValue = true;
  }

  _calculate() {
    switch (operation) {
      case '%':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  String get value => _value;
}
