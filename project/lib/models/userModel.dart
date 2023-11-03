// ignore: file_names
import 'package:flutter/material.dart';

import '../data/data.dart';

class UserModel {
  final String id;
  final ImageProvider? profil;
  final String username;
  final String email;
  final String? noHp;
  final String? gender;
  final String? dateOfBirth;
  final String password;

  UserModel({
    required this.id,
    this.profil,
    required this.username,
    required this.email,
    this.noHp,
    this.gender,
    this.dateOfBirth,
    required this.password,
  });
}

class Product {
  String barcode;
  String pemasok;
  String gambar;
  String namaProduct;
  String category;
  String deskripsi;
  String exp;
  String tglMasuk;
  int sold;
  int stok;

  Product({
    required this.barcode,
    required this.pemasok,
    required this.gambar,
    required this.namaProduct,
    required this.category,
    required this.deskripsi,
    required this.exp,
    required this.tglMasuk,
    required this.sold,
    required this.stok,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      barcode: json['barcode'],
      pemasok: json['pemasok'],
      gambar: json['gambar'],
      namaProduct: json['namaProduct'],
      category: json['category'],
      deskripsi: json['deskripsi'],
      exp: json['exp'],
      tglMasuk: json['tglMasuk'],
      sold: json['sold'],
      stok: json['stok'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'barcode': barcode,
      'pemasok': pemasok,
      'gambar': gambar,
      'namaProduct': namaProduct,
      'category': category,
      'deskripsi': deskripsi,
      'exp': exp,
      'tglMasuk': tglMasuk,
      'sold': sold,
      'stok': stok,
    };
  }
}

class Pemasok {
  String name;
  Pemasok({required this.name});

  factory Pemasok.fromJson(Map<String, dynamic> json) {
    return Pemasok(name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  List<Pemasok> listPemasok = listProduct
      .map((product) => Pemasok(name: product.pemasok))
      .toSet()
      .toList();
}
