import 'package:flutter/material.dart';
import 'package:herpi/models/reptiles.dart';

class ReptileCategoryProvider with ChangeNotifier {
  List<Reptile> reptiles = [];
  List<Reptile> get _reptiles => reptiles;

 
}
