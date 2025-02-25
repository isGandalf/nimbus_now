import 'package:flutter/material.dart';

class HourlyForecast extends StatefulWidget {
  const HourlyForecast({super.key});

  @override
  State<HourlyForecast> createState() => _HourlyForecastState();
}

class _HourlyForecastState extends State<HourlyForecast> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: AlwaysScrollableScrollPhysics(),
      child: Scoller(),
    );
  }
}

class Scoller extends StatelessWidget {
  const Scoller({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          for (int i = 0; i < 10; i++)
            Padding(
              padding: const EdgeInsets.only(bottom: 12, left: 5, right: 5),
              child: Container(
                width: 100,
                decoration: BoxDecoration(
                  color:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(blurRadius: 5.0, offset: Offset(0, 5))],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    children: [
                      Text('20 C', style: TextStyle(fontSize: 20)),
                      SizedBox(height: 5),
                      Icon(Icons.cloud, size: 40),
                      SizedBox(height: 5),
                      Text('Sky', style: TextStyle(fontSize: 18)),
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
