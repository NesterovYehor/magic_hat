class CharacterModel {
  final String id;
  final String name;
  final List<String> alternateNames;
  final String species;
  final String gender;
  final String house;
  final String dateOfBirth;
  final int? yearOfBirth;
  final bool wizard;
  final String ancestry;
  final String eyeColour;
  final String hairColour;
  final String patronus;
  final bool hogwartsStudent;
  final bool hogwartsStaff;
  final String actor;
  final List<String> alternateActors;
  final bool alive;
  final String image;
  final bool? guessed;
  final int attempts;

  CharacterModel({
    required this.id,
    required this.name,
    required this.alternateNames,
    required this.species,
    required this.gender,
    required this.house,
    required this.dateOfBirth,
    required this.yearOfBirth,
    required this.wizard,
    required this.ancestry,
    required this.eyeColour,
    required this.hairColour,
    required this.patronus,
    required this.hogwartsStudent,
    required this.hogwartsStaff,
    required this.actor,
    required this.alternateActors,
    required this.alive,
    required this.image,
    this.guessed,
    this.attempts = 0
  });

  factory CharacterModel.fromJson(Map<String, dynamic> json) {
    return CharacterModel(
      id: json["id"] ?? '',
      name: json["name"] ?? '',
      alternateNames: List<String>.from(json["alternate_names"].map((x) => x)),
      species: json["species"] ?? '',
      gender: json["gender"] ?? '',
      house: json["house"] ?? '',
      dateOfBirth: json["dateOfBirth"] ?? '',
      yearOfBirth: json["yearOfBirth"] != null ? json["yearOfBirth"] as int? : null,
      wizard: json["wizard"] ?? false,
      ancestry: json["ancestry"] ?? '',
      eyeColour: json["eyeColour"] ?? '',
      hairColour: json["hairColour"] ?? '',
      patronus: json["patronus"] ?? '',
      hogwartsStudent: json["hogwartsStudent"] ?? false,
      hogwartsStaff: json["hogwartsStaff"] ?? false,
      actor: json["actor"] ?? '',
      alternateActors: List<String>.from(json["alternate_actors"].map((x) => x)),
      alive: json["alive"] ?? false,
      image: json["image"] ?? '',
      guessed: null, // Initialize guessed as null
    );
  }

  CharacterModel copyWith({
    String? id,
    String? name,
    List<String>? alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    List<String>? alternateActors,
    bool? alive,
    String? image,
    bool? guessed,
    int? attempts
  }) {
    return CharacterModel(
      id: id ?? this.id,
      name: name ?? this.name,
      alternateNames: alternateNames ?? this.alternateNames,
      species: species ?? this.species,
      gender: gender ?? this.gender,
      house: house ?? this.house,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      yearOfBirth: yearOfBirth ?? this.yearOfBirth,
      wizard: wizard ?? this.wizard,
      ancestry: ancestry ?? this.ancestry,
      eyeColour: eyeColour ?? this.eyeColour,
      hairColour: hairColour ?? this.hairColour,
      patronus: patronus ?? this.patronus,
      hogwartsStudent: hogwartsStudent ?? this.hogwartsStudent,
      hogwartsStaff: hogwartsStaff ?? this.hogwartsStaff,
      actor: actor ?? this.actor,
      alternateActors: alternateActors ?? this.alternateActors,
      alive: alive ?? this.alive,
      image: image ?? this.image,
      guessed: guessed ?? this.guessed,
    );
  }
}
