import 'package:cloud_firestore/cloud_firestore.dart';

class QRCodeModel {
  dynamic dateTime;
  dynamic lat;
  dynamic long;

  QRCodeModel({
    this.dateTime,
    this.lat,
    this.long,
  });

  factory QRCodeModel.fromDocument(DocumentSnapshot doc) {
    return QRCodeModel(
        lat: doc['lat'] ?? '',
        long: doc['long'] ?? '',
        dateTime: doc['dateTime'] ?? '');
  }
}
