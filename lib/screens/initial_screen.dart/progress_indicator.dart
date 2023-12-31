import 'package:flutter/material.dart';
import 'package:trade/main.dart';
import 'package:trade/services/services_index.dart';

class LinearProgressIndicatorWidget extends StatefulWidget {
  const LinearProgressIndicatorWidget({super.key});

  @override
  State<LinearProgressIndicatorWidget> createState() =>
      _LinearProgressIndicatorWidgetState();
}

class _LinearProgressIndicatorWidgetState
    extends State<LinearProgressIndicatorWidget> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..addListener(() {
        onNavigate();
      });
    controller.forward();
    super.initState();
  }

  void onNavigate() {
    setState(() {});
    if (controller.value == 1.0) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const TradingApp(),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(38.0),
      child: SizedBox(
        height: 30.0,
        child: Stack(
          children: [
            _LinearProgressIndicatorWidget(controller: controller),
            _IndicatorValueText(controller: controller),
          ],
        ),
      ),
    );
  }
}

class _IndicatorValueText extends StatelessWidget {
  const _IndicatorValueText({
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${(controller.value * 100).toStringAsFixed(0)}%',
        style: GoogleFonts.inter(
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w800,
            height: 19.36 / 16,
            letterSpacing: -1.9,
          ),
        ),
      ),
    );
  }
}

class _LinearProgressIndicatorWidget extends StatelessWidget {
  const _LinearProgressIndicatorWidget({
    required this.controller,
  });

  final AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.0,
      child: LinearProgressIndicator(
        value: controller.value,
        borderRadius: BorderRadius.circular(30),
        backgroundColor: const Color.fromARGB(255, 91, 90, 96),
        color: const Color.fromARGB(255, 53, 185, 114),
      ),
    );
  }
}
