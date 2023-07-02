// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:greengrocer/src/models/cart_item_model.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  String id;
  DateTime? createdDateTime;

  @JsonKey(name: 'due')
  DateTime overdueDateTime;

  // se não retornar nada do backend setamos como uma lista vazia
  @JsonKey(defaultValue: [])
  List<CartItemModel> items;
  String status;

  String qrCodeImage;
  @JsonKey(name: 'copiaecola')
  String copyAndPaste;
  double total;

  OrderModel({
    required this.id,
    this.createdDateTime,
    required this.overdueDateTime,
    required this.items,
    required this.status,
    required this.qrCodeImage,
    required this.copyAndPaste,
    required this.total,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderModelToJson(this);
}
