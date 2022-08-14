import 'dart:convert';

class Project {
  String name;
  String description;
  String namespace;
  String version;
  String package;
    String? objectuuid;
  String projectuuid;


  Project({
        required this.name,
        required this.description,
        required this.namespace,
        required this.version,
        required this.package,
        this.objectuuid,
        required this.projectuuid,
               });

  factory Project.fromJson(Map<String, dynamic> map) {
    return Project(
      name: map["name"],
      description: map["description"],
      namespace: map["namespace"],
      version: map["version"],
      package: map["package"],
      objectuuid: map["objectuuid"],
      projectuuid: map["projectuuid"],
      );
  }

  Map<String, dynamic> toJson() {
  return {
    
            "name": name,
    
            "description": description,
    
            "namespace": namespace,
    
            "version": version,
    
            "package": package,
    
            "objectuuid": objectuuid,
    
            "projectuuid": projectuuid,
 };
  }

  @override
  String toString() {
    return 'Project{'
          'name: $name,'
          'description: $description,'
          'namespace: $namespace,'
          'version: $version,'
          'package: $package,'
          'objectuuid: $objectuuid,'
          'projectuuid: $projectuuid,'
   '}';
  }

}

List<Project> ProjectListFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Project>.from(data.map((item) => Project.fromJson(item)));
}

Project ProjectFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return data.map((item) => Project.fromJson(item));
}

String ProjectToJson(Project data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
