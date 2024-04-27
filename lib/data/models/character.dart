// // ignore_for_file: public_member_api_docs, sort_constructors_first
// class Character {
//   int id;
//   String name;
//   String gender;
//   String status;
//   String image;
//   Character({
//     required this.id,
//     required this.name,
//     required this.gender,
//     required this.status,
//     required this.image,
//   });
//   factory Character.fromJson(Map<String, dynamic> jsonData) {
//     return Character(
//       id: jsonData['id'],
//       name: jsonData['name'],
//       gender: jsonData['gender'],
//       status: jsonData['status'],
//       image: jsonData['image'],
//     );
//   }
//   Map<String, dynamic> characterToJson() => {'id': id};
// }
