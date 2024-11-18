import 'package:con_cards/features/login/view/login_controller.dart';
import 'package:con_cards/features/sign_up/sign_up.dart';
import 'package:con_cards/features/welcome/welcome.dart';
import 'package:con_cards/features/widgets/widgets.dart';
import 'package:con_cards/generated/l10n.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isHiddenPassword = true;
  TextEditingController emailTextInputController = TextEditingController();
  TextEditingController passwordTextInputController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailTextInputController.dispose();
    passwordTextInputController.dispose();

    super.dispose();
  }

  void togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> Login() async {
    final navigator = Navigator.of(context);

    final isValid = formKey.currentState!.validate();
    if (!isValid) return;

    String message = '';

    String result = await LogInController().SignIn(
        emailTextInputController.text.trim(),
        passwordTextInputController.text.trim());

    if (result == 'invalid_credentials') {
      message = S.of(context).snackBarErrorMessageWrongEmail;
    } else {
      message = S.of(context).snackBarErrorMessageUnknownError;

      SnackbarService.showSnackBar(context, message, true);
      return;
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
                MaterialPageRoute(builder: (context) => const WelcomeScrean()));
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.87,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).loginWelcomeBack,
                        style: const TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(0, 10, 57, 1.0),
                        ),
                      ),
                      Text(
                        S.of(context).logInToContinue,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
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
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            onPressed: Login,
                            child: Text(
                              S.of(context).signIn,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   width: double.infinity,
                        //   child: TextButton(
                        //     onPressed: () {},
                        //     style: TextButton.styleFrom(
                        //       backgroundColor: const Color(0x00000000),
                        //     ),
                        //     child: Text(
                        //       S.of(context).forgotYourPassword,
                        //       style: const TextStyle(
                        //         fontSize: 18,
                        //         color: Color.fromRGBO(0, 21, 170, 1),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
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
              S.of(context).didnTCreateAnAccount,
              style: const TextStyle(
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
                        builder: (context) => const SignUpScreen()));
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0x00000000),
              ),
              child: Text(
                S.of(context).loginButtomBarRegistration,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Color.fromRGBO(0, 21, 170, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
