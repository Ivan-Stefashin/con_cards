import 'package:con_cards/generated/l10n.dart';
import 'package:con_cards/screens/homePage.dart';
import 'package:con_cards/screens/login/login1.dart';
import 'package:con_cards/screens/login/signUp.dart';
import 'package:con_cards/screens/login/welcome.dart';
import 'package:con_cards/services/snackBar.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isHiddenPassword = true;
  final formKey = GlobalKey<FormState>();

  TextEditingController lastNameTextInputController = TextEditingController();
  TextEditingController firstNameTextInputController = TextEditingController();
  TextEditingController patronymicTextInputController = TextEditingController();
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();

  @override
  void dispose() {
    lastNameTextInputController.dispose();
    firstNameTextInputController.dispose();
    patronymicTextInputController.dispose();
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> SignUp() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailTextInputController.text.trim(),
        password: passwordTextInputController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.code);

      if (e.code == 'email-already-in-use') {
        SnackbarService.showSnackBar(context,
            S.of(context).theUserWithThisEmailHasAlreadyBeenRegistered, true);
        return;
      } else {
        SnackbarService.showSnackBar(
            context, S.of(context).snackBarErrorMessageUnknownError, true);
        return;
      }
    }
    navigator.pushNamedAndRemoveUntil('/home', (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Welcome()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.87,
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).signUpHello,
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 10, 57, 1.0),
                        ),
                      ),
                      Text(
                        S.of(context).signUpCreateNewAccount,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        autocorrect: false,
                        controller: lastNameTextInputController,
                        decoration: InputDecoration(
                          hintText: S.of(context).lastName,
                        ),
                      ),
                      TextFormField(
                        autocorrect: false,
                        controller: firstNameTextInputController,
                        decoration: InputDecoration(
                          hintText: S.of(context).firstName,
                        ),
                      ),
                      TextFormField(
                        autocorrect: false,
                        controller: patronymicTextInputController,
                        decoration: InputDecoration(
                          hintText: S.of(context).patronymic,
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        autocorrect: false,
                        controller: emailTextInputController,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? S.of(context).enterCorrectEmail
                                : null,
                        decoration: InputDecoration(
                          hintText: S.of(context).enterEmail,
                        ),
                      ),
                      TextFormField(
                        autocorrect: false,
                        controller: passwordTextInputController,
                        obscureText: isHiddenPassword,
                        validator: (password) =>
                            password != null && password.length < 6
                                ? S.of(context).minimumOfSixCharacters
                                : null,
                        decoration: InputDecoration(
                          suffix: InkWell(
                            onTap: togglePasswordView,
                            child: Icon(
                              isHiddenPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: Colors.black,
                            ),
                          ),
                          hintText: S.of(context).enterPassword,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                        onPressed: SignUp,
                        // {
                        //   Authentication().Auth(
                        //       FirstName, LastName, Patronymic, Email, Password);

                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: (context) => const HomePage()));
                        // },
                        child: Text(
                          S.of(context).registeration,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        margin: const EdgeInsets.only(left: 15),
        child: Row(
          children: [
            Text(
              S.of(context).alreadyHaveAnAccount,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Text(
                S.of(context).signUpLogIn,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 21, 170, 1),
                ),
              ),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
