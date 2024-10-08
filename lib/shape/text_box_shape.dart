/// A class representing a text box shape that extends the RectangleShape class.
/// It contains properties such as text, textAlign, textStyle, _isEditing,
/// and methods such as draw, startEdit, and endEdit.
///
import 'package:flutter/material.dart';
import 'package:magic_canvas/shape/shape.dart';

class TextBoxShape extends RectangleShape {
  String text;
  TextAlign textAlign;
  TextStyle textStyle;
  bool _isEditing = false;

  TextBoxShape({
    super.id,
    this.text = '',
    this.textAlign = TextAlign.center,
    this.textStyle = const TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    super.location,
    super.size,
    super.color,
    super.borderColor,
    super.zIndex,
    super.borderRadius,
    super.reactSize,
  });

  @override
  void draw(Canvas canvas, Size boardSize) {
    super.draw(canvas, boardSize);

    if (!_isEditing) {
      final textSpan = TextSpan(
        text: text,
        style: textStyle,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: TextDirection.ltr,
        textAlign: textAlign,
      );
      textPainter.layout(
        minWidth: size.width,
        maxWidth: size.width,
      );

      final offsetRect = Alignment.center.inscribe(
          textPainter.size,
          Rect.fromPoints(
              location, location.translate(size.width, size.height)));
      textPainter.paint(canvas, offsetRect.topLeft.translate(-1.5, 0));
    }
  }

  void startEdit() {
    _isEditing = true;
  }

  void endEdit() {
    _isEditing = false;
  }
}
