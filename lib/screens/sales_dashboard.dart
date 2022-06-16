import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:pivotal_erp/screens/widgets/drawer_screen.dart';

class SalesDashboard extends StatefulWidget {
  const SalesDashboard({Key? key}) : super(key: key);

  @override
  State<SalesDashboard> createState() => _SalesDashboardState();
}

class _SalesDashboardState extends State<SalesDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        // leading: IconButton(onPressed: () {}, icon: Icon(Icons.home)),
      ),
      drawer: DrawerScreen(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 60,
                ),
                Text(
                  "Sales",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 1.0),
                      color: Color.fromARGB(255, 255, 253, 253),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/today.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Today",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "  4 Orders",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 68,
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Yesterday",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "1 Order",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 40,
                              color: Colors.green,
                            )
                          ],
                        )
                        // Container(
                        //   height: 50,
                        //   width: 40,
                        //   child: Icon(
                        //     Icons.arrow_upward,
                        //     size: 50,
                        //     color: Colors.green,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
                /////////second
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 1.0),
                      color: Color.fromARGB(255, 255, 253, 253),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/week.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              // SizedBox(
                              //   width: 80,
                              // ),
                              Text(
                                " This Week",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "5 Orders",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 44,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Last Week",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "1 Order",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 40,
                              color: Colors.green,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 1.0),
                      color: Color.fromARGB(255, 255, 253, 253),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/month.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              // SizedBox(
                              //   width: 20,
                              // ),
                              Text(
                                " This Month",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                "4 Orders",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Last Month",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 Order",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 40,
                              color: Colors.green,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white30, width: 1.0),
                      color: Color.fromARGB(255, 255, 253, 253),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2, //spread radius
                          blurRadius: 2, // blur radius
                          offset: Offset(0, 2),
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("images/year.png"),
                                  fit: BoxFit.fill)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                " This Year",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 35,
                              ),
                              Text(
                                " 8 Orders",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 60,
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              "Last Year",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              "0 Order",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.arrow_upward,
                              size: 40,
                              color: Colors.green,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //     body: GroupedListView<dynamic, String>(
      //   elements: _elements,
      //   groupBy: (element) => element['group'],
      //   groupSeparatorBuilder: (String groupByValue) => Text(groupByValue),
      //   itemBuilder: (context, dynamic element) => Text(element['name']),
      //   itemComparator: (item1, item2) => item1['name'].compareTo(item2['name']), // optional
      //   useStickyGroupSeparators: true, // optional
      //   floatingHeader: true, // optional
      //   order: GroupedListOrder.ASC, // optional
      // ),
    );
  }
}
