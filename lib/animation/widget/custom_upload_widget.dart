import 'package:check_animation/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CustomUploadWidget extends AnimatedWidget {
  final String title;
  final String buttonText;
  final VoidCallback? onButtonPressed;
  final bool showButton;
  final Color color;
  final Color textColor;
  final Color titleColor;
  final Color? buttonBorderColor;

  const CustomUploadWidget({
    super.key,
    required Animation<double> animation,
    this.title = '',
    this.buttonText = 'Ok',
    this.onButtonPressed,
    this.showButton = true,
    this.color = orangePrincipal,
    this.textColor = orangePrincipal,
    this.titleColor = Colors.black,
    this.buttonBorderColor,
  }) : super(listenable: animation);

  Animation<double> get animation => listenable as Animation<double>;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: [
          if (animation.value > 0)
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: CustomPaint(
                        foregroundPainter: _CustomAnimationPainter(
                          animation: animation,
                          color: color,
                        ),
                        child: const SizedBox(
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  Expanded(
                    child: TweenAnimationBuilder(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(milliseconds: 400),
                      builder: (_, double value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(0.0, 50 * (1 - value)),
                            child: child,
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          if (title.isNotEmpty)
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                title,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                  color: titleColor,
                                ),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                              ),
                            ),
                          const Spacer(),
                          if (showButton)
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: buttonBorderColor ?? textColor,
                                ),
                              ),
                              onPressed: onButtonPressed ??
                                  () => Navigator.of(context).pop(),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20.0,
                                  horizontal: 40,
                                ),
                                child: Text(
                                  buttonText,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: textColor,
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 70),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _CustomAnimationPainter extends CustomPainter {
  final Animation<double> animation;
  final Color color;

  _CustomAnimationPainter({
    required this.animation,
    required this.color,
  }) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final circlePath = Path();
    circlePath.addArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        height: size.height,
        width: size.width,
      ),
      vector.radians(-90.0),
      vector.radians(360.0 * animation.value),
    );

    final leftLine = size.width * 0.2;
    final rightLine = size.width * 0.3;

    final leftPercent = animation.value > 0.5 ? 1.0 : animation.value / 0.5;
    final rightPercent =
        animation.value < 0.5 ? 0.0 : (animation.value - 0.5) / 0.5;

    canvas.save();
    canvas.translate(size.width / 3, size.height / 2);
    canvas.rotate(vector.radians(-45.0));

    canvas.drawLine(Offset.zero, Offset(0.0, leftLine * leftPercent), paint);
    canvas.drawLine(
      Offset(0.0, leftLine),
      Offset(rightLine * rightPercent, leftLine),
      paint,
    );

    canvas.restore();
    canvas.drawPath(circlePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
