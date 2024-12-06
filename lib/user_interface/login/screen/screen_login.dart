import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veho_app/user_interface/home/screen/home_screen.dart';
import 'package:veho_app/user_interface/login/service/login_service.dart';
import 'package:veho_app/utils/core_service/serviced.dart';
import 'package:veho_app/utils/widgets/button.dart';
import 'package:veho_app/utils/widgets/generalTextField.dart';

class ScreenLogin extends StatefulWidget {
  const ScreenLogin({super.key});

  @override
  State<ScreenLogin> createState() => _ScreenLoginState();
}

class _ScreenLoginState extends State<ScreenLogin> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color.fromARGB(255, 241, 241, 241),
        body: _isLoading
            ? const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 50.0),
                          child: SvgPicture.asset(
                            'assests/svg/main_logo.svg',
                            height: 100.0,
                            width: 100.0,
                          ),
                        ),
                        const Text(
                          'Login With Your Email & \nPassword',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SpaceWidget(
                          height: 50,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Email',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SpaceWidget(
                          height: 10,
                        ),
                        CustomTextField(
                          prefixIcon: Icons.mail_outline,
                          hintText: 'Enter your email',
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter an email address';
                            }
                            // Check if the email format is valid
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          controller: _emailController,
                        ),
                        const SpaceWidget(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Text(
                              'Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        const SpaceWidget(
                          height: 10,
                        ),
                        CustomTextField(
                          prefixIcon: Icons.lock_outline,
                          isPassword: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          hintText: 'Enter your password',
                          controller: _passwordController,
                        ),
                        const SpaceWidget(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot Password?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        SpaceWidget(
                          height: MediaQuery.of(context).size.height / 100 * 25,
                        ),
                        CustomButton(
                          backgroundColor: const Color(0xff4A101D),
                          buttonText: 'Login',
                          onPressed: () async {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              _isLoading = true;
                              setState(() {});
                              await LoginService().login(
                                  _emailController.text.toString(),
                                  _passwordController.text.toString());
                            }
                            _isLoading = false;
                            setState(() {});
                            if (token != null) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DashboardScreen()),
                              );
                            }
                          },
                        ),
                        const SpaceWidget(
                          height: 10,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              ' Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}

class SpaceWidget extends StatelessWidget {
  final double? width;
  final double? height;

  const SpaceWidget({Key? key, this.width, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
