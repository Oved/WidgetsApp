import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: 'Botones',
      subTitle: 'Varios botones en Flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: 'Tarjetas',
      subTitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItems(
      title: 'ProgressIndicators',
      subTitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.refresh_rounded),
  MenuItems(
      title: 'Snackbars y diálogos',
      subTitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.info_outline),
  MenuItems(
      title: 'Animated Container',
      subTitle: 'Stateful Widgets animado',
      link: '/animated',
      icon: Icons.check_box_outline_blank),
  MenuItems(
      title: 'Ui Controls + Tiles',
      subTitle: 'Una serie de controles de Flutter',
      link: '/ui-controls',
      icon: Icons.car_rental_rounded),
  MenuItems(
      title: 'Tutorial',
      subTitle: 'Introducción a la aplicación',
      link: '/tutorial',
      icon: Icons.live_help_outlined),
  MenuItems(
      title: 'Infinite Scroll y Pull',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.list_alt_outlined),
  MenuItems(
      title: 'Counter Riverpod',
      subTitle: 'Contador con gestor de estado',
      link: '/counter',
      icon: Icons.calculate_outlined),
  MenuItems(
      title: 'Theme Changer',
      subTitle: 'Cambiar el tema de la aplicación',
      link: '/theme-changer',
      icon: Icons.color_lens_outlined),
  //MenuItems(title: 'Botones', subTitle: 'Varios botones en Flutter', link: '/buttons', icon: Icons.smart_button_outlined),
];
