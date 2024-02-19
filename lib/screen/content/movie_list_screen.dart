import 'package:edspert_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/image_dir.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../utils/widgets/edspert_rating.dart';

class MovieListScreen extends StatefulWidget {
  static const routeName = '/movie-list';
  const MovieListScreen({super.key});

  @override
  State<MovieListScreen> createState() => _MovieListScreenState();
}

class _MovieListScreenState extends State<MovieListScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: EdspertColor.secondaryColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            EdspertNavigation().pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: Text(
          'Daftar Film',
          style: GoogleFonts.openSans(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 13),
          Container(
            decoration: BoxDecoration(
              color: EdspertColor.black2.withOpacity(0.24),
              borderRadius: BorderRadius.circular(8),
            ),
            child: PreferredSize(
              preferredSize: const Size.fromHeight(48),
              child: SizedBox(
                width: 250,
                height: 32,
                child: TabBar(
                  controller: _tabController,
                  dividerColor: EdspertColor.primaryColor,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.white.withOpacity(0.6),
                  labelStyle: GoogleFonts.openSans(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    color: EdspertColor.purple,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tabs: const [
                    Tab(text: 'Sedang Tayang'),
                    Tab(text: 'Akan Datang'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 21),
                    color: EdspertColor.primaryColor,
                    child: Column(
                      children: [
                        const SizedBox(height: 22),
                        cardMovie(
                          title: 'Star Wars : The Last Jedi',
                          image: ImageDir.imageItem1,
                          rate: 5,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                        cardMovie(
                          title: 'Fast & Furious 9',
                          image: ImageDir.imageItem2,
                          rate: 4,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                        cardMovie(
                          title: 'The Conjuring 3',
                          image: ImageDir.imageItem3,
                          rate: 4,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                      ],
                    ),
                  ),
                ),
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 21),
                    color: EdspertColor.primaryColor,
                    child: Column(
                      children: [
                        const SizedBox(height: 22),
                        cardMovie(
                          title: 'Petualangan Sherina 2',
                          image: ImageDir.imageItem4,
                          rate: 4,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                        cardMovie(
                          title: 'The Marvels',
                          image: ImageDir.imageItem5,
                          rate: 4,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                        cardMovie(
                          title: 'Despicable Me 4',
                          image: ImageDir.imageItem6,
                          rate: 4,
                          pg: 'P-G 13+',
                          genre: 'Action, Sci-fi',
                        ),
                        const SizedBox(height: 27),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget cardMovie({
  required String title,
  required double rate,
  required String pg,
  required String genre,
  required String image,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 117,
          height: 167,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 210),
              child: Text(
                title,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 5),
            EdspertRating.rating(
              initialRating: rate,
            ),
            Text(
              pg,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Text(
              genre,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w400,
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            SizedBox(
              height: title.length > 16 ? 30 : 60,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: EdspertColor.purple,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Beli Tiket',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
