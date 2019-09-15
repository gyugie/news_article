import 'package:flutter/material.dart';

class Thumbnails extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      margin: EdgeInsets.all(10),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black45,
                  blurRadius: 15.0,
                  offset: Offset(0, 0.5)
              )
            ],
        ),
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7dGYEqU62iL254Ihi7q86eXt1hmo9eG277eTjpmysYyfxEIYk',
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                      color: Colors.black87,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal:20
                      ),
                      child: Text(
                        'KTM is Possible for enduro',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}