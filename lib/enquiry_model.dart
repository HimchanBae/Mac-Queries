import 'package:intl/intl.dart';

class EnquiryModel {
  String? enquiryType;
  String? title;
  String? details;
  String? date;

  EnquiryModel({this.enquiryType, this.title, this.details, this.date});

  Map<String, dynamic> toMap() {
    return {
      'enquiryType': enquiryType,
      'title': title,
      'details': details,
      'date': date,
    };
  }

  factory EnquiryModel.fromMap(Map<String, dynamic> map) {
    return EnquiryModel(
      enquiryType: map['enquiryType'],
      title: map['title'],
      details: map['details'],
      date: formatDate(map['timestamp']),
    );
  }

  static String formatDate(dynamic timestamp) {
    if (timestamp != null) {
      var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
      var formatter = DateFormat('dd-MM-yyyy');
      return formatter.format(date);
    }
    return 'No date';
  }
}
