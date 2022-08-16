class GetFilters {
  GetFilters({
    required this.type,
    required this.message,
    required this.data,
  });
  late final String type;
  late final String message;
  late final Data data;

  GetFilters.fromJson(Map<String, dynamic> json){
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
    required this.name,
  });
  late final String name;

  Plants.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class Seeds {
  Seeds({
    required this.name,
  });
  late final String name;

  Seeds.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}

class Tools {
  Tools({
    required this.name,
  });
  late final String name;

  Tools.fromJson(Map<String, dynamic> json){
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    return _data;
  }
}