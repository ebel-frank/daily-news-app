import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF1F4F8),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie_animations/yoga.json',
                  width: 300,
                  height: 300,
                  fit: BoxFit.fill,
                  frameRate: FrameRate(10),
                  animate: true,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text('Be Fit, Stay Healthy! Always...',
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 50),
                  child: Text(
                    'Find inner peace with meditation and yoga for a healthier life.',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF57636C)
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFFA7171)),
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(
                            vertical: 12, horizontal: 28)),
                    elevation: MaterialStateProperty.all(5),
                  ),
                  child: const Text("Start"),
                ),
                // FFButtonWidget(
                //   onPressed: () {
                //     print('Button pressed ...');
                //   },
                //   text: 'Start',
                //   options: FFButtonOptions(
                //     width: 120,
                //     padding: const EdgeInsets.symmetric(vertical: 18),
                //     color:
                //     elevation: 5,
                //     borderSide: const BorderSide(
                //       width: 1,
                //     ),
                //     borderRadius: BorderRadius.circular(8),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
