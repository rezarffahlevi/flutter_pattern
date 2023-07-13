import 'dart:ui';

extension HexColor on String {
  Color toColor() {
    final hexCode = replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}
