class FoodModel{
  String? foodId;
  String? foodTitle;
  String? foodDetails;
  String? foodCategory;
  String? foodAddress;
  String? foodQuantity;
  String? foodTime;
  String? foodImage;

  FoodModel({
    required this.foodId,
    required this.foodTitle,
    required this.foodDetails,
    required this.foodAddress,
    required this.foodCategory,
    required this.foodQuantity,
    required this.foodTime,
    required this.foodImage
  });

  FoodModel.fromJson(Map<String, dynamic> json){
    foodId = json['foodId'];
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
      'foodId' : foodId,
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