import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:talasuf_car_care/Api_services/data/network/Api_services.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';
import 'package:talasuf_car_care/Screens/User/Home_screen.dart';
import '../../Api_services/data/Local_services/Session.dart';
import '../../Components/Custom_button.dart';
import '../../Components/Custom_textfeild.dart';
import '../Techniician_app/Homescreen.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  Sharedprefrence sp =Sharedprefrence();
  TextEditingController username = TextEditingController ();

  TextEditingController password = TextEditingController ();

  bool isloading =false;

  Api api=Api();



  void check(BuildContext context )
  {
    if(username.text.isEmpty)
      {
        CustomToast.showError(  "Please fill the Email first");
      }
    else if(password.text.isEmpty)
    {
      CustomToast.showError(  "Please fill the Passowrd first");
    }
    else {
      login(context);
    }
  }


  void login(BuildContext context)  {
    try {

      setState(() {
        isloading = true;
      });


      api.loginapi(username.text, password.text).then((value) async {

          setState(() {
            isloading = false;
          });

          if (value.status == "200")
          {
           await  sp.savedata(value.response);
           await  sp.getlmsdata();
            print(value.status);
            CustomToast.showSuccess(value.statusMessage);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          }
          else
          {
            setState(() {
              isloading = false;
            });
            print(value.status);
            // If login failed, show error snack bar
            CustomToast.showError( value.statusMessage);
          }
              }).catchError((e) {
        // Handle any error from the API call
        if (mounted) {
          setState(() {
            isloading = false;
          });

          // If an error occurs, show a generic error snack bar
          SnackBarHelper.showErrorSnackBar(context, 'An error occurred');
        }
      });
    } catch (e) {
      // In case of any unexpected error
      if (mounted) {
        setState(() {
          isloading = false;
        });

        SnackBarHelper.showErrorSnackBar(context, 'An unexpected error occurred');
      }
    }
  }


  @override
  Widget build(BuildContext contexts) {
    return


      Scaffold(
      backgroundColor: Colors.white,

      body:

      isloading ?
      Center(
          child:
          CircularProgressIndicator(
              color: AppColors.primary
          ))
          :
      SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: constraints.maxHeight * 0.08),
                Image.asset("assets/loginlogo.png"),


               // SizedBox(height: constraints.maxHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextFormField(hintText: 'Email',prefixIcon: Icons.email, controllers: username,),
                       SizedBox(height: 16.0),
                      CustomTextFormField(hintText: 'Password',prefixIcon: Icons.lock ,suffixIcon: Icons.visibility, controllers: password,),

                      CustomElevatedButton(onPressed: () {

                        check(contexts);

                      }, text: 'LOGIN',),
                      TextButton(
                        onPressed: () {
                          //Navigator.push(context, MaterialPageRoute(builder: (context)=> DashboardScreen()));
                        },
                        child: Text.rich(
                          const TextSpan(
                            text: "Already have an account? ",
                            children: [
                              TextSpan(
                                text: "Sign Up",
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                          style:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .color!
                                .withOpacity(0.64),
                          ),
                        ),
                      ),
SizedBox(height: 50,),


                      SocalButton(
                        press: () {},
                        text: "Connect with Facebook",
                        color: const Color(0xFF395998),
                        icon: Icon(Icons.abc)
                      ),
                      const SizedBox(height: 16),

                      // Google
                      SocalButton(
                        press: () {},
                        text: "Connect with Google",
                        color: const Color(0xFF4285F4),
                          icon: Icon(Icons.abc)
                      ),
                      const SizedBox(height: 16),


                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );


  }
}

// only for demo
List<DropdownMenuItem<String>>? countries = [ "Bangladesh","Switzerland", 'Canada', 'Japan', 'Germany',
  'Australia', 'Sweden',]
    .map<DropdownMenuItem<String>>(
        (String value)
    {
      return DropdownMenuItem<String>(value: value, child: Text(  value ));
    }).toList();