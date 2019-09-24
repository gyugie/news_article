
import 'package:flutter/material.dart';
import '../model/eventModel.dart';
import '../services/apiServices.dart';
import '../widget/article.dart';

class ArticleList extends StatefulWidget {
  @override
  _ArticleListState createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  ApiServices apiService;

  @override
  void initState(){
    super.initState();
    apiService = ApiServices();
  }

  @override
  Widget build(BuildContext context) {
  //  ApiServices().eventList().then((value) => print(value) );
    return Container(
      padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 10.0
              ),
      height: MediaQuery.of(context).size.height * 0.70,
      child: FutureBuilder(
        future: apiService.eventList(),
        builder: (BuildContext context, AsyncSnapshot<List<Event>> snapshot){
          if(snapshot.hasError){
           return Align(
              alignment: Alignment.topCenter,
              child: Container(
                child: Text("Something wrong with message: ${snapshot.error.toString()}"),
              ),
            );
          } else if(snapshot.connectionState == ConnectionState.done){
            List<Event> event = snapshot.data;
            return _buildListView(event);
          } else {
             return Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: 40,
                height: 40,
                child: new CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }

  _buildListView(List<Event> events){
    return Container(
        child : ListView.builder(
          itemBuilder: (ctx, index){
            Event event = events[index];
            print(event.image_url);
            return Article(
              event_id: event.event_id.toString(),
              event_title: event.event_title,
              event_description: event.event_description,
              image_url: event.image_url,
              created_date: event.created_date,
            );
          },
          itemCount: events.length,
        )
      );
  }
}

//  padding: EdgeInsets.symmetric(
      //           horizontal: 10.0,
      //           vertical: 10.0
      //         ),
      // height: MediaQuery.of(context).size.height * 0.70,
      // child: 
      // results == false 
      // ? 
      // Align(
      //   alignment: Alignment.topCenter,
      //   child: Container(
      //     width: 40,
      //     height: 40,
      //     child: new CircularProgressIndicator(),
      //   ),
      // ) 
      // : 
      // // Container()
      // ListView.builder(
      //   itemBuilder: (ctx, index){
      //     return Article(
      //       event_id: '1',
      //       event_title: 'test',
      //       event_description: 'test',
      //       event_image: 'test',
      //       event_date: 'rte',
      //     );
      //   },
      //   itemCount: 10,
      // ) 