class Company {
  final String? name;
  final String? catchPhrase;
  final String? bs;

  Company({this.name, this.catchPhrase, this.bs});

  Company.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        catchPhrase = json['catchPhrase'],
        bs = json['bs'];


 factory Company.fromMap(Map<String, dynamic> json) => Company(
        name: json["name"],
        catchPhrase: json["catchPhrase"],
        bs: json["bs"],
    );


   Map<String, dynamic> toMap() => {
        "name": name,
        "catchPhrase": catchPhrase,
        "bs": bs,
    };


}
