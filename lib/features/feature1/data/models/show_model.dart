import 'package:skill_test_trogon_media/features/feature1/domain/entities/show_entity.dart';

class ShowModel extends ShowEntity {
  ShowModel({
    required super.id,
    required super.name,
    required super.language,
    required super.status,
    required super.premiered,
    required super.ended,
    required super.officialSite,
    required super.rating,
    required super.image,
    required super.summary,
  });

  ShowModel copyWith({
    int? id,
    String? name,
    String? language,
    String? status,
    String? premiered,
    String? ended,
    String? officialSite,
    String? rating,
    String? image,
    String? summary,
  }) {
    return ShowModel(
      id: id ?? this.id,
      name: name ?? this.name,
      language: language ?? this.language,
      status: status ?? this.status,
      premiered: premiered ?? this.premiered,
      ended: ended ?? this.ended,
      officialSite: officialSite ?? this.officialSite,
      rating: rating ?? this.rating,
      image: image ?? this.image,
      summary: summary ?? this.summary,
    );
  }

  factory ShowModel.fromMap(Map<String, dynamic> map) {
    return ShowModel(
      id: map['id'] as int,
      name: map['name'] as String,
      language: map['language'] as String,
      status: map['status'] as String,
      premiered: map['premiered'] as String,
      ended: map['ended'] as String,
      officialSite: map['officialSite'] as String,
      rating: (map['rating']['average'] as double).toString(),
      image: map['image']['medium'] as String,
      summary: map['summary'] as String,
    );
  }

 @override
  bool operator ==(covariant ShowModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.language == language &&
        other.status == status &&
        other.premiered == premiered &&
        other.ended == ended &&
        other.officialSite == officialSite &&
        other.rating == rating &&
        other.image == image &&
        other.summary == summary;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        language.hashCode ^
        status.hashCode ^
        premiered.hashCode ^
        ended.hashCode ^
        officialSite.hashCode ^
        rating.hashCode ^
        image.hashCode ^
        summary.hashCode;
  }
}
