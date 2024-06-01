import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:tesis_app/config/constants/entertainment/entertainment_constant.dart';

List<String> listaDiversion = ['Musica', 'Videos', 'Chistes', 'minijuegos'];

class DiversionSlider extends StatelessWidget {
  const DiversionSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 610,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.9,
        scale: 0.9,
        autoplay: true,
        pagination: SwiperPagination(
            margin: const EdgeInsets.only(top: 0),
            builder: DotSwiperPaginationBuilder(
                activeColor: colors.primary, color: colors.secondary)),
        itemCount: itemsEntertainmentConstant.length,
        itemBuilder: (context, index) {
          final itemsEntertainment = itemsEntertainmentConstant[index];
          return _Slide(
            entertainmenConstant: itemsEntertainment,
          );
        },
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  // final String titulos;
  final EntertainmentConstant entertainmenConstant;
  const _Slide({required this.entertainmenConstant});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(140, 0, 0, 0),
              blurRadius: 10,
              offset: Offset(0, 10))
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: GestureDetector(
          onTap: () {
            context.push(entertainmenConstant.ruta);
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                entertainmenConstant.imagen,
                fit: BoxFit.cover,
              )),
        ),
      ),
    );
  }
}
