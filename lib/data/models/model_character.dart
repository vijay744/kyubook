class ModelCharacter {
  Info info;
  List<Results> results;

  ModelCharacter({required this.info, required this.results});

  factory ModelCharacter.fromJson(Map<String, dynamic> json) {
    List<Results> results = <Results>[];
    json['results'].forEach((v) {
      results.add(Results.fromJson(v));
    });
    return ModelCharacter(info: Info.fromJson(json['info']), results: results);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['info'] = info.toJson();
    data['results'] = results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Info {
  int count;
  int pages;
  String next;

  Info({required this.count, required this.pages, required this.next});

  Info.fromJson(Map<String, dynamic> json)
      : count = json['count'],
        pages = json['pages'],
        next = json['next'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['pages'] = pages;
    data['next'] = next;
    return data;
  }
}

class Results {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Origin origin;
  Origin location;
  String image;
  List<String> episode;
  String url;

  Results(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url});

  Results.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        status = json['status'],
        species = json['species'],
        type = json['type'],
        gender = json['gender'],
        origin = Origin.fromJson(json['origin']),
        location = Origin.fromJson(json['location']),
        image = json['image'],
        episode = json['episode'].cast<String>(),
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    data['species'] = species;
    data['type'] = type;
    data['gender'] = gender;
    if (origin != null) {
      data['origin'] = origin.toJson();
    }
    if (location != null) {
      data['location'] = location.toJson();
    }
    data['image'] = image;
    data['episode'] = episode;
    data['url'] = url;
    return data;
  }
}

class Origin {
  String name;
  String url;

  Origin({required this.name, required this.url});

  Origin.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        url = json['url'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['url'] = url;
    return data;
  }
}
