import 'dart:ffi';

class product{
  String id;
  String name;
  String description;
  String category;
  String secondcategory;
  String image;
  String price;
  String card;

  product({this.id="",
    required this.name,
    required this.description,
    required this.category,
    required this.image,required this.price,required this.secondcategory,required this.card
  });

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "name" : name,
      "description" : description,
      "category" : category,
      "image" : image,
      "price" : price,
      "secondcategory" : secondcategory,
      "card" : card,



    };
  }
  product.fromFirestore (Map<String,dynamic> json):this(
      id : json["id"],
      name : json['name'],
      description : json['description'],
      category : json['category'],
    image :json[ 'image'],
      price :json[ 'price'],
    secondcategory :json[ 'secondcategory'],
    card :json[ 'card'],


  );
}
class my_car{
  String id;
  String id_product;
  String count;

  my_car({this.id="",
    required this.id_product,
    required this.count,
  });

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "id_product" : id_product,
      "count" : count,
    };
  }
  my_car.fromFirestore (Map<String,dynamic> json):this(
    id : json["id"],
    id_product : json['id_product'],
    count : json['count'],
  );
}
class my_love{
  String id;
  String id_product;

  my_love({this.id="",
    required this.id_product,
  });

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "id_product" : id_product,
    };
  }
  my_love.fromFirestore (Map<String,dynamic> json):this(
    id : json["id"],
    id_product : json['id_product'],
  );
}
class users{
  String id;
  String name;
  String mail;


  users({this.id="",
    required this.name,
    required this.mail,
  });

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "name" : name,
      "mail" : mail,

    };
  }
  users.fromFirestore (Map<String,dynamic> json):this(
    id : json["id"],
    name : json['name'],
    mail : json['mail'],
  );
}
class order{
  String id;
  String id_user;
  String total_price;


  order({this.id="",
    required this.id_user,
    required this.total_price,
  });

  Map<String,dynamic> toFirestore(){
    return{
      "id" : id,
      "id_user" : id_user,
      "total_price" : total_price,

    };
  }
  order.fromFirestore (Map<String,dynamic> json):this(
    id : json["id"],
    id_user : json['id_user'],
    total_price : json['total_price'],
  );
}

class displayss{
  String maincat;
  String secondcat;
  String user_id;
  displayss(this.maincat,this.secondcat,this.user_id);
}

class displays_card{
  String maincat;
  String cards;
  String user_id;
  displays_card(this.maincat,this.cards,this.user_id);
}

