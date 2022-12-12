import 'package:evryday/screens/signup.dart';
import 'package:flutter/material.dart';
import 'package:evryday/main.dart';
import 'package:provider/provider.dart';
import 'package:evryday/widgets/drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:evryday/screens/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  void togglePasswordView() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  String username = "";
  String password1 = "";

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    var screen = Provider.of<ScreenState>(context);
    Size size = MediaQuery.of(context).size;
    return Form(
        key: _formKey,
        child: Stack(
          children: [
            Scaffold(
              appBar: AppBar(title: const Text("Login"), backgroundColor: const Color.fromRGBO(42, 44, 62, 1),),
              drawer: const DrawerComponents(currentPage: "Login"),
              body: Column(
                children: [
                  const Flexible(
                    child: Center(
                      child: Text(
                        'EV-ryday',
                        style: TextStyle(
                            color: Color.fromRGBO(42, 44, 62, 1),
                            fontSize: 60,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Masukkan Username",
                            labelText: "Username",
                            labelStyle: const TextStyle(color: Colors.black),
                            icon: const Icon(Icons.attach_email),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            hintStyle: const TextStyle(color: Colors.black),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              username = value!;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
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
                              borderRadius: BorderRadius.circular(5.0),
                            ),
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
                            final response = await request.login(
                                "https://ev-ryday.up.railway.app/login-flutter/",
                                {
                                  'username': username,
                                  'password': password1,
                                });
                            if (response['status']) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("Successfully logged in!"),
                              ));
                              // ignore: use_build_context_synchronously
                              Provider.of<ScreenState>(context, listen: false)
                                  .setCurrentScreen(0);
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()));
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content:
                                    Text("An error occured, please try again."),
                              ));
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
                        height: 35,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Provider.of<ScreenState>(context, listen: false)
                          .setCurrentScreen(7);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUpPage()));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.black))),
                      child: const Text(
                        'Create New Account',
                        style: TextStyle(
                            fontSize: 22, color: Colors.black, height: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 35,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
