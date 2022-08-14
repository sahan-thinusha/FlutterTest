import 'dart:convert';

class Environment {
  String name;
  String profile;
  String region;
  String description;
  String provider;
  String status;
  String environmentid;
    String? objectuuid;


  Environment({
        required this.name,
        required this.profile,
        required this.region,
        required this.description,
        required this.provider,
        required this.status,
        required this.environmentid,
        this.objectuuid,
               });

  factory Environment.fromJson(Map<String, dynamic> map) {
    return Environment(
      name: map["name"],
      profile: map["profile"],
      region: map["region"],
      description: map["description"],
      provider: map["provider"],
      status: map["status"],
      environmentid: map["environmentid"],
      objectuuid: map["objectuuid"],
      );
  }

  Map<String, dynamic> toJson() {
  return {
    
            "name": name,
    
            "profile": profile,
    
            "region": region,
    
            "description": description,
    
            "provider": provider,
    
            "status": status,
    
            "environmentid": environmentid,
    
            "objectuuid": objectuuid,
 };
  }

  @override
  String toString() {
    return 'Environment{'
          'name: $name,'
          'profile: $profile,'
          'region: $region,'
          'description: $description,'
          'provider: $provider,'
          'status: $status,'
          'environmentid: $environmentid,'
          'objectuuid: $objectuuid,'
   '}';
  }

}

List<Environment> EnvironmentListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Environment>.from(data.map((item) => Environment.fromJson(item)));
}

Environment EnvironmentFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return data.map((item) => Environment.fromJson(item));
}

String EnvironmentToJson(Environment data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
