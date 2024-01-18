import 'package:flutter/material.dart';

class UserModel {
  UserModel(
    this.stories, {
    required this.userName,
    required this.imageUrl,
  });

  final List<StoryModel> stories;
  final String userName;
  final String imageUrl;

  Image get userImage => Image.network(imageUrl);
}

class StoryModel {
  StoryModel({
    required this.imageUrl,
  });

  final String imageUrl;

  Image get storyImage => Image.network(imageUrl);
}

final users = [
  UserModel(
    userName: "User 1",
    imageUrl:
        "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw",
    [
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/e44w6saipufr4qhbtesw",
      ),
      // Other StoryModel instances
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/lpckjnidqulkymh6r1da",
      ),
      // Other StoryModel instances
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/ilr7v5wikdxcla8odvr1",
      ),
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/ilr7v5wikdxcla8odvr1",
      ),
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/k4etvr7nmwerdgd3fals",
      ),
      StoryModel(
        imageUrl:
            "https://res.cloudinary.com/dxlcsubez/image/upload/f_auto,q_auto/m3gung4bdlzc3fsh0bb5",
      )
      // Other StoryModel instances
    ],
  ),

  // Other UserModel instances
];
