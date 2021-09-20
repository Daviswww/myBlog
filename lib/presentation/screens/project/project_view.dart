import 'package:flutter/material.dart';
import 'package:myblog/infrastructure/data/project_data.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  _ProjectViewState createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  late PageController pageController;
  double? pageOffset = 0;
  List data = ProjectData.data;
  @override
  void initState() {
    super.initState();
    pageController = PageController(viewportFraction: 0.7);
    pageController.addListener(() {
      setState(() {
        pageOffset = pageController.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Theme.of(context).primaryColor,
      child: Stack(
        children: [
          Positioned(
            bottom: 16,
            child: Container(
              alignment: Alignment.bottomLeft,
              width: MediaQuery.of(context).size.width,
              height: 500,
              padding: EdgeInsets.all(16),
              child: SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(16),
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 8,
                          itemBuilder: (BuildContext ctxt, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                margin: EdgeInsets.only(left: 16, right: 16),
                                width: 230,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                    index * 70,
                                    index * 20,
                                    index * 10,
                                    1,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Theme.of(context).primaryColorDark,
                                      blurRadius: 4,
                                      offset: Offset(4, 8), // Shadow position
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
