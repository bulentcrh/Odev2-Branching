import 'package:coffe_app_project/color_palette.dart';
import 'package:coffe_app_project/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/wi.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {

  final List<String> coffeeTypes =  [
    "Coppuccino",
    'Espresso',
    'Latte',
    'Flat white',
  ];

  
  String selectedItem = 'Coppuccino';

  int counter = -1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: ColorPalette().ScaffoldBg,
     body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuModelContainers(),  
          _TitleText(),
          SizedBox(height: 20),
          SearchBar(),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
            child: ShaderMask(
              shaderCallback: (Rect bounds)  {
                 return  LinearGradient(
                  begin: Alignment(0.7, -1.0),
                  end: Alignment(1.0, -1.0),
                  colors: <Color>[Colors.black, Colors.transparent],
                 ).createShader(bounds);
              },
              blendMode: BlendMode.dstATop ,
               child: Container(
                color: Color(0xFF0D0F14),
                width: MediaQuery.of(context).size.width - 20.0,
                height: 40.0,
                child: ListView(
                scrollDirection: Axis.horizontal,
                  children: [
                    ...coffeeTypes.map((e) {
                      counter++;
                      if(counter <= 3)
                       return  _buildTypes(e, counter);
                       else {
                        counter = 0;
                        return _buildTypes(e, counter);
                       }
                    }).toList()
                  ],
                ),
              ), 
            ),
          ),
        ],
       ), 
      ),
    );
  }
}

Widget _buildTypes(coffee, counter) {

   String selectedItem = 'Coppuccino';

  return Padding(
    padding: counter != 0
      ? EdgeInsets.only(left: 25.0)
      : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Color(0xFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                 selectedItem = coffee;
                });
              },
              child: Text(coffee,
              style: GoogleFonts.sourceSansPro(
                color: coffee == selectedItem 
                ? ColorPalette().coffeSelected 
                : ColorPalette().coffeUnselected,
                fontSize: 17.0,),
             ),
            ),
            SizedBox(height: 4.0,),
            Container(
              height: 8.0,
              width: 8.0,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: coffee == selectedItem
                ? ColorPalette().coffeSelected
                : Colors.transparent
              ), 
            ),
          ],
          ),
      ),  
    );
}

void setState(Null Function() param0) {
}

class _TitleText extends StatelessWidget {
 const _TitleText({Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      //color: Colors.blue,
      width: (MediaQuery.of(context).size.width / 3) * 2 + 30,
      child: Text("Find the best coffee for you",
      style: GoogleFonts.sourceSansPro(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 40.0),),
    );
  }
}

class _MenuModelContainers extends StatelessWidget {
  const _MenuModelContainers({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.fromLTRB(15, 25, 15, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},

            child :Container(
              padding: EdgeInsets.all(5.0),
              height: 42.0,
              width: 42.0,
              decoration: BoxDecoration(
                color: Color(0xFF1F242C),
                borderRadius: BorderRadius.circular(12.0)),
                child: Iconify(
                  HeroiconsSolid.view_grid,
                  size: 12.0,
                 color: Color(0xFF4D4F52)), 
                ),
          ),

          GestureDetector(
            onTap: () {},

            child :Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5.0),
              height: 42.0,
              width: 42.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/model.png"),
                  fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}