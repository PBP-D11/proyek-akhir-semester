import 'package:evryday/screens/login.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:evryday/main.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'dart:convert' as convert;

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  dynamic _validationPassword;
  dynamic _validationUsername;
  dynamic _validationEmail;

  Future<dynamic> checkPassword(checkPassword) async {
    _validationPassword = null;

    if (checkPassword.isEmpty) {
      _validationPassword = "Password konfirmasi tidak boleh kosong";
      setState(() {});
      return;
    }

    if (checkPassword != password1) {
      _validationPassword = "Password tidak sama";
      setState(() {});
      return;
    }

    setState(() {
      password2 = checkPassword;
    });
  }

  Future<dynamic> checkEmail(checkEmail) async {
    _validationEmail = null;

    if (checkEmail.isEmpty) {
      _validationEmail = "Emai tidak boleh kosong";
      setState(() {});
      return;
    }
    bool checkReg = RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(checkEmail);
    if (!checkReg) {
      _validationEmail = "Email invalid";
      setState(() {});
      return;
    }

    setState(() {});
    final response = await CookieRequest().get(
        "https://ev-ryday.up.railway.app/validate-email?email=$checkEmail");

    bool exists = response["exists"];
    if (exists) {
      _validationEmail = "Email tidak dapat digunakan";
      setState(() {});
      return;
    } else {
      setState(() {
        email = checkEmail;
      });
    }
  }

  Future<dynamic> checkUsername(checkUsername) async {
    _validationUsername = null;

    if (checkUsername.isEmpty) {
      _validationUsername = "Username tidak boleh kosong";
      setState(() {});
      return;
    }

    setState(() {});
    final response = await CookieRequest().get(
        "https://ev-ryday.up.railway.app/validate-username?username=$checkUsername");

    bool exists = response["exists"];
    if (exists) {
      _validationUsername = "Username tidak dapat digunakan";
      setState(() {});
      return;
    } else {
      setState(() {
        username = checkUsername;
      });
    }
  }

  String username = "";
  String email = "";
  String password1 = "";
  String password2 = "";
  String firstName = "";
  String lastName = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          Scaffold(
            appBar: AppBar(title: const Text("Sign Up")),
            drawer: const DrawerComponents(currentPage: "Sign Up"),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Stack(
                    children: const [
                      Center(
                        child: Text('Sign Up',
                            style:
                                TextStyle(fontSize: 60, color: Colors.black)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: size.width * 0.1,
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Focus(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "contoh: Dummy123",
                                labelText: "Username",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              controller: _usernameCtrl,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) => _validationUsername,
                            ),
                            onFocusChange: (hasFocus) {
                              if (!hasFocus) checkUsername(_usernameCtrl.text);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Focus(
                            child: TextFormField(
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "contoh: dummy1@korongko.com",
                                labelText: "Email",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(Icons.people),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              controller: _emailCtrl,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) => _validationEmail,
                            ),
                            onFocusChange: (hasFocus) {
                              if (!hasFocus) checkEmail(_emailCtrl.text);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          obscureText: true,
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Masukkan Password",
                            labelText: "Password",
                            labelStyle: const TextStyle(color: Colors.black),
                            icon: const Icon(
                              Icons.lock_outline,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              password1 = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Focus(
                            child: TextFormField(
                              obscureText: true,
                              style: const TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                hintText: "Konfirmasi Password",
                                labelText: "Password",
                                labelStyle:
                                    const TextStyle(color: Colors.black),
                                icon: const Icon(
                                  Icons.lock_outline,
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                                hintStyle: const TextStyle(color: Colors.black),
                              ),
                              controller: _passwordCtrl,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (val) => _validationPassword,
                            ),
                            onFocusChange: (hasFocus) {
                              if (!hasFocus) checkPassword(_passwordCtrl.text);
                            }),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama Depan",
                            labelText: "First Name",
                            labelStyle: const TextStyle(color: Colors.black),
                            icon: const Icon(
                              Icons.person_pin_outlined,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              firstName = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              firstName = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama depan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Masukkan Nama Belakang",
                            labelText: "Last Name",
                            labelStyle: const TextStyle(color: Colors.black),
                            icon: const Icon(
                              Icons.person_pin_outlined,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              lastName = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              lastName = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Nama belakang tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: size.height * 0.08,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.black26,
                        ),
                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Submit to Django server and wait for response
                              final response = await request.postJson(
                                  "https://ev-ryday.up.railway.app/register-flutter/",
                                  convert.jsonEncode(<String, String>{
                                    'username': username,
                                    'email': email,
                                    'password1': password1,
                                    'password2': password2,
                                    'first_name': firstName,
                                    'second_name': lastName,
                                  }));
                              if (response['status'] == 'success') {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "Account has been successfully registered!"),
                                ));
                                // ignore: use_build_context_synchronously
                                Provider.of<ScreenState>(context, listen: false)
                                    .setCurrentScreen(6);
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const LoginPage()));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "An error occured, please try again."),
                                ));
                              }
                            }
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.black54,
                                height: 1.5,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account?',
                            style: TextStyle(
                                fontSize: 22, color: Colors.black, height: 1.5),
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<ScreenState>(context, listen: false)
                                  .setCurrentScreen(0);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const LoginPage()));
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.black,
                                  height: 1.5,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
