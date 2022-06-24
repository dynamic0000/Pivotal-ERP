import 'package:flutter/material.dart';

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
        leading: const Icon(Icons.backspace_rounded),
        elevation: 0,
        bottomOpacity: 0,

        // toolbarOpacity: 0,
        backgroundColor: const Color.fromARGB(255, 24, 84, 137),
        title: const Text('Organisation'),
        actions: const [Icon(Icons.edit)],
      ),
      body: Column(children: [
        Container(
          height: 40,
          width: double.infinity,
          color: const Color.fromARGB(255, 24, 84, 137),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            child: Text(
              'Username',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        )
        /////////photo suru////////
        ,
        SizedBox(
          //  color: Colors.grey,
          height: 300,
          width: double.infinity,
          child: const Icon(
            Icons.photo,
            size: 200,
          ),
        ),
        ////////////details//////////
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              _organisationDetailRow(
                  question: 'Company Name', answer: 'Dynamic Technosoft'),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(
                  question: 'Company Address', answer: 'Baneshwor'),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(
                  question: 'Group Name', answer: 'Administrator'),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(
                  question: 'Name', answer: 'Administrator Name'),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(question: 'Address', answer: ''),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(question: 'Designation', answer: ''),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(question: 'Mobile Number', answer: ''),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
              _organisationDetailRow(question: 'Email', answer: 'abc@gmail'),
              const Divider(
                color: Colors.grey,
                height: 18,
                thickness: 1,
              ),
            ],
          ),
        )
      ]),
    );
  }

  Row _organisationDetailRow({String? question, String? answer}) {
    return Row(
      //  mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question!,
          style: TextStyle(
              color: Colors.grey[700],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
        const Expanded(child: SizedBox()),
        Text(
          answer!,
          style: const TextStyle(
              color: Color.fromARGB(255, 21, 101, 182),
              fontSize: 18,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
