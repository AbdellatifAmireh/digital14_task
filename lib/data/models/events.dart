class Events {
  int? id;
  String? title;
  String? type;
  late String datetimeLocal;
  List<Performers>? performers;
  Venue? venue;

  Events.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    datetimeLocal = json['datetime_local'];
    type = json['type'];
    performers = <Performers>[];
    json['performers'].forEach((i) {
      performers?.add(Performers.fromJson(i));
    });
    venue = Venue.fromJson(json['venue']);

    /*if (json['performers'] != null) {
      performers = <Performers>[];
      json['performers'].forEach((v) {
        performers!.add(Performers.fromJson(v));
      });
    }*/
  }
}

class Performers {
  int? id;
  String? image;
  String? name;
  String? type;

  Performers({
    this.id,
    this.image,
    this.name,
    this.type,
  });

  Performers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    name = json['name'];
    type = json['type'];
  }
}

class Venue {
  String? state;
  String? country;
  String? city;
  String? displayLocation;

  Venue({
    this.state,
    this.country,
    this.city,
    this.displayLocation,
  });

  Venue.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    country = json['country'];
    city = json['city'];
    displayLocation = json['display_location'];
  }
}
