import 'package:coffe_app_project/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        padding: EdgeInsets.all(8.0),
        height: 50.0,
        width: (MediaQuery.of(context).size.width - 30.0),
        decoration: BoxDecoration(
          color: ColorPalette().SearchBarFill,
          borderRadius: BorderRadius.circular(15.0),
          ),
         
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              hintText: "Find your coffee...",
              hintStyle: GoogleFonts.sourceSansPro(color: Colors.grey),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey,),
            ),
            style: GoogleFonts.sourceSansPro(color: Colors.grey),
          ),  
          
      ),
    );
  }
}