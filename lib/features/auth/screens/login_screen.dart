import 'package:clone_app_amazon/constants/global_variables.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(GloblalVariable.backgroundImageAuth),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ------ button back ------
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios,
                    size: 22, color: Colors.white),
              ),
            ),
            // ------ title ------
            const Expanded(
              child: Center(
                child: Text(
                  'Wellcome back',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      decoration: TextDecoration.none),
                ),
              ),
            ),

            Form(
              key: _formKey,
              child: SizedBox(
                height: 160,
                child: Column(
                  children: [
                    // ------ field username ------
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusColor: Colors.blue,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: const Icon(Icons.person,
                                color: GloblalVariable.Hex_9c9c9c),
                            hintText: 'Usename',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    // ------ field passwords ------
                    Expanded(
                      child: SizedBox(
                        width: 300,
                        height: 50,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a password';
                            }
                            return null;
                          },
                          obscureText: _passwordVisible,
                          decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)),
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusColor: Colors.blue,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5)),
                            prefixIcon: const Icon(Icons.lock,
                                size: 20, color: GloblalVariable.Hex_9c9c9c),
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                              child: Icon(
                                  _passwordVisible
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: GloblalVariable.Hex_9c9c9c),
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ----- forgot password -----
            Padding(
              padding: const EdgeInsets.only(right: 35),
              child: Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: null,
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // ------ button login-----
            GestureDetector(
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (_) => const LoginScreen()));
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 250,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.blue),
                  child: const Text('Log In',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                )),
            const SizedBox(height: 20),
            // --------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 2,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: GloblalVariable.Hex_9c9c9c))),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: Text('or',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                Container(
                  width: 110,
                  height: 2,
                  decoration: const BoxDecoration(
                      border: Border(
                          top: BorderSide(color: GloblalVariable.Hex_9c9c9c))),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // ------ other button login-----
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton.icon(
                    onPressed: null,
                    icon:
                        const Icon(Icons.facebook_outlined, color: Colors.blue),
                    label: const Text('Login',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.none)),
                  ),
                ),
                const SizedBox(width: 30),
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: TextButton.icon(
                    onPressed: null,
                    icon: Image.asset(
                      'assets/img/google.png',
                      width: 15,
                      height: 15,
                    ),
                    label: Text('Login',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            decoration: TextDecoration.none)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 90),
            // ------ sign up -------
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Do not have an account ? ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        decoration: TextDecoration.none)),
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context)
                        .pushNamed(GloblalVariable.registerScreen);
                  },
                  child: const Text('Register now',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          decoration: TextDecoration.none)),
                )
              ],
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
