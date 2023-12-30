import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ssdinterview/core/widgets/shipping_item.dart';
import '../../../core/utils/app_assets.dart';
import '../../../core/utils/getsize.dart';
import '../../../core/widgets/statistics_item.dart';

class MashaweirScreen extends StatelessWidget {
  const MashaweirScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: PreferredSize(
        preferredSize:  Size.fromHeight(getSize(context)/5),
        child: AppBar(
          shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(getSize(context)/15),
            ),),
          leading: IconButton(
            onPressed:() {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Colors.white),
          ),
          actions: const [
            Icon(Icons.speaker_notes,color: Colors.white),
            Padding(
              padding: EdgeInsets.all(12.0),
              child: Icon(Icons.notification_important_rounded,color: Colors.white),
            )
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          Row(
            children: [
             Text("statistics",style: Theme.of(context).textTheme.bodyLarge,),
              const Spacer(),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0,right: 5),
                  child: SvgPicture.asset(AppAssets.dateRange,),
                ),
                Text("now"),
                Icon(Icons.arrow_drop_down)
              ],)
          ],),
           const Row(
            children: [
              StatisticsItem(label: "Total Shipping",imagePath: AppAssets.cube),
              SizedBox(width: 10,),
               StatisticsItem(label: "Under Delivery",imagePath: AppAssets.clock,),
            ],
          ),
          const SizedBox(height: 9,),
           const Row(
            children: [
              StatisticsItem(label: "Waiting Shipping",imagePath: AppAssets.van),
              SizedBox(width: 10,),
              StatisticsItem(label: "Delivered Handed",imagePath: AppAssets.hand,),
            ],
          ),
          const SizedBox(height: 9,),
          Text("Shipping Info",style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            shadows: [
              const Shadow(
                color: Colors.black26,      // Choose the color of the shadow
                blurRadius: 2.0,          // Adjust the blur radius for the shadow effect
                offset: Offset(2.0, 2.0), // Set the horizontal and vertical offset for the shadow
              ),
            ],
          ),),
          Container(
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(18)
            ),
            child: const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ShippingItem(label: "New Shipping",icon: Icons.add,)
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Divider(color: Colors.grey,),
                ),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ShippingItem(label: "Track Shipping",icon: Icons.add,)
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Divider(color: Colors.grey,),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}
