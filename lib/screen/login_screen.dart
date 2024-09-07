import 'package:aplikasi_cerita/pattern/app_style/style.dart';
import 'package:aplikasi_cerita/responsive/responsive_widget.dart';
import 'package:aplikasi_cerita/screen/signup_screen.dart';
import 'package:flutter/material.dart';
import '../pattern/color_theme/app_color.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.backColor,
      body: SizedBox(
        height: height,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ResponsiveWidget.isSmallScreen(context)
                ? const SizedBox()
                : Expanded(
                    child: Container(
                      height: height,
                      color: AppColor.mainBlueColor,
                      child: Center(
                        child: Text(
                          "AdminExpress",
                          style: ralewayStyle.copyWith(
                            fontSize: 50,
                            color: AppColor.whiteColor,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
            Expanded(
              child: Container(
                height: height,
                margin: EdgeInsets.symmetric(
                    horizontal: ResponsiveWidget.isSmallScreen(context)
                        ? height * 0.032
                        : height * 0.12),
                color: AppColor.backColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Let\'s',
                              style: ralewayStyle.copyWith(
                                fontSize: 32,
                                color: AppColor.blueDarkColor,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            TextSpan(
                              text: ' Login👇🏻',
                              style: ralewayStyle.copyWith(
                                fontSize: 32,
                                color: AppColor.blueDarkColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Text(
                        "Hey, Enter your details to get login\nto your account.",
                        style: ralewayStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.064,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Email",
                          style: ralewayStyle.copyWith(
                            fontSize: 16,
                            color: AppColor.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.whiteColor,
                        ),
                        child: TextFormField(
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.blueDarkColor,
                            fontSize: 16,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.email_outlined,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              top: 16,
                            ),
                            hintText: "Enter Email",
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.blueDarkColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.014,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Text(
                          "Password",
                          style: ralewayStyle.copyWith(
                            fontSize: 16,
                            color: AppColor.blueDarkColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        height: 50,
                        width: width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.whiteColor,
                        ),
                        child: TextFormField(
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.blueDarkColor,
                            fontSize: 16,
                          ),
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.visibility_off_rounded,
                                ),
                              ),
                            ),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.lock_outline_rounded,
                                ),
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                              top: 16,
                            ),
                            hintText: "Enter Passowrd",
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.blueDarkColor.withOpacity(0.5),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Forget Password?",
                            style: ralewayStyle.copyWith(
                              fontSize: 12,
                              color: AppColor.mainBlueColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(16),
                          child: Ink(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 18),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: AppColor.mainBlueColor,
                            ),
                            child: Text(
                              "Login",
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColor.whiteColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        children: [
                          Text(
                            "Don't have account?",
                            style: ralewayStyle.copyWith(
                              fontSize: 16,
                              color: AppColor.blueDarkColor,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.0050,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpScreen();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Register",
                              style: ralewayStyle.copyWith(
                                fontSize: 16,
                                color: AppColor.mainBlueColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
