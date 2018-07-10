import 'package:flutter/material.dart';
import '../zoom_scaffold.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:convert';

final Screen loginScreen = new Screen(
title: 'Login Page',
  background: new DecorationImage(
    image: new AssetImage('assets/other_screen_bk.jpg'),
    fit: BoxFit.cover,
    colorFilter: new ColorFilter.mode(const Color(0xCC000000), BlendMode.multiply),
  ),
  contentBuilder: (BuildContext context) {
    return new LoginPage();
  }
);


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

Future<Post> fetchPost() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/posts/1');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    print((json.decode(response.body)));
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State < LoginPage > with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation < double > _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500)
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: new Stack(
        fit: StackFit.expand, //expandir la imagen
        children: < Widget > [
          new Image(
            image: new AssetImage("assets/goku.jpg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: < Widget > [
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new Form(
                child: new Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,
                    inputDecorationTheme: new InputDecorationTheme(
                      labelStyle: new TextStyle(
                        color: Colors.teal,
                        fontSize: 20.0
                      )
                    )
                  ),
                  child: new Container(
                    padding: const EdgeInsets.all(40.0),
                      child: new Column(
                        children: < Widget > [
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter email",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          new TextFormField(
                            decoration: new InputDecoration(
                              labelText: "Enter password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                          new Padding(
                            padding: const EdgeInsets.only(top: 40.0),
                          ),
                          new MaterialButton(
                            height: 40.0,
                            minWidth: 100.0,
                            color: Colors.teal,
                            textColor: Colors.white,
                            child: new Text("Login"),
                            //child: new Icon(Icons.arrow_right),
                            onPressed: () => {
                              'data': fetchPost(),
                            },
                            splashColor: Colors.redAccent,
                          )
                        ],
                      ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}