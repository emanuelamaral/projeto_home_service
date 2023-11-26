class AddressEntity {
  int? addressId;
  final String? street;
  final String? numberOfHouse;
  final String? district;
  final String? city;
  final String? state;
  final String? complement;

  AddressEntity(
      {this.addressId,
      required this.street,
      required this.numberOfHouse,
      required this.district,
      required this.city,
      required this.state,
      required this.complement});

  factory AddressEntity.fromJson(Map<String, dynamic> json) {
    return AddressEntity(
        addressId: json['addressId'],
        street: json['street'],
        numberOfHouse: json['numberOfHouse'],
        district: json['district'],
        city: json['city'],
        state: json['state'],
        complement: json['complement']);
  }

  Map<String, dynamic> toJson() {
    return {
      'addressId': addressId,
      'street': street,
      'numberOfHouse': numberOfHouse,
      'district': district,
      'city': city,
      'state': state,
      'complement': complement
    };
  }
}
