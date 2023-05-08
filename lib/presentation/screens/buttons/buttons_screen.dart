import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonsScreen extends StatelessWidget {
  static const String name = 'buttons_screen';
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Screen'),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          context.pop();
        },
      ),
    );
  }
}

class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
            spacing: 5,
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              ElevatedButton(onPressed: () {}, child: const Text('Elevated')),
              const ElevatedButton(
                  onPressed: null, child: const Text('Disabled')),
              ElevatedButton(onPressed: () {}, child: const Text('Enabled')),
              ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.alarm),
                  label: Text('Elevated icon')),
              FilledButton(onPressed: () {}, child: const Text('Filled')),
              FilledButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.accessible_forward_sharp),
                  label: const Text('Filled')),
              OutlinedButton(onPressed: () {}, child: const Text('Outline')),
              OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.last_page_sharp),
                  label: const Text('Outline')),
              TextButton(onPressed: () {}, child: const Text('Text')),
              const CustomButton(),
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.text_fields),
                  label: const Text('Text')),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add_home_work_sharp,
                ),
                color: colors.primary,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(colors.primary)),
              )
            ]),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              'Hola mundo',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
