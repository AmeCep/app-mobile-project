import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/controllers/auth_controller.dart';
import 'package:desarrollo_movil_app/views/buyers/autorization/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
 GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController _authController = AuthController();

// late es para declararlo avisanod que despues se le van a hacer uso
  late String email;
  late String fullName;
  late String password;
  bool _isObscure = true;

  registerNewUser() async {
    if (_formKey.currentState!.validate()) {
      BuildContext localContext = context;
      String response =
          await _authController.registerUser(email, fullName, password);
      if (response == 'success') {
        Future.delayed(Duration.zero, () {
          //0 para que no dure nada
          Navigator.push(localContext, MaterialPageRoute(
            builder: (context) {
              return LoginScreen();
            },
          ));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Account Created')));
        });
      } else {
        Future.delayed(Duration.zero, () {
          //0 para que no dure nada
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response)));
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // valida el status del formulario
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Create an account",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              fontSize: 23.0, color: Color(0XFF0D12FE))),
                    ),
                    Text(
                      "to explore world's exclusive",
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(fontSize: 14.0)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 160.0,
                      height: 160.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0XFF050957),
                          width: 4.0,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 80,
                        backgroundColor:
                            Color.fromARGB(255, 255, 255, 255),
                        backgroundImage:
                            AssetImage('assets/images/Illustration.png'),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid email address';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.email, color: Color(0XFF0D12FE)),
                          labelText: 'Your Email',
                          hintText: 'user@email.com',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter a valid name';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        fullName = value;
                      },
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.person, color: Color(0XFF0D12FE)),
                          labelText: 'Your FullName',
                          hintText: 'your FullName',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter password';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          prefixIcon:
                              const Icon(Icons.password, color: Color(0XFF0D12FE)),
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              child: const Icon(Icons.visibility,
                                  color: Color.fromARGB(255, 60, 4, 0))),
                          labelText: 'Your Password',
                          hintText: 'your Password',
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(10.0))),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        width: double.infinity,
                        height: 70,
                        decoration: BoxDecoration(
                            gradient: const LinearGradient(
                                colors: [Color(0XFF262FDE), Color(0XFF050957)]),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Center(
                          child: Text(
                            'Register',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      onTap: () {
                        registerNewUser();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          //Capa invisible que te permite hacer acciones
                          child: Text(
                            'Login now!',
                            style: GoogleFonts.roboto(
                                color: const Color(0XFF0D12FE),
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return LoginScreen();
                            }))
                          },
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
