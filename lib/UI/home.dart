import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:herevolution/UI/route_page.dart';
import 'package:herevolution/config_api/config_repo.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Address and Vehicle Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AddressForm(),
    );
  }
}

class AddressForm extends ConsumerStatefulWidget {
  AddressForm({super.key});

  @override
  ConsumerState<AddressForm> createState() => _AddressFormState();
}

class _AddressFormState extends ConsumerState<AddressForm> {
  final TextEditingController _address1Controller = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _vehicleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Address and Vehicle Form'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _address1Controller,
              decoration: InputDecoration(
                labelText: 'Address 1',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _address2Controller,
              decoration: InputDecoration(
                labelText: 'Address 2',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              controller: _vehicleController,
              decoration: InputDecoration(
                labelText: 'Vehicle',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Submit functionality here
                var repo = ref.watch(configRepoProvider);
                repo.params.address1 = _address1Controller.text;
                repo.params.address2 = _address2Controller.text;
                repo.params.vehicle = _vehicleController.text;
                repo.execute();
                print('Address 1: ${_address1Controller.text}');
                print('Address 2: ${_address2Controller.text}');
                print('Vehicle: ${_vehicleController.text}');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RoutePage()),
                );
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
