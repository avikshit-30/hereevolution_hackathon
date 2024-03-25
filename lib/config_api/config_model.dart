class ConfigModel {
  List<Routes>? routes;

  ConfigModel({this.routes});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    if (json['routes'] != null) {
      routes = <Routes>[];
      json['routes'].forEach((v) {
        routes!.add(new Routes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.routes != null) {
      data['routes'] = this.routes!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ConfigModel{routes: $routes}';
  }
}

class Routes {
  String? id;
  List<Sections>? sections;
  String? routeHandle;

  Routes({this.id, this.sections, this.routeHandle});

  Routes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['sections'] != null) {
      sections = <Sections>[];
      json['sections'].forEach((v) {
        sections!.add(new Sections.fromJson(v));
      });
    }
    routeHandle = json['routeHandle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.sections != null) {
      data['sections'] = this.sections!.map((v) => v.toJson()).toList();
    }
    data['routeHandle'] = this.routeHandle;
    return data;
  }

  @override
  String toString() {
    return 'Routes{id: $id, sections: $sections, routeHandle: $routeHandle}';
  }
}

class Sections {
  String? id;
  String? type;
  List<Actions>? actions;
  Departure? departure;
  Departure? arrival;
  Summary? summary;

  String? language;
  Transport? transport;

  Sections(
      {this.id,
      this.type,
      this.actions,
      this.departure,
      this.arrival,
      this.summary,
      this.language,
      this.transport});

  Sections.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(new Actions.fromJson(v));
      });
    }
    departure = json['departure'] != null
        ? new Departure.fromJson(json['departure'])
        : null;
    arrival = json['arrival'] != null
        ? new Departure.fromJson(json['arrival'])
        : null;
    summary =
        json['summary'] != null ? new Summary.fromJson(json['summary']) : null;

    language = json['language'];
    transport = json['transport'] != null
        ? new Transport.fromJson(json['transport'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    if (this.departure != null) {
      data['departure'] = this.departure!.toJson();
    }
    if (this.arrival != null) {
      data['arrival'] = this.arrival!.toJson();
    }
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }

    data['language'] = this.language;
    if (this.transport != null) {
      data['transport'] = this.transport!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Sections{id: $id, type: $type, actions: $actions, departure: $departure, arrival: $arrival, summary: $summary, language: $language, transport: $transport}';
  }
}

class Actions {
  String? action;
  int? duration;
  int? length;
  String? instruction;
  int? offset;
  String? direction;
  String? severity;
  int? exit;

  Actions(
      {this.action,
      this.duration,
      this.length,
      this.instruction,
      this.offset,
      this.direction,
      this.severity,
      this.exit});

  Actions.fromJson(Map<String, dynamic> json) {
    action = json['action'];
    duration = json['duration'];
    length = json['length'];
    instruction = json['instruction'];
    offset = json['offset'];
    direction = json['direction'];
    severity = json['severity'];
    exit = json['exit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['action'] = this.action;
    data['duration'] = this.duration;
    data['length'] = this.length;
    data['instruction'] = this.instruction;
    data['offset'] = this.offset;
    data['direction'] = this.direction;
    data['severity'] = this.severity;
    data['exit'] = this.exit;
    return data;
  }

  @override
  String toString() {
    return 'Actions{action: $action, duration: $duration, length: $length, instruction: $instruction, offset: $offset, direction: $direction, severity: $severity, exit: $exit}';
  }
}

class Departure {
  String? time;
  Place? place;

  Departure({this.time, this.place});

  Departure.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    place = json['place'] != null ? new Place.fromJson(json['place']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    if (this.place != null) {
      data['place'] = this.place!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Departure{time: $time, place: $place}';
  }
}

class Place {
  String? type;
  Location? location;
  Location? originalLocation;

  Place({this.type, this.location, this.originalLocation});

  Place.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    originalLocation = json['originalLocation'] != null
        ? Location.fromJson(json['originalLocation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (originalLocation != null) {
      data['originalLocation'] = originalLocation!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return 'Place{type: $type, location: $location, originalLocation: $originalLocation}';
  }
}

class Location {
  double? lat;
  double? lng;

  Location({this.lat, this.lng});

  Location.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }

  @override
  String toString() {
    return 'Location{lat: $lat, lng: $lng}';
  }
}

class Summary {
  int? duration;
  int? length;
  int? baseDuration;

  Summary({this.duration, this.length, this.baseDuration});

  Summary.fromJson(Map<String, dynamic> json) {
    duration = json['duration'];
    length = json['length'];
    baseDuration = json['baseDuration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['duration'] = this.duration;
    data['length'] = this.length;
    data['baseDuration'] = this.baseDuration;
    return data;
  }

  @override
  String toString() {
    return 'Summary{duration: $duration, length: $length, baseDuration: $baseDuration}';
  }
}

class Transport {
  String? mode;

  Transport({this.mode});

  Transport.fromJson(Map<String, dynamic> json) {
    mode = json['mode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mode'] = this.mode;
    return data;
  }

  @override
  String toString() {
    return 'Transport{mode: $mode}';
  }
}
