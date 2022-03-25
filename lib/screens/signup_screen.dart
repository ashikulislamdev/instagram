import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_method.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/utils/utils.dart';
import 'package:instagram/widgets/input_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  Uint8List ? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  void selectedImage() async {
    Uint8List selectImage = await pickImage(ImageSource.gallery);
    setState(() {
      _image = selectImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height / 8,),
              SvgPicture.asset("assets/images/Instagram_Logo.svg", color: primaryColor, height: 64,),
              const SizedBox(height: 48,),
              Stack(
                children: [
                  _image != null ? CircleAvatar(radius: 64, backgroundImage: MemoryImage(_image!),) : const CircleAvatar(radius: 64, backgroundImage: AssetImage("assets/images/web-dev.png"),),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: (){
                        selectedImage();
                      }, 
                      icon: const Icon(Icons.add_a_photo),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 24,),
              TextInputField(
                textEditingController: _usernameController, 
                hintText: "Enter your username", 
                textInputType: TextInputType.text,
              ),
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
              TextInputField(
                textEditingController: _bioController, 
                hintText: "Enter your Bio", 
                textInputType: TextInputType.text,
              ),
              const SizedBox(height: 24,),
              InkWell(
                onTap: () async {
                  String res = await AuthMethod().signUpUser(
                    email: _emailController.text, 
                    password: _passController.text, 
                    username: _usernameController.text, 
                    bio: _bioController.text,
                    file: _image
                  );
                  print(res);
                },
                child: Container(
                  child: const Text("Sign up"),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ), color: blueColor )
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height / 10,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text("Already have an account? "),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child: Container(
                      child: const Text("Log in", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),),
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