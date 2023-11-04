import 'package:flutter/material.dart';

class ListProduction extends StatefulWidget {
  const ListProduction({super.key, required this.title});

  final String title;


  @override
  State<ListProduction> createState() => _ListProductionState();
}

class _ListProductionState extends State<ListProduction> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: ListView.separated(
        itemCount: users.length,
        padding: const EdgeInsets.only(
          top: 16,
        ),
        separatorBuilder: (context, index) {
          return Container(
            color: const Color(0xFFEDEDED),
            height: 1,
            margin: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 24,
            ),
          );
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(
              bottom: 4,
              left: 24,
              right: 24,
            ),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    right: 12,
                  ),
                  child: SizedBox(
                    height: 56,
                    width: 56,
                    child: Center(
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage("${users[index].avatar}"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "${users[index].userName}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text(
                      "${users[index].cost}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5F5F5F),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class UserEntity {
  final String? avatar;
  final String? userName;
  final String? cost;

  UserEntity({
    this.cost,
    this.avatar,
    this.userName,
  });
}

List<UserEntity> users = [
  UserEntity(
    avatar: "assets/images/Onion.png",
    userName: "Onion Rings",
    cost: "S60.30",
  ),
  UserEntity(
    avatar: "assets/images/Buffalo.png",
    userName: "Buffolo Wings",
    cost: "S72.00",
  ),
  UserEntity(
    avatar: "assets/images/Spaghetti.png",
    userName: "Spaghetti Carbonara",
    cost: "S39.00",
  ),
  UserEntity(
    avatar: "assets/images/Salad.png",
    userName: "Chicken Salad",
    cost: "S52.00",
  ),
  UserEntity(
    avatar: "assets/images/porridge.png",
    userName: "Porridge with Pork Liver",
    cost: "S32.00",
  ),
  UserEntity(
    avatar: "assets/images/Terrazza.png",
    userName: "La Terrazza's Favourite",
    cost: "S132.00",
  ),
];
