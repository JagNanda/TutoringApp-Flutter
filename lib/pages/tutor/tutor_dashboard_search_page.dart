import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/student_post_listing.dart';

class TutorDashboardSearchPage extends StatefulWidget {
  @override
  _TutorDashboardSearchPageState createState() => _TutorDashboardSearchPageState();
}

//TODO: Replace mock data with database calls

class _TutorDashboardSearchPageState extends State<TutorDashboardSearchPage> {
  List<StudentPostListing> myList = List.generate(10, (index) => StudentPostListing());
  int shownPostCount = 10;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchMorePosts();
        print('more');
        setState(() {});
      }
    });
  }

  void fetchMorePosts() {
    for (int i = shownPostCount; i < shownPostCount + 10; i++) {
      myList.add(StudentPostListing());
    }
    shownPostCount += 10;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(20),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Enter main subject area",
              icon: Icon(Icons.search),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: myList.length + 1,
            itemBuilder: (context, index) {
              if (index == myList.length) {
                return Center(child: CircularProgressIndicator());
              }
              return myList[index];
            },
          ),
        ),
      ],
    );
  }
}
