import 'dart:convert';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ScanModel {
  int? id;
  String? tipo;
  String valor;

  ScanModel({
    this.id,
    this.tipo,
    required this.valor,
  }) {
    if (valor.startsWith('http')) {
      tipo = 'http';
    } else if (valor.startsWith('geo:')) {
      tipo = 'geo';
    } else {
      tipo = 'unknown';
    }
  }

  LatLng getLatLng() {
    if (!valor.startsWith('geo:')) {
      throw const FormatException('Not a geo scan');
    }

    final coords = valor.substring(4).split(',');
    if (coords.length != 2) {
      throw const FormatException('Invalid geo format');
    }

    final lat = double.tryParse(coords[0]);
    final lng = double.tryParse(coords[1]);

    if (lat == null || lng == null) {
      throw const FormatException('Invalid coordinates');
    }

    return LatLng(lat, lng);
  }

  factory ScanModel.fromJson(String str) =>
      ScanModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ScanModel.fromMap(Map<String, dynamic> json) => ScanModel(
        id: json['id'],
        tipo: json['tipo'],
        valor: json['valor'],
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'tipo': tipo,
        'valor': valor,
      };
}
