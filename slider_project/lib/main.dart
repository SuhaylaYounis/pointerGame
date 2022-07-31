import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:syncfusion_flutter_gauges/gauges.dart';

void main() {
  return runApp(GaugeApp());
}
/// Represents the GaugeApp class
class GaugeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Radial Gauge Demo',
      theme: ThemeData(primarySwatch: Colors.red),
      home: MyHomePage(),
    );
  }
}
/// Represents MyHomePage class
class MyHomePage extends StatefulWidget {
  /// Creates the instance of MyHomePage
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
var x1,x2=0;
var y1,y2=0;
Offset of1=Offset(0, 0);
Offset of2=Offset(0, 0);
double time = 0.001;
void calculate(){
  double s=(of1.dy-of2.dy)/(of1.dx-of2.dy);
  double distance = sqrt(pow((of1.dy-of2.dy), 2)+pow((of1.dx-of2.dx), 2));
  double speed = distance /time ;
  double acc= speed / time;
  value7=speed;
  print("Speed : ${speed} \n================================");
  print("Acc : ${acc} \n================================");
  of2=of1;
}
double value=0;
double value1=0;
double value2=0;
double value3=0;
int value4=0;
int value5=0;
int value6=0;
double value7=0;
class _MyHomePageState extends State<MyHomePage> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return Listener(

      onPointerHover: (e){
        of1 = e.position;
        calculate();
        setState(() {
          print(e.position.dx);
          print(e.position.dy);
          value1  = e.position.dx  ;
          value2  = e.position.dy  ;
          value3  = e.position.distance  ;
          value4  = e.timeStamp.inSeconds  ;
        });
      },
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Container(
              child: SfRadialGauge(
                  title: GaugeTitle(
                      text: 'X Value Meter',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 2000, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 1000,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 1000,
                          endValue: 1500,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 1500,
                          endValue: 2000,

                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(value: value1,onValueChanged: (print),)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(

                              child: const Text('2000',

                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold))),
                          angle: 2000,
                          positionFactor: 0.5)
                    ])
                  ]),
            ),
            Container(
              child: SfRadialGauge(
                  title: GaugeTitle(
                      text: 'Y Value Meter',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 2000, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 1000,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 1000,
                          endValue: 1500,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 1500,
                          endValue: 2000,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(
                        value: value2,onValueChanged: (print),)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(

                              child: const Text('2000',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold))),
                          angle: 2000,
                          positionFactor: 0.5)
                    ])
                  ]),
            ),
            Container(
              child: SfRadialGauge(
                  title: GaugeTitle(
                      text: 'Speed',
                      textStyle:
                      const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                  axes: <RadialAxis>[
                    RadialAxis(minimum: 0, maximum: 2000, ranges: <GaugeRange>[
                      GaugeRange(
                          startValue: 0,
                          endValue: 1000,
                          color: Colors.green,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 1000,
                          endValue: 10000,
                          color: Colors.orange,
                          startWidth: 10,
                          endWidth: 10),
                      GaugeRange(
                          startValue: 10000,
                          endValue: 50000,
                          color: Colors.red,
                          startWidth: 10,
                          endWidth: 10)
                    ], pointers: <GaugePointer>[
                      NeedlePointer(
                        value: value7,onValueChanged: (print),)
                    ], annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                          widget: Container(

                              child: const Text('50000',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold))),
                          angle: 50000,
                          positionFactor: 0.5)
                    ])
                  ]),
            ),

          ],
        ),
      ),
    );
  }
  Widget _getLinearGauge() {
    return SingleChildScrollView(
      child: Container(
        height: 100,
        width: 100,
        child: SfLinearGauge(
            minimum: 0.0,
            maximum: 100.0,
            orientation: LinearGaugeOrientation.horizontal,
            majorTickStyle: LinearTickStyle(length: 20),
            axisLabelStyle: TextStyle(fontSize: 12.0, color: Colors.black),
            axisTrackStyle: LinearAxisTrackStyle(
                color: Colors.amber,
                edgeStyle: LinearEdgeStyle.bothFlat,
                thickness: 15.0,
                borderColor: Colors.grey)),
        margin: EdgeInsets.all(10),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Syncfusion Flutter Gauge')),
        body: _getGauge());
  }
}
