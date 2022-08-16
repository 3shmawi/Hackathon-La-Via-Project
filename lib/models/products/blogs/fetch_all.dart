class FetchAllBlogs {
  FetchAllBlogs({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  FetchAllBlogs.fromJson(Map<String, dynamic> json){
    type = json['type'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.plants,
    required this.seeds,
    required this.tools,
  });
  late final List<Plants> plants;
  late final List<Seeds> seeds;
  late final List<Tools> tools;

  Data.fromJson(Map<String, dynamic> json){
    plants = List.from(json['plants']).map((e)=>Plants.fromJson(e)).toList();
    seeds = List.from(json['seeds']).map((e)=>Seeds.fromJson(e)).toList();
    tools = List.from(json['tools']).map((e)=>Tools.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plants'] = plants.map((e)=>e.toJson()).toList();
    _data['seeds'] = seeds.map((e)=>e.toJson()).toList();
    _data['tools'] = tools.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Plants {
  Plants({
    required this.plantId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.waterCapacity,
    required this.sunLight,
    required this.temperature,
  });
  late final String plantId;
  late final String name;
  late final String description;
  late final String imageUrl;
  late final int waterCapacity;
  late final int sunLight;
  late final int temperature;

  Plants.fromJson(Map<String, dynamic> json){
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['plantId'] = plantId;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    _data['waterCapacity'] = waterCapacity;
    _data['sunLight'] = sunLight;
    _data['temperature'] = temperature;
    return _data;
  }
}

class Seeds {
  Seeds({
    required this.seedId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String seedId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Seeds.fromJson(Map<String, dynamic> json){
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['seedId'] = seedId;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    return _data;
  }
}

class Tools {
  Tools({
    required this.toolId,
    required this.name,
    required this.description,
    required this.imageUrl,
  });
  late final String toolId;
  late final String name;
  late final String description;
  late final String imageUrl;

  Tools.fromJson(Map<String, dynamic> json){
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['toolId'] = toolId;
    _data['name'] = name;
    _data['description'] = description;
    _data['imageUrl'] = imageUrl;
    return _data;
  }
}