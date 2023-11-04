import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: ListView.separated(
        itemCount: descItem.length,
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
                        height: double.infinity,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                            image: NetworkImage("${descItem[index].imageDes}"),
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
                      "${descItem[index].titleDes}",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF000000),
                      ),
                    ),
                    Text(
                      "${descItem[index].description}",

                      maxLines: 3,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        
                      ),
                    ),
                    Text(
                      "${descItem[index].timeUp}",
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

class DescriptionItem {
  final String? imageDes;
  final String? titleDes;
  final String? description; 
  final String? timeUp;

  DescriptionItem({
    this.imageDes,
    this.titleDes,
    this.description,
    this.timeUp,
  });
}

List<DescriptionItem> descItem = [
  DescriptionItem(
    imageDes: "assets/images/Onion.png",
    titleDes: "Good food and its benifits",
    description: "Goodfood makes cooking fun and easy, We'll provide you with all the ingredients in your meal kit that you need to make a delicious meal.",
    timeUp: "15 mins",
  ),
  DescriptionItem(
    imageDes: "assets/images/Buffalo.png",
    titleDes: "Buffolo Wings",
    description: "A dinner party is a lot more intimate than a party-party, so inviting only friends who have never could be awkward. Instead, invite people.",
    timeUp: "25 mins",
  ),
  DescriptionItem(
    imageDes: "assets/images/Spaghetti.png",
    titleDes: "Spaghetti Carbonara",
    description: "Those steaks are cooking way faster than the potatoes! Grill, it's pretty simple: move the steaks over to the cool side, away from the charcoal. Your steak can rest and continue to absorb those smokey flavors.",
    timeUp: "55 mins",
  ),
  DescriptionItem(
    imageDes: "assets/images/Salad.png",
    titleDes: "Chicken Salad",
    description: "Two layers separated by coffee butter icing, which also covers the top of the cake.",
    timeUp: "Yesterday",
  ),
  DescriptionItem(
    imageDes: "assets/images/porridge.png",
    titleDes: "Porridge with Pork Liver",
    timeUp: "2 hours ago",
  ),
  DescriptionItem(
    imageDes: "assets/images/Terrazza.png",
    titleDes: "La Terrazza's Favourite",
    timeUp: "just finished",
  ),
];