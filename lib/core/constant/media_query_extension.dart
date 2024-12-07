import 'package:flutter/material.dart';

/// This extension simplifies access to screen dimensions (height and width)
/// using MediaQuery directly from the BuildContext.
///
/// Example:
/// - To get screen height: `context.height`
/// - To get screen width: `context.width`
///
/// This helps reduce repetitive code and makes the widget layout calculations cleaner
extension MediaQueryEx on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
