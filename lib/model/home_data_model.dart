
class modelbanners{

String? image;

modelbanners({
    this.image,
  });

Map<String, dynamic> toMap() {
    return {
      'image': this.image,
    };
  }

  factory modelbanners.fromMap(Map<String, dynamic> map) {
    return modelbanners(
      image: map['image'] as String,
    );
  }
}
class modelproducts{
  dynamic id;
 String? name;
 String? image;
 String? description;
dynamic old_price;
 dynamic price;
bool? in_favorites;
bool? in_cart;

 modelproducts({
   this.id,
    this.name,
    this.image,
    this.description,
    this.old_price,
    this.price,
   this.in_cart,
   this.in_favorites
  });

 Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'image': this.image,
      'description': this.description,
      'old_price': this.old_price,
      'price': this.price,
      'in_favorites': this.in_favorites,
      'in_cart': this.in_cart,
    };
  }

  factory modelproducts.fromMap(Map<String, dynamic> map) {
    return modelproducts(
      id: map ["id"] ,
      name: map['name'] ,
      image: map['image'] ,
      description: map['description'] ,
      old_price: map['old_price'] ,
      price: map['price'] ,
      in_favorites: map['in_favorites'] ,
      in_cart: map['in_cart'] ,
    );
  }
}