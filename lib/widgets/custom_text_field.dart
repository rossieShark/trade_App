// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trade/app_logic/sell_buy_provider.dart';

import 'package:trade/services/ui_services/app_colors.dart';
import 'package:trade/app_logic/timer_provider.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.mask,
    required this.controllerText,
  }) : super(key: key);
  final String mask;
  final String controllerText;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  // late final MaskedTextController _controller =
  //     MaskedTextController(mask: widget.mask);
  late final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    print(widget.controllerText);
    _controller.text = widget.controllerText;

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant CustomTextField oldWidget) {
    if (widget.controllerText != oldWidget.controllerText) {
      _controller.text = widget.controllerText;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        onChanged: (value) =>
            {context.read<BuySellProvider>().onValueChanged(value)},
        style: const TextStyle(
            color: AppColors.white,
            fontFamily: 'SFPro',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 19.09 / 16));
  }
}

class TimerTextField extends StatefulWidget {
  const TimerTextField({
    Key? key,
    required this.mask,
    required this.controllerText,
  }) : super(key: key);
  final String mask;
  final String controllerText;
  @override
  State<TimerTextField> createState() => _TimerTextFieldState();
}

class _TimerTextFieldState extends State<TimerTextField> {
  // late final MaskedTextController _controller =
  //     MaskedTextController(mask: widget.mask);
  late final TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    print(widget.controllerText);
    _controller.text = widget.controllerText;

    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant TimerTextField oldWidget) {
    if (widget.controllerText != oldWidget.controllerText) {
      _controller.text = widget.controllerText;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: _controller,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            {context.read<TimerProvider>().onValueChanged(value)},
        style: const TextStyle(
            color: AppColors.white,
            fontFamily: 'SFPro',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            height: 19.09 / 16));
  }
}
