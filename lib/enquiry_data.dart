import 'package:mac_queries/enquiry_model.dart';

class EnquiryData {
  static final List<EnquiryModel> _openEnquiries = [
    EnquiryModel(
        enquiryType: 'Open',
        title: 'Refund Request',
        details: 'Details about the refund request',
        date: '22-08-2024'),
    EnquiryModel(
        enquiryType: 'Open',
        title: 'About Study Plan',
        details: 'Inquiry about the study plan',
        date: '23-08-2024'),
  ];

  static final List<EnquiryModel> _closedEnquiries = [
    EnquiryModel(
        enquiryType: 'Closed',
        title: 'About Scholarship',
        details: 'Details about the scholarship',
        date: '27-04-2024'),
    EnquiryModel(
        enquiryType: 'Closed',
        title: 'Where is the basket',
        details: 'Query about the basket location',
        date: '28-04-2024'),
  ];

  static List<EnquiryModel> get openEnquiries => _openEnquiries;
  static List<EnquiryModel> get closedEnquiries => _closedEnquiries;
}
