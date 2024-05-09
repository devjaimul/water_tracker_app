
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_tracker_app/views/water_consume_class.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _glassTrackerTEController =
      TextEditingController(text: "1");

  List<WaterConsume> waterConsumeList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),

      ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  _buildWaterConsumeButton(),
                  const SizedBox(height: 20,),
                  _buildNoOfGlasses(),
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const Text(
                'History',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Total: ${_getTotalWaterConsumeCount()} ",
                style: const TextStyle(fontSize: 18),
              ),
            ]),
            const Divider(
              height: 20,
            ),
            _buildExpanded()
          ],
        ),
      ),
    );
  }

  Widget _buildNoOfGlasses() {
    return SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _glassTrackerTEController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.teal,
                    decoration: InputDecoration(
                      labelText: 'No of Glass',
                     labelStyle: TextStyle(color:Colors.black.withOpacity(0.6),),
                     enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    ),
                  ),
                );
  }

  Widget _buildWaterConsumeButton() {
    return GestureDetector(
                  onTap: _addWaterConsume,
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: Colors.teal.withOpacity(0.6), width: 8),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 32,
                            ),
                            Text('Tap Here'),
                          ],
                        ),
                      )),
                );
  }

  Widget _buildExpanded() {
    return Expanded(
            child: ListView.builder(
              itemCount: waterConsumeList.length,
              itemBuilder: (context, index) {
                return _buildListTile(waterConsumeList[index],index+1);
              },
            ),
          );
  }

  Widget _buildListTile(WaterConsume waterConsume,int serialNo) {
    return ListTile(
                  leading: CircleAvatar(
                    child: Text("$serialNo"),
                  ),
                  title: Text(DateFormat.yMEd().add_jms().format(waterConsume.time)),
                  trailing: Text(
                    waterConsume.glassCount.toString(),
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                );
  }

  void _addWaterConsume() {
    int glassCount = int.parse(_glassTrackerTEController.text);
    WaterConsume waterConsume =
        WaterConsume(time: DateTime.now(), glassCount: glassCount);
    waterConsumeList.add(waterConsume);
    setState(() {});
  }

  int _getTotalWaterConsumeCount() {
    int totalCount = 0;
    for (WaterConsume waterConsume in waterConsumeList) {
      totalCount += waterConsume.glassCount;
    }
    return totalCount;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _glassTrackerTEController.clear();

    super.dispose();
  }
}


