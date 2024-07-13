import 'package:flutter/material.dart';
import 'package:prathima_loan_app/customs/custom_text.dart';

import '../../customs/custom_appbar.dart';
import '../../customs/custom_button.dart';
import '../../utils/colors.dart';


class AuthSuccessPage extends StatefulWidget {
  const AuthSuccessPage({super.key});

  @override
  State<AuthSuccessPage> createState() => _AuthSuccessPageState();
}

class _AuthSuccessPageState extends State<AuthSuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: '',
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage(
                        "assets/success_icon.png",
                      ),
                      height: 106,
                      width: 106,
                    ),
                    CustomText(
                      text: "Success!",
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: CustomText(
                            text:
                                "Congratulations! You have been\n    successfully authenticated",
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                            maxLines: 2,
                            color: MyTheme.textfield_grey,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40.0),
                      child: CustomButton(
                        text: 'Continue',
                        onPressed: () {
                          // Define what happens when the button is pressed
                          print('Button Pressed');
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AuthSuccessPage()));
                        },
                        textColor: Colors.white,
                        borderRadius: 12.0,
                        padding: 20.0,
                        horizontalPadding: 80,
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
