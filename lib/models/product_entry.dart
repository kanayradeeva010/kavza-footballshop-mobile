// To parse this JSON data, do
//
//     final productEntry = productEntryFromJson(jsonString);

import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(json.decode(str).map((x) => ProductEntry.fromJson(x)));

String productEntryToJson(List<ProductEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
    String id;
    String name;
    int price;
    String description;
    String category;
    String thumbnail;
    int productStock;
    int productViews;
    bool isFeatured;
    int? userId;

    ProductEntry({
        required this.id,
        required this.name,
        required this.price,
        required this.description,
        required this.category,
        required this.thumbnail,
        required this.productStock,
        required this.productViews,
        required this.isFeatured,
        this.userId,
    });

    
    factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
        id: json["id"] ?? "",
        name: json["name"] ?? "",
        price: json["price"] ?? 0,
        description: json["description"] ?? "",
        category: json["category"] ?? "",
        thumbnail: json["thumbnail"] ?? "",          
        productStock: json["product_stock"] ?? 0,
        productViews: json["product_views"] ?? 0,
        isFeatured: json["is_featured"] ?? false,
        userId: json["user_id"],                    
      );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "description": description,
        "category": category,
        "thumbnail": thumbnail,
        "product_stock": productStock,
        "product_views": productViews,
        "is_featured": isFeatured,
        "user_id": userId,
    };
}
