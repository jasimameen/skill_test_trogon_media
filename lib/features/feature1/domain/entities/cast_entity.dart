class CastEnitity {
  int id;
  String name;
  String country;
  String birthday;
  String gender;
  String image;
  CastEnitity({
    required this.id,
    required this.name,
    required this.country,
    required this.birthday,
    required this.gender,
    required this.image,
  });
  

  @override
  String toString() {
    return 'CastEnitity(id: $id, name: $name, country: $country, birthday: $birthday, gender: $gender, image: $image)';
  }

  @override
  bool operator ==(covariant CastEnitity other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.country == country &&
      other.birthday == birthday &&
      other.gender == gender &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      country.hashCode ^
      birthday.hashCode ^
      gender.hashCode ^
      image.hashCode;
  }
}
