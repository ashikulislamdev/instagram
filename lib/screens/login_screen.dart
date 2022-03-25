import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: Container(), flex: 2),
              SvgPicture.asset("assets/images/Instagram_Logo.svg", color: primaryColor, height: 64,),
              const SizedBox(height: 24,),
              TextInputField(
                textEditingController: _emailController, 
                hintText: "Enter your email", 
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24,),
              TextInputField(
                textEditingController: _passController, 
                hintText: "Enter your password", 
                textInputType: TextInputType.text,
                isPass: true,
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: () {
                  
                },
                child: Container(
                  child: const Text("Log in"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ), color: blueColor )
                ),
              ),
              Expanded(child: Container(), flex: 2),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Don't have an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      child: const Text("Sign up", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16,)
            ],
          ),
        ),
      ),
    );
  }
}