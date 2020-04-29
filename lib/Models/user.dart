class User {
   int id;
   String username;
   String email;
   String password;
   String token;

  User({this.id, this.username, this.email, this.password, this.token});

  User.initial() :
  id = 0,
  username = '',
  email = '',
  password = '';


  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['name'];
    email = json['email'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['name'] = this.username;
    data['email']= this.email;
    data['password'] = this.password;

    return data;
  }
}