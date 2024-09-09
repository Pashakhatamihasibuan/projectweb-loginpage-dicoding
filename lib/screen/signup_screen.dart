import 'package:aplikasi_cerita/pattern/app_style/style.dart';
import 'package:aplikasi_cerita/responsive/responsive_widget.dart';
import 'package:aplikasi_cerita/screen/login_screen.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../pattern/color_theme/app_color.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _register() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Registered Success')),
    );
  }

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
                          viewportFraction: 1.0,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
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
                          icon: Icons.person_2_outlined,
                          controller: _nameController),
                      buildInputField(
                          context: context,
                          label: "Email",
                          hint: "Enter Email",
                          icon: Icons.email_outlined,
                          controller: _emailController),
                      buildInputField(
                          context: context,
                          label: "Password",
                          hint: "Enter Password",
                          icon: Icons.lock_outline_rounded,
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          toggleObscureText: _togglePasswordVisibility),
                      buildInputField(
                          context: context,
                          label: "Confirm Password",
                          hint: "Enter Confirm Password",
                          icon: Icons.lock_outline_rounded,
                          controller: _confirmPasswordController,
                          obscureText: _obscurePassword,
                          toggleObscureText: _togglePasswordVisibility),
                      SizedBox(
                        height: height * 0.06,
                      ),
                      _isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : buildRegisterButton(),
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

    BoxFit fitType = ResponsiveWidget.isSmallScreen(context)
        ? BoxFit.fitWidth
        : BoxFit.cover;

    return SizedBox(
      width: width,
      height: height * (ResponsiveWidget.isSmallScreen(context) ? 0.3 : 0.8),
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
    required TextEditingController controller,
    bool obscureText = false,
    VoidCallback? toggleObscureText,
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
              controller: controller,
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
                suffixIcon: toggleObscureText != null
                    ? IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                          color: AppColor.blueDarkColor,
                        ),
                        onPressed: toggleObscureText,
                      )
                    : null,
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
          onTap: _register,
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
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        },
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Already have an account? ',
                style: ralewayStyle.copyWith(
                  fontSize: 14,
                  color: AppColor.textColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextSpan(
                text: 'Login',
                style: ralewayStyle.copyWith(
                  fontSize: 14,
                  color: AppColor.mainBlueColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final urlImages = [
  "https://images.unsplash.com/photo-1718679388215-75b00db812f5?w=1600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHx0b3BpYy1mZWVkfDR8NnNNVmpUTFNrZVF8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1725539075423-984d4dcdefae?q=80&w=1664&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://images.unsplash.com/photo-1725435214975-989b71be4a56?q=80&w=1635&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
];
