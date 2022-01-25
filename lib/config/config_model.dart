import 'dart:convert';

// ignore_for_file: non_constant_identifier_names
class ConfigModel {
  final String API_HOST;
  final bool DEBUG;
  final bool TESTING;
  final String KEY;

  const ConfigModel({
    required this.API_HOST,
    required this.DEBUG,
    required this.TESTING,
    required this.KEY,
  });

  ConfigModel copyWith({
    String? API_HOST,
    bool? DEBUG,
    bool? TESTING,
    String? KEY,
  }) {
    return ConfigModel(
      API_HOST: API_HOST ?? this.API_HOST,
      DEBUG: DEBUG ?? this.DEBUG,
      TESTING: TESTING ?? this.TESTING,
      KEY: KEY ?? this.KEY,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'API_HOST': API_HOST,
      'DEBUG': DEBUG,
      'TESTING': TESTING,
      'KEY': KEY,
    };
  }

  factory ConfigModel.fromMap(Map<String, dynamic> map) {
    return ConfigModel(
      API_HOST: map['API_HOST'] ?? '',
      DEBUG: map['DEBUG'] ?? false,
      TESTING: map['TESTING'] ?? false,
      KEY: map['KEY'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ConfigModel.fromJson(String source) =>
      ConfigModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ConfigModel(API_HOST: $API_HOST, DEBUG: $DEBUG, TESTING: $TESTING, KEY: $KEY)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ConfigModel &&
        other.API_HOST == API_HOST &&
        other.DEBUG == DEBUG &&
        other.TESTING == TESTING &&
        other.KEY == KEY;
  }

  @override
  int get hashCode {
    return API_HOST.hashCode ^ DEBUG.hashCode ^ TESTING.hashCode ^ KEY.hashCode;
  }
}
