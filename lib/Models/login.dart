class User {
  String userId;
  String userName;
  String userEmail;
  String userPassword;
  String userType;

  User({
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userPassword,
    required this.userType,
  });

  // Factory method to create a User from a map (usually comes from JSON)
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      userName: json['user_name'],
      userEmail: json['user_email'],
      userPassword: json['user_password'],
      userType: json['user_type'],
    );
  }

  // Method to convert User object to JSON
  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'user_name': userName,
      'user_email': userEmail,
      'user_password': userPassword,
      'user_type': userType,
    };
  }
}

// Model for the response that contains the User
class LoginResponse {
  String status;
  String statusMessage;
  List<User> response;

  LoginResponse({
    required this.status,
    required this.statusMessage,
    required this.response,
  });

  // Factory method to create a LoginResponse from a map (usually comes from JSON)
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    var list = json['response'] as List;
    List<User> userList = list.map((i) => User.fromJson(i)).toList();

    return LoginResponse(
      status: json['status'],
      statusMessage: json['status_message'],
      response: userList,
    );
  }

  // Method to convert LoginResponse object to JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'status_message': statusMessage,
      'response': response.map((user) => user.toJson()).toList(),
    };
  }
}