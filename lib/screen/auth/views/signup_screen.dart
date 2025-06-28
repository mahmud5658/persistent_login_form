import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constant/app_colors.dart';
import '../../../utils/input_validator.dart';
import '../controllers/auth_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPasswordController = TextEditingController();

  bool isRememberMeChecked = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _buildNameField(),
                const SizedBox(height: 20),
                _buildEmailField(),
                const SizedBox(height: 20),
                _buildPasswordField(),
                const SizedBox(height: 20),
                _buildConfirmPassword(),
                const SizedBox(height: 10),
                _buildRememberMeAndForgotPassword(),
                const SizedBox(height: 15),
                _buildLoginButton(),
                const SizedBox(height: 30),
                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameField() {
    return TextFormField(
      validator: (value) => InputValidator.validateName(value!),
      keyboardType: TextInputType.emailAddress,
      controller: nameController,
      decoration: InputDecoration(
        hintText: 'name',
        prefixIcon: Icon(Icons.person),
      ),
    );
  }


  Widget _buildEmailField() {
    return TextFormField(
      validator: (value) => InputValidator.validateEmail(value!),
      keyboardType: TextInputType.emailAddress,
      controller: emailController,
      decoration: InputDecoration(
        hintText: 'Email',
        prefixIcon: Icon(Icons.email),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      validator: (value) => InputValidator.validatePassword(value!),
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isPasswordVisible,
      obscuringCharacter: '*',
      controller: passwordController,
      decoration: InputDecoration(
        hintText: 'Password',
        suffixIcon: IconButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      validator: (value) => InputValidator.validatePassword(value!),
      keyboardType: TextInputType.visiblePassword,
      obscureText: !isPasswordVisible,
      obscuringCharacter: '*',
      controller: cPasswordController,
      decoration: InputDecoration(
        hintText: 'Confirm password',
        suffixIcon: IconButton(
          style: ButtonStyle(
            overlayColor: WidgetStateProperty.all(Colors.transparent),
          ),
          icon: Icon(
            isPasswordVisible ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              isPasswordVisible = !isPasswordVisible;
            });
          },
        ),
        prefixIcon: Icon(Icons.lock),
      ),
    );
  }


  Widget _buildRememberMeAndForgotPassword() {
    return Row(
      children: [
        Checkbox(
          overlayColor: WidgetStateProperty.all(Colors.transparent),
          value: isRememberMeChecked,
          onChanged: (bool? value) {
            setState(() {
              isRememberMeChecked = value!;
            });
          },
        ),
        const Text('Remember Me'),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Get.snackbar(
            'Success',
            'SignUp successful!',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.green.shade600,
            colorText: Colors.white,
            borderRadius: 12,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            icon: const Icon(Icons.check_circle, color: Colors.white),
            duration: const Duration(seconds: 3),
            isDismissible: true,
            forwardAnimationCurve: Curves.easeOutBack,
          );
        }
      },
      child: Text('Sign Up'),
    );
  }

  Widget _buildSignUpLink() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
        children: [
          TextSpan(
            text: "Already have an account. ",
          ),
          TextSpan(
            text: "Login",
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              final authController = Get.find<AuthController>();
              authController.changeTabIndex(1);
            },
          ),
        ],
      ),
    );
  }
}
