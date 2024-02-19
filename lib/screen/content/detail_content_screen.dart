import 'package:edspert_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_final_project/screen/content/date_place_screen.dart';
import 'package:edspert_final_project/utils/svg_dir.dart';
import 'package:edspert_final_project/utils/widgets/edspert_button.dart';
import 'package:edspert_final_project/utils/widgets/edspert_rating.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/home/movie_model.dart';
import 'package:flutter/material.dart';

class DetailContentScreen extends StatelessWidget {
  static const routeName = '/detail-content-screen';
  const DetailContentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  movieModel.imageBackground,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 225,
                ),
                Container(
                  color: Colors.black.withOpacity(0.69),
                  width: MediaQuery.of(context).size.width,
                  height: 225,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: SvgPicture.asset(
                    SvgDir.play,
                    width: 55,
                    height: 55,
                  ),
                ),
                Positioned(
                  top: 190,
                  left: 10,
                  child: DescriptionCard.card(
                    title: movieModel.title,
                    image: movieModel.image,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.56,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      DescriptionBox.box(
                        isRating: true,
                        description: '8.9/10',
                        starRating: double.parse(movieModel.rating),
                      ),
                      const SizedBox(width: 17),
                      DescriptionBox.box(
                        isRating: false,
                        description: '152 Min',
                        title: 'Duration',
                      ),
                      const SizedBox(width: 17),
                      DescriptionBox.box(
                        isRating: false,
                        description: '13+',
                        title: 'P-G',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    'Sinopsis',
                    style: GoogleFonts.openSans(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Dalam film Lucasfilm Star Wars: The Last Jedi, kisah keluarga Skywalker diteruskan ketika para pahlawan The Force Awakens bergabung dengan para legenda galaksi dalam sebuah petualangan mencengangkan untuk menguak kunci misteri lintas zaman mengenai the Force serta terkuaknya secara mengejutkan berbagai rahasia masa lalu.Film ini dibintangi Mark Hamill, Carrie Fisher, Adam Driver, Daisy Ridley, John Boyega, Oscar Isaac, Lupita Nyong’o, Andy Serkis, Domhnall Gleeson, Anthony Daniels, Gwendoline Christie, Kelly Marie Tran, Laura Dern dan Benicio Del Toro. Star Wars: The Last Jedi ditulis & disutradarai oleh Rian Johnson dan diproduseri Kathleen Kennedy serta Ram Bergman. J.J. Abrams, Tom Karnowski dan Jason McGatlin sebagai produser eksekutif.',
                    style: GoogleFonts.openSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ],
              ),
            ),
            EdspertButton().primary(
              text: "Beli Tiket",
              isIcon: true,
              icon: SvgPicture.asset(SvgDir.ticketOutlined),
              onTap: () {
                EdspertNavigation().pushNamed(DatePlaceScreen.routeName,
                    arguments: {'movieModel': movieModel});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DescriptionBox {
  static Widget box({
    required bool isRating,
    required String description,
    double starRating = 1,
    String title = '',
  }) {
    return Container(
      width: 98,
      height: 58,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.white.withOpacity(0.15),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isRating == true
              ? EdspertRating.rating(
                  initialRating: starRating,
                )
              : Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.4),
                  ),
                ),
          Text(
            description,
            style: GoogleFonts.openSans(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionCard {
  static Widget card({required String title, required String image}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: title.length > 16 ? 20 : 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              width: 132,
              height: 189,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 220,
                ),
                child: Text(
                  title,
                  style: GoogleFonts.openSans(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 13),
              MovieDescription.list(titleList: [
                "Director",
                "Writter",
                "Genre",
                "PH"
              ], nameList: [
                "Rian Johnson",
                "Rian Johnson",
                "Action, Sci-fi",
                "Lucasfillm Ltd."
              ]),
              const SizedBox(height: 35),
            ],
          ),
        ),
      ],
    );
  }
}

class MovieDescription {
  static Widget list({
    required List<String> titleList,
    required List<String> nameList,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: titleList
              .map(
                (e) => Text(
                  e,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.25),
                  ),
                ),
              )
              .toList(),
        ),
        const SizedBox(width: 32),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: nameList
              .map(
                (e) => Text(
                  e,
                  style: GoogleFonts.openSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.60),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
