import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trade/screens/screens_index.dart';

import 'package:trade/services/services_index.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              color: AppColors.darkBlue,
            ),
          ),
          const Positioned(
            right: 21,
            top: 193,
            child: _BacgroundGreenGradient(),
          ),
          const Positioned(
            left: 20,
            top: 462,
            child: _BackgroundRedGradient(),
          ),
          const Positioned.fill(
            child: _ProgressIndicatorWidget(),
          ),
        ],
      ),
    );
  }
}

class _ProgressIndicatorWidget extends StatelessWidget {
  const _ProgressIndicatorWidget();

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
          child: const Align(
              alignment: Alignment.center,
              child: LinearProgressIndicatorWidget())),
    );
  }
}

class _BackgroundRedGradient extends StatelessWidget {
  const _BackgroundRedGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123.0,
      height: 123.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.red, AppColors.red],
          center: Alignment.center,
        ),
      ),
    );
  }
}

class _BacgroundGreenGradient extends StatelessWidget {
  const _BacgroundGreenGradient();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 123.0,
      height: 123.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [AppColors.green, AppColors.green],
          center: Alignment.center,
        ),
      ),
    );
  }
}
