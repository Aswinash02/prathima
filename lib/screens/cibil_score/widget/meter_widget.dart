import 'package:flutter/material.dart';
import 'package:prathima_loan_app/screens/cibil_score/widget/custom_painter_analog_meter.dart';
import 'package:prathima_loan_app/screens/cibil_score/widget/custom_painter_arrow_indicator.dart';
import 'package:prathima_loan_app/screens/cibil_score/widget/custom_painter_background.dart';
import 'dart:math' as math;

class MeterWidget extends StatefulWidget {
  const MeterWidget({Key? key}) : super(key: key);

  @override
  State<MeterWidget> createState() => _MeterWidgetState();
}

class _MeterWidgetState extends State<MeterWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;

  late AnimationController controllerColor;
  late Animation<Color?> colorTween;

  // List<int> list = [1, 2, 3, 4];

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    controllerColor.dispose();

    super.dispose();
  }

  startAnimation() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    )..addListener(() {
        // if ((controller.value * 1000).round() >= 500) {
        //   controller.stop();
        // }
        setState(() {});
      });
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 7600),
    )..addListener(() {
        // if ((controller.value * 1000).round() >= 500) {
        //   controller2.stop();
        // }
        setState(() {});
      });

    controllerColor = AnimationController(
        duration: const Duration(
          milliseconds: 7600,
        ),
        vsync: this)
      ..addListener(() {
        // if ((controller.value * 1000).round() >= 500) {
        //   controllerColor.stop();
        // }
        setState(() {});
      });

    colorTween = ColorTween(begin: Colors.red, end: Colors.green.shade400)
        .animate(CurvedAnimation(
            parent: controllerColor, curve: Curves.easeOutSine));

    controller.forward();
    controller2.forward();
    controllerColor.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 170,
                    width: 170,
                    child: CustomPaint(
                      painter: CustomPainterBackground(),
                    ),
                  ),
                  CustomPaint(
                      size: const Size(400, 400),
                      painter:
                          CustomPainterAnalogMeter(value: controller.value),
                      child: Transform.rotate(
                          angle: -90,
                          child: Transform.rotate(
                            angle: controller2.value * 2 * math.pi > 4.1
                                ? 4.1
                                : controller2.value * 2 * math.pi,
                            child: SizedBox(
                              width: 150,
                              height: 150,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    top: 5,
                                    left: 60,
                                    right: 60,
                                    child: CustomPaint(
                                      size: const Size(40, 20),
                                      // Adjust the size of the arrow here
                                      painter: CustomPainterArrowIndicator(
                                          color: colorTween.value),
                                    ),
                                  ),
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        width: 110,
                                        height: 110,
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                                spreadRadius: 4,
                                                blurRadius: 9,
                                                color: Colors.black12),
                                          ],
                                          color: Colors
                                              .white, // Set your desired circle color here
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        height: 90,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 0.7),
                                          shape: BoxShape.circle,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ))),
                ],
              ),
              GestureDetector(
                  onTap: () {
                    startAnimation();
                    // int element = 40;
                    // int element = list[math.Random().nextInt(list.length)];
                    // Future.delayed(Duration(seconds: element), () {
                    //   controller.stop();
                    //   controller2.stop();
                    //   controllerColor.stop();
                    // });
                  },
                  child: Container(
                    width: 90,
                    height: 90,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "${(controller.value * 900).round()}",
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
