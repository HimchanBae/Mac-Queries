import 'package:flutter/material.dart';
import 'package:mac_queries/component/my_app_bar.dart';
import 'package:mac_queries/component/my_bottom_nav_bar.dart';
import 'package:mac_queries/screen/closed_enquiry_detail_screen.dart';
import 'package:mac_queries/screen/home_screen.dart';
import 'package:mac_queries/screen/my_enquiry_screen.dart';
import 'package:mac_queries/screen/new_enquiry_screen.dart';
import 'package:mac_queries/screen/open_enquiry_detail_screen.dart';
import 'package:mac_queries/screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(
      () {
        if (index < 4) {
          _selectedIndex = index;
        }
      },
    );
  }

  String _getTitleForSelectedIndex(int index) {
    switch (index) {
      case 0:
        return 'Home';
      case 1:
        return 'Home > NewEnquiries';
      case 2:
        return 'Home > MyEnquiries';
      case 3:
        return 'Home > Settings';
      case 4:
        return 'Home > MyQ > OpenQ Detail';
      case 5:
        return 'Home > MyQ > ClosedQ Detail';
      default:
        return 'This is MacQ App';
    }
  }

  void _navigateToOpenEnquiryDetail() {
    setState(() {
      _selectedIndex = 4;
    });
  }

  void _navigateToClosedEnquiryDetail() {
    setState(() {
      _selectedIndex = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: MyAppBar(
        selectedIndex: _selectedIndex,
        onBackButtonPressed: () {
          if (_selectedIndex != 0) {
            setState(() {
              _selectedIndex = 0;
            });
          }
        },
        title: _getTitleForSelectedIndex(_selectedIndex),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          HomeScreen(
            navigateToOpenEnquiryDetail: _navigateToOpenEnquiryDetail,
            navigateToClosedEnquiryDetail: _navigateToClosedEnquiryDetail,
          ),
          const NewEnquiriesScreen(),
          MyEnquiryScreen(
            navigateToOpenEnquiryDetail: _navigateToOpenEnquiryDetail,
            navigateToClosedEnquiryDetail: _navigateToClosedEnquiryDetail,
          ),
          const SettingsScreen(),
          const OpenEnquiryDetailScreen(),
          const ClosedEnquiryDetailScreen(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        onTap: _onItemTapped,
        selectedIndex: _selectedIndex,
      ),
    );
  }
}
