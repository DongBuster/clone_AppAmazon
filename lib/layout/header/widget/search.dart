import 'package:clone_app_amazon/constants/global_variables.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        cursorColor: const Color(0xff9c9c9c),
        cursorHeight: 22,
        style: const TextStyle(color: Colors.black87),
        decoration: InputDecoration(
          // center text
          contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
          //
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide.none),
          hintText: 'BÀN CHẢI ĐIỆN GIẢM 50%',
          hintStyle: TextStyle(
            color: Colors.red[300],
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),

          suffixIcon: const IconButton(
            onPressed: null,
            icon: Icon(Icons.camera_alt_outlined),
            iconSize: 20,
            color: hex_9c9c9c,
          ),
          prefixIcon: const Icon(
            Icons.search_outlined,
            size: 25,
            color: hex_9c9c9c,
          ),
        ),
      ),
    );
  }
}
