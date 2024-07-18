import 'package:flutter/cupertino.dart';
import 'package:prathima_loan_app/utils/colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

Widget toggleSwitch() {
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: ToggleSwitch(
      minWidth: 160.0,
      cornerRadius: 8.0,
      activeBgColors: [
        [MyTheme.mainColor],
        [MyTheme.mainColor],
        [MyTheme.mainColor],
      ],
      activeFgColor: MyTheme.white,
      inactiveBgColor: MyTheme.mainColor.withOpacity(0.2),
      inactiveFgColor: MyTheme.blackColor,
      initialLabelIndex: 0,
      totalSwitches: 3,
      fontSize : 13,
      labels: ['Personal Loan', 'Business Loan' , 'Home Loan'],
      // multiLineText : true,
      centerText : true,
      borderWidth : 2.0,
      borderColor: [
        MyTheme.mainColor.withOpacity(0.2),
      ],
      radiusStyle: true,
      onToggle: (index) {
        print('switched to: $index');
      },
    ),
  );
}
