import 'package:flutter/material.dart';

class FrontScreen extends StatefulWidget {
  const FrontScreen({Key? key}) : super(key: key);

  @override
  State<FrontScreen> createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/japanese-temple.webp'),
          fit: BoxFit.fill,
        )),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('images/Monkey.jpg'),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'R Y M E S',
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(226, 14, 14, 14),
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(bottom: 30.0, right: 20),
                            child: ElevatedButton(
                                onPressed: (() {
                                  Navigator.pushNamed(context, '/login');
                                }),
                                style: ElevatedButton.styleFrom(
                                    primary: const Color.fromARGB(
                                        255, 224, 231, 235)),
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 50, right: 50),
                                  child: Text(
                                    'Sign IN',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                              padding: const EdgeInsets.only(bottom: 30),
                              child: ElevatedButton(
                                  onPressed: (() {
                                    Navigator.pushNamed(context, '/signup');
                                  }),
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 50, right: 50),
                                    child: Text(
                                      'Sign UP',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 224, 231, 235),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                  ))),
                        ],
                      )))
            ],
          ),
        ));
  }
}
