import 'package:experiment_app1/FinalProject/Pages/cenima_main_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketScreen extends StatelessWidget {
  final List<String> selectedSeats;
  final DateTime selectedTime;
  final int totalPrice;

  const TicketScreen({
    Key? key,
    required this.selectedSeats,
    required this.selectedTime,
    required this.totalPrice,
  }) : super(key: key);
                                
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Change as per your theme 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Your Ticket'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Ticket Header
                  const Text(
                    'Ticket Confirmation',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 1,
                    height: 20,
                  ),

                  // Movie and Time Details
                  Column(
                    children: [
                      Text(
                        'Date: ${DateFormat('EEE, MMM d, y').format(selectedTime)}',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Time: ${DateFormat('hh:mm a').format(selectedTime)}',
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Seats Information
                  const Text(
                    'Selected Seats:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10,
                    runSpacing: 5,
                    children: selectedSeats
                        .map(
                          (seat) => Chip(
                            label: Text(seat),
                            backgroundColor: Colors.blueGrey.withOpacity(0.2),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(height: 20),

                  // Total Price
                  Text(
                    'Total Price: \$${totalPrice}.00',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Back to Home Button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push( context, MaterialPageRoute(builder: (context) => const CinemaMainScreen()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                    ),
                    child: const Text(
                      'Back to Home',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
