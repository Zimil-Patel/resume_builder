import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resume_builder/util/colors/container.dart';
import 'package:resume_builder/util/colors/texts.dart';
import 'package:blurrycontainer/blurrycontainer.dart';

late double height;
late double width;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

TextEditingController emailTxt = TextEditingController();
TextEditingController passTxt = TextEditingController();

class _LoginScreenState extends State<LoginScreen> {
  bool showPass = false;
  String? email;
  String? pass;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black54,
      //appbar
      appBar: AppBar(
        backgroundColor: Colors.black,
        toolbarHeight: 0,
      ),

      //body
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //images and text
              topImg(),

              //login text and box
              loginBox(),

              dividerText(),

              //google sign in button
              googleSigninBtn(),

              //register text
              registerTxt(),
            ],
          ),
        ),
      ),
    );
  }

  //top image
  topImg() {
    return Center(
      child: ClipRRect(
        child: Image.asset(
          'asset/images/loginRegister/loginImg.png',
          height: 250,
        ),
      ),
    );
  }

  //login text and box
  loginBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //login text
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: Text(
            'Login',
            style: GoogleFonts.varelaRound(textStyle: textStyle()),
          ),
        ),

        const SizedBox(
          height: 10,
        ),

        //email pass textbox
        BlurryContainer(
          blur: 5,
          elevation: 10,
          color: Colors.grey.withOpacity(0.1),
          padding: const EdgeInsets.all(8),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Container(
            width: width,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                //email input  box
                Row(
                  children: [
                    //email icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.email,
                        color: Colors.grey,
                      ),
                    ),

                    //email input
                    Expanded(
                      child: TextField(
                        controller: emailTxt,
                        keyboardType: TextInputType.emailAddress,
                        cursorColor: Colors.white,
                        style: inputTextStyle(),
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //password input box
                Row(
                  children: [
                    //lock icon
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(
                        Icons.lock_rounded,
                        color: Colors.grey,
                      ),
                    ),

                    //password input
                    Expanded(
                      child: TextField(
                        controller: passTxt,
                        keyboardType: TextInputType.visiblePassword,
                        cursorColor: Colors.white,
                        obscureText: showPass,
                        style: inputTextStyle(),
                        decoration: InputDecoration(
                          hintText: 'Password',
                          hintStyle:
                              const TextStyle(fontSize: 15, color: Colors.grey),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                showPass = !showPass;
                              });
                            },
                            child: Icon(
                              showPass
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //spacer between input box
                const SizedBox(
                  height: 14,
                ),

                //forgotpass text
                Align(
                  alignment: Alignment.bottomRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: GoogleFonts.varelaRound(
                          textStyle: miniText(blueColor)),
                    ),
                  ),
                ),

                //login Button
                loginBtn(),
              ],
            ),
          ),
        )
      ],
    );
  }

  //loginb button
  loginBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {
        setState(() {
          email = emailTxt.text.toLowerCase();
          pass = passTxt.text;

          if (email == "patelzimil2310@gmail.com" && pass == "Zimil1023@") {
            Navigator.pushReplacementNamed(context, '/home');
          }
        });
      },
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.2),
        ),
        child: Text(
          'Login',
          style: GoogleFonts.varelaRound(
            textStyle: normalText(Colors.white),
          ),
        ),
      ),
    );
  }

  //divider with text
  dividerText() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: 0.2,
              width: width,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'OR',
              style: miniText(Colors.grey),
            ),
          ),
          Expanded(
            child: Container(
              height: 0.2,
              width: width,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  googleSigninBtn() {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () {},
      child: Container(
        width: width,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0),
              child: SizedBox(
                height: 24,
                width: 24,
                child: ClipRect(
                  child:
                      Image.asset('asset/images/loginRegister/googleLogo.png'),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  'Login with Google',
                  style: GoogleFonts.varelaRound(
                    textStyle: normalText(Colors.white.withOpacity(0.5)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //new here register
  registerTxt() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 26.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            'New to resumeBuilder?',
            style: miniText(Colors.white),
          ),
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Text(
              '  Register here',
              style: miniText(blueColor),
            ),
          )
        ]),
      ),
    );
  }
}
