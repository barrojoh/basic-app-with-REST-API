import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var objectId;
  var person;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
                border: UnderlineInputBorder(), labelText: 'Enter Name'),
          ),
          ElevatedButton(
              onPressed: () async {
                objectId = await savePerson();
              },
              child: Text('Save Data')),
          ElevatedButton(
              onPressed: () async {
                person = await getPerson(objectId);
              },
              child: Text('Read Data')),
          ElevatedButton(onPressed: updateData, child: Text('Update Data'))
        ],
      ),
    );
  }

  /*
   final objectId = await savePerson();
  final person = await getPerson(objectId!);
  print('Person: ${person.toString()}');
  print('Name: ${person['name']}');
  print('Age: ${person['age']}');
  
  
  
  void showMessage(String message) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }

  void saveData() async {
    //enters data into database
    final person = ParseObject('Person')
      ..objectId = objectId
      ..set('name', "Vlad")
      ..set('age', 27)
      ..set('State', true)
      ..set('Email', 'person@person.com')
      ..set('Password', '2');

    await person.save();
  }

  void readData() async {
    if (objectId.isEmpty) {
      showMessage('None objectId. Click button Save Date before.');
      return;
    }

    QueryBuilder<ParseObject> queryPerson =
        QueryBuilder<ParseObject>(ParseObject('DataTypes'))
          ..whereEqualTo('objectId', objectId);
    final ParseResponse parseResponse = await queryPerson.query();
    if (parseResponse.success && parseResponse.results != null) {
      final object = (parseResponse.results!.first) as ParseObject;
      print('Name: ${object.get<String>('name')}');
      print('Age: ${object.get<int>('age')}');
      print('Email: ${object.get<String>('Email')}');
      print('Password: ${object.get<String>('Password')}');
      print('state: ${object.get<bool>('State')}');
    }
  }*/

  void updateData() async {
    if (objectId.isEmpty) {
      ScaffoldMessenger.of(context)
        ..removeCurrentSnackBar()
        ..showSnackBar(
            SnackBar(content: Text('None objectId. Click Save before.')));
      return;
    }

    final parseObject = ParseObject("DataTypes")
      ..objectId = objectId
      ..set("age", 3)
      ..set("name", 'Kermit');

    final ParseResponse parseResponse = await parseObject.save();
  }


Future<String?> savePerson() async {
  final person = ParseObject('Person')
    ..set('name', "Johnny Boy")
    ..set('age', 21);
  await person.save();
  return person.objectId;
}

//Reading your First Data Object from Back4App
Future<Map<String, dynamic>> getPerson(String objectId) async {
  QueryBuilder<ParseObject> queryPerson =
      QueryBuilder<ParseObject>(ParseObject('Person'))
        ..whereEqualTo('objectId', objectId);
  final ParseResponse apiResponse = await queryPerson.query();
  if (apiResponse.success && apiResponse.results != null) {
    final name = apiResponse.results!.first.get<String>('name');
    final age = apiResponse.results!.first.get<String>('age');
    return {'name': name, 'age': age};
  } else {
    return {};
  }
}
}
