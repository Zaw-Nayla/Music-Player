

import 'package:flutter/material.dart';
import 'package:flutter_application_3/front.dart';
import 'package:flutter_application_3/musicpage.dart';
import 'package:flutter_application_3/register.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() => runApp(const Loginpage());

class Loginpage extends StatelessWidget {
  const Loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spotify Login',
      initialRoute: '/',
      routes: {
        '/':(context) => const FrontScreen(),
        '/login': (context) =>  const  MyLogInPage(),
        '/signup':(context) => const RegisterPage(),
        '/main': (context) => const MyHomepage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyLogInPage extends StatefulWidget {
  const MyLogInPage({Key? key}) : super(key: key);

  @override
  State<MyLogInPage> createState() => _MyLogInPageState();
}

class _MyLogInPageState extends State<MyLogInPage> {

  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  bool eye = true;
  var dropdownValue = '2';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  children: [
                    const SizedBox( height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Log In',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(height: 70,),
                        DropdownButton(
                          value: dropdownValue,
                          underline: const SizedBox(),
                          items: const [
                            DropdownMenuItem(
                              value: '1',
                              child: Text(
                                '   Admin',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            DropdownMenuItem(
                              value: '2',
                              child: Text(
                                '   Member',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                          onChanged: (newValue) {
                            setState(() {
                              dropdownValue = newValue.toString();
                            });
                          },
                        )
                      ],
                    ),
                    ClipRRect(
                        child: Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage('images/pic.png'),
                        fit: BoxFit.fill,
                      )),
                    )),
                    TextField(
                        cursorColor: Colors.black,
                        controller: usernamecontroller,
                        decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            prefixIcon: Icon(Icons.person),
                            labelText: 'Username',
                            labelStyle: TextStyle(color: Colors.black))),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                        cursorColor: Colors.black,
                        controller: passwordcontroller,
                        obscureText: eye,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black)),
                          prefixIcon: const Icon(Icons.key_outlined),
                          labelText: 'Password',
                          labelStyle: const TextStyle(color: Colors.black),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  eye = !eye;
                                });
                              },
                              splashRadius: 5,
                              icon: eye
                                  ? const Icon(
                                      Icons.remove_red_eye,
                                      color: Color.fromARGB(31, 20, 20, 20),
                                    )
                                  : const Icon(
                                      Icons.visibility_off,
                                      color: Color.fromARGB(66, 19, 18, 18),
                                    )),
                        )),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(10)),
                            ),
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            )),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: ()async {
                              final prefs = await SharedPreferences.getInstance();
                               final String? username = prefs.getString('userValue');
                                final String? password = prefs.getString('passValue');
                              setState(() {
                                print(
                                    '$username + $password + ${dropdownValue.toString()}');
                                if (usernamecontroller.text ==
                                        username &&
                                    passwordcontroller.text ==
                                        password) {
                                  Navigator.pushNamed(context, '/main');
                                  usernamecontroller.clear();
                      passwordcontroller.clear();
                                }
                              });
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.blueGrey),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10)),
                                shadowColor: MaterialStateProperty.all(
                                    Colors.blueAccent)),
                            child: const Text('Log In')),
                      ],
                    )
                  ]),
            ),
          ),
        ));
  }
}
