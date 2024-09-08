import 'package:aplikasi_cerita/pattern/app_style/style.dart';
import 'package:aplikasi_cerita/responsive/responsive_widget.dart';
import 'package:aplikasi_cerita/screen/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../pattern/color_theme/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final urlImages = [
    "https://images.unsplash.com/photo-1718679388215-75b00db812f5?w=1600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDR8NnNNVmpUTFNrZVF8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1725539075423-984d4dcdefae?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1725435214975-989b71be4a56?q=80&w=1635&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  ];

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
                      child: CarouselSlider.builder(
                        itemCount: urlImages.length,
                        itemBuilder: (context, index, realIndex) {
                          final urlImage = urlImages[index];
                          return buildImages(urlImage, context);
                        },
                        options: CarouselOptions(
                          viewportFraction:
                              1.0, // Gambar penuh sesuai lebar container
                          autoPlay: true, // Auto play
                          autoPlayInterval:
                              const Duration(seconds: 3), // Durasi setiap slide
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
                              text: ' Register👇🏻',
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
                        "Hey, Enter your details to get register\nto your account.",
                        style: ralewayStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.textColor,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.064,
                      ),
                      buildInputField(
                          context: context,
                          label: "Name",
                          hint: "Enter Name",
                          icon: Icons.person_2_outlined),
                      buildInputField(
                          context: context,
                          label: "Email",
                          hint: "Enter Email",
                          icon: Icons.email_outlined),
                      buildInputField(
                          context: context,
                          label: "Password",
                          hint: "Enter Password",
                          icon: Icons.lock_outline_rounded,
                          obscureText: true),
                      buildInputField(
                          context: context,
                          label: "Confirm Password",
                          hint: "Enter Confirm Password",
                          icon: Icons.lock_outline_rounded,
                          obscureText: true),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      buildRegisterButton(),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      buildLoginText(context),
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

  Widget buildImages(String urlImage, BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // Mengatur BoxFit dan ukuran berdasarkan ukuran layar
    BoxFit fitType = ResponsiveWidget.isSmallScreen(context)
        ? BoxFit.fitWidth
        : BoxFit.cover;

    return SizedBox(
      width: width, // Menyesuaikan dengan lebar layar
      height: height *
          (ResponsiveWidget.isSmallScreen(context)
              ? 0.3
              : 0.8), // Proporsi tinggi gambar
      child: Image.network(
        urlImage,
        fit: fitType,
      ),
    );
  }

  Widget buildInputField({
    required BuildContext context,
    required String label,
    required String hint,
    required IconData icon,
    bool obscureText = false,
  }) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: ralewayStyle.copyWith(
              fontSize: 16,
              color: AppColor.blueDarkColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 50,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColor.whiteColor,
            ),
            child: TextFormField(
              obscureText: obscureText,
              style: ralewayStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColor.blueDarkColor,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: hint,
                hintStyle: ralewayStyle.copyWith(
                  fontWeight: FontWeight.w400,
                  color: AppColor.blueDarkColor.withOpacity(0.5),
                ),
                prefixIcon: Icon(icon, color: AppColor.blueDarkColor),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget buildRegisterButton() {
    return Center(
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.mainBlueColor,
        child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 50,
            width: 300,
            alignment: Alignment.center,
            child: Text(
              'Register',
              style: ralewayStyle.copyWith(
                color: AppColor.whiteColor,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoginText(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account?',
                style: ralewayStyle.copyWith(
                  color: AppColor.blueDarkColor,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: ' Log in',
                style: ralewayStyle.copyWith(
                  color: AppColor.mainBlueColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
