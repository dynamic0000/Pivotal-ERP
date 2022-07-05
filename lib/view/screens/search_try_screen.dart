import 'dart:developer';

import 'package:collection/collection.dart';

var list = [
  {
    "10/01/2019": [
      {"title": "Avengers"},
      {"title": "Creed"}
    ]
  },
  {
    "30/10/2019": [
      {"title": "Jumanji"}
    ]
  }
];

void main(List<String> args) {
  var data = [
    {"title": 'Avengers', "release_date": '10/01/2019'},
    {"title": 'Creed', "release_date": '10/01/2019'},
    {"title": 'Jumanji', "release_date": '30/10/2019'},
  ];

  var newMap = groupBy(data, (Map obj) => obj['release_date']);
  log('mapppppppppppp==========$newMap');
  print(newMap);
  var newMap1 = groupBy(data, (Map obj) => obj['release_date'])
      .map((k, v) => MapEntry(k, v.map((item) {
            item.remove('release_date');
            return item;
          })));
}
