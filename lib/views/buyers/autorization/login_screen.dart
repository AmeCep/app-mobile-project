import 'package:desarrollo_movil_app/constants.dart';
import 'package:desarrollo_movil_app/controllers/auth_controller.dart';
import 'package:desarrollo_movil_app/views/buyers/autorization/register_screen.dart';
import 'package:desarrollo_movil_app/views/buyers/nav_screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
   GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AuthController _authController = AuthController();

  late String email;
  late String password;
  bool _isLoading = false;
  bool _isObscure = true;
  loginUser() async {
    _isLoading = true;
    if (_formKey.currentState!.validate()) {
      BuildContext localContext = context;
      var response = await _authController.loginUser(email, password);
      if (response == 'success') {
        Future.delayed(Duration.zero, () {
          //0 para que no dure nada
          Navigator.push(localContext, MaterialPageRoute(
            builder: (context) {
              return MainScreen();
            },
          ));
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Login Successful')));
        }).whenComplete(() {
          setState(() {
            _formKey.currentState!.reset();
            _isLoading = false;
          });
        });
      } else {
        Future.delayed(Duration.zero, () {
          //0 para que no dure nada
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(response)));
        }).whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      }
    }
  }

/*
  loginUser() async {

    if (_formKey.currentState!.validate()) {
      BuildContext localContext = context;
      String response = await _authController.loginUser(email, password);
      if (response == 'success') {
        // Navigate to the home screen or any other desired screen
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Login Successful')));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(response)));
      }
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 200.0,
                    height: 200.0,
                    child: const Image(
                      image: AssetImage('assets/images/Illustration.png'),
                      fit: BoxFit
                          .cover, // Puedes ajustar la forma en que la imagen se ajusta al contenedor
                    ),
                  ),
                  Text(
                    "Login to your account",
                    style: GoogleFonts.lato(
                      textStyle:
                          const TextStyle(fontSize: 23.0, color: Color(0XFF0D12FE)),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      prefixIcon: const Icon(
                        Icons.email,
                        color: Color(0XFF0D12FE),
                      ),
                      labelText: 'Your Email',
                      hintText: 'user@email.com',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
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
                      prefixIcon: const Icon(
                        Icons.password,
                        color: Color(0XFF0D12FE),
                      ),
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
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      loginUser();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [Color(0XFF262FDE), Color(0XFF050957)],
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Center(
                        child: _isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Login',
                                style: GoogleFonts.lato(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: Text(
                          'Register now!',
                          style: GoogleFonts.roboto(
                            color: const Color(0XFF0D12FE),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const RegisterScreen();
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
      ),
    );
  }
}
