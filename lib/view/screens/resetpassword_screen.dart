import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({
    Key? key,
    required this.bearerToken,
  }) : super(key: key);
  final String bearerToken;
  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  bool _showpassword = false;
  bool _showpassword2 = false;
  bool _showpassword3 = false;
  final oldPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Password'),
        backgroundColor: const Color.fromARGB(255, 80, 159, 244),
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const UserHomeScreen(
                            bearerToken: '',
                          ))));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(

//          mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Text(
                    'Update Password',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                _extractPassword(
                    obscureText: !_showpassword,
                    hintText: 'Enter Old Password',
                    controller: oldPassword,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showpassword = !_showpassword;
                          });
                        },
                        icon: Icon(_showpassword
                            ? Icons.visibility
                            : Icons.visibility_off))),
                _extractPassword(
                    hintText: 'Enter New Password',
                    controller: newPassword,
                    obscureText: !_showpassword2,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showpassword2 = !_showpassword2;
                          });
                        },
                        icon: Icon(_showpassword2
                            ? Icons.visibility
                            : Icons.visibility_off))),
                _extractPassword(
                    hintText: 'Confirm Password',
                    controller: confirmPassword,
                    obscureText: !_showpassword3,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _showpassword3 = !_showpassword3;
                          });
                        },
                        icon: Icon(_showpassword3
                            ? Icons.visibility
                            : Icons.visibility_off))),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: SizedBox(
                    height: 45,
                    width: 170,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 80, 159, 244))),
                        onPressed: () async {
                          var oldPWD = oldPassword.text;
                          var newPWD = newPassword.text;
                          var confPWD = confirmPassword.text;
                          if (newPWD == confPWD) {
                            final changeeeeee = RemoteService().updatePassword(
                                oldPWD, newPWD, widget.bearerToken);
                            Fluttertoast.showToast(msg: 'Sucess');
                            Navigator.pop(context);
                          } else {
                            Fluttertoast.showToast(msg: 'try again');
                          }

                          // log('changeeeeeeeeeee: $changeeeeee');
                          log('oldpwd::::$oldPWD' 'newpwd:::$newPWD');
                        },
                        child: const Text('Update Password')),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  Padding _extractPassword({
    String? hintText,
    TextEditingController? controller,
    Widget? suffixIcon,
    required bool obscureText,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
          controller: controller,
          obscureText: obscureText,
          decoration:
              InputDecoration(hintText: hintText, suffixIcon: suffixIcon)
          // GestureDetector(
          //     onTap: () {
          //       setState(() {
          //         _showpassword = !_showpassword;
          //       });
          //     },
          //     child: Icon(
          //         _showpassword ? Icons.visibility : Icons.visibility_off))),

          ),
    );
  }
}
