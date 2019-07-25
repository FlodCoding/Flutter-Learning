import 'dart:convert';
import 'dart:io';

import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';

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
        "RowPage": (context) => RowPage(),
        "FlexLayoutTestRoute": (context) => FlexLayoutTestRoute(),
        "ScrollableTest": (context) => ScrollableTest(),
        "ListViewTest": (context) => ListViewTest(),
        "InfiniteListTest": (context) => InfiniteListTest(),
        "CustomScrollViewTestRoute": (context) => CustomScrollViewTestRoute(),
        "ThemeTestRoute": (context) => ThemeTestRoute(),
        "GestureDetectorTestRoute": (context) => GestureDetectorTestRoute(),
        "_Drag": (context) => _Drag(),
        "_DragVertical": (context) => _DragVertical(),
        "ScaleTestRoute": (context) => ScaleTestRoute(),
        "FileOperationRoute": (context) => FileOperationRoute(),
        "HttpTestRoute": (context) => HttpTestRoute(),
        "DioTestPage": (context) => DioTestPage(),
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
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  TextEditingController _nameController = new TextEditingController();

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.addListener(() {
      // print(_nameController.text);
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
    String icons = "";
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
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
          scrollDirection: Axis.vertical,

          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.display1,
                ),
                /*  FlatButton(
              child: Text("Open new roter"),
              textColor: Colors.blue,
              colorBrightness: Brightness.dark,
              onPressed: () {
                */ /*  Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) {
                          return new NewRote();
                        },
                        fullscreenDialog: true));*/ /*

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
            Text(icons,
                style: TextStyle(
                    fontFamily: "MaterialIcons",
                    fontSize: 24.0,
                    color: Colors.green)),
            Switch(
              value: _switchSelected,
              onChanged: (value) {
                setState(() {
                  _switchSelected = value;
                });
              },
            ),*/
                /*   TextField(
                  controller: _nameController,
                  onChanged: (string) {
                    print("onChange: $string");
                  },
                  decoration: InputDecoration(
                      labelText: "用户名", prefixIcon: Icon(Icons.person)),
                ),
                TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: "密码", prefixIcon: Icon(Icons.lock))),*/
                FlatButton(
                    child: Text("RowPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "RowPage");
                    }),
                FlatButton(
                    child: Text("FlexLayoutTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "FlexLayoutTestRoute");
                    }),
                FlatButton(
                    child: Text("ScrollableTest"),
                    onPressed: () {
                      Navigator.pushNamed(context, "ScrollableTest");
                    }),
                FlatButton(
                    child: Text("ListViewTest"),
                    onPressed: () {
                      Navigator.pushNamed(context, "ListViewTest");
                    }),
                FlatButton(
                    child: Text("InfiniteListTest"),
                    onPressed: () {
                      Navigator.pushNamed(context, "InfiniteListTest");
                    }),
                FlatButton(
                    child: Text("CustomScrollViewTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "CustomScrollViewTestRoute");
                    }),
                FlatButton(
                    child: Text("ThemeTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "ThemeTestRoute");
                    }),
                FlatButton(
                    child: Text("GestureDetectorTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "GestureDetectorTestRoute");
                    }),
                FlatButton(
                    child: Text("_Drag"),
                    onPressed: () {
                      Navigator.pushNamed(context, "_Drag");
                    }),
                FlatButton(
                    child: Text("_DragVertical"),
                    onPressed: () {
                      Navigator.pushNamed(context, "_DragVertical");
                    }),
                FlatButton(
                    child: Text("ScaleTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "ScaleTestRoute");
                    }),
                FlatButton(
                    child: Text("FileOperationRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "FileOperationRoute");
                    }),
                FlatButton(
                    child: Text("HttpTestRoute"),
                    onPressed: () {
                      Navigator.pushNamed(context, "HttpTestRoute");
                    }),
                FlatButton(
                    child: Text("DioTestPage"),
                    onPressed: () {
                      Navigator.pushNamed(context, "DioTestPage");
                    }),
              ],
            ),
          ),
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
    final word = new WordPair.random(maxSyllables: 100 * 100 * 100);
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

//线性布局Row Column
class RowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text("hello world"), Text("i m flod")],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: <Widget>[Text("hello world"), Text("i m flod")],
              )
            ],
          ),
        ));
  }
}

class FlexLayoutTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: Container(
                  height: 80,
                  color: Colors.blue,
                )),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.amber,
              ),
            )
          ],
        )
      ],
    );
  }
}

class ScrollableTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.all(16),
      child: Center(
        child: Row(
          verticalDirection: VerticalDirection.down,
          children: str
              .split("")
              .map((c) => Text(
                    c,
                    textScaleFactor: 2,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class ListViewTest extends StatelessWidget {
  Widget divider = Divider(color: Colors.lightGreen);
  Widget divider2 = Divider(color: Colors.blue);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text("$index"),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? divider : divider2;
          },
          itemCount: 100),
    );
  }
}

class InfiniteListTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfiniteListTestState();
  }
}

class _InfiniteListTestState extends State<InfiniteListTest> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: ListView.separated(
          itemBuilder: (context, index) {
            //如果到了表尾
            if (_words[index] == loadingTag) {
              //不足100条，继续获取数据
              if (_words.length - 1 < 100) {
                //获取数据
                _retrieveData();
                //加载时显示loading
                return Container(
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 24.0,
                      height: 24.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0)),
                );
              } else {
                //已经加载了100条数据，不再获取数据。
                return Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "没有更多了",
                      style: TextStyle(color: Colors.grey),
                    ));
              }
            }
            //显示单词列表项
            return ListTile(title: Text(_words[index]));
          },
          separatorBuilder: (context, index) => Divider(height: .0),
          itemCount: _words.length),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(
          //从##loading## 前面插入
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {
        //重新构建列表
      });
    });
  }
}

class CustomScrollViewTestRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text("sss"),
            centerTitle: true,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Image.asset(
                "./images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: new SliverGrid(
              //Grid
              gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //Grid按两列显示
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  //创建子widget
                  return new Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: new Text('grid item $index'),
                  );
                },
                childCount: 20,
              ),
            ),
          ),

          //List
          new SliverFixedExtentList(
            itemExtent: 50.0,
            delegate: new SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              //创建列表项
              return new Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: new Text('list item $index'),
              );
            }, childCount: 50 //50个列表项
                ),
          ),
        ],
      ),
    );
  }
}

class ThemeTestRoute extends StatefulWidget {
  @override
  _ThemeTestRouteState createState() => new _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  Color _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
      data: ThemeData(
          primarySwatch: _themeColor, //用于导航栏、FloatingActionButton的背景色等
          iconTheme: IconThemeData(color: _themeColor) //用于Icon颜色
          ),
      child: Scaffold(
        appBar: AppBar(title: Text("主题测试")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //第一行Icon使用主题中的iconTheme
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Icon(Icons.favorite),
              Icon(Icons.airport_shuttle),
              Text("  颜色跟随主题")
            ]),
            //为第二行Icon自定义颜色（固定为黑色)
            Theme(
              data: themeData.copyWith(
                iconTheme: themeData.iconTheme.copyWith(color: Colors.black),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text("  颜色固定黑色")
                  ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () => //切换主题
                setState(() => _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal),
            child: Icon(Icons.palette)),
      ),
    );
  }
}

class GestureDetectorTestRoute extends StatefulWidget {
  @override
  _GestureDetectorTestRouteState createState() =>
      new _GestureDetectorTestRouteState();
}

class _GestureDetectorTestRouteState extends State<GestureDetectorTestRoute> {
  String _operation = "No Gesture detected!"; //保存事件名
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateText("Tap"), //点击
          onDoubleTap: () => updateText("DoubleTap"), //双击
          onLongPress: () => updateText("LongPress"), //长按
        ),
      ),
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

class _Drag extends StatefulWidget {
  @override
  _DragState createState() => new _DragState();
}

class _DragState extends State<_Drag> with SingleTickerProviderStateMixin {
  double _top = 100; //距顶部的偏移
  double _left = 100; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          left: _left,
          child: GestureDetector(
            child: CircleAvatar(child: Text("A")),
            //手指按下时会触发此回调
            onPanDown: (DragDownDetails e) {
              //打印手指按下的位置(相对于屏幕)
              print("用户手指按下：${e.globalPosition}");
            },
            //手指滑动时会触发此回调
            onPanUpdate: (DragUpdateDetails e) {
              //用户手指滑动时，更新偏移，重新构建
              setState(() {
                _left += e.delta.dx;
                _top += e.delta.dy;
              });
            },
            onPanEnd: (DragEndDetails e) {
              //打印滑动结束时在x、y轴上的速度
              print(e.velocity);
            },
          ),
        )
      ],
    );
  }
}

class _DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => new _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 200;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: _top,
          child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              }),
        )
      ],
    );
  }
}

class ScaleTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ScaleTestRouteState();
  }
}

class _ScaleTestRouteState extends State<ScaleTestRoute> {
  double _width = 300.0; //通过修改图片宽度来达到缩放效果

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        //指定宽度，高度自适应
        child: Image.asset("./images/img2.png", width: _width),
        onScaleUpdate: (ScaleUpdateDetails details) {
          setState(() {
            //缩放倍数在0.8到10倍之间
            _width = 300 * details.scale.clamp(.8, 10.0);
          });
        },
      ),
    );
  }
}

typedef void EventCallback(arg);

class EventBus {
  //私有构造函数
  EventBus._internal();

  //保存单例
  static EventBus _singleton = new EventBus._internal();

  //工厂构造函数
  factory EventBus() => _singleton;

  //保存事件订阅者队列，key:事件名(id)，value: 对应事件的订阅者队列
  var _emap = new Map<Object, List<EventCallback>>();

  //添加订阅者
  void on(eventName, EventCallback f) {
    if (eventName == null || f == null) return;
    _emap[eventName] ??= new List<EventCallback>();
    _emap[eventName].add(f);
  }

  //移除订阅者
  void off(eventName, [EventCallback f]) {
    var list = _emap[eventName];
    if (eventName == null || list == null) return;
    if (f == null) {
      _emap[eventName] = null;
    } else {
      list.remove(f);
    }
  }

  //触发事件，事件触发后该事件所有订阅者会被调用
  void emit(eventName, [arg]) {
    var list = _emap[eventName];
    if (list == null) return;
    int len = list.length - 1;
    //反向遍历，防止在订阅者在回调中移除自身带来的下标错位
    for (var i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

class FileOperationRoute extends StatefulWidget {
  FileOperationRoute({Key key}) : super(key: key);

  @override
  _FileOperationRouteState createState() => new _FileOperationRouteState();
}

class _FileOperationRouteState extends State<FileOperationRoute> {
  int _counter;

  @override
  void initState() {
    super.initState();
    //从文件读取点击次数
    _readCounter().then((int value) {
      setState(() {
        _counter = value;
      });
    });
  }

  Future<File> _getLocalFile() async {
    // 获取应用目录
    String dir = (await getApplicationDocumentsDirectory()).path;
    return new File('$dir/counter.txt');
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      // 读取点击次数（以字符串）
      String contents = await file.readAsString();
      return int.parse(contents);
    } on FileSystemException {
      return 0;
    }
  }

  Future<Null> _incrementCounter() async {
    setState(() {
      _counter++;
    });
    // 将点击次数以字符串类型写到文件中
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('文件操作')),
      body: new Center(
        child: new Text('点击了 $_counter 次'),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class HttpTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HttpTestRouteState();
  }
}

class _HttpTestRouteState extends State<HttpTestRoute> {
  bool _loading = false;
  String _string = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('_HttpTestRouteState'),
      ),
      body: new Center(
          child: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Column(
          children: <Widget>[
            RaisedButton(
                child: Text("获取"),
                onPressed: _loading
                    ? null
                    : () async {
                        setState(() {
                          _loading = true;
                          _string = "正在请求";
                        });

                        try {
                          HttpClient client = new HttpClient();
                          HttpClientRequest request = await client
                              .getUrl(Uri.parse("https://www.baidu.com"));
                          request.headers.add("user-agent",
                              "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1");
                          HttpClientResponse response = await request.close();

                          _string =
                              await response.transform(utf8.decoder).join();
                          print(response.headers);
                          //关闭client后，通过该client发起的所有请求都会中止。
                          client.close();
                        } catch (e) {
                          ;
                          _string = "请求失败：$e";
                        } finally {
                          setState(() {
                            _loading = false;
                          });
                        }
                      }),
            Container(
                width: MediaQuery.of(context).size.width - 50.0,
                child: Text(_string.replaceAll(new RegExp(r"\s"), "")))
          ],
        ),
      )),
    );
  }
}

class DioTestPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _DioTestPageState();
  }
}

class _DioTestPageState extends State<DioTestPage> {
  String str = "";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("DioTestPage"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              child: Text("getBaidu"),
              onPressed: () async {
                try {
                  Response resonese = await Dio().get("http://www.baidu.com");
                  setState(() {
                    str = resonese.toString();
                  });
                } catch (e) {
                  print(e);
                }
              },
            ),
            Text(str)
          ],
        ),
      ),
    );
  }
}
