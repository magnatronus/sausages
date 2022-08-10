
/// The main API model at the top level
class GreggsModel {

  final String articleCode;
  final String shopCode;
  final DateTime availableFrom;
  final DateTime availableUntil;
  final double eatOutPrice;
  final double eatInPrice;
  final String articleName;
  final String internalDescription;
  final String customerDescription;
  final String imageUri;
  final String thumbnailUri;
  final List daysParts;

  GreggsModel({
    required this.articleCode, 
    required this.shopCode, 
    required this.availableFrom, 
    required this.availableUntil, 
    required this.eatOutPrice, 
    required this.eatInPrice, 
    required this.articleName,
    required this.internalDescription,
    required this.customerDescription,
    required this.imageUri,
    required this.thumbnailUri,
    required this.daysParts
  });

  static GreggsModel fromJson(Map<String, dynamic> json){
    return GreggsModel(
      articleCode: json['articleCode'],
      shopCode: json['shopCode'],
      availableFrom: DateTime.parse(json['availableFrom']), 
      availableUntil: DateTime.parse(json['availableUntil']), 
      eatOutPrice: json['eatOutPrice'], 
      eatInPrice: json['eatInPrice'], 
      articleName: json['articleName'],
      internalDescription: json['internalDescription'],
      customerDescription: json['customerDescription'],
      imageUri: json['imageUri'],
      thumbnailUri: json['thumbnailUri'],
      daysParts: json['dayParts']
    );
  }

}