import 'package:flutter/material.dart';
import 'package:talasuf_car_care/Components/Utilis.dart';
import '../../Api_services/data/Local_services/Session.dart';
import '../../Components/Custom_app_bar.dart';

class EditProfileScreen extends StatelessWidget {
   EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          RoundedAppBar(title: 'Edit Profile'),
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                      UserInfoEditField(
                        text: "Name",
                        child: TextFormField(
                          initialValue: UserData.username,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.primary.withOpacity(0.05),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      UserInfoEditField(
                        text: "Email",
                        child: TextFormField(
                          initialValue: UserData.email,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors.primary.withOpacity(0.05),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),


                      UserInfoEditField(
                        text: "Old Password",
                        child: TextFormField(
                          obscureText: true,
                          initialValue: UserData.password,
                          decoration: InputDecoration(
                            suffixIcon: const Icon(
                              Icons.visibility_off,
                              size: 20,
                            ),
                            filled: true,
                            fillColor: AppColors.primary.withOpacity(0.05),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),
                      UserInfoEditField(
                        text: "New Password",
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "New Password",
                            filled: true,
                            fillColor: AppColors.primary.withOpacity(0.05),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0 * 1.5, vertical: 16.0),
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(50)),
                            ),
                          ),
                        ),
                      ),


                 SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 120,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .color!
                              .withOpacity(0.08),
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 48),
                          shape: const StadiumBorder(),
                        ),
                        child: const Text("Cancel"),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    SizedBox(
                      width: 160,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          minimumSize: const Size(double.infinity, 48),
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: const Text("Save Update"),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
    required this.image,
    this.isShowPhotoUpload = false,
    this.imageUploadBtnPress,
  });

  final String image;
  final bool isShowPhotoUpload;
  final VoidCallback? imageUploadBtnPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color:
          Theme.of(context).textTheme.bodyLarge!.color!.withOpacity(0.08),
        ),
      ),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(image),
          ),
          InkWell(
            onTap: imageUploadBtnPress,
            child: CircleAvatar(
              radius: 13,
              backgroundColor: Theme.of(context).primaryColor,
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UserInfoEditField extends StatelessWidget {
  const UserInfoEditField({
    super.key,
    required this.text,
    required this.child,
  });

  final String text;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0 / 2),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(text),
          ),
          Expanded(
            flex: 3,
            child: child,
          ),
        ],
      ),
    );
  }
}
