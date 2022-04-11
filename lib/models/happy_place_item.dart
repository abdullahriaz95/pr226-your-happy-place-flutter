import 'package:happy_place/models/happy_place_detail_item.dart';

class HappyPlaceItem {
  String name;
  String asset;
  int id;
  String titleDetailString;
  List<HappyPlaceDetailItem> listDetailItems;
  HappyPlaceItem({
    required this.name,
    required this.asset,
    required this.id,
    required this.titleDetailString,
    required this.listDetailItems,
  });
}
