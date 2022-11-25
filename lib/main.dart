import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  List<Widget> Contacts = [];

  TextEditingController nameControler = TextEditingController();
  TextEditingController PhoneControler = TextEditingController();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contacts Screen',
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          title: Center(
              child: Text(
            "Contacts Screen",
          )),
        ),
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: nameControler,
                    decoration: InputDecoration(
                        hintText: "Enter Your Name Here",
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.edit,
                          color: Colors.indigoAccent,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: PhoneControler,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: "Enter Your Phone Number",
                        hintStyle: TextStyle(color: Colors.white),
                        suffixIcon: Icon(
                          Icons.phone,
                          color: Colors.indigoAccent,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                  //  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)
                                  )
                              ),
                            ),
                            onPressed: (){
                              if(Contacts.length < 3){
                                setState(() {
                                  Contacts.add(Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Container(
                                      padding: EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child:Column(
                                        crossAxisAlignment: CrossAxisAlignment.stretch,
                                        children: [
                                          Text("Name : " + nameControler.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                          Text("Phone : " + PhoneControler.text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                        ],
                                      ),
                                    ),
                                  ),);
                                });
                              }else{
                                Fluttertoast.showToast(
                                    msg: "This is maxmuim length",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white
                                );
                              }
                            },
                            child: Text("Add")),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.red),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)
                                )
                              ),
                          ),
                            onPressed: (){
                             if(Contacts.length > 0){
                               setState(() {
                                 Contacts.removeAt(Contacts.length - 1);
                               });
                             }else{
                               Fluttertoast.showToast(
                                   msg: "The list is empty",
                                   toastLength: Toast.LENGTH_SHORT,
                                   gravity: ToastGravity.BOTTOM,
                                   timeInSecForIosWeb: 1,
                                   backgroundColor: Colors.red,
                                   textColor: Colors.yellow
                               );
                             }
                            },
                            child: Text("Delete")),
                      ),
                    ],
                  ),
                  ...Contacts
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

}
