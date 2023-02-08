import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../router/fluro_navigator.dart';
import '../../router/router_generator.dart';
import '../../widget/utils/assets_utils.dart';
import '../../widget/utils/colors.dart';
import '../../widget/utils/text_styles.dart';

class LoginAcount extends StatefulWidget {
  const LoginAcount({Key? key}) : super(key: key);

  @override
  State<LoginAcount> createState() => _LoginAcountState();
}

class _LoginAcountState extends State<LoginAcount> {
  bool _obscureText = true;
  late String _password;
  void _toggle(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 1.1,
                child: Transform.scale(
                    scale: 1.08, child: Image.asset(ImageUtils.NEN)),
              ),
              Container(
                padding: EdgeInsets.only(left: 25, top: 80, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(ImageUtils.LOGO),
                    Text("Welcome to", style: TextStyles.textSize20),
                    Text(
                      "Dirbbox",
                      style: TextStyles.textSize20
                          .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Best cloud storage platform for all',
                      style: TextStyles.textSize14,
                    ),
                    Text('business and individual to',
                        style: TextStyles.textSize14),
                    Text('manage there data', style: TextStyles.textSize14),
                    SizedBox(height: 10),
                    TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(width: 0.5,color: Colors.blue),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(width: 0.5,color: Colors.black38),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        hintText: 'Password',
                        prefixIcon: Padding(
                          padding: EdgeInsets.only(),
                          child: Icon(Icons.lock),
                        ),
                        suffixIcon: IconButton(onPressed: _toggle, icon: Icon(_obscureText?Icons.lock_outline:Icons.lock_open)),
                      ),
                      validator: (value)=> value!.length < 6 ? 'Password too short': null,
                      onSaved: (val)=>_password = val!,
                      obscureText: _obscureText,
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffe3e7ef),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_back_rounded, color: Colos.CA,),
                                SizedBox(width: 5),
                                Text('Back page',
                                    style: TextStyles.textSize14.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colos.CA))
                              ],
                            ),
                          ),
                          onTap: (){
                            Navigator.pop(context);
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            height: 50,
                            width: 170,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colos.CA,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Sign in',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                SizedBox(width: 5),
                                Icon(Icons.arrow_forward,color: Colors.white,)
                              ],
                            ),
                          ),
                          onTap: (){
                            NavigatorUtils.push(context, RouterGenerator.routeLoginAcount);
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text('Use Social Login',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xff1B1D28),fontSize: 12)),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/Instagram Logo.svg'),
                        SizedBox(width: 50),
                        SvgPicture.asset('assets/svg/Twitter Logo.svg'),
                        SizedBox(width: 50),
                        SvgPicture.asset('assets/svg/Facebook Logo.svg'),
                      ],
                    ),
                    SizedBox(height: 50),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        'Create an account',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color(0xff1B1D28),fontSize: 16),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
