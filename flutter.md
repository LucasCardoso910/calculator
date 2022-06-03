## Projeto inicial

### main.dart
```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
```

Mudar a cor azul pela verde e mostrar o que o hot restart faz

```dart 
primarySwatch: Colors.green,
```

Deletar o código e mostrar o que o hot reload faz

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
```

## Initial structuring the project
Explain what we are going to need to build this project:

In lib folder, create three folders:
- componentes
- models
- screens

Inside the components folder, create:
- button.dart
- button_row.dart
- display.dart
- keyboard.dart

Inside the models folder, create:
- memory.dart

Inside the screens folder, create:
- calculator.dart

## Creating calculator screen
### main.dart:
```dart
import 'package:flutter/material.dart';
import 'screens/calculator.dart';

void main() {
  runApp(const Calculator());
}
```

### calculator.dart
```dart 
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appChildren = [
      Text("Display"),
      Text("Keyboard"),
    ];

    return MaterialApp(
      home: Column(
        children: appChildren,
      ),
    );
  }
}
```

## Initializing display widget
### display.dart
```dart
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final String text;

  const Display({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
```

### calculator.dart
```dart
import 'package:calculator/components/display.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appChildren = [
      Display(text: '0'),
      Text("Keyboard"),
    ];

    return MaterialApp(
      home: Column(
        children: appChildren,
      ),
    );
  }
```

## Improving display component
`flutter pub add auto_size_text`

### display.dart
Modify build to:
```dart
 @override
  Widget build(BuildContext context) {
    const Color bgColor = Color.fromRGBO(48, 48, 48, 1);
    const displayTextStyle = TextStyle(
      fontWeight: FontWeight.w100,
      decoration: TextDecoration.none,
      fontSize: 80,
      color: Colors.white,
    );

    return Expanded(
      flex: 1, // takes all the space available
      child: Container(
        color: bgColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AutoSizeText(
                text,
                minFontSize: 20,
                maxFontSize: 80,
                maxLines: 1,
                textAlign: TextAlign.end,
                style: displayTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
```

and `import 'package:auto_size_text/auto_size_text.dart';`

## Initialize keyboard component
### keyboard.dart
```dart
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size mediaSize = MediaQuery.of(context).size; // get screen size

    return Container(
      height: mediaSize.height * 0.6, // set height as 60% of screen height
    );
  }
} 
```

### calculator.dart
add `import 'package:calculator/components/keyboard.dart';`
replace `Text("Keyboard"),` by `Keyboard(),`

## Create void buttons just to show them for now
### keyboard.dart
```dart
return Container(
      height: mediaSize.height * 0.6, // set height as 60% of screen height
      child: Column(
        children: [
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
          ElevatedButton(onPressed: () {}, child: buttonLabel),
        ],
      ),
    );
```

## Initialize button component and show them off in the keyboard
### button.dart
```dart
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttonLabel;

  const Button({Key? key, required this.buttonLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: ElevatedButton(
        child: Text(buttonLabel),
        onPressed: () {},
      ),
    );
  }
}
```

### keyboard.dart
replace `ElevatedButton(onPressed: () {}, child: buttonLabel),` by `Button(buttonLabel: '9'),`

## Initialize button row component and create a numeric keyboard
### button_row.dart
```dart
import 'package:calculator/components/button.dart';
import 'package:flutter/material.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;

  const ButtonRow({Key? key, required this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: buttons,
    );
  }
}
```

### keyboard.dart
replace `Button(buttonLabel: '9'),` by 
```dart
ButtonRow(
  buttons: [
    Button(buttonLabel: '7'),
    Button(buttonLabel: '8'),
    Button(buttonLabel: '9'),
  ],
),
```
and the other numbers...

## Expand buttons and create full keyboard
### button_row.dart
Replace return by:
```dart
return Expanded(
  flex: 1,
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: buttons,
  ),
);
```

### keyboard.dart
Keyboard layout:

| AC | % | / | |
|----|---|---|-|
| 7 | 8 | 9 | x |
| 4 | 5 | 6 | - |
| 1 | 2 | 3 | + |
| 0 | . | = |

## making keyboard buttons more pretty
### button.dart
Add to button class:
```dart
  static const labelFont =
      TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w200);
  static const darkGray = Color.fromRGBO(82, 82, 82, 1);
  static const lightGray = Color.fromRGBO(112, 112, 112, 1);
  static const orange = Color.fromRGBO(250, 158, 13, 1);
```

```dart
final bool big;
final Color color;
```

Change constructor to:
```dart
const Button({
  Key? key,
  required this.buttonLabel,
  this.big = false,
  this.color = lightGray,
}) : super(key: key);
```

Change return to:
```dart
return Expanded(
  flex: big ? 2 : 1,
  child: ElevatedButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(color),
    ),
    child: Text(
      buttonLabel,
      style: labelFont,
    ),
    onPressed: () {},
  ),
);
```

Add `big: true` to the constructor of buttons 0 and AC

## Using named constructors
### button.dart
Overload constructors with:
```dart
const Button.big({
  Key? key,
  required this.buttonLabel,
  this.big = true,
  this.color = lightGray,
}) : super(key: key);

const Button.operation({
  Key? key,
  required this.buttonLabel,
  this.big = false,
  this.color = orange,
}) : super(key: key);
```

Change buttons AC and 0 to `Button.big` and /, x, -, +, = to `Button.operation`

## Implement first version of a callback function for button pressing
### keyboard.dart
Pass the colors darkGray to buttons AC and %
```dart
Button.big(buttonLabel: 'AC', color: Button.darkGray, cb: cb),
Button(buttonLabel: '%', color: Button.darkGray, cb: cb)
```

### calculator.dart
Change const variable appChildren to:

`const initialDisplay = Display(text: '0');`

And alter where it was used to:
```dart
children: [
  initialDisplay,
  Keyboard(cb: _onPressed),
],
```

Create callback function on calculator:
```dart
void _onPressed(String text) {
  print(text);
}
```
and pass it to keyboard that will pass it to buttons, where it is called:

### button.dart
`onPressed: () => cb(buttonLabel)`

Don't forget to mark the callback function as required everywhere

## Initialize memory class
### memory.dart
```dart
class Memory {
  String _value = '0';

  String get value => _value;
}
```

## Convert calculator to stateful widget
### calculator.dart
Convert it and add a new variable to the state class:
`final Memory memory = Memory();`

## Change value on display with buttons
### memory.dart
Create new function:
```dart
void applyCommand(String command) {
  _value += command;
}
```

### calculator.dart
change _onPressed function to this:
```dart
void _onPressed(String command) {
  setState(() {
    memory.applyCommand(command);
  });
}
```

remove initialDisplay variable and change it to `Display(text: memory.value),` where it was called before

## Finalize graphic interface
What is missing is some space between buttons:

### keyboard.dart
Create, in the build function, a const variable called spacer: 

`const spacer = SizedBox(height: 1);`

Adds it between each ButtonRow.

### button_row.dart
Inside the build funcion, create a new variable: `const spacer = SizedBox(width: 1);`

To add a tiny space in the keyboard buttons, change the row children in the build class to:
```dart
children: buttons.fold(<Widget>[], (list, button) {
  list.isEmpty ? list.add(button) : list.addAll([spacer, button]);
  return list;
}),
```
The fold function iteratively combine each element of a collection with an 
existing value.
The firs parameter is its initial value, in this case an empty widget list, 
returns the previously element in the second parameter (list), and the new 
element is the third (button).

## Create clear button logic
### memory.dart
```dart
void applyCommand(String command) {
  if (command == 'AC') {
    _allClear();
    return;
  }

  _value += command;
}
```

```dart
_allClear() {
  _value = '0';
}
```

## add digit function
### memory.dart
Create variables inside the class:
```dart
static const operations = ['%', '/', 'x', '-', '+', '='];
final _buffer = [0.0, 0.0];
int bufferIndex = 0;
String operation = '';
bool _wipeValue = true;
```

Change applyCommand function to this:
```dart
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
```

Create _setOperation function:
```dart
_setOperation(String newOperation) {
  _wipeValue = true;
}
```

Create _addDigit function:
```dart
_addDigit(String digit) {
  final isDot = digit == '.';
  if (isDot && _value.contains('.') && !_wipeValue) return;

  final emptyValue = isDot ? '0' : '';
  if (_wipeValue) _value = emptyValue;

  _value += digit;
  _wipeValue = false;

  _buffer[bufferIndex] = double.tryParse(_value) ?? 0;
}
```

add this line to _allClear: `_wipeValue = true;`

## calculate, all_clear and set_operation functions
### memory.dart
Change _setOperation to:
```dart
_setOperation(String newOperation) {
  bool isEqualSign = newOperation == '=';

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
```

Change _allClear to:
```dart
_allClear() {
  _value = '0';
  _buffer.setAll(0, [0, 0]);
  bufferIndex = 0;
  operation = '';
  _wipeValue = true;
}
```

create _calculate function:
```dart
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
```

## isReplacingOperation
Case where the user clicked in two operation buttons in a row.
### memory.dart
Create lastCommand variable inside class: `String lastCommand = '';`

Save lastCommand in the last line of applyCommand function:
```dart
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
```

Create _isReplacingOperation function:
```dart
_isReplacingOperation(String command) {
  return operations.contains(lastCommand) &&
      operations.contains(command) &&
      lastCommand != '=' &&
      command != '=';
}
```

Inside _setOperation check for _isReplacingOperation:
```dart
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