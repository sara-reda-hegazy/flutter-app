class DeveloperModel
{
  String? name;
  String? image;
  String? email;
  int? phone;
  DeveloperModel({this.email,this.image,this.name,this.phone});
   factory DeveloperModel.fromJson(Map<String,dynamic>json)=>DeveloperModel(
      name: json['name'], 
       image:json['image'] ,
        phone:json['phone'],
        email: json['email']
         );

        Map<String,dynamic>toJson()=>{
        'name':name,
        'image':image,
        'phone':phone,
        'email':email,

        };
}