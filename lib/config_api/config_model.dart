// To parse this JSON data, do
//
//     final configModel = configModelFromJson(jsonString);

import 'dart:convert';

ConfigModel configModelFromJson(String str) =>
    ConfigModel.fromJson(json.decode(str));

String configModelToJson(ConfigModel data) => json.encode(data.toJson());

class ConfigModel {
  List<Route> routes;

  ConfigModel({
    required this.routes,
  });

  factory ConfigModel.fromJson(Map<String, dynamic> json) => ConfigModel(
        routes: List<Route>.from(json["routes"].map((x) => Route.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "routes": List<dynamic>.from(routes.map((x) => x.toJson())),
      };
  @override
  String toString() {
    return 'ConfigModel(routes: $routes)';
  }
}

class Route {
  String id;
  List<Section> sections;
  String routeHandle;

  Route({
    required this.id,
    required this.sections,
    required this.routeHandle,
  });

  factory Route.fromJson(Map<String, dynamic> json) => Route(
        id: json["id"],
        sections: List<Section>.from(
            json["sections"].map((x) => Section.fromJson(x))),
        routeHandle: json["routeHandle"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sections": List<dynamic>.from(sections.map((x) => x.toJson())),
        "routeHandle": routeHandle,
      };
}

class Section {
  String id;
  String type;
  List<Action> actions;
  Arrival departure;
  Arrival arrival;
  Summary summary;
  String polyline;
  List<Notice> notices;
  String language;
  Transport transport;

  Section({
    required this.id,
    required this.type,
    required this.actions,
    required this.departure,
    required this.arrival,
    required this.summary,
    required this.polyline,
    required this.notices,
    required this.language,
    required this.transport,
  });

  factory Section.fromJson(Map<String, dynamic> json) => Section(
        id: json["id"],
        type: json["type"],
        actions:
            List<Action>.from(json["actions"].map((x) => Action.fromJson(x))),
        departure: Arrival.fromJson(json["departure"]),
        arrival: Arrival.fromJson(json["arrival"]),
        summary: Summary.fromJson(json["summary"]),
        polyline: json["polyline"],
        notices:
            List<Notice>.from(json["notices"].map((x) => Notice.fromJson(x))),
        language: json["language"],
        transport: Transport.fromJson(json["transport"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "type": type,
        "actions": List<dynamic>.from(actions.map((x) => x.toJson())),
        "departure": departure.toJson(),
        "arrival": arrival.toJson(),
        "summary": summary.toJson(),
        "polyline": polyline,
        "notices": List<dynamic>.from(notices.map((x) => x.toJson())),
        "language": language,
        "transport": transport.toJson(),
      };
}

class Action {
  String action;
  int duration;
  int length;
  String instruction;
  int offset;
  Direction? direction;
  String? severity;

  Action({
    required this.action,
    required this.duration,
    required this.length,
    required this.instruction,
    required this.offset,
    this.direction,
    this.severity,
  });

  factory Action.fromJson(Map<String, dynamic> json) => Action(
        action: json["action"],
        duration: json["duration"],
        length: json["length"],
        instruction: json["instruction"],
        offset: json["offset"],
        direction: directionValues.map[json["direction"]]!,
        severity: json["severity"],
      );

  Map<String, dynamic> toJson() => {
        "action": action,
        "duration": duration,
        "length": length,
        "instruction": instruction,
        "offset": offset,
        "direction": directionValues.reverse[direction],
        "severity": severity,
      };
}

enum Direction { LEFT, RIGHT }

final directionValues =
    EnumValues({"left": Direction.LEFT, "right": Direction.RIGHT});

class Arrival {
  DateTime time;
  Place place;

  Arrival({
    required this.time,
    required this.place,
  });

  factory Arrival.fromJson(Map<String, dynamic> json) => Arrival(
        time: DateTime.parse(json["time"]),
        place: Place.fromJson(json["place"]),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "place": place.toJson(),
      };
}

class Place {
  String type;
  Location location;
  Location originalLocation;

  Place({
    required this.type,
    required this.location,
    required this.originalLocation,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        type: json["type"],
        location: Location.fromJson(json["location"]),
        originalLocation: Location.fromJson(json["originalLocation"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "location": location.toJson(),
        "originalLocation": originalLocation.toJson(),
      };
}

class Location {
  double lat;
  double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Notice {
  String title;
  String code;
  String severity;

  Notice({
    required this.title,
    required this.code,
    required this.severity,
  });

  factory Notice.fromJson(Map<String, dynamic> json) => Notice(
        title: json["title"],
        code: json["code"],
        severity: json["severity"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "code": code,
        "severity": severity,
      };
}

class Summary {
  int duration;
  int length;
  int baseDuration;

  Summary({
    required this.duration,
    required this.length,
    required this.baseDuration,
  });

  factory Summary.fromJson(Map<String, dynamic> json) => Summary(
        duration: json["duration"],
        length: json["length"],
        baseDuration: json["baseDuration"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "length": length,
        "baseDuration": baseDuration,
      };
}

class Transport {
  String mode;

  Transport({
    required this.mode,
  });

  factory Transport.fromJson(Map<String, dynamic> json) => Transport(
        mode: json["mode"],
      );

  Map<String, dynamic> toJson() => {
        "mode": mode,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
