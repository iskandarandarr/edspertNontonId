import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:edspert_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_final_project/model/home/movie_model.dart';
import 'package:edspert_final_project/screen/content/select_seat_screen.dart';
import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/image_dir.dart';
import 'package:edspert_final_project/utils/widgets/edspert_button.dart';
import 'package:edspert_final_project/utils/widgets/edspert_textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DatePlaceScreen extends StatefulWidget {
  static const routeName = '/date-place-screen';
  const DatePlaceScreen({super.key});

  @override
  State<DatePlaceScreen> createState() => _DatePlaceScreenState();
}

class _DatePlaceScreenState extends State<DatePlaceScreen> {
  List<Color> colorTimeSelected =
      List.generate(4, (index) => EdspertColor.darkGrey);

  void _onSelectColor(int boxIndex) {
    if (boxIndex == 0) return;

    setState(() {
      for (int i = 0; i < colorTimeSelected.length; i++) {
        if (i == boxIndex) {
          colorTimeSelected[i] = EdspertColor.purple;
        } else {
          colorTimeSelected[i] = EdspertColor.darkGrey;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    MovieModel movieModel = arguments['movieModel'] as MovieModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: EdspertColor.secondaryColor,
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
          movieModel.title,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const DateContent(),
            const SizedBox(height: 21),
            EdspertTextField.textField(
                hintText: "Cari Bioskop",
                icon: Icons.search,
                marginContainer: 10),
            const SizedBox(height: 21),
            Accordion(
              headerBackgroundColor: Colors.transparent,
              contentBorderColor: Colors.transparent,
              contentBorderWidth: 0,
              contentBackgroundColor: EdspertColor.primaryColor,
              contentBorderRadius: 0,
              contentHorizontalPadding: 1,
              contentVerticalPadding: 1,
              scaleWhenAnimating: true,
              openAndCloseAnimation: true,
              headerPadding:
                  const EdgeInsets.symmetric(vertical: 11, horizontal: 0),
              sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
              sectionClosingHapticFeedback: SectionHapticFeedback.light,
              children: [
                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  leftIcon: Image.asset(ImageDir.cinema1),
                  header: Text(
                    'CGV JWalk',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: accordionContent(
                    listDate: List.generate(
                      colorTimeSelected.length,
                      (index) => timeBox(
                        color: index == 0
                            ? EdspertColor.softBlack
                            : colorTimeSelected[index],
                        label: '16.00',
                        onTap: () {
                          _onSelectColor(index);
                        },
                      ),
                    ),
                  ),
                ),
                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  leftIcon: Image.asset(ImageDir.cinema2),
                  header: Text(
                    'XXI Ambarukmo Plaza',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: accordionContent(
                    listDate: List.generate(
                      colorTimeSelected.length,
                      (index) => timeBox(
                        color: index == 0
                            ? EdspertColor.softBlack
                            : colorTimeSelected[index],
                        label: '16.00',
                        onTap: () {
                          _onSelectColor(index);
                        },
                      ),
                    ),
                  ),
                ),
                AccordionSection(
                  isOpen: true,
                  contentVerticalPadding: 20,
                  leftIcon: Image.asset(ImageDir.cinema2),
                  header: Text(
                    'Cinema XXI',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  content: accordionContent(
                    listDate: List.generate(
                      colorTimeSelected.length,
                      (index) => timeBox(
                        color: index == 0
                            ? EdspertColor.softBlack
                            : colorTimeSelected[index],
                        label: '16.00',
                        onTap: () {
                          _onSelectColor(index);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            EdspertButton().primary(
              text: 'Beli Tiket',
              onTap: () {
                EdspertNavigation().pushNamed(SelectSeatScreen.routeName,
                    arguments: {'movieModel': movieModel});
              },
            )
          ],
        ),
      ),
    );
  }
}

Widget accordionContent({
  required List<Widget> listDate,
}) {
  return Container(
    width: double.infinity,
    height: 124,
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.white.withOpacity(0.24),
      ),
      borderRadius: BorderRadius.circular(8),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Regular",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
            Text(
              "Rp. 50.000",
              style: GoogleFonts.openSans(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ],
        ),
        const SizedBox(height: 11),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: listDate,
        ),
      ],
    ),
  );
}

Widget timeBox({
  required Color color,
  required String label,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Text(
        label,
        style: GoogleFonts.openSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class DateContent extends StatefulWidget {
  const DateContent({
    super.key,
  });

  @override
  State<DateContent> createState() => _DateContentState();
}

class _DateContentState extends State<DateContent> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> items = [
    {'date': '21', 'day': 'Mon'},
    {'date': '22', 'day': 'Tue'},
    {'date': '23', 'day': 'Wed'},
    {'date': '24', 'day': 'thu'},
    {'date': '25', 'day': 'Fri'},
    {'date': '26', 'day': 'Sat'},
    {'date': '27', 'day': 'Sun'},
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1,
            color: Colors.white.withOpacity(0.25),
          ),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        controller: _scrollController,
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(
                () {
                  selectedIndex = index;
                  final double offset = selectedIndex * 120.0 -
                      MediaQuery.of(context).size.width / 2 +
                      50;
                  _scrollController.animateTo(
                    offset,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
              );
            },
            child: Container(
              width: 50,
              height: 80,
              margin: const EdgeInsets.all(5),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    items[index]['day']!,
                    style: GoogleFonts.ptSans(
                      fontSize: index == selectedIndex ? 17 : 11,
                      fontWeight: index == selectedIndex
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: index == selectedIndex
                          ? Colors.white
                          : EdspertColor.grey,
                    ),
                  ),
                  Text(
                    items[index]['date']!,
                    style: GoogleFonts.ptSans(
                      fontSize: index == selectedIndex ? 24 : 15,
                      fontWeight: index == selectedIndex
                          ? FontWeight.w700
                          : FontWeight.w400,
                      color: index == selectedIndex
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
