import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yazan_project2/ui/widgets/custom_card.dart';
import 'package:yazan_project2/ui/widgets/story_circle.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800 && constraints.maxWidth < 1200) {
              return TabDesign();
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}

class TabDesign extends StatefulWidget {
  const TabDesign({Key? key}) : super(key: key);

  @override
  _TabDesignState createState() => _TabDesignState();
}

class _TabDesignState extends State<TabDesign> {
  List<Color> colors = [
    Colors.teal,
    Colors.pink,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.amber
  ];

  final videoPlayerController = VideoPlayerController.network(
      'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4');
  ChewieController? chewieController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      aspectRatio: 16 / 13,
      autoPlay: false,
      autoInitialize: false,
      looping: false,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    chewieController!.dispose();
    chewieController!.pause();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    print(_width);
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width / 2.2,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Image.asset(
              'assets/images/mobile.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Container(
                  color: Colors.teal,
                  width: _width / 2,
                  height: 250,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StoryCircle(
                    radius: _width / 23,
                    image: NetworkImage(
                      'https://images.squarespace-cdn.com/content/v1/560a4c4be4b0774c42e0cd81/1443700257061-24DLQG9GZ1407VCVEVML/mansmiling.jpg?format=2500w',
                    ),
                  ),
                  SizedBox(width: 15),
                  StoryCircle(
                    radius: _width / 23,
                    image: NetworkImage(
                      'https://iso.500px.com/wp-content/uploads/2015/04/portraitist_cover.jpeg',
                    ),
                  ),
                  SizedBox(width: 15),
                  StoryCircle(
                    radius: _width / 23,
                    image: NetworkImage(
                        'https://media.istockphoto.com/photos/happy-laughing-man-picture-id544358212?k=20&m=544358212&s=612x612&w=0&h=aWtM7z1UWMKK7MNysUQZy5INHEnFfTevudKpQV10gGs='),
                  ),
                  SizedBox(width: 15),
                  StoryCircle(
                    radius: _width / 23,
                    image: NetworkImage(
                      'https://iso.500px.com/wp-content/uploads/2015/04/portraitist_cover.jpeg',
                    ),
                  ),
                  SizedBox(width: 15),
                ],
              ),
              Container()
            ],
          ),
          Container(
            color: Colors.teal,
            constraints: BoxConstraints(maxHeight: 350),
            height: _width / 3,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: colors.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    width: _width / 3,
                    decoration: BoxDecoration(
                        color: colors[index],
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(2, 3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            color: Colors.black,
                          )
                        ]),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'علاء محمد',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: _width / 32,
                                    ),
                                  ),
                                  Text(
                                    "المعدل: 99.2",
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      color: Colors.white,
                                      fontSize: 18,
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CircleAvatar(
                                radius: _width / 23,
                                backgroundImage: NetworkImage(
                                  'https://i.pinimg.com/originals/35/97/e3/3597e3639c0ba51f2924f1b656dbe415.jpg',
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 10, left: 10),
                            child: Text(
                              """ ما شاء الله استاذ رائع ومتميز, جبت عندو علامة كاملة, بنصحكم فيه والنتائج كانت واضحة من امتحانات التجريبي ، كنت الأكثر تفوقا بالصيفي  والكل سألني عن السر ، وقلت بكل ثقة الاستاذ يزن العقرباوي""",
                              style: TextStyle(
                                fontFamily: 'Cairo',
                                color: Colors.white,
                                fontSize: _width / 65,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
            indent: 70,
            endIndent: 70,
            thickness: 2,
          ),
          GridView.count(
            childAspectRatio: 3 / 3.5,
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 100, vertical: 20),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children: [
              CustomCard(
                  ontap: () {
                    print(_width);
                  },
                  title: 'إمتحانات محوسبة',
                  image:
                      'https://images.all-free-download.com/images/graphiclarge/student_background_studying_woman_sketch_cartoon_sketch_6843822.jpg'),
              CustomCard(
                  title: 'الدوسية',
                  image:
                      'https://thumbs.dreamstime.com/z/education-knowledge-mathematics-science-concept-tiny-male-character-learning-stationery-college-university-student-175865628.jpg'),
              CustomCard(
                  title: 'المراكز الثقافية',
                  image:
                      'https://image.shutterstock.com/shutterstock/photos/2025641873/display_1500/stock-vector-creative-ideas-and-technologies-concept-young-smiling-woman-female-character-going-with-laptop-2025641873.jpg'),
              CustomCard(
                  title: 'الدروس المجانية',
                  image:
                      'https://image.shutterstock.com/shutterstock/photos/2025641876/display_1500/stock-vector-great-creative-idea-and-innovation-concept-young-smiling-woman-cartoon-character-standing-showing-2025641876.jpg'),
            ],
          ),
          Divider(
            height: 20,
            color: Theme.of(context).primaryColor,
            indent: 70,
            endIndent: 70,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
