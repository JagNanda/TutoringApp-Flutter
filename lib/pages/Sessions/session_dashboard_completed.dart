import 'package:flutter/material.dart';
import 'package:tutoring_app_flutter/components/sessions/completed_sessions.dart';

class SessionDashboardCompleted extends StatefulWidget {
  @override
  _SessionDashboardCompletedState createState() => _SessionDashboardCompletedState();
}

class _SessionDashboardCompletedState extends State<SessionDashboardCompleted> {
  List<CompletedSession> myList = List.generate(10, (index) => CompletedSession());
  ScrollController _scrollController = ScrollController();
  int shownPostCount = 10;

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
    for (int i = shownPostCount; i < shownPostCount + 10; i++) {
      myList.add(CompletedSession());
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
              hintText: "Search your Sessions",
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