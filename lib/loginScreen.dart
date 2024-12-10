import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_screen/style.dart';

import 'customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? emailErrorMessage;
  String? passwordErrorMessage;
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = true;

  // void _login() {
  //   if (_formKey.currentState!.validate()) {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text('Login successful!')),
  //     );
  //   }
  // }

  void _login() {
    bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login successful!')),
      );
    }
  }

  void _validateEmail(String value) {
    if (value.isEmpty) {
      emailErrorMessage = "Please enter your email";
    } else if (!RegExp(r"^[^@]+@[^@]+\.[^@]+").hasMatch(value)) {
      emailErrorMessage = "Invalid email address";
    } else {
      emailErrorMessage = null;
    }
    setState(() {});
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordErrorMessage = "Please enter your password";
    } else if (value.length < 6) {
      passwordErrorMessage = "Password must be at least 6 characters";
    } else {
      passwordErrorMessage = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 80),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Image.asset(
                    'assets/login.png',
                    color: colorLightGray,
                    height: 150,
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
                // CustomTextFormField(
                //   onChanged: (value) => _validateEmail(value),
                //   borderSideColor: Colors.grey,
                //   label: 'Email',
                //   hint: 'Email',
                //   prefixIcon: Icons.email,
                //   controller: emailController,
                //   inputType: TextInputType.emailAddress,
                //   validator: (_) => emailErrorMessage,
                // ),
                CustomTextFormField(
                  onChanged: (value) {
                    //_validateEmail(value);
                    emailErrorMessage = value;
                    _formKey.currentState?.validate();
                  },
                  borderSideColor: Colors.grey,
                  label: 'Email',
                  hint: 'Email',
                  prefixIcon: Icons.email,
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (_) {
                    _validateEmail(emailController.text);
                    return emailErrorMessage;
                  },
                ),

                // if (emailErrorMessage != null)
                //   Text(
                //     emailErrorMessage!,
                //     style: TextStyle(color: Colors.red),
                //   ),
                SizedBox(height: 20),
                //
                CustomTextFormField(
                  onChanged: (value) {
                    //_validatePassword(value);
                    passwordErrorMessage = value;
                    _formKey.currentState?.validate();
                  },
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
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                  isObsecureText: _isPasswordVisible,
                  validator: (_) {
                    _validatePassword(passwordController.text);
                    return passwordErrorMessage;
                  },
                ),

                // if (passwordErrorMessage != null)
                //   Text(
                //     passwordErrorMessage!,
                //     style: TextStyle(color: Colors.red),
                //   ),
                SizedBox(
                  height: 10,
                ),
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
                  onPressed: () {
                    _login();
                  },
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
                            border: Border.all(color: colorLightGray),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have a account?",
                              style: HeadText7(colorDarkBlue),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Register",
                                style: HeadText7(colorDarkBlue),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
