import 'package:flutter/material.dart';
import 'package:renta/pages/login_page.dart';
import 'package:http/http.dart' as http;


class RegPage extends StatefulWidget {
  const RegPage({key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<RegPage> {
  
  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
              
      children: [
        Container(
          height: 250,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(90)),
            color: new Color(0xFF1B6A65),
            gradient: LinearGradient(
              colors: [(new Color(0xFF1B6A65)), new Color(0xFF1B6A65)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  "assets/images/rentalogo.png",
                  height: 50,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 20, top: 20),
                alignment: Alignment.bottomRight,
                child: const Text(
                  "Register",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              )
            ],
          )),
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: const Color(0xFF1B6A65),
            decoration: const InputDecoration(
              icon: Icon(
                Icons.person,
                color: Color(0xFF1B6A65),
              ),
              hintText: "Full Name",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),         
          ),
              
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.grey[200],
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 10),
                  blurRadius: 50,
                  color: const Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: const Color(0xFF1B6A65),
            // ignore: unnecessary_const
            decoration: const InputDecoration(
              icon: Icon(
                Icons.verified_user_sharp,
                color: const Color(0xFF1B6A65),
              ),
              hintText: "username",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          )
          
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 100,
                  color: const Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: Color(0xFF1B6A65),
            decoration: InputDecoration(
              focusColor: Color(0xFF1B6A65),
              icon: Icon(
                Icons.phone,
                color: const Color(0xFF1B6A65),
              ),
              hintText: "Phone Number",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
         
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: const Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: const Color(0xFF1B6A65),
            decoration: InputDecoration(
              focusColor: Color(0xFF1B6A65),
              icon: Icon(
                Icons.email,
                color: const Color(0xFF1B6A65),
              ),
              hintText: "Email",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
         
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  offset: Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: const Color(0xFF1B6A65),
            // ignore: unnecessary_const
            decoration: const InputDecoration(
              focusColor: Color(0xFF1B6A65),
              icon: Icon(
                Icons.vpn_key,
                color: Color(0xFF1B6A65),
              ),
              hintText: "Enter Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
           
        ),
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
          padding: const EdgeInsets.only(left: 20, right: 20),
          height: 54,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: const Color(0xffEEEEEE),
            // ignore: prefer_const_literals_to_create_immutables
            boxShadow: [
              const BoxShadow(
                  offset: const Offset(0, 20),
                  blurRadius: 100,
                  color: Color(0xffEEEEEE)),
            ],
          ),
          child: const TextField(
            cursorColor: Color(0xFF1B6A65),
            // ignore: unnecessary_const
            decoration: const InputDecoration(
              focusColor: const Color(0xFF1B6A65),
              // ignore: unnecessary_const
              icon: const Icon(
                Icons.vpn_key,
                color: Color(0xFF1B6A65),
              ),
              hintText: "Re-type Password",
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
             
        ),
        GestureDetector(
          onTap: () {
            // Write Click Listener Code Here.
             Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(left: 20, right: 20, top: 70),
            padding: const EdgeInsets.only(left: 20, right: 20),
            height: 54,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [(new Color(0xFF1B6A65)), new Color(0xFF1B6A65)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey[200],
              // ignore: prefer_const_literals_to_create_immutables
              boxShadow: [
                const BoxShadow(
                    offset: Offset(0, 10),
                    blurRadius: 50,
                    color: Color(0xffEEEEEE)),
              ],
            ),
            child: const Text(
              "REGISTER",
              style: TextStyle(color: Colors.white),

            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Have Already Member?  "),
              GestureDetector(
                child: const Text(
                  "Login Now",
                  style: const TextStyle(color: Color(0xFF1B6A65)),
                ),
                onTap: () {
                  // Write Tap Code Here.
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const LoginPage()));
                },
              )
            ],
          ),
        )
      ],
    )));
  }
}
