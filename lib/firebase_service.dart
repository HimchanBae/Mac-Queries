import 'package:firebase_database/firebase_database.dart';
import 'package:mac_queries/enquiry_model.dart';

class FirebaseService {
  final FirebaseDatabase _realtime = FirebaseDatabase.instance;

  Stream<DatabaseEvent> getEnquiriesStream() {
    return _realtime.ref().child('enquiries').orderByChild('timestamp').onValue;
  }

  Future<void> saveEnquiryData(
      String? enquiryType, String? title, String? details) async {
    DatabaseReference enquiriesRef = _realtime.ref().child('enquiries');
    try {
      await enquiriesRef.push().set({
        'enquiryType': enquiryType,
        'title': title,
        'details': details,
        'timestamp': ServerValue.timestamp,
      });
      print("Document added");
      print('enquiryType: $enquiryType, title: $title, details: $details');
    } catch (e) {
      print("Error adding document: $e");
    }
  }

  Future<List<EnquiryModel>> fetchOpenEnquiries(
      FirebaseDatabase database) async {
    final snapshot = await database.ref().child('enquiries').get();
    List<EnquiryModel> enquiries = [];

    if (snapshot.exists && snapshot.value is Map) {
      Map<String, dynamic> enquiriesMap =
          Map<String, dynamic>.from(snapshot.value as Map);
      enquiries = enquiriesMap.values.map((value) {
        return EnquiryModel.fromMap(Map<String, dynamic>.from(value));
      }).toList();
    }

    return enquiries;
  }
}
