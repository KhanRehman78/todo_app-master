import 'package:flutter/material.dart';

import '../utils/appconstant_wodget.dart';
import '../widgets/custom_row.dart';
import '../widgets/custom_text.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomRow(
                myText: "Account Setting",
                textFont: FontWeight.bold,
                textColor: Colors.white,
                textSize: 18,
                textSpaceing: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/images/artnine.jpg"),
                                fit: BoxFit.cover,
                              )),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              myText: "User Name",
                              textFont: FontWeight.bold,
                              textColor: AppConstantWidget.blackColor,
                              textSize: 18,
                              textSpaceing: 0,
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            CustomText(
                              myText: "Edit Profile",
                              textFont: FontWeight.bold,
                              textColor: Colors.grey,
                              textSize: 15,
                              textSpaceing: 0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.note_alt_outlined,
                              size: 25,
                            )),
                        Expanded(
                          flex: 6,
                          child: CustomText(
                            myText: "Edit Profile",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 15,
                            textSpaceing: 0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.privacy_tip_outlined,
                              size: 25,
                            )),
                        Expanded(
                          flex: 6,
                          child: CustomText(
                            myText: "Privacy & Policy",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 15,
                            textSpaceing: 0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.contact_phone_outlined,
                              size: 25,
                            )),
                        Expanded(
                          flex: 6,
                          child: CustomText(
                            myText: "Contect us",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 15,
                            textSpaceing: 0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.logout,
                              size: 25,
                            )),
                        Expanded(
                          flex: 6,
                          child: CustomText(
                            myText: "Logout",
                            textFont: FontWeight.bold,
                            textColor: AppConstantWidget.blackColor,
                            textSize: 15,
                            textSpaceing: 0,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
