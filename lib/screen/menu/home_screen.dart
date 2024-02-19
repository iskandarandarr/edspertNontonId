import 'package:edspert_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_final_project/model/home/movie_model.dart';
import 'package:edspert_final_project/screen/content/detail_content_screen.dart';
import 'package:edspert_final_project/screen/content/movie_list_screen.dart';
import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/illustration_dir.dart';
import 'package:edspert_final_project/utils/image_dir.dart';
import 'package:edspert_final_project/utils/svg_dir.dart';
import 'package:edspert_final_project/utils/widgets/edspert_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _current = 0;
  final CarouselController _controller = CarouselController();

  List<MovieModel> listMovie = [
    MovieModel(
      title: "Star Wars : The Last",
      image: ImageDir.imageItem1,
      imageBackground: ImageDir.imageDetail1,
      rating: "4",
    ),
    MovieModel(
      title: "Fast & Furious 9",
      image: ImageDir.imageItem2,
      imageBackground: ImageDir.imageDetail2,
      rating: "5",
    ),
    MovieModel(
      title: "The Conjuring 3",
      image: ImageDir.imageItem3,
      imageBackground: ImageDir.imageDetail3,
      rating: "2",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgDir.location,
              width: 18,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              'Yogyakarta',
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            )
          ],
        ),
        leading: Image.asset(ImageDir.dummyProfile),
        actions: const [
          Icon(
            Icons.notifications_none,
            color: Colors.white,
          ),
          SizedBox(
            width: 25,
          ),
        ],
      ),
      body: Container(
        color: EdspertColor.primaryColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              bannerHome(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Sedang Tayang",
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            EdspertNavigation()
                                .pushNamed(MovieListScreen.routeName);
                          },
                          child: Text(
                            "Lihat Semua",
                            style: GoogleFonts.openSans(
                              color: Colors.white.withOpacity(0.6),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white.withOpacity(0.6),
                          size: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    children: List.generate(
                      listMovie.length,
                      (index) => cardMovie(
                        listMovie[index],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 19),
              const Divider(
                color: Colors.white,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Voucher Deals',
                      style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 11),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          voucherCard(icon: IllustrationDir.card),
                          const SizedBox(width: 14),
                          voucherCard(icon: IllustrationDir.people),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bannerHome() {
    return Column(
      children: [
        SizedBox(
          height: 265,
          child: CarouselSlider(
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10)),
                    alignment: Alignment.center,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        ImageDir.imageBanner1,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
            carouselController: _controller,
            options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [1, 2, 3, 4, 5].asMap().entries.map(
            (entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: _current == entry.key ? 24 : 12,
                  height: 12,
                  margin: const EdgeInsets.symmetric(
                    vertical: 1,
                    horizontal: 5,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    color: EdspertColor.purple
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            },
          ).toList(),
        ),
      ],
    );
  }
}

Widget cardMovie(MovieModel movieModel) {
  return Padding(
    padding: const EdgeInsets.only(right: 14),
    child: InkWell(
      onTap: () {
        EdspertNavigation().pushNamed(
          DetailContentScreen.routeName,
          arguments: {'movieModel': movieModel},
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 147,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                movieModel.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            movieModel.title,
            style: GoogleFonts.openSans(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          EdspertRating.rating(
            initialRating: double.parse(movieModel.rating),
          ),
        ],
      ),
    ),
  );
}

Widget voucherCard({required String icon}) {
  return Container(
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: EdspertColor.purple,
    ),
    width: 213,
    height: 131,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              icon,
              width: 73,
              height: 73,
            ),
            Container(
              margin: const EdgeInsets.only(left: 11),
              constraints: const BoxConstraints(maxWidth: 100),
              child: Column(
                children: [
                  Text(
                    'Bayar Pakai Debit BCA',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hemat',
                        style: GoogleFonts.openSans(
                          color: EdspertColor.yellow,
                          fontSize: 9,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '30%',
                        style: GoogleFonts.openSans(
                          color: EdspertColor.yellow,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 15,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(113),
            color: Colors.amber,
          ),
          child: Text(
            'Klik Disini',
            style: GoogleFonts.openSans(
              color: EdspertColor.darkPurple,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    ),
  );
}
