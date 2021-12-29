class EstateSearchResultModel {
  List<EstateSearchResult> searchResult;
  static const List<EstateSearchResult> data = [];
  EstateSearchResultModel({this.searchResult = data});
  

}

class EstateSearchResult {
  num? price;
  String? postedBy;
  String? propertyDecription;
  String? availableFor;

  EstateSearchResult(
      {this.postedBy, this.price, this.propertyDecription, this.availableFor});

  EstateSearchResult.fromJson(Map<String, dynamic> json) {
    price = json["price"];
    postedBy = json["posted_by"];
    propertyDecription = json["property_desc"];
    availableFor = json["available_for"];
  }
}
