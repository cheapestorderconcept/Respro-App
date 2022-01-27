class EstateModel {
  final String estateName;
  final String estatePrice;
  final String activeStatus;
  final String estateDesc;
  final String availableFor;
  final String estateLocation;
  final List<dynamic> estateImage;

  

  EstateModel(
      {required this.estateName,
      required this.estatePrice,
      required this.activeStatus,
      required this.estateDesc,
      required this.availableFor,
      required this.estateLocation,
      required this.estateImage
      });

  EstateModel.fromData(Map<String, dynamic> data)
      : activeStatus = data['active_status'].toString(),
        estateName = data['estate_name'].toString(),
        estatePrice = data['estate_price'].toString(),
        estateDesc = data['estate_desc'].toString(),
        estateImage = data['estate_image'],
        availableFor = data['available_for'].toString(),
        estateLocation = data['estate_location'].toString();
}