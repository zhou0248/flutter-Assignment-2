import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<List<Product>> _data;

  @override
  void initState() {
    super.initState();
    _data = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Product>>(
          future: _data,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final data = snapshot.data!;
              return GridView.builder(
                  itemCount: data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      crossAxisCount: 2,
                      mainAxisExtent: 330),
                  itemBuilder: (context, index) {
                    return Card(
                      child: Container(
                        padding: const EdgeInsets.all(4.0),
                        child: Column(children: [
                          Image.network(
                            data[index].thumbnail,
                            width: 80,
                            height: 80,
                            fit: BoxFit.cover,
                          ),
                          Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                data[index].name,
                                style: Theme.of(context).textTheme.titleSmall,
                              )),
                          Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(data[index].description))
                        ]),
                      ),
                    );
                  });
            } else {
              return Center(child: Text('No data!!!'));
            }
          }),
    );
  }

  Future<List<Product>> fetchData() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body)['products'];
      return jsonData
          .map((data) => Product(
              id: data['id'],
              name: data['title'],
              description: data['description'],
              thumbnail: data['thumbnail']))
          .toList();
    } else {
      throw Exception('Have trouble loading data');
    }
  }
}

class Product {
  final int id;
  final String name;
  final String description;
  final String thumbnail;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.thumbnail});
}
