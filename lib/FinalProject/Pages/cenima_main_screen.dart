import 'package:experiment_app1/FinalProject/Pages/ticket_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:experiment_app1/FinalProject/Pages/home_page_cenima.dart';
import 'package:experiment_app1/FinalProject/const.dart';

class CinemaMainScreen extends StatefulWidget {
  const CinemaMainScreen({super.key});

  @override
  State<CinemaMainScreen> createState() => _CinemaMainScreenState();
}

class _CinemaMainScreenState extends State<CinemaMainScreen> {
  List<IconData> bottomIcons = [
    Icons.home_filled,
    CupertinoIcons.compass_fill,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];

  int currentIndex = 0;

  // Dummy ticket data (replace this with actual data passed from reservation screen)
  List<String> selectedSeats = ['A1', 'A2'];
  DateTime selectedTime = DateTime.now();
  int totalPrice = 40;

  late final List<Widget> pages;

  @override
  void initState() {
    pages = [
      const HomePageCinema(),
      navBarPage(CupertinoIcons.compass_fill),
      TicketPage(
        selectedSeats: selectedSeats,
        selectedTime: selectedTime,
        totalPrice: totalPrice,
      ),
      navBarPage(Icons.person_rounded),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(0.3),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: bottomIcons
            .map(
              (icon) => BottomNavigationBarItem(
                icon: Icon(icon, size: 30),
                label: '',
              ),
            )
            .toList(),
      ),
      body: pages[currentIndex],
    );
  }

  Widget navBarPage(IconData icon) {
    return Center(
      child: Icon(
        icon,
        size: 100,
        color: Colors.white,
      ),
    );
  }
}
