import 'package:skill_test_trogon_media/features/feature1/domain/entities/cast_entity.dart';

class CastModel extends CastEnitity {
  CastModel({
    required super.id,
    required super.name,
    required super.country,
    required super.birthday,
    required super.gender,
    required super.image,
  });

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      id: map ['person'] ['id'] as int,
      name: map['person']['name'] as String,
      country: map['person']['country']['name'] as String,
      birthday: map['birthday'] as String,
      gender: map['gender'] as String,
      image: map['image']['medium'] as String,
    );
  }

  CastEnitity copyWith({
    int? id,
    String? name,
    String? country,
    String? birthday,
    String? gender,
    String? image,
  }) {
    return CastEnitity(
      id: id ?? this.id,
      name: name ?? this.name,
      country: country ?? this.country,
      birthday: birthday ?? this.birthday,
      gender: gender ?? this.gender,
      image: image ?? this.image,
    );
  }
}
