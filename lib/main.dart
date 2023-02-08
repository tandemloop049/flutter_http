import 'package:flutter/material.dart';
import 'package:flutter_http/delete_method.dart';
import 'package:flutter_http/get_method.dart';
import 'package:flutter_http/http_provider.dart';
import 'package:flutter_http/patch_method.dart';
import 'package:flutter_http/post_method.dart';
import 'package:flutter_http/put_method.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => HttpProvider(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GetPage(),
                  ),
                );
              },
              child: Text("Get"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PutMethod(),
                  ),
                );
              },
              child: Text("Put"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostMethod(),
                  ),
                );
              },
              child: Text("Post"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DeleteMethod(),
                  ),
                );
              },
              child: Text("Delete"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PatchMethod(),
                  ),
                );
              },
              child: Text("Patch"),
            ),
          ],
        ),
      ),
    );
  }
}

// class DummyClass {
//   String name = "Sumanth";
//   int age = 24;
// }

class HTTPCRUD {
  const HTTPCRUD({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
  });

  final int id;
  final String title;
  final int price;
  final String description;

  /// A factory constructor is a constructor that can be used when you don't necessarily want a constructor to create a new instance of your class.
  /// This might be useful if you hold instances of your class in memory and don't want to create a new one each time (or if the operation of creating an instance is costly).
  factory HTTPCRUD.fromJSON(json) {
    return HTTPCRUD(
      id: json['id'] ?? -1,
      title: json['title'] ?? "",
      price: json['price'] ?? -2,
      description: json['description'] ?? "",
    );
  }
}
