import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:management_of_scientific_research_project_of_ptithcm/models/topic.dart';

class TopicScreen extends StatelessWidget {
  final Topic topic;

  TopicScreen({
    Key key,
    @required this.topic,
  }) : super(key: key);

  final formatCurrency = new NumberFormat("#,##0", "vi_VN");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            print("Click Join Now");
          },
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber.withOpacity(0.8),
            ),
            child: Text(
              "Join now",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    child: CachedNetworkImage(imageUrl: topic.image),
                  ),
                ),
                Container(
                  height: 60,
                  child: AppBar(
                    elevation: 0.0,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    actions: [
                      IconButton(
                        icon: Icon(Icons.info_outline),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "ID: ${topic.topicCode}",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Text(
                    topic.name.toUpperCase(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.cyan,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("Type: ${topic.type}"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.cyan,
                        ),
                        borderRadius: BorderRadius.circular(15)),
                    child: Text("Field: ${topic.field}"),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
            Divider(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Day Created",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(topic.dateCreated.substring(0, 10)),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Text(
                        "End Date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(topic.acceptanceTime.substring(0, 10)),
                    ],
                  ),
                  Container(
                    width: 2,
                    height: 40,
                    color: Colors.grey,
                  ),
                  Column(
                    children: [
                      Text(
                        "Budget",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Text('${formatCurrency.format(topic.budget)} vnd'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Text(
                  "Nội dung: ${topic.content}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          ],
        ),
      ),
    );
  }
}
