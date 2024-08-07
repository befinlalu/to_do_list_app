import 'package:flutter/material.dart';

// Custom long button widget
class CustomLongButton extends StatefulWidget {
  final Function() onPressed; // Callback function when the button is pressed
  final Color textColor; // Text color for the button
  final Color buttonColor; // Background color for the button
  final String buttonTitle; // Text displayed on the button
  final bool
      isLoading; // Flag indicating whether the button is in a loading state
  final double width;
  final double radius;
  final Color borderColor;
  final double height;
  final double fontSize;

  // Constructor for CustomLongButton
  const CustomLongButton({
    super.key,
    required this.height,
    required this.buttonColor,
    required this.buttonTitle,
    required this.onPressed,
    required this.isLoading,
    required this.textColor,
    required this.width,
    required this.radius,
    required this.borderColor,
    required this.fontSize,
  });

  @override
  State<CustomLongButton> createState() => _CustomLongButtonState();
}

// State class for CustomLongButton
class _CustomLongButtonState extends State<CustomLongButton> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        // Styling for the container
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(widget.radius),
            border: Border.all(color: widget.borderColor, width: 1)),
        height: widget.height, // Set the button's height
        width: widget.width, // Set the button's width
        child: ElevatedButton(
          onPressed: widget.isLoading ? () {} : widget.onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: widget.buttonColor, // Button background color
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(widget.radius), // Button shape
            ),
          ),
          child: Container(
            color: Colors.transparent,
            width: widget.width,
            height: widget.fontSize,
            child: FittedBox(
              fit: BoxFit.fitHeight,
              child: Text(
                widget.buttonTitle, // Text displayed on the button
                style: TextStyle(
                  color: widget.textColor, // Text color
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
