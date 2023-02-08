import 'dart:convert';

import 'package:flutter_http/main.dart';
import 'package:http/http.dart' as http;

class HttpMethods {
  static Future<HTTPCRUD> get(int id) async {
    /// Since a method that takes some time cannot return immediately, it will return the promise of
    /// delivering a value when it's done. That is called a Future.
    /// So the promise to load a number from the database would return a Future<int> while
    /// the promise to return a list of movies from an internet search might return a
    /// Future<List<Movie>>.

    /// Future is a core Dart class for working with async operations. A Future object
    /// represents a potential value or error that will be available at some time in the future.

    final url = Uri.parse("http://10.0.2.2:3000/products/$id");
    final response = await http.get(url);
    // The get method takes in only URI(Uniform Resource Identifier) which is a superset of URL and not
    // string. So, we need to convert from URL to URI using URI.parse().

    // Here, the get() method returns an instance of 'Response'. Actually, the method "promises" to
    // return the 'Response' but not immediately. That's why its returning an instance of Future<Repsonse>.

    // As the get() method returns an instance of Future<T>, in order to get the actual instance 'T'
    // and not Future<T>, we need to wait for get() method to return the 'Response' instance.
    // The framework being asynchronous, we can ask it to continue execution while waiting for get()
    // to return using the 'await' keyword. Using the await means, the function calling the get()
    // should be made asynchronous using 'async'.
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.

      // Here, we are returning an HTTPCRUD class using a factory constructor. The decoded values
      // reponse.body is "mapped" to repsective values defined in the factory constructor.
      // See the factory constructor defined to see the decoded values from response.body being mapped.
      return HTTPCRUD.fromJSON(
        json.decode(response.body),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception("Failed to load the data");
    }

    // print(response.statusCode);
    // // If the statusCode is 200, this means that we found the file we are looking for and the
    // // the statusCode of 404, means that we cannot find the file in the mentioned URL.

    // print(response.body);
    // var jsonResponse = json.decode(response.body);
    // print(jsonResponse);
  }

  static Future<HTTPCRUD> putRequest() async {
    var url = Uri.parse("http://10.0.2.2:3000/reviews/1");

    // The entire content for the product ID gets updated while completely wiping out the previous
    // content.
    var updateData = jsonEncode(
      <String, Object>{
        "comment using put method":
            "Updated Review - using put() method 2 for product id 30",
      },
    );
    // HTTP Headers: The http headers let the client and the server pass additional
    // information along with an http request or response.
    // Ex: Request headers, Response headers etc.

    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.put(url, body: updateData, headers: headers);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HTTPCRUD.fromJSON(
        json.decode(response.body),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception("Failed to load the data");
    }
  }

  static Future<HTTPCRUD> patchRequest() async {
    var url = Uri.parse("http://10.0.2.2:3000/reviews/1");

    // The difference between put and patch is that the patch method only updates the data where the
    // changes were made while keeping the unchanged data same. Whereas the put() completely replaces
    // the previous one with the updated one.
    var updateData = jsonEncode(
      <String, Object>{
        "comment using patch method":
            "Updated Review 2 - using patch() for product id 50",
        "productID": 4,
      },
    );
    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    var response = await http.put(url, body: updateData, headers: headers);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HTTPCRUD.fromJSON(
        json.decode(response.body),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception("Failed to load the data");
    }
  }

  static Future<HTTPCRUD> postRequest() async {
    // Note: The only requirement is that to be valid JSON Api, it must have an id field as part of
    // the resource object itself.
    // This is required resource metadata for the entire structure to function correctly.
    var url = Uri.parse("http://10.0.2.2:3000/products");

    var postData = <String, Object>{
      "rating": 10,
      "comment": "Review 2 for product id 49",
      "productID": 2
    };

    // Both jsonEncode and json.encode is actually the same. They convert the given object to string.
    var postDataString = json.encode(postData);

    var headers = <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };
    // var obj = DummyClass();
    var response = await http.post(url, body: postDataString, headers: headers);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HTTPCRUD.fromJSON(
        json.decode(response.body),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception("Failed to load the data");
    }
  }

  static Future<HTTPCRUD> deleteRequest() async {
    var url = Uri.parse("http://10.0.2.2:3000/products/2");
    var response = await http.delete(url);
    // If the deleteRequest deletes the data for the given ID then what's the use of body property
    // for the delete().
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return HTTPCRUD.fromJSON(
        json.decode(response.body),
      );
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception("Failed to load the data");
    }
  }
}
