class ResponseModel {
  List<Data>? data;
  Links? links;
  Meta? meta;

  ResponseModel({this.data, this.links, this.meta});

  ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? createdAt;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  Category? category;
  Thumbnails? thumbnails;
  Thumbnails? features;
  List<String>? tags;
  Admin? admin;
  bool? isFeatured;

  Data(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.createdAt,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.category,
      this.thumbnails,
      this.features,
      this.tags,
      this.admin,
      this.isFeatured});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    createdAt = json['created_at'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    category = json['category'] != null
        ? Category.fromJson(json['category'])
        : null;
    thumbnails = json['thumbnails'] != null
        ? Thumbnails.fromJson(json['thumbnails'])
        : null;
    features = json['features'] != null
        ? Thumbnails.fromJson(json['features'])
        : null;
    if (json['tags'] != null) {
      tags = <String>[];
      json['tags'].forEach((v) {
        tags!.add(json['tags']);
      });
    }
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
    isFeatured = json['is_featured'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['meta_title'] = metaTitle;
    data['meta_keywords'] = metaKeywords;
    data['meta_description'] = metaDescription;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (thumbnails != null) {
      data['thumbnails'] = thumbnails!.toJson();
    }
    if (features != null) {
      data['features'] = features!.toJson();
    }
    if (tags != null) {
      data['tags'] = tags!.map((v) => v).toList();
    }
    if (admin != null) {
      data['admin'] = admin!.toJson();
    }
    data['is_featured'] = isFeatured;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? slug;
  String? description;
  Null extras;
  String? createdAt;
  String? updatedAt;
  Null deletedAt;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.description,
      this.extras,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    description = json['description'];
    extras = json['extras'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['description'] = description;
    data['extras'] = extras;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Thumbnails {
  String? path;
  Null variant;
  Null variantName;
  String? filename;
  String? m;
  String? o;
  int? size;
  String? extension;
  int? id;
  String? aggregateType;
  int? duration;

  Thumbnails(
      {this.path,
      this.variant,
      this.variantName,
      this.filename,
      this.m,
      this.o,
      this.size,
      this.extension,
      this.id,
      this.aggregateType,
      this.duration});

  Thumbnails.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    variant = json['variant'];
    variantName = json['variant_name'];
    filename = json['filename'];
    m = json['m'];
    o = json['o'];
    size = json['size'];
    extension = json['extension'];
    id = json['id'];
    aggregateType = json['aggregate_type'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['path'] = path;
    data['variant'] = variant;
    data['variant_name'] = variantName;
    data['filename'] = filename;
    data['m'] = m;
    data['o'] = o;
    data['size'] = size;
    data['extension'] = extension;
    data['id'] = id;
    data['aggregate_type'] = aggregateType;
    data['duration'] = duration;
    return data;
  }
}

class Admin {
  String? name;
  Null symbol;
  int? id;

  Admin({this.name, this.symbol, this.id});

  Admin.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    data['id'] = id;
    return data;
  }
}

class Links {
  String? first;
  String? last;
  String? prev;
  String? next;

  Links({this.first, this.last, this.prev, this.next});

  Links.fromJson(Map<String, dynamic> json) {
    first = json['first'];
    last = json['last'];
    prev = json['prev'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['first'] = first;
    data['last'] = last;
    data['prev'] = prev;
    data['next'] = next;
    return data;
  }
}

class Meta {
  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  Meta(
      {this.currentPage,
      this.from,
      this.lastPage,
      this.links,
      this.path,
      this.perPage,
      this.to,
      this.total});

  Meta.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    from = json['from'];
    lastPage = json['last_page'];
    if (json['links'] != null) {
      links = <Link>[];
      json['links'].forEach((v) {
        links!.add(Link.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['from'] = from;
    data['last_page'] = lastPage;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['path'] = path;
    data['per_page'] = perPage;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class Link {
  String? url;
  String? label;
  bool? active;

  Link({this.url, this.label, this.active});

  Link.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}
