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

    factory Address.fromJson(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo : json["geo"]
        //geo: Geo.fromJson(json["geo"]),
    );

    factory Address.fromMap(Map<String, dynamic> json) => Address(
        street: json["street"],
        suite: json["suite"],
        city: json["city"],
        zipcode: json["zipcode"],
        geo: {
          //'lat':
        },
  //      geo: Geo.fromMap(json["geo"]),
    );






    Map<String, dynamic> toMap() => {
        "street": street,
        "suite": suite,
        "city": city,
        "zipcode": zipcode,
        "geo": geo.toString(),
   //     "geo": "{'lat': }"
        //   "geo": geo.toMap(),
        //TODO:revisar Geo como to Map
    };

}