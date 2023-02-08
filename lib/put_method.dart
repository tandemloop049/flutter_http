import 'package:flutter/material.dart';
import 'package:flutter_http/http_methods.dart';
import 'package:flutter_http/main.dart';

class PutMethod extends StatelessWidget {
  const PutMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("View the results of 'put' method"),
      ),
      body: Center(
        child: FutureBuilder<HTTPCRUD>(
          future: HttpMethods.putRequest(),
          builder: (context, snapshot) {
            try {
              if (snapshot.hasData) {
                return const Center();
              }
            } catch (e) {
              print(e);
            }
            return Column(
              children: const [
                Text(
                  "The data has been added. Take a look at the JSON file in the server.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                CircularProgressIndicator(),
              ],
            );
          },
        ),
      ),
    );
  }
}
