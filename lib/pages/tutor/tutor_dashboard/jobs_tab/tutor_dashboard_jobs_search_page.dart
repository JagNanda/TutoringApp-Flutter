import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/scrollable_list.dart';
import 'file:///C:/Users/Jag/AndroidStudioProjects/TutoringApp-Flutter/lib/components/student/student_post_listing.dart';

class TutorDashboardJobsSearchPage extends StatefulWidget {
  @override
  _TutorDashboardJobsSearchPageState createState() => _TutorDashboardJobsSearchPageState();
}

class _TutorDashboardJobsSearchPageState extends State<TutorDashboardJobsSearchPage> {
  List<StudentPostListing> postListings =
      List.generate(15, (index) => StudentPostListing(showSavedIcon: true));

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollableList(widgetList: postListings);
  }
}
