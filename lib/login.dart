// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// // import './style/theme.dart' as Theme;
// // import './utils/bubble_indication_painter.dart';
// // import 'package:firebase_auth/firebase_auth.dart';

// // void selectIntroScreen(BuildContext context){
// //   Navigator.of(context).pushNamed('/intro_screen');
// // }

// // void selectFoodOrder(BuildContext context){
// //   Navigator.of(context).pushNamed('/food_order');
// // }
// // class LoginPage extends StatefulWidget {
// //   LoginPage({Key key}) : super(key: key);

// //   @override
// //   _LoginPageState createState() => new _LoginPageState();
// // }

// // class _LoginPageState extends State<LoginPage>
// //     with SingleTickerProviderStateMixin {
// //   final _auth= FirebaseAuth.instance;
// //   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

// //   final FocusNode myFocusNodeEmailLogin = FocusNode();
// //   final FocusNode myFocusNodePasswordLogin = FocusNode();

// //   final FocusNode myFocusNodePassword = FocusNode();
// //   final FocusNode myFocusNodeEmail = FocusNode();
// //   final FocusNode myFocusNodeName = FocusNode();

// //   TextEditingController loginEmailController = new TextEditingController();
// //   TextEditingController loginPasswordController = new TextEditingController();

// //   bool _obscureTextLogin = true;
// //   bool _obscureTextSignup = true;
// //   bool _obscureTextSignupConfirm = true;

// //   TextEditingController signupEmailController = new TextEditingController();
// //   TextEditingController signupNameController = new TextEditingController();
// //   TextEditingController signupPasswordController = new TextEditingController();
// //   TextEditingController signupConfirmPasswordController =
// //   new TextEditingController();

// //   PageController _pageController;

// //   Color left = Colors.black;
// //   Color right = Colors.white;

// //   @override
// //   Widget build(BuildContext context) {
// //     return new Scaffold(
// //       key: _scaffoldKey,
// //       body: NotificationListener<OverscrollIndicatorNotification>(
// //         // ignore: missing_return
// //         onNotification: (overscroll) {
// //           overscroll.disallowGlow();
// //         },
// //         child: SingleChildScrollView(
// //           child: Container(
// //             width: MediaQuery.of(context).size.width,
// //             height: MediaQuery.of(context).size.height >= 775.0
// //                 ? MediaQuery.of(context).size.height
// //                 : 775.0,
// //             decoration: new BoxDecoration(
// //               gradient: new LinearGradient(
// //                   colors: [
// //                     Theme.Colors.loginGradientStart,
// //                     Theme.Colors.loginGradientEnd
// //                   ],
// //                   begin: const FractionalOffset(0.0, 0.0),
// //                   end: const FractionalOffset(1.0, 1.0),
// //                   stops: [0.0, 1.0],
// //                   tileMode: TileMode.clamp),
// //             ),
// //             child: Column(
// //               mainAxisSize: MainAxisSize.max,
// //               children: <Widget>[
// //                 Padding(
// //                   padding: EdgeInsets.only(top: 75.0),
// //                   child: new Image(
// //                       width: 250.0,
// //                       height: 191.0,
// //                       fit: BoxFit.fill,
// //                       image: new AssetImage('assets/login_image.png')),
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.only(top: 20.0),
// //                   child: _buildMenuBar(context),
// //                 ),
// //                 Expanded(
// //                   flex: 2,
// //                   child: PageView(
// //                     controller: _pageController,
// //                     onPageChanged: (i) {
// //                       if (i == 0) {
// //                         setState(() {
// //                           right = Colors.white;
// //                           left = Colors.black;
// //                         });
// //                       } else if (i == 1) {
// //                         setState(() {
// //                           right = Colors.black;
// //                           left = Colors.white;
// //                         });
// //                       }
// //                     },
// //                     children: <Widget>[
// //                       new ConstrainedBox(
// //                         constraints: const BoxConstraints.expand(),
// //                         child: _buildSignIn(context),
// //                       ),
// //                       new ConstrainedBox(
// //                         constraints: const BoxConstraints.expand(),
// //                         child: _buildSignUp(context),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     myFocusNodePassword.dispose();
// //     myFocusNodeEmail.dispose();
// //     myFocusNodeName.dispose();
// //     _pageController?.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   void initState() {
// //     super.initState();

// //     SystemChrome.setPreferredOrientations([
// //       DeviceOrientation.portraitUp,
// //       DeviceOrientation.portraitDown,
// //     ]);

// //     _pageController = PageController();
// //   }

// //   void showInSnackBar(String value) {
// //     FocusScope.of(context).requestFocus(new FocusNode());
// //     _scaffoldKey.currentState?.removeCurrentSnackBar();
// //     _scaffoldKey.currentState.showSnackBar(new SnackBar(
// //       content: new Text(
// //         value,
// //         textAlign: TextAlign.center,
// //         style: TextStyle(
// //             color: Colors.white,
// //             fontSize: 16.0,
// //             fontFamily: "WorkSansSemiBold"),
// //       ),
// //       backgroundColor: Colors.blue,
// //       duration: Duration(seconds: 3),
// //     ));
// //   }

// //   Widget _buildMenuBar(BuildContext context) {
// //     return Container(
// //       width: 300.0,
// //       height: 50.0,
// //       decoration: BoxDecoration(
// //         color: Color(0x552B2B2B),
// //         borderRadius: BorderRadius.all(Radius.circular(25.0)),
// //       ),
// //       child: CustomPaint(
// //         painter: TabIndicationPainter(pageController: _pageController),
// //         child: Row(
// //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //           children: <Widget>[
// //             Expanded(
// //               child: FlatButton(
// //                 splashColor: Colors.transparent,
// //                 highlightColor: Colors.transparent,
// //                 onPressed: _onSignInButtonPress,
// //                 child: Text(
// //                   "Existing",
// //                   style: TextStyle(
// //                       color: left,
// //                       fontSize: 16.0,
// //                       fontFamily: "WorkSansSemiBold"),
// //                 ),
// //               ),
// //             ),
// //             //Container(height: 33.0, width: 1.0, color: Colors.white),
// //             Expanded(
// //               child: FlatButton(
// //                 splashColor: Colors.transparent,
// //                 highlightColor: Colors.transparent,
// //                 onPressed: _onSignUpButtonPress,
// //                 child: Text(
// //                   "New",
// //                   style: TextStyle(
// //                       color: right,
// //                       fontSize: 16.0,
// //                       fontFamily: "WorkSansSemiBold"),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget _buildSignIn(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.only(top: 23.0),
// //       child: Column(
// //         children: <Widget>[
// //           Stack(
// //             alignment: Alignment.topCenter,
// //             overflow: Overflow.visible,
// //             children: <Widget>[
// //               Card(
// //                 elevation: 2.0,
// //                 color: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                 ),
// //                 child: Container(
// //                   width: 300.0,
// //                   height: 190.0,
// //                   child: Column(
// //                     children: <Widget>[
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           focusNode: myFocusNodeEmailLogin,
// //                           controller: loginEmailController,
// //                           keyboardType: TextInputType.emailAddress,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               Icons.account_circle,
// //                               color: Colors.black,
// //                               size: 22.0,
// //                             ),
// //                             hintText: "Email Address",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 17.0),
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         width: 250.0,
// //                         height: 1.0,
// //                         color: Colors.grey[400],
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           focusNode: myFocusNodePasswordLogin,
// //                           controller: loginPasswordController,
// //                           obscureText: _obscureTextLogin,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               Icons.lock,
// //                               size: 22.0,
// //                               color: Colors.black,
// //                             ),
// //                             hintText: "Password",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 17.0),
// //                             suffixIcon: GestureDetector(
// //                               onTap: _toggleLogin,
// //                               child: Icon(
// //                                 _obscureTextLogin
// //                                     ? FontAwesomeIcons.eye
// //                                     : FontAwesomeIcons.eyeSlash,
// //                                 size: 15.0,
// //                                 color: Colors.black,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.only(top: 170.0),
// //                 decoration: new BoxDecoration(
// //                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //                   boxShadow: <BoxShadow>[
// //                     BoxShadow(
// //                       color: Theme.Colors.loginGradientStart,
// //                       offset: Offset(1.0, 6.0),
// //                       blurRadius: 20.0,
// //                     ),
// //                     BoxShadow(
// //                       color: Theme.Colors.loginGradientEnd,
// //                       offset: Offset(1.0, 6.0),
// //                       blurRadius: 20.0,
// //                     ),
// //                   ],
// //                   gradient: new LinearGradient(
// //                       colors: [
// //                         Theme.Colors.loginGradientEnd,
// //                         Theme.Colors.loginGradientStart
// //                       ],
// //                       begin: const FractionalOffset(0.2, 0.2),
// //                       end: const FractionalOffset(1.0, 1.0),
// //                       stops: [0.0, 1.0],
// //                       tileMode: TileMode.clamp),
// //                 ),
// //                 child: MaterialButton(
// //                   highlightColor: Colors.transparent,
// //                   splashColor: Theme.Colors.loginGradientEnd,
// //                   //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
// //                   child: Padding(
// //                     padding: const EdgeInsets.symmetric(
// //                         vertical: 10.0, horizontal: 42.0),
// //                     child: Text(
// //                       "LOGIN",
// //                       style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 25.0,
// //                           fontFamily: "WorkSansBold"),
// //                     ),
// //                   ),
// //                   onPressed: () => selectIntroScreen(context),
// //                   // showInSnackBar("Login button pressed")),

// //                 ),
// //               ),
// //             ],
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(top: 10.0),
// //             child: FlatButton(
// //                 onPressed: () {},
// //                 child: Text(
// //                   "Forgot Password?",
// //                   style: TextStyle(
// //                       decoration: TextDecoration.underline,
// //                       color: Colors.white,
// //                       fontSize: 16.0,
// //                       fontFamily: "WorkSansMedium"),
// //                 )),
// //           ),
// //           Padding(
// //             padding: EdgeInsets.only(top: 10.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: <Widget>[
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     gradient: new LinearGradient(
// //                         colors: [
// //                           Colors.white10,
// //                           Colors.white,
// //                         ],
// //                         begin: const FractionalOffset(0.0, 0.0),
// //                         end: const FractionalOffset(1.0, 1.0),
// //                         stops: [0.0, 1.0],
// //                         tileMode: TileMode.clamp),
// //                   ),
// //                   width: 100.0,
// //                   height: 1.0,
// //                 ),
// //                 Padding(
// //                   padding: EdgeInsets.only(left: 15.0, right: 15.0),
// //                   child: Text(
// //                     "Or",
// //                     style: TextStyle(
// //                         color: Colors.white,
// //                         fontSize: 16.0,
// //                         fontFamily: "WorkSansMedium"),
// //                   ),
// //                 ),
// //                 Container(
// //                   decoration: BoxDecoration(
// //                     gradient: new LinearGradient(
// //                         colors: [
// //                           Colors.white,
// //                           Colors.white10,
// //                         ],
// //                         begin: const FractionalOffset(0.0, 0.0),
// //                         end: const FractionalOffset(1.0, 1.0),
// //                         stops: [0.0, 1.0],
// //                         tileMode: TileMode.clamp),
// //                   ),
// //                   width: 100.0,
// //                   height: 1.0,
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: <Widget>[
// //               Padding(
// //                 padding: EdgeInsets.only(top: 10.0, right: 40.0),
// //                 child: GestureDetector(
// //                   onTap: () => showInSnackBar("Facebook button pressed"),
// //                   child: Container(
// //                     padding: const EdgeInsets.all(15.0),
// //                     decoration: new BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.white,
// //                     ),
// //                     child: new Icon(
// //                       FontAwesomeIcons.facebookF,
// //                       color: Color(0xFF0084ff),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: EdgeInsets.only(top: 10.0),
// //                 child: GestureDetector(
// //                   onTap: () => showInSnackBar("Google button pressed"),
// //                   child: Container(
// //                     padding: const EdgeInsets.all(15.0),
// //                     decoration: new BoxDecoration(
// //                       shape: BoxShape.circle,
// //                       color: Colors.white,
// //                     ),
// //                     child: new Icon(
// //                       FontAwesomeIcons.google,
// //                       color: Color(0xFF0084ff),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _buildSignUp(BuildContext context) {
// //     return Container(
// //       padding: EdgeInsets.only(top: 23.0),
// //       child: Column(
// //         children: <Widget>[
// //           Stack(
// //             alignment: Alignment.topCenter,
// //             overflow: Overflow.visible,
// //             children: <Widget>[
// //               Card(
// //                 elevation: 2.0,
// //                 color: Colors.white,
// //                 shape: RoundedRectangleBorder(
// //                   borderRadius: BorderRadius.circular(8.0),
// //                 ),
// //                 child: Container(
// //                   width: 300.0,
// //                   height: 360.0,
// //                   child: Column(
// //                     children: <Widget>[
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           focusNode: myFocusNodeName,
// //                           controller: signupNameController,
// //                           keyboardType: TextInputType.text,
// //                           textCapitalization: TextCapitalization.words,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               Icons.account_circle,
// //                               color: Colors.black,
// //                             ),
// //                             hintText: "Name",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 16.0),
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         width: 250.0,
// //                         height: 1.0,
// //                         color: Colors.grey[400],
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           focusNode: myFocusNodeEmail,
// //                           controller: signupEmailController,
// //                           keyboardType: TextInputType.emailAddress,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               IconData(0xe158, fontFamily: 'MaterialIcons'),
// //                               color: Colors.black,
// //                             ),
// //                             hintText: "Email Address",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 16.0),
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         width: 250.0,
// //                         height: 1.0,
// //                         color: Colors.grey[400],
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           focusNode: myFocusNodePassword,
// //                           controller: signupPasswordController,
// //                           obscureText: _obscureTextSignup,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               Icons.lock,
// //                               color: Colors.black,
// //                             ),
// //                             hintText: "Password",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 16.0),
// //                             suffixIcon: GestureDetector(
// //                               onTap: _toggleSignup,
// //                               child: Icon(
// //                                 _obscureTextSignup
// //                                     ? FontAwesomeIcons.eye
// //                                     : FontAwesomeIcons.eyeSlash,
// //                                 size: 15.0,
// //                                 color: Colors.black,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       Container(
// //                         width: 250.0,
// //                         height: 1.0,
// //                         color: Colors.grey[400],
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.only(
// //                             top: 20.0, bottom: 20.0, left: 25.0, right: 25.0),
// //                         child: TextField(
// //                           controller: signupConfirmPasswordController,
// //                           obscureText: _obscureTextSignupConfirm,
// //                           style: TextStyle(
// //                               fontFamily: "WorkSansSemiBold",
// //                               fontSize: 16.0,
// //                               color: Colors.black),
// //                           decoration: InputDecoration(
// //                             border: InputBorder.none,
// //                             icon: Icon(
// //                               Icons.lock,
// //                               color: Colors.black,
// //                             ),
// //                             hintText: "Confirmation",
// //                             hintStyle: TextStyle(
// //                                 fontFamily: "WorkSansSemiBold", fontSize: 16.0),
// //                             suffixIcon: GestureDetector(
// //                               onTap: _toggleSignupConfirm,
// //                               child: Icon(
// //                                 _obscureTextSignupConfirm
// //                                     ? FontAwesomeIcons.eye
// //                                     : FontAwesomeIcons.eyeSlash,
// //                                 size: 15.0,
// //                                 color: Colors.black,
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //               Container(
// //                 margin: EdgeInsets.only(top: 340.0),
// //                 decoration: new BoxDecoration(
// //                   borderRadius: BorderRadius.all(Radius.circular(5.0)),
// //                   boxShadow: <BoxShadow>[
// //                     BoxShadow(
// //                       color: Theme.Colors.loginGradientStart,
// //                       offset: Offset(1.0, 6.0),
// //                       blurRadius: 20.0,
// //                     ),
// //                     BoxShadow(
// //                       color: Theme.Colors.loginGradientEnd,
// //                       offset: Offset(1.0, 6.0),
// //                       blurRadius: 20.0,
// //                     ),
// //                   ],
// //                   gradient: new LinearGradient(
// //                       colors: [
// //                         Theme.Colors.loginGradientEnd,
// //                         Theme.Colors.loginGradientStart
// //                       ],
// //                       begin: const FractionalOffset(0.2, 0.2),
// //                       end: const FractionalOffset(1.0, 1.0),
// //                       stops: [0.0, 1.0],
// //                       tileMode: TileMode.clamp),
// //                 ),
// //                 child: MaterialButton(
// //                     highlightColor: Colors.transparent,
// //                     splashColor: Theme.Colors.loginGradientEnd,
// //                     //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
// //                     child: Padding(
// //                       padding: const EdgeInsets.symmetric(
// //                           vertical: 10.0, horizontal: 42.0),
// //                       child: Text(
// //                         "SIGN UP",
// //                         style: TextStyle(
// //                             color: Colors.white,
// //                             fontSize: 25.0,
// //                             fontFamily: "WorkSansBold"),
// //                       ),
// //                     ),
// //                     onPressed: () =>
// //                         showInSnackBar("SignUp button pressed")),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _onSignInButtonPress() {
// //     _pageController.animateToPage(0,
// //         duration: Duration(milliseconds: 500), curve: Curves.decelerate);
// //   }

// //   void _onSignUpButtonPress() {
// //     _pageController?.animateToPage(1,
// //         duration: Duration(milliseconds: 500), curve: Curves.decelerate);
// //   }

// //   void _toggleLogin() {
// //     setState(() {
// //       _obscureTextLogin = !_obscureTextLogin;
// //     });
// //   }

// //   void _toggleSignup() {
// //     setState(() {
// //       _obscureTextSignup = !_obscureTextSignup;
// //     });
// //   }

// //   void _toggleSignupConfirm() {
// //     setState(() {
// //       _obscureTextSignupConfirm = !_obscureTextSignupConfirm;
// //     });
// //   }
// // }

// import 'dart:math';
// import 'package:provider/provider.dart';
// import 'package:flutter/material.dart';
// import './providers/auth.dart';

// enum AuthMode { Signup, Login }

// class LoginPage extends StatelessWidget {
//   static const routeName = '/';

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
//     // transformConfig.translate(-10.0);
//     return Scaffold(
//       // resizeToAvoidBottomInset: false,
//       body: Stack(
//         children: <Widget>[
//           Container(
//             decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 colors: [
//                   Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
//                   Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
//                 ],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//                 stops: [0, 1],
//               ),
//             ),
//           ),
//           SingleChildScrollView(
//             child: Container(
//               height: deviceSize.height,
//               width: deviceSize.width,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: <Widget>[
//                   Flexible(
//                     child: Container(
//                       margin: EdgeInsets.only(bottom: 20.0),
//                       padding:
//                           EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
//                       transform: Matrix4.rotationZ(-8 * pi / 180)
//                         ..translate(-10.0),
//                       // ..translate(-10.0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         color: Colors.deepOrange.shade900,
//                         boxShadow: [
//                           BoxShadow(
//                             blurRadius: 8,
//                             color: Colors.black26,
//                             offset: Offset(0, 2),
//                           )
//                         ],
//                       ),
//                       child: Text(
//                         'MealsApp',
//                         style: TextStyle(
//                           // ignore: deprecated_member_use
//                           color: Theme.of(context).accentTextTheme.title.color,
//                           fontSize: 50,
//                           fontFamily: 'Anton',
//                           fontWeight: FontWeight.normal,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Flexible(
//                     flex: deviceSize.width > 600 ? 2 : 1,
//                     child: AuthCard(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class AuthCard extends StatefulWidget {
//   const AuthCard({
//     Key key,
//   }) : super(key: key);

//   @override
//   _AuthCardState createState() => _AuthCardState();
// }

// class _AuthCardState extends State<AuthCard> {
//   final GlobalKey<FormState> _formKey = GlobalKey();
//   AuthMode _authMode = AuthMode.Login;
//   Map<String, String> _authData = {
//     'email': '',
//     'password': '',
//   };
//   var _isLoading = false;
//   final _passwordController = TextEditingController();

//   Future<void> _submit() async{
//     if (!_formKey.currentState.validate()) {
//       // Invalid!
//       return;
//     }
//     _formKey.currentState.save();
//     setState(() {
//       _isLoading = true;
//     });
//     if (_authMode == AuthMode.Login) {
//       // Log user in
//       await Provider.of<Auth>(context, listen:false).login(
//         _authData['email'],
//         _authData['password'],
//       );
//     } else {
//       // Sign user up
//       await Provider.of<Auth>(context, listen:false).signup(
//         _authData['email'],
//         _authData['password'],
//       );
//     }
//     setState(() {
//       _isLoading = false;
//     });
//   }

//   void _switchAuthMode() {
//     if (_authMode == AuthMode.Login) {
//       setState(() {
//         _authMode = AuthMode.Signup;
//       });
//     } else {
//       setState(() {
//         _authMode = AuthMode.Login;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final deviceSize = MediaQuery.of(context).size;
//     return Card(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10.0),
//       ),
//       elevation: 8.0,
//       child: Container(
//         height: _authMode == AuthMode.Signup ? 320 : 260,
//         constraints:
//             BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
//         width: deviceSize.width * 0.75,
//         padding: EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'E-Mail'),
//                   keyboardType: TextInputType.emailAddress,
//                   validator: (value) {
//                     if (value.isEmpty || !value.contains('@')) {
//                       return 'Invalid email!';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _authData['email'] = value;
//                   },
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Password'),
//                   obscureText: true,
//                   controller: _passwordController,
//                   // ignore: missing_return
//                   validator: (value) {
//                     if (value.isEmpty || value.length < 5) {
//                       return 'Password is too short!';
//                     }
//                   },
//                   onSaved: (value) {
//                     _authData['password'] = value;
//                   },
//                 ),
//                 if (_authMode == AuthMode.Signup)
//                   TextFormField(
//                     enabled: _authMode == AuthMode.Signup,
//                     decoration: InputDecoration(labelText: 'Confirm Password'),
//                     obscureText: true,
//                     validator: _authMode == AuthMode.Signup
//                         // ignore: missing_return
//                         ? (value) {
//                             if (value != _passwordController.text) {
//                               return 'Passwords do not match!';
//                             }
//                           }
//                         : null,
//                   ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 if (_isLoading)
//                   CircularProgressIndicator()
//                 else
//                   RaisedButton(
//                     child:
//                         Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
//                     onPressed: _submit,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     padding:
//                         EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
//                     color: Theme.of(context).primaryColor,
//                     textColor: Theme.of(context).primaryTextTheme.button.color,
//                   ),
//                 FlatButton(
//                   child: Text(
//                       '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
//                   onPressed: _switchAuthMode,
//                   padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
//                   materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                   textColor: Theme.of(context).primaryColor,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// ignore: unused_import
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './models/http_exception.dart';

enum AuthMode { Signup, Login }

class LoginPage extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              // gradient: LinearGradient(
              //   colors: [
              //     Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
              //     Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   stops: [0, 1],
              // ),
              color: Colors.blue,
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.transparent,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: new Image(
                        width: 250.0,
                        height: 191.0,
                        fit: BoxFit.fill,
                        image: new AssetImage('assets/login_image.png'),
                      ),
                      // child: Text(
                      //   'digiCook',
                      //   style: TextStyle(
                      //     // ignore: deprecated_member_use
                      //     color: Theme.of(context).accentTextTheme.title.color,
                      //     fontSize: 50,
                      //     fontFamily: 'Anton',
                      //     fontWeight: FontWeight.normal,
                      //   ),
                      // ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    try {
      if (_authMode == AuthMode.Login) {
        // Log user in
        await Provider.of<Auth>(context, listen: false).login(
          _authData['email'],
          _authData['password'],
        );
      } else {
        // Sign user up
        await Provider.of<Auth>(context, listen: false).signup(
          _authData['email'],
          _authData['password'],
        );
      }
      Navigator.of(context).pushReplacementNamed('/intro_screen');
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      decoration: new BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black45,
                blurRadius: 20.0,
              ),
            ],
          ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
          
        ),
        elevation: 8.0,
        child: Container(
          height: _authMode == AuthMode.Signup ? 320 : 260,
          constraints: BoxConstraints(
              minHeight: _authMode == AuthMode.Signup ? 320 : 260),
          width: deviceSize.width * 0.75,
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'E-Mail',
                      icon: Icon(
                        Icons.account_circle,
                        color: Colors.black,
                        size: 22.0,
                      ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "WorkSansSemiBold",
                    ),
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty || !value.contains('@')) {
                        return 'Invalid email!';
                      }
                    },
                    onSaved: (value) {
                      _authData['email'] = value;
                    },
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(
                        Icons.lock,
                        size: 22.0,
                        color: Colors.black,
                      ),
                    ),

                    obscureText: true,
                    controller: _passwordController,
                    // ignore: missing_return
                    validator: (value) {
                      if (value.isEmpty || value.length < 5) {
                        return 'Password is too short!';
                      }
                    },
                    onSaved: (value) {
                      _authData['password'] = value;
                    },
                  ),
                  if (_authMode == AuthMode.Signup)
                    TextFormField(
                      enabled: _authMode == AuthMode.Signup,
                      decoration:
                          InputDecoration(labelText: 'Confirm Password'),
                      obscureText: true,
                      validator: _authMode == AuthMode.Signup
                          // ignore: missing_return
                          ? (value) {
                              if (value != _passwordController.text) {
                                return 'Passwords do not match!';
                              }
                            }
                          : null,
                    ),
                  SizedBox(
                    height: 20,
                  ),
                  if (_isLoading)
                    CircularProgressIndicator()
                  else
                    RaisedButton(
                      child: Text(
                          _authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                      onPressed: _submit,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                      // color: Theme.of(context).primaryColor,
                      color:Colors.lightBlueAccent,
                      textColor:
                          Colors.black,
                    ),
                  FlatButton(
                    child: Text(
                        '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                    onPressed: _switchAuthMode,
                    padding:
                        EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
