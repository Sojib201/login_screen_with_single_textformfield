// import 'package:flutter/material.dart';
// import 'package:login_screen/style.dart';
//
// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});
//
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   bool _isPasswordVisible = true;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Container(
//                 child: Image.asset(
//                   'assets/login.png',
//                   color: colorLightGray,
//                   height: 100,
//                   width: 200,
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Text(
//                 "Get Started With",
//                 style: Head1Text(colorDarkBlue),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               TextFormField(
//                 keyboardType: TextInputType.emailAddress,
//                 decoration: EmailInputDeceration1(
//                   "Email",
//                   "Email",
//                   Icon(Icons.email),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               TextFormField(
//                 decoration: PasswordInputDeceration(
//                   "Password",
//                   "Password",
//                   Icon(Icons.lock),
//                   IconButton(
//                     icon: Icon(
//                       _isPasswordVisible
//                           ? Icons.visibility_off
//                           : Icons.visibility,
//                     ),
//                     onPressed: () {
//                       //_isPasswordVisible = !_isPasswordVisible;
//                       if (_isPasswordVisible) {
//                         _isPasswordVisible = false;
//                       } else {
//                         _isPasswordVisible = true;
//                       }
//                       setState(
//                         () {},
//                       );
//                     },
//                   ),
//                 ),
//                 obscureText: _isPasswordVisible,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 243),
//                 child: InkWell(
//                   onTap: () {},
//                   child: Text(
//                     "Forgot Password?",
//                     style: HeadText7(colorLightGray),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               ElevatedButton(
//                 onPressed: () {},
//                 child: SuccessButtonChild("Login"),
//                 style: AppButtonStyle(),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Container(
//                   alignment: Alignment.center,
//                   child: Column(
//                     children: [
//                       Container(
//                         height: 45,
//                         decoration: BoxDecoration(
//                           border: Border.all(color: colorGreen),
//                           color: colorWhite,
//                           borderRadius: BorderRadius.circular(6),
//                         ),
//                         child: InkWell(
//                           onTap: () {},
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Container(
//                                 child: Image.asset(
//                                   'assets/img.png',
//                                   height: 30,
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Text(
//                                 'Sign in with Google',
//                                 style: HeadText7(colorDarkBlue),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       InkWell(
//                         onTap: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Don't have a account?",
//                               style: HeadText7(colorDarkBlue),
//                             ),
//                             Text(
//                               "Register",
//                               style: HeadText7(colorGreen),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/style.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset(
                  'assets/login.png',
                  color: colorLightGray,
                  height: 100,
                  width: 200,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Get Started With",
                style: Head1Text(colorDarkBlue),
              ),
              SizedBox(
                height: 40,
              ),
              CustomTextFormField(
                borderSideColor: Colors.grey,
                label: 'Email',
                hint: 'Email',
                prefixIcon: Icons.email,
                controller: emailController,
                inputType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
                    return "Invalid email address";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                borderSideColor: Colors.green,
                label: 'Password',
                hint: 'Password',
                isPassword: true,
                prefixIcon: Icons.lock,
                controller: passwordController,
                suffixIconButton: IconButton(
                  icon: Icon(
                    _isPasswordVisible
                        ? Icons.visibility_off
                        : Icons.visibility,
                  ),
                  onPressed: () {
                    //_isPasswordVisible = !_isPasswordVisible;
                    if (_isPasswordVisible) {
                      _isPasswordVisible = false;
                    } else {
                      _isPasswordVisible = true;
                    }
                    setState(
                      () {},
                    );
                  },
                ),
                isObsecureText: _isPasswordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  if (value.length < 6) {
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              // TextFormField(
              //   decoration: PasswordInputDeceration(
              //     "Password",
              //     "Password",
              //     Icon(Icons.lock),
              //     IconButton(
              //       icon: Icon(
              //         _isPasswordVisible
              //             ? Icons.visibility_off
              //             : Icons.visibility,
              //       ),
              //       onPressed: () {
              //         //_isPasswordVisible = !_isPasswordVisible;
              //         if (_isPasswordVisible) {
              //           _isPasswordVisible = false;
              //         } else {
              //           _isPasswordVisible = true;
              //         }
              //         setState(
              //           () {},
              //         );
              //       },
              //     ),
              //   ),
              //   obscureText: _isPasswordVisible,
              // ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 243),
                child: InkWell(
                  onTap: () {},
                  child: Text(
                    "Forgot Password?",
                    style: HeadText7(colorLightGray),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {},
                child: SuccessButtonChild("Login"),
                style: AppButtonStyle(),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          border: Border.all(color: colorGreen),
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Image.asset(
                                  'assets/img.png',
                                  height: 30,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Sign in with Google',
                                style: HeadText7(colorDarkBlue),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have a account?",
                              style: HeadText7(colorDarkBlue),
                            ),
                            Text(
                              "Register",
                              style: HeadText7(colorGreen),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final Color? focusColor;
  final double? borderRadiusCircular;
  final Color? borderSideColor;
  final Color? fillColor;
  final bool? filled;
  final String label;
  final Widget? suffixIconButton;
  final String hint;
  final IconData prefixIcon;
  final isPassword;
  final bool? isObsecureText;
  final TextEditingController controller;
  final TextInputType inputType;
  final Function(String)? onChanged;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;

  CustomTextFormField({
    Key? key,
    required this.label,
    required this.hint,
    required this.prefixIcon,
    required this.controller,
    this.inputType = TextInputType.text,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.suffixIconButton,
    this.isPassword = false,
    this.isObsecureText = false,
    this.fillColor,
    this.filled,
     this.borderSideColor=Colors.grey,
     this.borderRadiusCircular=20, this.focusColor=Colors.green,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObsecureText!,
      keyboardType: inputType,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: validator,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: filled,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusCircular!),
          borderSide: BorderSide(color: borderSideColor!),
        ),
        focusColor: focusColor,
        suffixIcon: isPassword ? suffixIconButton : null,
        labelText: label,
        hintText: hint,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadiusCircular!),
          borderSide: BorderSide(color: borderSideColor!),
        ),
      ),
    );
  }
}
