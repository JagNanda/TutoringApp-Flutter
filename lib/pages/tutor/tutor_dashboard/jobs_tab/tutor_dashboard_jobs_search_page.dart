import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/student_post_listing.dart';

class TutorDashboardJobsSearchPage extends StatefulWidget {
  @override
  _TutorDashboardJobsSearchPageState createState() => _TutorDashboardJobsSearchPageState();
}

//TODO: Replace mock data with database calls

class _TutorDashboardJobsSearchPageState extends State<TutorDashboardJobsSearchPage> {
  //TODO: replace list.generate with database call
  List<StudentPostListing> myList =
      List.generate(10, (index) => StudentPostListing(showSavedIcon: true));
  int amountOfPostsCurrentlyShowing = 10;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchMorePosts();
        setState(() {});
      }
    });
  }

  void fetchMorePosts() {
    //TODO: replace myList.add with
    for (int i = amountOfPostsCurrentlyShowing; i < amountOfPostsCurrentlyShowing + 10; i++) {
      myList.add(StudentPostListing());
    }
    amountOfPostsCurrentlyShowing += 10;
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
