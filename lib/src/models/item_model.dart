import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.g.dart';

@JsonSerializable()
class ItemModel {
  String id;

  // aqui pegar o title para atribuir a nossa itemName
  @JsonKey(name: 'title')
  String itemName;

  @JsonKey(name: 'picture')
  String imgUrl;

  String unit;
  double price;
  String description;

  ItemModel({
    this.id = '',
    required this.description,
    required this.imgUrl,
    required this.itemName,
    required this.price,
    required this.unit,
  });
  // metodo de recuperacao de dados ↓↓↓↓↓
  // pegar um Map e transformar em objeto
  factory ItemModel.fromJson(Map<String, dynamic> json) =>
      _$ItemModelFromJson(json);
  // pegar objeto e transformar em Map
  Map<String, dynamic> toJson() => _$ItemModelToJson(this);
}
