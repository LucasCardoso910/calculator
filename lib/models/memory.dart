class Memory {
  String _value = '0';

  void applyCommand(String command) {
    if (command == 'AC') {
      _allClear();
      return;
    }

    _value += command;
  }

  _allClear() {
    _value = '0';
  }

  String get value => _value;
}
