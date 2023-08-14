import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}


const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Mensajes',
      subTitle: 'Aca encontraremos el sistema de mensajes para el adulto mayor',
      link: '/message',
      icon: Icons.content_cut_rounded),
  MenuItem(
      title: 'Medicamentos',
      subTitle: 'Medicinas para adultos mayores',
      link: '/medicines',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Diversion',
      subTitle: 'Un contenedor estilizado',
      link: '/entertainment',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Foro',
      subTitle: 'Generales y controlados',
      link: '/forum',
      icon: Icons.refresh_rounded),
  MenuItem(
      title: 'Asistente',
      subTitle: 'indicadores en pantalla',
      link: '/assistant',
      icon: Icons.info_outline),
  MenuItem(
      title: 'Perfil',
      subTitle: 'Una serie de controles el flutter',
      link: '/ui-control',
      icon: Icons.car_rental_outlined),
  MenuItem(
      title: 'Settings',
      subTitle: 'Stateful widget animado',
      link: '/settings',
      icon: Icons.check_box_outline_blank_rounded),
  MenuItem(
      title: 'Login',
      subTitle: 'Pequeño tutorial introductorio',
      link: '/login',
      icon: Icons.accessible_rounded),
  MenuItem(
      title: 'Signup',
      subTitle: 'Listas infinitas y pull to refresh',
      link: '/signup',
      icon: Icons.list_alt_rounded),
  MenuItem(
      title: 'Chistes',
      subTitle: 'Cambiar tema de la aplicacion',
      link: '/jokes',
      icon: Icons.color_lens_outlined),
];
