import 'dart:convert';

import 'package:flutter/material.dart';

import '../../constants.dart';
import '../../data/data.dart';
import '../../models/userModel.dart';
import 'detailProduct.dart';

class ProductPage extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final data;

  // ignore: prefer_typing_uninitialized_variables
  static var routeName;
  const ProductPage({super.key, this.data});

  List<Product> decodeData(String jsonData, [data]) {
    final List<dynamic> decoded = json.decode(jsonData);
    return decoded.map((dynamic item) {
      return Product.fromJson(item);
    }).toList();
  }

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        title: Text(widget.data['namaCate']),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                  child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                children: listProduct
                    .where((category) =>
                        category['category'] == widget.data['namaCate'])
                    .map((data) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailProductPage(data: data))),
                      child: Card(
                        elevation: 6,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  image: DecorationImage(
                                      image: AssetImage('${data['gambar']}'),
                                      fit: BoxFit.cover)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data['namaProduct']}',
                              style: const TextStyle(
                                  fontSize: 17,
                                  color: ColorPalette.textColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
