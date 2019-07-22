import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
      routes: {
        "new_page": (context) => NewRote(),
        "countWidget": (context) => CounterWidget(),
        "TabBoxA": (context) => TabBoxA(),
        "ParentWidget": (context) => ParentWidget(),
        "ParentWidgetC": (context) => ParentWidgetC(),
        "CupertinoTestRoute": (context) => CupertinoTestRoute(),
        "TextStyleTest": (context) => TextStyleTest(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
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
          // Column is also layout widget. It takes a list of children and
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
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
            FlatButton(
              child: Text("Open new roter"),
              textColor: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                /*  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) {
                          return new NewRote();
                        },
                        fullscreenDialog: true));*/

                Navigator.pushNamed(context, "random_page");
              },
            ),
            RandomWordWidget(),
            FlatButton(
                child: Text("Count widget"),
                onPressed: () {
                  Navigator.pushNamed(context, "countWidget");
                }),
            FlatButton(
                child: Text("TabBoxA"),
                onPressed: () {
                  Navigator.pushNamed(context, "TabBoxA");
                }),
            FlatButton(
                child: Text("ParentWidget"),
                onPressed: () {
                  Navigator.pushNamed(context, "ParentWidget");
                }),
            FlatButton(
                child: Text("ParentWidgetC"),
                onPressed: () {
                  Navigator.pushNamed(context, "ParentWidgetC");
                }),
            FlatButton(
                child: Text("CupertinoTestRoute"),
                onPressed: () {
                  Navigator.pushNamed(context, "CupertinoTestRoute");
                }),
            FlatButton(
                child: Text("TextStyleTest"),
                onPressed: () {
                  Navigator.pushNamed(context, "TextStyleTest");
                }),

            Image(
              image: AssetImage("images/avatar.png"),
              width: 100,
            ),
            
            Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
        width: 100.0,)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRote extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New route"),
      ),
      body: Center(
        child: Text("This is new route"),
      ),
    );
  }
}

class RandomWordWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final word = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(word.toString()),
    );
  }
}

class CounterWidget extends StatefulWidget {
  const CounterWidget({Key key, this.initValue = 0});

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    return new _CounterWidget();
  }
}

class _CounterWidget extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      body: Center(
        child: FlatButton(
          child: Text("$_counter"),
          onPressed: () => setState(() => ++_counter),
        ),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
}

class TabBoxA extends StatefulWidget {
  TabBoxA({Key key}) : super(key: key);

  @override
  State createState() => new _TapBoxAState();
}

class _TapBoxAState extends State<TabBoxA> {
  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child: new Center(
          child: new Text(
            _active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
            color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {
  @override
  _ParentWidgetState createState() => new _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  bool _active = false;

  void _handleTabBoxChanged(bool newValue) {
    setState(() {
      this._active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TabBoxB(active: _active, onChanged: _handleTabBoxChanged),
    );
  }
}

class TabBoxB extends StatelessWidget {
  final bool active;
  final ValueChanged<bool> onChanged;

  TabBoxB({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  void _handleTop() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTop,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? 'Active' : 'Inactive',
            style: new TextStyle(fontSize: 32.0, color: Colors.grey),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
            color: active ? Colors.lightGreen[700] : Colors.grey[600]),
      ),
    );
  }
}

//---------------------------- ParentWidget ----------------------------

class ParentWidgetC extends StatefulWidget {
  @override
  _ParentWidgetCState createState() => new _ParentWidgetCState();
}

class _ParentWidgetCState extends State<ParentWidgetC> {
  bool _active = false;

  void _handleTapboxChanged(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
        active: _active,
        onChanged: _handleTapboxChanged,
      ),
    );
  }
}

class TapboxC extends StatefulWidget {
  TapboxC({Key key, this.active: false, @required this.onChanged})
      : super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  @override
  _TapboxCState createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {
  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() {
      _highlight = true;
    });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    // 在按下时添加绿色边框，当抬起时，取消高亮
    return new GestureDetector(
      onTapDown: _handleTapDown,
      // 处理按下事件
      onTapUp: _handleTapUp,
      // 处理抬起事件
      onTap: _handleTap,
      onTapCancel: _handleTapCancel,
      child: new Container(
        child: new Center(
          child: new Text(widget.active ? 'Active' : 'Inactive',
              style: new TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        width: 200.0,
        height: 200.0,
        decoration: new BoxDecoration(
          color: widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight
              ? new Border.all(
                  color: Colors.teal[700],
                  width: 10.0,
                )
              : null,
        ),
      ),
    );
  }
}

class CupertinoTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CupertinoNavigationBar(
        middle: Text("Cupertino Demo"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CupertinoButton(
              color: CupertinoColors.activeBlue,
              child: Text("Press"),
              onPressed: () {}),
          RaisedButton(
            child: Text("RaisedButton"),
            onPressed: () => {},
          ),
          FlatButton(
            child: Text("RaisedButton"),
            onPressed: () => {},
            disabledColor: Colors.lightGreenAccent,
            //按钮不可用时的颜色
            hoverColor: Colors.lightGreenAccent,
            //指针悬浮到按钮的颜色

            color: Colors.blue,
            highlightColor: Colors.blue[700],
            //按下时的颜色
            colorBrightness: Brightness.dark,
            //按钮的主题
            splashColor: Colors.grey,
            //水波纹的颜色
            padding: EdgeInsets.all(15),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(60)),
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () => {},
          ),
        ],
      )),
    );
  }
}

class TextStyleTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("TextStyleTest"),
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,

          children: <Widget>[
            Text(
              "Hello world",
              textAlign: TextAlign.start,
            ),
            Text(
              "Hello world! I'm Jack. " * 6,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              "Hello world",
              textDirection: TextDirection.rtl,
            )
          ],
        ),
      ),
    );
  }
}

 
