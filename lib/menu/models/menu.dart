/* Menu Class- Plain Dart object */
class Menu {
  List<Categories>? categories;
  String? error;

  Menu({this.categories});

  Menu.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = [];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  Menu.withError(String errorMessage) {
    error = errorMessage;
  }
}

class Categories {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  String? nameCn;
  String? abbr;
  bool? onMenu;
  int? ordinal;
  List<Items>? items;

  Categories(
      {this.createdAt,
        this.updatedAt,
        this.id,
        this.name,
        this.nameCn,
        this.abbr,
        this.onMenu,
        this.ordinal,
        this.items});

  Categories.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    name = json['name'];
    nameCn = json['name_cn'];
    abbr = json['abbr'];
    onMenu = json['on_menu'];
    ordinal = json['ordinal'];
    if (json['items'] != null) {
      items = [];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_cn'] = this.nameCn;
    data['abbr'] = this.abbr;
    data['on_menu'] = this.onMenu;
    data['ordinal'] = this.ordinal;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? createdAt;
  String? updatedAt;
  String? id;
  String? name;
  String? nameCn;
  String? description;
  String? descriptionCn;
  String? abbr;
  List<String>? images;
  String? thumb;
  String? type;
  List<String>? tags;
  List<Variations>? variations;
  List<String>? modifierSetIds;
  List<String>? optionSetIds;
  int? ordinal;
  bool? soldOut;
  Price? priceMax;
  Price? priceMin;
  bool? timeAvailable;

  Items(
      {this.createdAt,
        this.updatedAt,
        this.id,
        this.name,
        this.nameCn,
        this.description,
        this.descriptionCn,
        this.abbr,
        this.images,
        this.thumb,
        this.type,
        this.tags,
        this.variations,
        this.modifierSetIds,
        this.optionSetIds,
        this.ordinal,
        this.soldOut,
        this.priceMax,
        this.priceMin,
        this.timeAvailable});

  Items.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    name = json['name'];
    nameCn = json['name_cn'];
    description = json['description'];
    descriptionCn = json['description_cn'];
    abbr = json['abbr'];
    images = json['images'].cast<String>();
    thumb = json['thumb'];
    type = json['type'];
    tags = json['tags'].cast<String>();
    if (json['variations'] != null) {
      variations = [];
      json['variations'].forEach((v) {
        variations!.add(new Variations.fromJson(v));
      });
    }
    modifierSetIds = json['modifierSet_ids'].cast<String>();
    optionSetIds = json['optionSet_ids'].cast<String>();
    ordinal = json['ordinal'];
    soldOut = json['sold_out'];
    priceMax = json['price_max'] != null
        ? new Price.fromJson(json['price_max'])
        : null;
    priceMin = json['price_min'] != null
        ? new Price.fromJson(json['price_min'])
        : null;
    timeAvailable = json['time_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['id'] = this.id;
    data['name'] = this.name;
    data['name_cn'] = this.nameCn;
    data['description'] = this.description;
    data['description_cn'] = this.descriptionCn;
    data['abbr'] = this.abbr;
    data['images'] = this.images;
    data['thumb'] = this.thumb;
    data['type'] = this.type;
    data['tags'] = this.tags;
    if (this.variations != null) {
      data['variations'] = this.variations!.map((v) => v.toJson()).toList();
    }
    data['modifierSet_ids'] = this.modifierSetIds;
    data['optionSet_ids'] = this.optionSetIds;
    data['ordinal'] = this.ordinal;
    data['sold_out'] = this.soldOut;
    if (this.priceMax != null) {
      data['price_max'] = this.priceMax!.toJson();
    }
    if (this.priceMin != null) {
      data['price_min'] = this.priceMin!.toJson();
    }
    data['time_available'] = this.timeAvailable;
    return data;
  }
}

class Variations {
  String? id;
  Price? price;
  List<String>? optionIds;
  bool? onMenu;
  bool? soldOut;

  Variations({this.id, this.price, this.optionIds, this.onMenu, this.soldOut});

  Variations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    optionIds = json['option_ids'].cast<String>();
    onMenu = json['on_menu'];
    soldOut = json['sold_out'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['option_ids'] = this.optionIds;
    data['on_menu'] = this.onMenu;
    data['sold_out'] = this.soldOut;
    return data;
  }
}

class Price {
  String? currency;
  int? amount;

  Price({this.currency, this.amount});

  Price.fromJson(Map<String, dynamic> json) {
    currency = json['currency'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['currency'] = this.currency;
    data['amount'] = this.amount;
    return data;
  }
}
