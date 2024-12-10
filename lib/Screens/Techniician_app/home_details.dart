import 'package:flutter/material.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';

import '../../Components/Custom_app_bar.dart';

class JobDetailsScreen extends StatelessWidget {
  final String title;

  JobDetailsScreen({required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          RoundedAppBar(title: title,),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: Offset(0, 3), // Shadow position
                  ),
                ],
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Name:', 'John Doe'),
                  SizedBox(height: 8),
                  _buildDetailRow('Address:', '123 Main St, City, Country'),
                  SizedBox(height: 8),
                  _buildDetailRow('Services:', 'AC Repair'),
                  SizedBox(height: 8),
                  _buildDetailRow('Amount:', '\$120'),
                  SizedBox(height: 8),
                  if(title =="Pending Jobs")
                    _buildDetailRow('Booking Date:', '30-Nov-2024'),
                  if(title =="Pending Jobs")
                    SizedBox(height: 8),
                  if(title =="Running Jobs" || title =="Completed Jobs")
                    _buildDetailRow('Start Date:', '2-Nov-2024'),
                  if(title =="Running Jobs" || title =="Completed Jobs")
                  SizedBox(height: 8),
                  if(title =="Feedback & Rating")
                    _buildDetailRow('Rating:', '3'),
                  if(title =="Feedback & Rating")
                  SizedBox(height: 8),
                  if(title =="Feedback & Rating")
                    _buildDetailRow('Review:', 'Good'),
                  if(title =="Feedback & Rating")
                  SizedBox(height: 10,),
                  if(title == "Pending Jobs" || title =="Running Jobs")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(""),

                      Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if(title =="Pending Jobs")
                          CustomButton(onPressed: () {  }, text: 'Start job', color: Colors.green),
                          if(title =="Running Jobs")
                            CustomButton(onPressed: () {  }, text: 'End job', color: Colors.red),
                          SizedBox(width: 5,),
                          CustomButton(onPressed: () {  }, text: 'View Route', color: AppColors.primary),

                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }




  Widget CustomButton({
    required VoidCallback onPressed,
    required String text,
    required Color color,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(

     padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


