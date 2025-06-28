
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_login_form/screen/auth/views/signin_screen.dart';
import 'package:persistent_login_form/screen/auth/views/signup_screen.dart';

import '../../../constant/app_colors.dart';
import '../../../widgets/app_logo.dart';
import '../controllers/auth_controller.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AuthController controller = Get.find<AuthController>();

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            _buildHeaderSection(controller),
            const SizedBox(height: 20),
            _buildMainTabContent(controller),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(AuthController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: Row(
        children: [
          Expanded(child: AppLogo()),
          TextButton(
            onPressed: () {
            },
            child: const Text('Skip'),
          ),
        ],
      ),
    );
  }

  Widget _buildMainTabContent(AuthController controller) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), topRight: Radius.circular(25)),
          color: AppColors.darkBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeaderIndicator(),
            const SizedBox(height: 10),
            _buildTabTitle(controller),
            const SizedBox(height: 5),
            _buildTabDescription(controller),
            const SizedBox(height: 25),
            _buildTabBar(controller),
            const SizedBox(height: 20),
            _buildTabBarView(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderIndicator() {
    return Container(
      height: 6,
      width: 70,
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.symmetric(vertical: 20),
    );
  }

  Widget _buildTabTitle(AuthController controller) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Text(
          controller.selectedTabIndex == 0 ? 'Login' : 'Sign Up',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        );
      },
    );
  }

  Widget _buildTabDescription(AuthController controller) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Text(
          controller.selectedTabIndex == 0
              ? 'Please enter your email and password'
              : 'Please fill in the details to create an account',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondaryColor,
          ),
        );
      },
    );
  }

  Widget _buildTabBar(AuthController controller) {
    return TabBar(
      onTap: (index) {
        controller.changeTabIndex(index);
      },
      controller: _tabController,
      tabs: const [
        Tab(text: 'Login'),
        Tab(text: 'Sign Up'),
      ],
    );
  }

  Widget _buildTabBarView() {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: const [LoginScreen(), SignupScreen()],
      ),
    );
  }
}
