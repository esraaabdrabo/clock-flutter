import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //inner circle
    var centerx = size.width / 2;
    var centery = size.height / 2;
    var circlePaint = Paint();
    circlePaint.color = const Color(0xff454975);
    canvas.drawCircle(Offset(centerx, centery), size.width * .25, circlePaint);

    //circle border
    var circleBorderPaint = Paint();
    circleBorderPaint.color = const Color(0xffeaecff);
    circleBorderPaint.style = PaintingStyle.stroke;
    circleBorderPaint.strokeWidth = 15;
    canvas.drawCircle(
        Offset(centerx, centery), size.width * .25, circleBorderPaint);

    //hour hand
    var hourPaint = Paint();
    hourPaint.color = const Color(0xff76c6ff);
    hourPaint.strokeWidth = 10;
    hourPaint.strokeCap = StrokeCap.round;
    canvas.drawLine(Offset(centerx, centery),
        Offset(centerx + 20, centery + 50), hourPaint);

    //min hand
    var minPaint = Paint();
    minPaint.color = Colors.yellow;
    minPaint.strokeWidth = 10;
    minPaint.strokeCap = StrokeCap.round;
    var minHandX = centerx + 100 * cos(DateTime.now().minute * pi / 180);
    var minHandY = centery + 100 * sin(DateTime.now().minute * pi / 180);
    canvas.drawLine(
        Offset(centerx, centery), Offset(minHandX, minHandY), minPaint);

    //sec hand
    var secPaint = Paint();
    secPaint.color = const Color(0xffe777be);
    secPaint.strokeWidth = 10;
    secPaint.strokeCap = StrokeCap.round;
    var secHandX = centerx + 100 * cos(DateTime.now().second * pi / 180);
    var secHandY = centery + 100 * sin(DateTime.now().second * pi / 180);

    canvas.drawLine(
        Offset(centerx, centery), Offset(secHandX, secHandY), secPaint);
    var dashPaint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    for (var i = 0; i < 360; i += 10) {
      var x1 = centerx + 230 * cos(i * pi / 180);
      var y1 = centery + 230 * sin(i * pi / 180);
      var x2 = centerx + 200 * cos(i * pi / 180);
      var y2 = centery + 200 * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashPaint);
    }
    //center circle
    var centerCirclePaint = Paint();
    centerCirclePaint.color = const Color(0xffeaecff);
    canvas.drawCircle(
        Offset(centerx, centery), size.width * .035, centerCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
