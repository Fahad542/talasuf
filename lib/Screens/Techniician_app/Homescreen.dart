import 'dart:async';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:intl/intl.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';

import '../../Components/Custom_app_bar.dart';
import '../User/Login_view.dart';
import 'Edit profile.dart';
import 'home_details.dart';

class DashboardScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Dummy counters for each card
    final Map<String, int> counters = {
      "Pending Jobs": 5,
      "Running Jobs": 2,
      "Completed Jobs": 8,
      "Feedback & Rating": 3,
      "Edit Profile": 0,
      "Logout": 0,
    };

    // Map of card titles to icons
    final Map<String, IconData> icons = {
      "Pending Jobs": Icons.pending_actions,
      "Running Jobs": Icons.run_circle,
      "Completed Jobs": Icons.task_alt,
      "Feedback & Rating": Icons.feedback,
      "Edit Profile": Icons.edit,
      "Logout": Icons.logout,
    };

    return Scaffold(

      body: Column(

        children: [
          RoundedAppBar(title: 'Dashboard',),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withOpacity(0.2),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                      ),

                      child: Row(
                        children: [
                          Image.asset("assets/dp_default.png", height: 120, width: 120,),
                          SizedBox(width: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Name: ", // Heading
                                      style: TextStyle(
                                        color: Colors.black, // You can adjust the color for the heading
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "Fahad Shafiq", // Displaying the username
                                      style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Email: ", // Heading
                                      style: TextStyle(
                                        color: Colors.black, // You can adjust the color for the heading
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "fahadshafiq77@mail.com", // Displaying the username
                                      style: TextStyle(
                                        color: AppColors.primary,

                                        fontSize: 12,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5,),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: "Phone: ", // Heading
                                      style: TextStyle(
                                        color: Colors.black, // You can adjust the color for the heading
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                    TextSpan(
                                      text: "03332736688", // Displaying the username
                                      style: TextStyle(
                                        color: AppColors.primary,

                                        fontSize: 13,
                                        fontFamily: "MeriendaBold",
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          )

                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 5,),
                  Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 45.0,
                        mainAxisSpacing: 16.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: counters.length,
                      itemBuilder: (context, index) {
                        final String title = counters.keys.elementAt(index);
                        final int count = counters.values.elementAt(index);
                        final IconData icon = icons[title] ?? Icons.help; // Fallback icon

                        return GestureDetector(
                          onTap: () {
                            if (title == "Logout" ) {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                            }
                            if (title == "Edit Profile" ) {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> EditProfiletech()));
                            }
                            else {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> JobDetailsScreen(title: title,)));


                            }
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white, // Background color of the card
                              borderRadius: BorderRadius.circular(20.0), // Match Card's radius
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 7,
                                  offset: Offset(0, 5), // Shadow position
                                ),
                              ],
                            ),



                              child: Stack(
                                children: [
                                  // Centered card content
                                  Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          icon,
                                          size: 50,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          title,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 16.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Badge for counter
                                  if (count > 0)
                                    Positioned(
                                      top: 5,
                                      right: 8,
                                      child: badges.Badge(
                                        badgeContent: Text(
                                          '$count',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        badgeStyle: badges.BadgeStyle(
                                          badgeColor: Colors.red,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );

                      },
                    ),
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



