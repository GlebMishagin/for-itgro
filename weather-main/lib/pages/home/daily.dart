import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather/config.dart';
import 'package:weather/models/model.dart';

class DailyForecast extends StatelessWidget {
  const DailyForecast({ Key? key, required this.items }) : super(key: key);

  final List<DailyList> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color.fromARGB(255, 255, 255, 255)),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: 8,
        itemBuilder: (BuildContext context, int index) {
          var item = items[index];
          var day = item.day;
          var icon = item.icon;
          var minTemp = item.minTemp;
          var maxTemp = item.maxTemp;
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 2),
            child: Row(
              children: [
                Expanded(flex: 3, child: Text(day, style: Config.bodyText1)),
                Expanded(flex: 4, child: SvgPicture.asset("images/conditions/$icon.svg", height: 15,)),
                Expanded(flex: 1, child: SvgPicture.asset("images/current/arrowDown.svg")),
                Expanded(flex: 2, child: Text("$minTemp°C", style: Config.bodyText1)),
                Expanded(flex: 1, child: SvgPicture.asset("images/current/arrowUp.svg")),
                Expanded(flex: 2, child: Text("$maxTemp°C", style: Config.bodyText1)),                
              ]),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            color: Color.fromARGB(255, 255, 255, 255)
          );
        }
      ),
    );
  }
}