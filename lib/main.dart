// @dart=2.9
import 'package:finfy/expenses_income.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:email_auth/email_auth.dart';
import 'package:otp_screen/otp_screen.dart';
import 'initial_setup.dart';


import 'package:sms/sms.dart';
//import 'package:sms_receiver/sms_receiver.dart';


EmailAuth emailAuth = EmailAuth(
  sessionName: "SignUp session",
);

void main() {
  // emailAuth.config({"server": "", "serverKey": ""}); TODO
  // SmsReceiver receiver = SmsReceiver();
  // receiver.onSmsReceived.listen((SmsMessage msg) => print(msg.body));
  runApp(const MyApp());
}

Function createOTPvalidator(String email, EmailAuth emailAuth) {
  Future<String> validateOtp(String otp) async {
    // emailAuth.validateOtp(recipientMail: email.text, userOtp: otp);
    if (emailAuth.validateOtp(recipientMail: email, userOtp: otp)) {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  return validateOtp;
}

// creates a function to go to the widget returned by parameter makeWidget
Function createRouteCallback(Function makeWidget) {
  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => makeWidget()));
  }

  return moveToNextScreen;
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
          appBar: AppBar(
              title: const Text(_title),
              backgroundColor: Colors.purple.shade100),
          body: LoginPage(),
          backgroundColor: Colors.white),

      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   // Define the default brightness and colors.
      //   brightness: Brightness.dark,
      //   primaryColor: Colors.purple[800],
      //
      //   // Define the default font family.
      //   fontFamily: 'Georgia',
      //
      //   // Define the default `TextTheme`. Use this to specify the default
      //   // text styling for headlines, titles, bodies of text, and more.
      //   textTheme: const TextTheme(
      //     headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      //     headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
      //     bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      //   ),
      // )
    );
  }
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _LoginPage();
// }

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(10, 50, 10, 5),
                child: const Text(
                  'Fin€Fy',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Scaffold(
                              appBar: AppBar(
                                title: const Text("Recover Password"),
                                backgroundColor: Colors.purple.shade100,
                              ),
                              body: ForgotPass(),
                              backgroundColor: Colors.white,
                            )));
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.purple),
              ),
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                    child: const Text(
                      'Login',
                    ),
                    onPressed: () {
                      // OTP verification
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                OtpScreen.withGradientBackground(
                              topColor: const Color(0xFFcc2b5e),
                              bottomColor: const Color(0xFF753a88),
                              otpLength: 4,
                              validateOtp: createOTPvalidator(
                                  emailcontroller.text, emailAuth),
                              routeCallback: createRouteCallback(
                                  () => const InitialSetup()),
                              themeColor: Colors.white,
                              titleColor: Colors.white,
                              title: "Email Verification",
                              subTitle: "Enter the code sent to your email",
                              icon: Image.asset(
                                'assets/email-logo.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple.shade500,
                    ))),
            Row(
              children: <Widget>[
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 20, color: Colors.purple),
                  ),
                  onPressed: () {
                    //signup screen
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Scaffold(
                                  appBar: AppBar(
                                    title: const Text("Register"),
                                    backgroundColor: Colors.purple.shade100,
                                  ),
                                  body: SignUp(),
                                  backgroundColor: Colors.white,
                                )))
                    ;
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

class SignUp extends StatelessWidget {
  // name, password, email

  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController email = TextEditingController();
  // EmailAuth emailAuth;
  // final EmailAuth emailAuth = EmailAuth(
  //   sessionName: "SignUp session",
  // );
  SignUp({Key key}) : super(key: key);
  // emailAuth.config({"server": "", "serverKey": ""});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: fname,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'First Name',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: lname,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Last Name',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: password,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'password',
            ),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Age',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone Number',
              ),
            )),
        Container(
          height: 80,
          width: 10,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: const Text('Submit'),
            onPressed: () {
              emailAuth.sendOtp(recipientMail: email.text, otpLength: 4);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen.withGradientBackground(
                      topColor: const Color(0xFFcc2b5e),
                      bottomColor: const Color(0xFF753a88),
                      otpLength: 4,
                      validateOtp: createOTPvalidator(email.text, emailAuth),
                      routeCallback:
                          createRouteCallback(() => const InitialSetup()),
                      themeColor: Colors.white,
                      titleColor: Colors.white,
                      title: "Email Verification",
                      subTitle: "Enter the code sent to your email",
                      icon: Image.asset(
                        'assets/email-logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple.shade500,
            ),
          ),
        )
      ]),
    );
  }
}

class ForgotPass extends StatelessWidget {
  ForgotPass({Key key}) : super(key: key);
  final TextEditingController email = TextEditingController();
  final EmailAuth emailAuth = EmailAuth(
    sessionName: "ForgotPass session",
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: email,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
        ),
        Container(
          height: 80,
          width: 10,
          padding: const EdgeInsets.all(10),
          child: ElevatedButton(
            child: const Text('Get OTP'),
            onPressed: () {
              // emailAuth.sendOtp(recipientMail: email.text, otpLength: 4);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OtpScreen.withGradientBackground(
                      topColor: const Color(0xFFcc2b5e),
                      bottomColor: const Color(0xFF753a88),
                      otpLength: 4,
                      validateOtp: createOTPvalidator(email.text, emailAuth),
                      routeCallback:
                          createRouteCallback(() => ChangePassword()),
                      themeColor: Colors.white,
                      titleColor: Colors.white,
                      title: "Email Verification",
                      subTitle: "Enter the code sent to your email",
                      icon: Image.asset(
                        'assets/email-logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ));
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.purple.shade500,
            ),
          ),
        )
      ]),
    );
  }
}

class ChangePassword extends StatelessWidget {
  ChangePassword({Key key}) : super(key: key);
  final TextEditingController newPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(children: <Widget>[
        Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              controller: newPass,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'New Password',
              ),
            )),
        Container(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              // change password button
              onPressed: () =>
                  {}, // todo change password (db related) then move to login screen
              child: const Text('Change Password'),
              style: ElevatedButton.styleFrom(
                primary: Colors.purple.shade500,
              ),
            ))
      ]),
    );
  }
}
