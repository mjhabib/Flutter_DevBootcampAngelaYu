import '/screens/login_screen.dart';
import '/screens/registration_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String id = 'welcome';
  // to save resources we can use the modifier/keyword 'static' to create class-wide states or constants, and to use it, we no longer need to create an object. (i.e: WelcomeScreen.id)

  @override
  State<WelcomeScreen> createState() => Controller();
}

class Controller extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  // Custom Animation
  // Ticker: Like a clock, each tick triggers a new setState to render something different on screen
  // Controller: Manges the animation and tell it what to do
  // Value: It can be anything that can be changed, like size, color, shape, etc..., and it is usually between 0 and 1
  late AnimationController controller;

  late Animation animation; // another type of animation

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      upperBound:
          100, // we can specify the lower/upper bound to be any value except 0-1
      duration: const Duration(seconds: 2),
      vsync:
          this, // 'this' refers to the ticker (i.e SingleTickerProviderStateMixin)
    );

    // animation = CurvedAnimation(parent: controller, curve: Curves.decelerate); // the controller Bounds should be between 0-1 for it to work

    // animation = ColorTween(begin: Colors.red, end: Colors.blue).animate(controller); // if we wanted to animate between two colors

    controller
        .forward(); // tell the animation to go forward or backward (i.e reverse)

    // If we want our animation to loop indefinitely!
    // controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     controller.reverse();
    //   } else if (status == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      // print(controller.value);
    });
  }

  // it's important to dispose our animation to save recourses when our state/screen gets destroy
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // Colors.green.withRed(controller.value.toInt()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: controller.value,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.w900,
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 48.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Log In',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: const Text(
                    'Register',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
