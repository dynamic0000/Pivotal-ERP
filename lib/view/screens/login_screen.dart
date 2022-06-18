import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pivotal_erp/constant.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';
import 'package:pivotal_erp/view/screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(children: [
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              height: 350,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background_bottom.png'),
                      fit: BoxFit.cover)),
            )),

        Positioned(
          top: 300,
          child: Center(
            child: Container(
              width: size.width - 50,
              margin: const EdgeInsets.only(right: 25, left: 25),
              height: 300,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15,
                        spreadRadius: 5)
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextFormField(
                        validator:
                            RequiredValidator(errorText: 'Enter UserName'),
                        controller: userNameController,
                        decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Icon(
                                Icons.message,
                                color: ColorConst.iconColor,
                              ),
                            ),
                            hintText: 'Email/Username'),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(4,
                              errorText: 'password must be at least 4 digits')
                        ]),
                        obscureText: true,
                        controller: passwordController,
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Icon(
                              Icons.lock,
                              color: ColorConst.iconColor,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(),
                          hintText: 'Password',
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: ColorConst.iconColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              }),
                          const Text('Remember Me'),
                          const SizedBox(
                            width: 40,
                          ),
                          GestureDetector(
                              child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ))
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      //logggggggggggggggggg INnnnnnnnnnnnnnnnnnnnnnnn
                      Container(
                          height: 43,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: TextButton(
                              onPressed: () async {
                                var userName = userNameController.text;
                                var password = passwordController.text;
                                try {
                                  final response = await RemoteService()
                                      .getToken(userName, password);
                                  if (response != null) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const UserHomeScreen()));
                                  }
                                } catch (e) {
                                  //  FlutterError.demangleStackTrace.toString();
                                  Fluttertoast.showToast(msg: e.toString());
                                }
                              },
                              child: const Text('Log In',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white))))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //cloudddddddddddddddddd
        Positioned(
          top: 50,
          left: 80,
          child: Container(
            height: 330,
            width: 230,
            decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage('images/cloud.png'))),
          ),
        ),
        Positioned(
          top: 30,
          right: 10,
          child: IconButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Change API'),
                      content: TextFormField(
                        initialValue: 'https://demo.pivotalerp.app/',
                        decoration: const InputDecoration(
                          label: Text('Url Please'),
                        ),
                        //`   readOnly: true,
                      ),
                      semanticLabel: 'sd',
                      actions: [
                        MaterialButton(
                          onPressed: () {},
                          child: const Text('Edit'),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: const Text('Check'),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 24,
            ),
          ),
        ),
        // Container(
        //   height: 200,
        //   color: Colors.white,
      ]),
    );
  }
}
