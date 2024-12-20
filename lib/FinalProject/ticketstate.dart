import 'package:flutter/material.dart';

class TicketState {
  static final ValueNotifier<Map<String, dynamic>?> ticketData =
      ValueNotifier<Map<String, dynamic>?>(null);




  static void saveTicket({
    required List<String> seats,
    required DateTime time,
    required int price,
  }) {
    ticketData.value = {
      'seats': seats,
      'time': time,
      'price': price,
    };
  }

  static void clearTicket() {
    ticketData.value = null;
  }
}
