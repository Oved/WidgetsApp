import 'package:flutter/material.dart';

class UiControlsScreen extends StatelessWidget {
  static const name = 'ui_controls_screen';
  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ui Controls'),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, plane, boat, submarine }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBrearfast = false;
  bool wantLunch = false;
  bool wantDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
          title: const Text('Developer Mode'),
          subtitle: const Text('Aditional information'),
          value: isDeveloper,
          onChanged: (value) => setState(() {
            isDeveloper = !isDeveloper;
          }),
        ),
        ExpansionTile(
          title: const Text('Vehículo de transporte'),
          subtitle: Text(
            selectedTransportation.name,
          ),
          children: [
            RadioListTile(
                title: const Text('By car'),
                subtitle: const Text('viajar en carro'),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.car;
                    })),
            RadioListTile(
                title: const Text('By boat'),
                subtitle: const Text('viajar en bote'),
                value: Transportation.boat,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.boat;
                    })),
            RadioListTile(
                title: const Text('By plane'),
                subtitle: const Text('viajar en avión'),
                value: Transportation.plane,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.plane;
                    })),
            RadioListTile(
                title: const Text('By submarine'),
                subtitle: const Text('viajar en submarino'),
                value: Transportation.submarine,
                groupValue: selectedTransportation,
                onChanged: (value) => setState(() {
                      selectedTransportation = Transportation.submarine;
                    })),
          ],
        ),
        CheckboxListTile(
            title: const Text('¿Desayuno?'),
            value: wantsBrearfast,
            onChanged: ((value) => setState(() {
                  wantsBrearfast = !wantsBrearfast;
                }))),
        CheckboxListTile(
            title: const Text('Almuerzo?'),
            value: wantLunch,
            onChanged: ((value) => setState(() {
                  wantLunch = !wantLunch;
                }))),
        CheckboxListTile(
            title: const Text('Cena?'),
            value: wantDinner,
            onChanged: ((value) => setState(() {
                  wantDinner = !wantDinner;
                }))),
      ],
    );
  }
}
