 

class UserModel{
  String ?name;
  String ?gender;
  int ?age;
  String ?city;
  String ?birthday;
  int ?phone;
  String ?email;

  UserModel({
      this.name,
      this.gender,
      this.age,
      this.city,
      this.birthday,
      this.phone,
       this.email,
    });
    factory UserModel.fromJson(Map<String,dynamic>json)=>UserModel(
      name: json['name'], 
      gender: json['gender'],
      age: json['age'],
       city:json['city'] , 
       birthday:json['birthday'] ,
        phone:json['phone'],
        email: json['email']
         );

        Map<String,dynamic>toJson()=>{
        'name':name,
        'gender':gender,
        'age':age,
        'city':city,
        'birthday':birthday,
        'phone':phone,
        'email':email,

        };
}
   