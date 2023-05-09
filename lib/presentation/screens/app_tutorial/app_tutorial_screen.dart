import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo(
      'Busca la comida',
      'Ya puedes matar tu antojo con nuestra variedad de comidas',
      'assets/images/1.png'),
  SlidesInfo(
      'Entrega rápida',
      'Ahora podrás disfrutar de tu pedido en el menor tiempo que creías',
      'assets/images/2.png'),
  SlidesInfo(
      'Disfruta la comida',
      'La comida ya llegó, disfruta ahora y vuelve a pedir con nosotros.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'app_tutorial_screen';
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }

      print('${pageViewController.page}');
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl))
                  .toList(),
            ),
            Positioned(
                right: 20,
                top: 50,
                child: TextButton(
                  child: const Text('Salir'),
                  onPressed: () {
                    context.pop();
                  },
                )),
            endReached
                ? Positioned(
                    bottom: 20,
                    right: 30,
                    child: FadeInRight(
                      from: 15,
                      delay: const Duration(milliseconds: 500),
                      child: FilledButton(
                        child: Text('Comenzar'),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                    ))
                : const SizedBox(),
          ],
        ));
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(imageUrl),
          ),
          Text(
            title,
            style: titleStyle,
          ),
          Text(
            caption,
            style: captionStyle,
          )
        ],
      ),
    );
  }
}
