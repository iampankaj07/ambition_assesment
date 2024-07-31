import 'package:flutter/material.dart';

extension on TextStyle {
  TextStyle get roboto {
    return copyWith(
      fontFamily: 'Roboto',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }

  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }
}

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.
class CustomTextStyles {
  // Body text style bodySmallBlack900
  static get bodySmall => const TextStyle(
      // color: colorScheme.primaryContainer.withOpacity(0.6),
      fontSize: 12,
      color: Colors.grey);
  static get title =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey
          // fontWeight: FontWeight.w600,
          );

  static get titleSmallSemiBold =>
      const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey);
}
