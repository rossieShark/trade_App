import 'package:flutter/material.dart';

// class PageRouteAnimation {
//   final Widget page;

//   PageRouteAnimation({required this.page});

//   PageRouteBuilder createPageRoute() {
//     return PageRouteBuilder(
//       pageBuilder: (context, animation, secondaryAnimation) {
//         return page;
//       },
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         const begin = Offset(1.0, 0.0);
//         const end = Offset(0.0, 0.0);
//         const curve = Curves.easeOut;

//         var tween = Tween(begin: begin, end: end).chain(
//           CurveTween(curve: curve),
//         );
//         var offsetAnimation = animation.drive(tween);
//         return SlideTransition(
//           position: offsetAnimation,
//           child: child,
//         );
//       },
//       transitionDuration: const Duration(milliseconds: 300),
//     );
//   }
// }
class PageRouteAnimation extends StatefulWidget {
  final Widget child;

  const PageRouteAnimation({Key? key, required this.child}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PageRouteAnimationState createState() => _PageRouteAnimationState();
}

class _PageRouteAnimationState extends State<PageRouteAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> animation;

  @override
  void initState() {
    super.initState();
    const animationDuration = Duration(milliseconds: 1000);
    const animationCurve = Curves.easeOut; // Choose your desired curve

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
    );

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: animationCurve,
    );

    animation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(curvedAnimation);

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: widget.child,
    );
  }
}
