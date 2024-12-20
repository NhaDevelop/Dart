import 'package:experiment_app1/FinalProject/ticketstate.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TicketPage extends StatelessWidget {
  const TicketPage(
      {Key? key,
      required DateTime selectedTime,
      required List<String> selectedSeats,
      required int totalPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Your Tickets'),
        centerTitle: true,
      ),
      body: ValueListenableBuilder<Map<String, dynamic>?>(
        valueListenable: TicketState.ticketData,
        builder: (context, ticketData, _) {
          if (ticketData == null) {
            return const Center(
              child: Text(
                'No Tickets Found',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            );
          }

          final List<String> seats = ticketData['seats'];
          final DateTime time = ticketData['time'];
          final int price = ticketData['price'];

          return Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
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
                      const Text(
                        'Your Ticket',
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
                      Column(
                        children: [
                          Text(
                            'Date: ${DateFormat('EEE, MMM d, y').format(time)}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Time: ${DateFormat('hh:mm a').format(time)}',
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
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
                        children: seats
                            .map(
                              (seat) => Chip(
                                label: Text(seat),
                                backgroundColor:
                                    Colors.blueGrey.withOpacity(0.2),
                              ),
                            )
                            .toList(),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Total Price: \$${price}.00',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
