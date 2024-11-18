import 'package:check_animation/animation/widget/custom_upload_widget.dart';
import 'package:check_animation/colors/colors.dart';
import 'package:flutter/material.dart';

class CheckAnimationScreen extends StatefulWidget {
  final String? title;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final bool? showButton;
  final Color? color;
  final Color? textColor;
  final Color? titleColor;
  final Color? buttonBorderColor;

  const CheckAnimationScreen({
    super.key,
    this.title,
    this.buttonText,
    this.onButtonPressed,
    this.showButton,
    this.color,
    this.textColor,
    this.titleColor,
    this.buttonBorderColor,
  });

  @override
  State<CheckAnimationScreen> createState() => _CheckAnimationScreenState();
}

class _CheckAnimationScreenState extends State<CheckAnimationScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomUploadWidget(
        animation: _controller,
        title: widget.title ?? '',
        buttonText: widget.buttonText ?? 'Ok',
        onButtonPressed: widget.onButtonPressed,
        showButton: widget.showButton ?? true,
        color: widget.color ?? orangePrincipal,
        textColor: widget.textColor ?? orangePrincipal,
        titleColor: widget.titleColor ?? Colors.black,
        buttonBorderColor: widget.buttonBorderColor,
      ),
    );
  }
}
