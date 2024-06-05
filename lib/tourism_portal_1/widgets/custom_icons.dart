import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> getMarkerIcon(IconData iconData, Color color, double size) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = color.withOpacity(0.6);
  final double iconSize = size;

  final textPainter = TextPainter(
    textDirection: TextDirection.ltr,
  );
  textPainter.text = TextSpan(
    text: String.fromCharCode(iconData.codePoint),
    style: TextStyle(
      fontSize: iconSize,
      fontFamily: iconData.fontFamily,
      color: color,
    ),
  );
  textPainter.layout();
  textPainter.paint(canvas, Offset.zero);

  final img = await pictureRecorder.endRecording().toImage(iconSize.toInt(), iconSize.toInt());
  final data = await img.toByteData(format: ui.ImageByteFormat.png);
  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}
