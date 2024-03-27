class FoodModel{
  String? donerName;
  String? donerPhone;
  String? donerId;
  String? foodTitle;
  String? foodDetails;
  String? foodCategory;
  String? foodAddress;
  int? foodQuantity;
  String? foodTime;
  String? foodImage;

  FoodModel({
    required this.donerName,
    required this.donerPhone,
    required this.donerId,
    required this.foodTitle,
    required this.foodDetails,
    required this.foodAddress,
    required this.foodCategory,
    required this.foodQuantity,
    required this.foodTime,
    required this.foodImage
  });

  FoodModel.fromJson(Map<dynamic, dynamic> json){
    donerId = json['donerId'];
    donerName = json['donerName'];
    donerPhone = json['donerPhone'];
    foodTitle = json['foodTitle'];
    foodDetails = json['foodDetails'];
    foodAddress = json['foodAddress'];
    foodCategory = json['foodCategory'];
    foodTime = json['foodTime'];
    foodQuantity = json['foodQuantity'];
    foodImage = json['foodImage'];
  }

  Map<String, dynamic> toMap(){
    return {
      'donerName': donerName,
      'donerId': donerId,
      'donerPhone': donerPhone,
      'foodTitle': foodTitle,
      'foodDetails': foodDetails,
      'foodAddress': foodAddress,
      'foodCategory': foodCategory,
      'foodTime': foodTime,
      'foodQuantity': foodQuantity,
      'foodImage': foodImage,
    };
  }
}