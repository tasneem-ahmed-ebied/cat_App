import 'package:cat_app/domain/entities/fact_entitity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'fact_model.g.dart';
@JsonSerializable()
class FactModel extends FactEntitity{
  const FactModel({
    required super.fact,
    required super.lenght,
  });

    factory FactModel.fromJson(Map<String, dynamic> json) => _$FactModelFromJson(json);

  Map<String, dynamic> toJson() => _$FactModelToJson(this);
}