class ShowEntity {
  int id;
  String name;
  String language;
  String status;
  String premiered;
  String ended;
  String officialSite;
  String rating; 
  String image;
  String summary;

  ShowEntity({
    required this.id,
    required this.name,
    required this.language,
    required this.status,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.rating,
    required this.image,
    required this.summary,
  });

  @override
  String toString() {
    return 'ShowEntity(id: $id, name: $name, language: $language, status: $status, premiered: $premiered, ended: $ended, officialSite: $officialSite, rating: $rating, image: $image, summary: $summary)';
  }

  @override
  bool operator ==(covariant ShowEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
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
