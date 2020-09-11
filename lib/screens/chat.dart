import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';

class Chat extends StatefulWidget {
  Chat({Key key, this.title}) : super(key: key);
  final String title;
  static final String id = "chat";

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _editingController = TextEditingController();

  Widget _buildTextComposer(){
    return IconTheme(
      data: IconThemeData(color: Theme.of(context).accentColor),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _editingController,
                onSubmitted: _handleSubmitted,
                decoration: InputDecoration.collapsed(
                  hintText: 'Send a message',
                  hintStyle: TextStyle(fontFamily: 'Lexend Deca')
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                icon: Icon(Icons.send),
                onPressed: () => _handleSubmitted(_editingController.text),
              )
            )
          ],
        )
      )
    );
  }

  void getResponse(query) async {
    _editingController.clear();
    AuthGoogle authGoogle = await AuthGoogle(fileJson: 'assets/creds.json').build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogflow.detectIntent(query);
    ChatMessage message = ChatMessage(
      text: response.getMessage() ??
              CardDialogflow(response.getListMessage()[0]).title,
      name: 'Bot',
      type: false
    );
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleSubmitted(String text){
    _editingController.clear();
    ChatMessage message = ChatMessage(
      text: text,
      name: 'You',
      type: true
    );
    setState(() {
      _messages.insert(0, message);
    });
    getResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Chat',
          style: TextStyle(fontFamily: 'Lexend Deca')
        )
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            )
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor),
            child: _buildTextComposer()
          )
        ],
      )
    );
  }
}

class ChatMessage extends StatelessWidget {
  ChatMessage({ this.text, this.name, this.type });

  final String text;
  final String name;
  final bool type;

  List<Widget> otherMessage(context){
    return <Widget>[
      Container(
        margin: const EdgeInsets.only(right: 16.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/bot-dp.jpg')
        )
      ),
      Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lexend Deca'
                )
              ),
              Container(
                margin: const EdgeInsets.only(top: 5.0),
                child: Text(
                  text,
                  style: TextStyle(fontFamily: 'Lexend Deca')
                )
              )
            ],
          )
      )
    ];
  }

  List<Widget> myMessage(context){
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              this.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Lexend Deca'
              )
            ),
            Container(
              margin: const EdgeInsets.only(top: 5.0),
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'Lexend Deca'
                )
              )
            )
          ],
        )
      ),
      Container(
        margin: const EdgeInsets.only(left: 16.0),
        child: CircleAvatar(
          child: Text(
            this.name[0],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'Lexend Deca'
            )
          )
        )
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: this.type
                  ? myMessage(context)
                  : otherMessage(context)
      )
    );
  }
}