import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/app/modules/login/controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Color(0xFFF2F3F6),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
          children: [
            SizedBox(height: size.height * 0.05),
            Text(
              'Hi, Welcome Back!',
              style: TextStyle(
                color: Color(0xFF1966FF),
                fontSize: size.width * 0.07,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 1.2,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Text(
              'Sign In First',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: size.width * 0.04,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              'Email Address',
              style: TextStyle(
                color: Color(0xFF1966FF),
                fontSize: size.width * 0.045,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your email address',
                prefixIcon: Icon(Icons.email, color: Color(0xFF5890FF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF5890FF)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF5890FF), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF1966FF), width: 2),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Password',
              style: TextStyle(
                color: Color(0xFF1966FF),
                fontSize: size.width * 0.045,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter your password',
                prefixIcon: Icon(Icons.lock, color: Color(0xFF5890FF)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF5890FF)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF5890FF), width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF1966FF), width: 2),
                ),
                suffixIcon: Icon(Icons.visibility_off),
              ),
            ),
            SizedBox(height: size.height * 0.015),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    Text(
                      'Remember Me',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: size.width * 0.03,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(
                      color: Color(0xFF1966FF),
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02), // Memperlebar tombol
                backgroundColor: Color(0xFF1966FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: size.width * 0.045,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/google.png',
                width: size.width * 0.06,
                height: size.width * 0.06,
              ),
              label: Text(
                'Continue with Google',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: size.width * 0.04,
                  fontWeight: FontWeight.w400,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: size.height * 0.02), // Memperlebar tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Color(0xFF94A3B8)),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04), // Tambah jarak
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don’t Have Account?',
                  style: TextStyle(
                    color: Color(0xFF989FA7),
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Color(0xFF101727),
                      fontSize: size.width * 0.03,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
          ],
        ),
      ),
    );
  }
}
