import "dart:convert";

import "package:flutter/material.dart";
import "package:http/http.dart" as http;

class ApiServices {
  static Future<dynamic> blogFetcher() async {
    // Futuren<dynamic> blogs = [];
    const String url = 'https://intent-kit-16.hasura.app/api/rest/blogs';
    const String adminSecret =
        '32qR4KmXOIpsGPQKMqEJHGJS27G5s7HdSKO3gdtQd2kv5e852SiYwWNfxkZOBuQ6';

    try {
    final response = await http.get(Uri.parse(url), headers: {
      'x-hasura-admin-secret': adminSecret,
    });

    if (response.statusCode == 200) {
      final body = response.body;
      final jsonData = jsonDecode(body);
      // blogs = jsonData["blogs"];
      return jsonData["blogs"];
    }
    }
    catch (e) {
      throw Exception("Fetching Deathlock");
    }
  }
}
