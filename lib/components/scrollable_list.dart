import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ScrollableList extends StatefulWidget {
  //all list items that will eventually be displayed
  final List<Widget> widgetList;
  //the amount of items to show initially
  final int amountToShow;
  ScrollableList({@required this.widgetList, @required this.amountToShow});

  @override
  _ScrollableListState createState() => _ScrollableListState();
}

class _ScrollableListState extends State<ScrollableList> {
  //amount of posts currently showing
  int postsShowingCount = 0;
  //the list items that are currently being displayed
  List widgetDisplayList;
  bool reachedEnd = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    initList();
    //check if we reached the bottom of the currently displayed list
    _scrollController.addListener(() {
      //check if we reached the end of the list
      if (postsShowingCount == widget.widgetList.length) {
        reachedEnd = true;
      }
      if (!reachedEnd &&
          _scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        fetchMorePosts();
        //force re-render
        setState(() {});
      }
    });
  }

  void initList() {
    //if list empty display the amountToShow
    widgetDisplayList = widget.widgetList.getRange(0, widget.amountToShow).toList();
    postsShowingCount += widget.amountToShow;
  }

  void fetchMorePosts() {
    //can remove this delay, just used it to show the loading icon
    Future.delayed(const Duration(milliseconds: 500), () {
      if (postsShowingCount < widget.widgetList.length) {
        for (int i = postsShowingCount; i < postsShowingCount + widget.amountToShow; i++) {
          widgetDisplayList.add(widget.widgetList[i]);
        }
        setState(() {});
        postsShowingCount += widget.amountToShow;
        print(postsShowingCount);
      }
    });
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
            itemCount: reachedEnd ? widgetDisplayList.length + 1 : widgetDisplayList.length,
            itemBuilder: (context, index) {
              if (index == widgetDisplayList.length && !reachedEnd) {
                return Center(child: CircularProgressIndicator());
              }
              print(reachedEnd);
              return widgetDisplayList[index];
            },
          ),
        ),
      ],
    );
  }
}
