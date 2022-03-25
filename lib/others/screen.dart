import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewScreen extends StatefulWidget {

  const NewScreen({ Key? key }) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formatedTime = DateFormat('HH:mm').format(now);
    var formatedDate = DateFormat('EEE, MMM d').format(now);

    var timeZoneString = now.timeZoneOffset.toString().split('.').first;
    var offsetSign = '';
    if (!timeZoneString.startsWith('-')) offsetSign = '+';

    return Scaffold(
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 26, 18, 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.alarm, size: 14,), SizedBox(width: 2.5),
                    Icon(Icons.wifi_tethering, size: 14,), SizedBox(width: 2.5),
                    Icon(Icons.four_g_mobiledata_outlined, size: 14,), SizedBox(width: 2.5),
                    Icon(Icons.network_cell_rounded, size: 14,), SizedBox(width: 2.5),
                    Text("80%", style: TextStyle(fontSize: 14),), 
                    Icon(Icons.battery_charging_full_sharp, size: 14,),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(18, 0, 8, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(icon:Icon(Icons.search), onPressed: () { }, ), 
                    IconButton(icon:Icon(Icons.power_settings_new), onPressed: () { }, ), 
                    IconButton(icon:Icon(Icons.settings), onPressed: () { }, ), 
                    IconButton(icon:Icon(Icons.more_vert), onPressed: () { }, ), 
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 70),
          Text(formatedTime, style: const TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.w200)),
          Text(formatedDate, style: const TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w300)),
          const SizedBox(height: 70),
          
        ],
      ),
    );
  }
}