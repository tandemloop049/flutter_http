import 'package:flutter/material.dart';
import 'package:flutter_http/http_methods.dart';
import 'package:flutter_http/http_provider.dart';
import 'package:flutter_http/main.dart';
import 'package:provider/provider.dart';
import 'package:tandemloop/tandemloop.dart';

class GetPage extends StatelessWidget {
  const GetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get method"),
        centerTitle: true,
      ),
      body: Center(
          child: Consumer<HttpProvider>(
        builder: (context, provider, child) => Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  hintText: "Enter the id",
                ),
                onChanged: (value) {
                  provider.changeID(value);
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Fetch data"),
            ),
            const SizedBox(
              height: 30,
            ),
            FutureBuilder<HTTPCRUD>(
              future: HttpMethods.get(provider.idGetMethod),
              builder: (context, snapshot) {
                try {
                  if (snapshot.hasData) {
                    return Column(
                      children: [
                        Text("Product ID - ${snapshot.data!.id}"),
                        Text("Title - ${snapshot.data!.title}"),
                        Text("Price - ${snapshot.data!.price}"),
                        Text("Description - ${snapshot.data!.description}"),
                      ],
                    );
                  }
                } catch (e) {
                  print(e);
                }
                return Column(
                  children: [
                    TltCircularProgressIndicator(
                      activeColor: TltColors.gray,
                      radius: 60,
                      animation: true,
                      showCenter: true,
                      animationDuration: 1000,
                      centerChild: const Text("Loading data"),
                      centerLabelStyle: const TextStyle(fontSize: 15),
                      animationCurve: Curves.linear,
                      width: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Failed to load data - Check if the given ID exists in the server",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
