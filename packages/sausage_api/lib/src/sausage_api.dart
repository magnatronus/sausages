import 'dart:convert';

import '../sausage_api.dart';


/// Hard coded version of the API return
const jsonString = 
'''
{
  "articleCode": "1000446",
  "shopCode": "1234",
  "availableFrom": "2020-12-30T00:00:00Z",
  "availableUntil": "2045-05-13T23:59:59Z",
  "eatOutPrice": 1.05,
  "eatInPrice": 1.15,
  "articleName": "Sausage Roll",
  "dayParts": [
    "Breakfast",
    "Lunch",
    "Evening"
  ],
  "internalDescription": "Sausage Roll",
  "customerDescription": "The Nation’s favourite Sausage Roll.\\n\\nMuch likeElvis was hailed the King of Rock, many have appointed Greggs as the(unofficial) King of Sausage Rolls.\\n\\nFreshly baked in our shopsthroughout the day, this British classic is made from seasoned sausage meatwrapped in layers of crisp, golden puff pastry, as well as a large dollopof TLC. It’s fair to say, we’re proper proud of them.\\n\\nAnd that’s it. Noclever twist. No secret ingredient. It’s how you like them, so that’s howwe make them.\\n\\n",
  "imageUri": "https://articles.greggs.co.uk/images/1000446.png?1623244287449",
  "thumbnailUri": "https://articles.greggs.co.uk/images/1000446-thumb.png?1623244287450"
}
''';



/// Lets create a FAUX API where we have the JSON result hard coded
class SausageAPI {

  /// Not really a Future but then easier to convert if HTTP API called made
  Future <GreggsModel> getSausage() async {

    // this would be the result of the API call
    final json = jsonDecode(jsonString);

    // now create a model of the data and return 
    return GreggsModel.fromJson(json);
  }

}