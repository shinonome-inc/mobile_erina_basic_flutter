class Album {
  final int id;
  final String name;
  final List<String> types;

  const Album({
    required this.id,
    required this.name,
    required this.types,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    List<String> typesToList(dynamic types) {
      List<String> ret = [];
      for (int i = 0; i < types.length; i++) {
        ret.add(types[i]['type']['name']);
      }
      return ret;
    }

    return Album(
      id: json['id'],
      name: json['name'],
      types: typesToList(json['types']),
    );
  }
}
