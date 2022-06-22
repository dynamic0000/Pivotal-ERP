import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:pivotal_erp/constant.dart';
import 'package:pivotal_erp/controller/remote_services.dart';
import 'package:pivotal_erp/view/widgets/loading_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController urlController = TextEditingController();
  bool _showPassword = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    urlController.text = 'https://demo.pivotalerp.app/';
  }

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
              // width: MediaQuery.of(context).size.width,
              height: 350.h,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/background_bottom.png'),
                      fit: BoxFit.cover)),
            )),

        //  cloudddddddddddddddddd
        Positioned(
          top: 50.h,
          left: 80.w,
          child: Container(
            height: 330.h,
            width: 230.w,
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
                        controller: urlController,
                        //  initialValue: 'https://demo.pivotalerp.app/',
                        decoration: const InputDecoration(
                          label: Text('Url Please'),
                        ),
                        //`   readOnly: true,
                      ),
                      semanticLabel: 'Hurray',
                      actions: [
                        Expanded(
                          child: Row(
                            children: [
                              MaterialButton(
                                onPressed: () {},
                                child: const Text('Edit'),
                              ),
                              MaterialButton(
                                onPressed: () async {
                                  var currentUrl = urlController.text;
                                  // log('qqqqqqqqqqqq$currentUrl');
                                  final response =
                                      await RemoteService().getUrl(currentUrl);
                                  Fluttertoast.showToast(msg: response);
                                  if (response == 'Success') {
                                    Navigator.pop(context);
                                  } else {
                                    return;
                                  }
                                },
                                child: const Text('Check'),
                              ),
                              MaterialButton(
                                onPressed: () {},
                                child: const Text('OK'),
                              ),
                            ],
                          ),
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
        Positioned(
          top: 300.h,
          child: Center(
            child: Container(
              width: size.width - 50.w,
              margin: EdgeInsets.only(right: 25.w, left: 25.w),
              height: 300.h,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.4),
                        blurRadius: 15.r,
                        spreadRadius: 5.r)
                  ],
                  borderRadius: BorderRadius.circular(15.r)),
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
                      SizedBox(
                        height: 20.h,
                      ),
                      TextFormField(
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(4,
                              errorText: 'password must be at least 4 digits')
                        ]),
                        // obscureText: obscureText,
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _showPassword = !_showPassword;
                                });
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            )),
                        obscureText: !_showPassword,
                      ),

                      // SizedBox(
                      //   height: 8.h,
                      // ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
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
                              ],
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            GestureDetector(
                                child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.blue),
                            ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      //logggggggggggggggggg INnnnnnnnnnnnnnnnnnnnnnnn
                      Container(
                          height: 43.h,
                          width: 100.w,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10.r)),
                          child: TextButton(
                              onPressed: () async {
                                var userName = userNameController.text;
                                var password = passwordController.text;
                                try {
                                  final response = await RemoteService()
                                      .getToken(userName, password);
                                  if (response != null) {
                                    const CircularProgressIndicator();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const LoadingScreen(),
                                      ),
                                    );
                                  }
                                } catch (e) {
                                  //  FlutterError.demangleStackTrace.toString();
                                  Fluttertoast.showToast(msg: e.toString());
                                }
                              },
                              child: Text('Log In',
                                  style: TextStyle(
                                      fontSize: 16.sp, color: Colors.white))))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        // Container(
        //   height: 200,
        //   color: Colors.white,
        // ),
      ]),
    );
  }
}
