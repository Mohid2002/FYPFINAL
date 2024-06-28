import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xffffc107),
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'Notifications',
            style: TextStyle(
              color: Colors.black,
              fontSize: 25,
            ),
          ),
        ),
      ),

      // body: ListView.builder(
      //     itemCount: 3,
      //     shrinkWrap: true,
      //     itemBuilder:(context,index){
      //   return SwitchItem();
      // })

      body: SwitchItem(),
    );
  }
}

class SwitchItem extends StatefulWidget {
  const SwitchItem({super.key});

  @override
  State<SwitchItem> createState() => _SwitchItemState();
}

class _SwitchItemState extends State<SwitchItem> {
  bool isSelected = false;
  void itemSwitch(bool value){
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Notification",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),
      subtitle: Text(isSelected ? "ON" : "OFF",style: TextStyle(color: Colors.white),),
      trailing: Switch(value: isSelected, onChanged: itemSwitch,),

    );
  }
}

