import 'package:flutter/material.dart';
import 'episodes/episodes.dart' as episodes;
import 'maps/maps.dart' as maps; 
import 'dictionaries/dictionaries.dart' as dict;

final Map<String, Map<String, Widget>> episodeData = {
  'Episode 700': {
    'map': maps.Episode20240211(),
    'episode': episodes.Episode20240211(),
    'dictionary': dict.Episode20240211(),
  },
  'Episode 699': {
    'map': maps.Episode20240204(),
    'episode': episodes.Episode20240204(),
    'dictionary': dict.Episode20240204(),
  },
}; 