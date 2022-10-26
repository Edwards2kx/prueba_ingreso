class Address {

    final String? street;
    final String? suite;
    final String? city;
    final String? zipcode;
    final Map<String, dynamic>? geo; //TODO: pasar a mapa
  //final String? geo;
  Address({
        this.street,
        this.suite,
        this.city,
        this.zipcode,
        this.geo,
    });

//Address.personal ( Map<String, dynamic> jsonn

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo : json["geo"]
        //geo: Geo.fromJson(json["geo"]),
    );
}