import 'package:flutter/material.dart';

enum ButtonType {
  primary,
  secondary,
  disabled,
}

extension ButtonTypeExtension on ButtonType {
  Color get color {
    switch (this) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }
}

class CustomButton extends StatelessWidget {
  final ButtonType buttonType;
  final String text;
  final IconData? icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.buttonType,
    required this.text,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: buttonType == ButtonType.disabled ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.color,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, color: Colors.white),
          if (icon != null) const SizedBox(width: 8),
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class CustomButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Custom Buttons')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              buttonType: ButtonType.primary,
              text: 'Submit',
              icon: Icons.check,
              onPressed: () {
                // Handle button press
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              buttonType: ButtonType.secondary,
              text: 'Time',
              icon: Icons.access_time,
              onPressed: () {
                // Handle button press
              },
            ),
            const SizedBox(height: 16),
            CustomButton(
              buttonType: ButtonType.disabled,
              text: 'Account',
              icon: Icons.account_circle,
              onPressed: null, // Disabled button
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CustomButtonDemo(),
  ));
}
