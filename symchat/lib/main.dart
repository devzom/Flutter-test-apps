import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp((SymChatApp()));

class SymChatApp extends StatelessWidget {
  //add targetPlatform specific theme
  final iOSTheme = new ThemeData(
      primarySwatch: Colors.orange,
      primaryColor: Colors.grey[100],
      primaryColorBrightness: Brightness.light);

  final defaultTheme = new ThemeData(
      primarySwatch: Colors.indigo,
      accentColor: Colors.indigo[500],
      primaryColorBrightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'SymChat',
        // check the actual platform and sets the proper theme getter from upper final spec
        theme: defaultTargetPlatform == TargetPlatform.iOS
            ? iOSTheme
            : defaultTheme,
        home: new ChatScreen());
  }
}

class ChatScreen extends StatefulWidget {
  @override
  ChatScreenState createState() => ChatScreenState();
}

//added MIXIN to reuse class body in multiple classes
class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  // define controller for text input operations
  final TextEditingController _textController = new TextEditingController();

  // init a empty list of message when there's none
  final List<ChatMessage> _message = <ChatMessage>[];

  //make SEND button context-aware and change it's appearance due to state of inputTextField whether is empty or not
  bool _isComposing = false;

  //add animation contoller
  @override
  void dispose() {
    for (ChatMessage message in _message) message.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('SymChat'),
        // leading: Icon(Icons.person),
        centerTitle: true,
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 1.0 : 6.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new Flexible(
              child: ListView.builder(
                padding: EdgeInsets.all(8.0),
                reverse: true,
                itemBuilder: (_, int index) => _message[index],
                itemCount: _message.length,
              ),
            ),
            Divider(height: 1),
            Container(
                decoration: Theme.of(context).platform == TargetPlatform.iOS
                    ? BoxDecoration(
                        border:
                            Border(top: BorderSide(color: Colors.grey[200])))
                    : null,
                child: _buildTextComposer()),
          ],
        ),
      ),
    );
  }

  Widget _buildTextComposer() {
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Row(
          children: <Widget>[
            Flexible(
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    InputDecoration.collapsed(hintText: "How we can help You?"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 6.0),
                child: Theme.of(context).platform == TargetPlatform.iOS
                    ? CupertinoButton(
                        child: Text("Send"),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null)
                    : FlatButton(
                        child: Icon(Icons.send),
                        onPressed: _isComposing
                            ? () => _handleSubmitted(_textController.text)
                            : null))
          ],
        ),
      ),
    );
  }

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });

    ChatMessage message = new ChatMessage(
      text: text,
      animationController: AnimationController(
          vsync: this, duration: Duration(milliseconds: 500)),
    );

    setState(() {
      _message.insert(0, message);
    });

    //specifing that animation should play forward only
    message.animationController.forward();
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;

  //add a member to store animation controller
  final AnimationController animationController;

  static const String _name = "Jacob";

  @override
  Widget build(BuildContext context) {
    var dateTime = DateTime.now();
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      child: Container(
          margin: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 12),
                child: CircleAvatar(
                  child: Text(
                    _name[0],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(_name,
                            style: Theme.of(context).textTheme.headline3),
                        Text(DateFormat('kk:mm').format(dateTime),
                            style: TextStyle(fontSize: 8)),
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(top: 5), child: Text(text)),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
