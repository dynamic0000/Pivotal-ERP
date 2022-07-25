import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pivotal_erp/view/screens/User_home_screen.dart';

class OrganisationDetials extends StatefulWidget {
  const OrganisationDetials({Key? key}) : super(key: key);

  @override
  State<OrganisationDetials> createState() => _OrganisationDetialsState();
}

class _OrganisationDetialsState extends State<OrganisationDetials> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //     toolbarHeight: 80,
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const UserHomeScreen(
                            bearerToken: '',
                          )));
            },
            icon: const Icon(Icons.arrow_back_ios)),
        elevation: 0,
        bottomOpacity: 0,

        backgroundColor: const Color.fromARGB(255, 80, 159, 244),
        title: const Text('Organisation'),
        actions: const [Icon(Icons.edit)],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 40.h,
            width: double.infinity,
            color: const Color.fromARGB(255, 80, 159, 244),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Text(
                'Username',
                style: TextStyle(color: Colors.white, fontSize: 18.sp),
              ),
            ),
          ),
          SizedBox(
            //  color: Colors.grey,
            height: 300.h,
            width: double.infinity,
            child: Icon(
              Icons.photo,
              size: 200.sp,
            ),
          ),
/*Profile details */
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                _organisationDetailRow(
                    question: 'Company Name', answer: 'Dynamic Technosoft'),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(
                    question: 'Company Address', answer: 'Baneshwor'),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(
                    question: 'Group Name', answer: 'Administrator'),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(
                    question: 'Name', answer: 'Administrator Name'),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(question: 'Address', answer: ''),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(question: 'Designation', answer: ''),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(question: 'Mobile Number', answer: ''),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
                _organisationDetailRow(question: 'Email', answer: 'abc@gmail'),
                Divider(
                  color: Colors.grey,
                  height: 18.h,
                  thickness: 1.w,
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Row _organisationDetailRow({String? question, String? answer}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question!,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        ),
        const Expanded(child: SizedBox()),
        Text(
          answer!,
          style: TextStyle(
              color: const Color.fromARGB(255, 21, 101, 182),
              fontSize: 18.sp,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
