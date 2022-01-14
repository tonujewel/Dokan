// To parse this JSON data, do
//
//     final favoriteDm = favoriteDmFromJson(jsonString);

import 'dart:convert';

List<ProductDm> favoriteDmFromJson(String str) =>
    List<ProductDm>.from(json.decode(str).map((x) => ProductDm.fromJson(x)));

String? favoriteDmToJson(List<ProductDm> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductDm {
  ProductDm({
    this.id,
    this.name,
    this.slug,
    this.postAuthor,
    this.permalink,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.type,
    this.status,
    this.featured,
    this.catalogVisibility,
    this.description,
    this.shortDescription,
    this.sku,
    this.price,
    this.regularPrice,
    this.salePrice,
    this.dateOnSaleFrom,
    this.dateOnSaleFromGmt,
    this.dateOnSaleTo,
    this.dateOnSaleToGmt,
    this.priceHtml,
    this.onSale,
    this.purchasable,
    this.totalSales,
    this.virtual,
    this.downloadable,
    this.downloads,
    this.downloadLimit,
    this.downloadExpiry,
    this.externalUrl,
    this.buttonText,
    this.taxStatus,
    this.taxClass,
    this.manageStock,
    this.stockQuantity,
    this.lowStockAmount,
    this.inStock,
    this.backorders,
    this.backordersAllowed,
    this.backordered,
    this.soldIndividually,
    this.weight,
    this.dimensions,
    this.shippingRequired,
    this.shippingTaxable,
    this.shippingClass,
    this.shippingClassId,
    this.reviewsAllowed,
    this.averageRating,
    this.ratingCount,
    this.relatedIds,
    this.upsellIds,
    this.crossSellIds,
    this.parentId,
    this.purchaseNote,
    this.categories,
    this.tags,
    this.images,
    this.attributes,
    this.defaultAttributes,
    this.variations,
    this.groupedProducts,
    this.menuOrder,
    this.metaData,
    this.store,
    this.links,
  });

  dynamic id;
  String? name;
  String? slug;
  String? postAuthor;
  String? permalink;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? type;
  String? status;
  bool? featured;
  String? catalogVisibility;
  String? description;
  String? shortDescription;
  String? sku;
  String? price;
  String? regularPrice;
  String? salePrice;
  dynamic dateOnSaleFrom;
  dynamic dateOnSaleFromGmt;
  dynamic dateOnSaleTo;
  dynamic dateOnSaleToGmt;
  String? priceHtml;
  bool? onSale;
  bool? purchasable;
  dynamic totalSales;
  bool? virtual;
  bool? downloadable;
  List<Download>? downloads;
  dynamic downloadLimit;
  dynamic downloadExpiry;
  String? externalUrl;
  String? buttonText;
  String? taxStatus;
  String? taxClass;
  bool? manageStock;
  dynamic stockQuantity;
  dynamic lowStockAmount;
  bool? inStock;
  String? backorders;
  bool? backordersAllowed;
  bool? backordered;
  bool? soldIndividually;
  String? weight;
  Dimensions? dimensions;
  bool? shippingRequired;
  bool? shippingTaxable;
  String? shippingClass;
  dynamic shippingClassId;
  bool? reviewsAllowed;
  String? averageRating;
  dynamic ratingCount;
  List<dynamic>? relatedIds;
  List<dynamic>? upsellIds;
  List<dynamic>? crossSellIds;
  dynamic parentId;
  String? purchaseNote;
  List<Category>? categories;
  List<dynamic>? tags;
  List<Image>? images;
  List<dynamic>? attributes;
  List<dynamic>? defaultAttributes;
  List<dynamic>? variations;
  List<dynamic>? groupedProducts;
  dynamic menuOrder;
  List<MetaDatum>? metaData;
  Store? store;
  Links? links;

  factory ProductDm.fromJson(Map<String?, dynamic> json) => ProductDm(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        postAuthor: json["post_author"],
        permalink: json["permalink"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        type: json["type"],
        status: json["status"],
        featured: json["featured"],
        catalogVisibility: json["catalog_visibility"],
        description: json["description"],
        shortDescription: json["short_description"],
        sku: json["sku"],
        price: json["price"],
        regularPrice: json["regular_price"],
        salePrice: json["sale_price"],
        dateOnSaleFrom: json["date_on_sale_from"],
        dateOnSaleFromGmt: json["date_on_sale_from_gmt"],
        dateOnSaleTo: json["date_on_sale_to"],
        dateOnSaleToGmt: json["date_on_sale_to_gmt"],
        priceHtml: json["price_html"],
        onSale: json["on_sale"],
        purchasable: json["purchasable"],
        totalSales: json["total_sales"],
        virtual: json["virtual"],
        downloadable: json["downloadable"],
        downloads: json["downloads"] == null
            ? null
            : List<Download>.from(
                json["downloads"].map((x) => Download.fromJson(x))),
        downloadLimit: json["download_limit"],
        downloadExpiry: json["download_expiry"],
        externalUrl: json["external_url"],
        buttonText: json["button_text"],
        taxStatus: json["tax_status"],
        taxClass: json["tax_class"],
        manageStock: json["manage_stock"],
        stockQuantity: json["stock_quantity"],
        lowStockAmount: json["low_stock_amount"],
        inStock: json["in_stock"],
        backorders: json["backorders"],
        backordersAllowed: json["backorders_allowed"],
        backordered: json["backordered"],
        soldIndividually: json["sold_individually"],
        weight: json["weight"],
        dimensions: json["dimensions"] == null
            ? null
            : Dimensions.fromJson(json["dimensions"]),
        shippingRequired: json["shipping_required"],
        shippingTaxable: json["shipping_taxable"],
        shippingClass: json["shipping_class"],
        shippingClassId: json["shipping_class_id"],
        reviewsAllowed: json["reviews_allowed"],
        averageRating: json["average_rating"],
        ratingCount: json["rating_count"],
        relatedIds: json["related_ids"] == null
            ? null
            : List<dynamic>.from(json["related_ids"].map((x) => x)),
        upsellIds: json["upsell_ids"] == null
            ? null
            : List<dynamic>.from(json["upsell_ids"].map((x) => x)),
        crossSellIds: json["cross_sell_ids"] == null
            ? null
            : List<dynamic>.from(json["cross_sell_ids"].map((x) => x)),
        parentId: json["parent_id"],
        purchaseNote: json["purchase_note"],
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        tags: json["tags"] == null
            ? null
            : List<dynamic>.from(json["tags"].map((x) => x)),
        images: json["images"] == null
            ? null
            : List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
        attributes: json["attributes"] == null
            ? null
            : List<dynamic>.from(json["attributes"].map((x) => x)),
        defaultAttributes: json["default_attributes"] == null
            ? null
            : List<dynamic>.from(json["default_attributes"].map((x) => x)),
        variations: json["variations"] == null
            ? null
            : List<dynamic>.from(json["variations"].map((x) => x)),
        groupedProducts: json["grouped_products"] == null
            ? null
            : List<dynamic>.from(json["grouped_products"].map((x) => x)),
        menuOrder: json["menu_order"],
        metaData: json["meta_data"] == null
            ? null
            : List<MetaDatum>.from(
                json["meta_data"].map((x) => MetaDatum.fromJson(x))),
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
        links: json["_links"] == null ? null : Links.fromJson(json["_links"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "post_author": postAuthor,
        "permalink": permalink,
        "date_created": dateCreated,
        "date_created_gmt": dateCreatedGmt,
        "date_modified": dateModified,
        "date_modified_gmt": dateModifiedGmt,
        "type": type,
        "status": status,
        "featured": featured,
        "catalog_visibility": catalogVisibility,
        "description": description,
        "short_description": shortDescription,
        "sku": sku,
        "price": price,
        "regular_price": regularPrice,
        "sale_price": salePrice,
        "date_on_sale_from": dateOnSaleFrom,
        "date_on_sale_from_gmt": dateOnSaleFromGmt,
        "date_on_sale_to": dateOnSaleTo,
        "date_on_sale_to_gmt": dateOnSaleToGmt,
        "price_html": priceHtml,
        "on_sale": onSale,
        "purchasable": purchasable,
        "total_sales": totalSales,
        "virtual": virtual,
        "downloadable": downloadable,
        "downloads": downloads,
        "download_limit": downloadLimit,
        "download_expiry": downloadExpiry,
        "external_url": externalUrl,
        "button_text": buttonText,
        "tax_status": taxStatus,
        "tax_class": taxClass,
        "manage_stock": manageStock,
        "stock_quantity": stockQuantity,
        "low_stock_amount": lowStockAmount,
        "in_stock": inStock,
        "backorders": backorders,
        "backorders_allowed": backordersAllowed,
        "backordered": backordered,
        "sold_individually": soldIndividually,
        "weight": weight,
        "dimensions": dimensions,
        "shipping_required": shippingRequired,
        "shipping_taxable": shippingTaxable,
        "shipping_class": shippingClass,
        "shipping_class_id": shippingClassId,
        "reviews_allowed": reviewsAllowed,
        "average_rating": averageRating,
        "rating_count": ratingCount,
        "related_ids": relatedIds,
        "upsell_ids": upsellIds,
        "cross_sell_ids": crossSellIds,
        "parent_id": parentId,
        "purchase_note": purchaseNote,
        "categories": categories,
        "tags": tags,
        "images": images,
        "attributes": attributes,
        "default_attributes": defaultAttributes,
        "variations": variations,
        "grouped_products": groupedProducts,
        "menu_order": menuOrder,
        "meta_data": metaData,
        "store": store,
        "_links": links,
      };
}

class Category {
  Category({
    this.id,
    this.name,
    this.slug,
  });

  dynamic id;
  String? name;
  String? slug;

  factory Category.fromJson(Map<String?, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Dimensions {
  Dimensions({
    this.length,
    this.width,
    this.height,
  });

  String? length;
  String? width;
  String? height;

  factory Dimensions.fromJson(Map<String?, dynamic> json) => Dimensions(
        length: json["length"],
        width: json["width"],
        height: json["height"],
      );

  Map<String?, dynamic> toJson() => {
        "length": length,
        "width": width,
        "height": height,
      };
}

class Download {
  Download({
    this.id,
    this.name,
    this.file,
  });

  String? id;
  String? name;
  String? file;

  factory Download.fromJson(Map<String?, dynamic> json) => Download(
        id: json["id"],
        name: json["name"],
        file: json["file"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "file": file,
      };
}

class Image {
  Image({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
    this.position,
  });

  dynamic id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;
  dynamic position;

  factory Image.fromJson(Map<String?, dynamic> json) => Image(
        id: json["id"],
        dateCreated: json["date_created"] == null
            ? null
            : DateTime.parse(json["date_created"]),
        dateCreatedGmt: json["date_created_gmt"] == null
            ? null
            : DateTime.parse(json["date_created_gmt"]),
        dateModified: json["date_modified"] == null
            ? null
            : DateTime.parse(json["date_modified"]),
        dateModifiedGmt: json["date_modified_gmt"] == null
            ? null
            : DateTime.parse(json["date_modified_gmt"]),
        src: json["src"],
        name: json["name"],
        alt: json["alt"],
        position: json["position"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "date_created": dateCreated,
        "date_created_gmt": dateCreatedGmt,
        "date_modified": dateModified,
        "date_modified_gmt": dateModifiedGmt,
        "src": src,
        "name": name,
        "alt": alt,
        "position": position,
      };
}

class Links {
  Links({
    this.self,
    this.collection,
  });

  List<Collection>? self;
  List<Collection>? collection;

  factory Links.fromJson(Map<String?, dynamic> json) => Links(
        self: json["self"] == null
            ? null
            : List<Collection>.from(
                json["self"].map((x) => Collection.fromJson(x))),
        collection: json["collection"] == null
            ? null
            : List<Collection>.from(
                json["collection"].map((x) => Collection.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "self": self,
        "collection": collection,
      };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String?, dynamic> json) => Collection(
        href: json["href"],
      );

  Map<String?, dynamic> toJson() => {
        "href": href,
      };
}

class MetaDatum {
  MetaDatum({
    this.id,
    this.key,
    this.value,
  });

  dynamic id;
  String? key;
  dynamic value;

  factory MetaDatum.fromJson(Map<String?, dynamic> json) => MetaDatum(
        id: json["id"],
        key: json["key"],
        value: json["value"],
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "key": key,
        "value": value,
      };
}

class Store {
  Store({
    this.id,
    this.name,
    this.url,
    this.avatar,
    this.address,
  });

  dynamic id;
  String? name;
  String? url;
  String? avatar;
  Address? address;

  factory Store.fromJson(Map<String?, dynamic> json) => Store(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        avatar: json["avatar"],
        address:
            json["address"] == null ? null : Address.fromJson(json["address"]),
      );

  Map<String?, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "avatar": avatar,
        "address": address,
      };
}

class Address {
  Address({
    this.street1,
    this.street2,
    this.city,
    this.zip,
    this.country,
    this.state,
  });

  String? street1;
  String? street2;
  String? city;
  String? zip;
  String? country;
  String? state;

  factory Address.fromJson(Map<String?, dynamic> json) => Address(
        street1: json["street_1"],
        street2: json["street_2"],
        city: json["city"],
        zip: json["zip"],
        country: json["country"],
        state: json["state"],
      );

  Map<String?, dynamic> toJson() => {
        "street_1": street1,
        "street_2": street2,
        "city": city,
        "zip": zip,
        "country": country,
        "state": state,
      };
}
