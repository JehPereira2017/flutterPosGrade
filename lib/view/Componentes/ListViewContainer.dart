import 'package:flutter/material.dart';
import 'List.dart';
import '../Home/styles.dart';

class ListViewContent extends StatelessWidget {
  final Animation<double> listTileWidth;
  final Animation<Alignment> listSlideAnimation;
  final Animation<EdgeInsets> listSlidePosition;
  ListViewContent({
    this.listSlideAnimation,
    this.listSlidePosition,
    this.listTileWidth,
  });
  @override
  Widget build(BuildContext context) {
    return (new Stack(
      alignment: listSlideAnimation.value,
      children: <Widget>[
        new ListData(
            margin: listSlidePosition.value * 5.5,
            width: listTileWidth.value,
            title: "Emily Thorne",
            subtitle: "Nutricionista",
            image: avatar6),
        new ListData(
            margin: listSlidePosition.value * 4.5,
            width: listTileWidth.value,
            title: "Harry Styles",
            subtitle: "Nutricionista ",
            image: avatar1),
        new ListData(
            margin: listSlidePosition.value * 3.5,
            width: listTileWidth.value,
            title: "Pheobe Philips",
            subtitle: "Educadora Física",
            image: avatar5),
        new ListData(
            margin: listSlidePosition.value * 2.5,
            width: listTileWidth.value,
            title: "Cleide Maria",
            subtitle: "Nutricionista",
            image: avatar4),
        new ListData(
            margin: listSlidePosition.value * 1.5,
            width: listTileWidth.value,
            title: "Everton Luís",
            subtitle: "Educador Físico",
            image: avatar2),
        new ListData(
            margin: listSlidePosition.value * 0.5,
            width: listTileWidth.value,
            title: "Suzana Silva",
            subtitle: "Nutricionista",
            image: avatar3),
      ],
    ));
  }
}

//For large set of data

//import '../Screens/Home/data.dart';
// DataListBuilder dataListBuilder = new DataListBuilder();
// var i = dataListBuilder.rowItemList.length + 0.5;
// children: dataListBuilder.rowItemList.map((RowBoxData rowBoxData) {
//   return new ListData(
//     title: rowBoxData.title,
//     subtitle: rowBoxData.subtitle,
//     image: rowBoxData.image,
//     width: listTileWidth.value,
//     margin: listSlidePosition.value * (--i).toDouble(),
//   );
// }).toList(),
