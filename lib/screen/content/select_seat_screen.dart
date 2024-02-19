import 'package:edspert_final_project/core/navigation/edspert_navigation.dart';
import 'package:edspert_final_project/model/home/movie_model.dart';
import 'package:edspert_final_project/utils/edspert_color.dart';
import 'package:edspert_final_project/utils/image_dir.dart';
import 'package:edspert_final_project/utils/svg_dir.dart';
import 'package:edspert_final_project/utils/widgets/edspert_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectSeatScreen extends StatefulWidget {
  static const routeName = '/select-seat-screen';
  const SelectSeatScreen({super.key});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  List<List<String>> seats = List.generate(8, (row) {
    return List.generate(12, (col) {
      if ((col == 5 && row != 7) || (col == 6 && row != 7)) {
        return 'not_seat_cinema';
      } else {
        if (
            (col == 0 && row == 0) ||
            (col == 2 && row == 0) ||
            (col == 4 && row == 0) ||
            (col == 1 && row == 1) ||
            (col == 3 && row == 1) ||
            (col == 0 && row == 2) ||
            (col == 2 && row == 2) ||
            (col == 4 && row == 2) ||
            (col == 1 && row == 3) ||
            (col == 3 && row == 3) ||
            (col == 0 && row == 4) ||
            (col == 2 && row == 4) ||
            (col == 4 && row == 4) ||
            (col == 1 && row == 5) ||
            (col == 3 && row == 5) ||
            (col == 0 && row == 6) ||
            (col == 2 && row == 6) ||
            (col == 4 && row == 6) ||
            (col == 1 && row == 7) ||
            (col == 3 && row == 7)
            ) {
          return 'not available';
        } else {
          return 'available';
        }
      }
    });
  });
  final ScrollController _scrollController = ScrollController();
  List<String> selectedSeats = [];
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
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Image.asset(ImageDir.screenCinema),
                  ),
                  Text(
                    'LAYAR',
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Scrollbar(
              controller: _scrollController,
              interactive: true,
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int col = 0; col < seats[0].length; col++)
                      Column(
                        children: [
                          for (int row = 0; row < seats.length; row++)
                            GestureDetector(
                              onTap: () {
                                String rowAlphabet = String.fromCharCode(
                                    'A'.codeUnitAt(0) + row);
                                String seatStatus = seats[row][col];
                                if (seatStatus != 'not_seat_cinema') {
                                  setState(() {
                                    String seat = '$rowAlphabet${col + 1}';
                                    if (selectedSeats.contains(seat)) {
                                      selectedSeats.remove(seat);
                                    } else {
                                      if (selectedSeats.length > 4) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'Maksimum pembelian 5 tiket'),
                                            duration: Duration(seconds: 2),
                                            backgroundColor: Colors.red,
                                          ),
                                        );
                                      } else {
                                        if (seatStatus == 'available') {
                                          selectedSeats.add(seat);
                                        }
                                      }
                                    }
                                  });
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 31,
                                  height: 31,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                    color: seats[row][col] != 'not_seat_cinema'
                                        ? selectedSeats.contains(
                                                '${String.fromCharCode('A'.codeUnitAt(0) + row)}${col + 1}')
                                            ? EdspertColor.purple
                                            : seats[row][col] == 'not available'
                                                ? EdspertColor.softBlack
                                                : EdspertColor.darkGrey
                                        : Colors.transparent,
                                  ),
                                  child: Center(
                                    child: Text(
                                      '${String.fromCharCode('A'.codeUnitAt(0) + row)}${col + 1}',
                                      style: GoogleFonts.openSans(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            seats[row][col] == 'not_seat_cinema'
                                                ? Colors.transparent
                                                : Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          const SizedBox(height: 20),
                        ],
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 25,
                left: 25,
                top: 16,
                bottom: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusSeat(title: 'Tersedia', color: EdspertColor.darkGrey),
                  statusSeat(
                      title: 'Tidak Tersedia', color: EdspertColor.softBlack),
                  statusSeat(title: 'Dipilih', color: EdspertColor.purple),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: EdspertColor.secondaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 23,
                  vertical: 17,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgDir.building,
                          width: 16,
                          height: 16,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'CGV Pamulang Barat',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        descriptionCard(title: 'Jam', description: '16.00'),
                        descriptionCard(
                            title: 'Tanggal', description: '24 Juni'),
                        descriptionCard(title: 'Kelas', description: 'Reguler'),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${selectedSeats.length} Kursi terpilih',
                          style: GoogleFonts.openSans(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Row(
                          children: [
                            for (String seat in selectedSeats)
                              Text(
                                '$seat, ',
                                style: GoogleFonts.openSans(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.openSans(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'Rp.150,000',
                          style: GoogleFonts.openSans(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    EdspertButton().primary(
                      text: 'Beli Tiket',
                      onTap: () {},
                      margin: const EdgeInsets.all(0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget statusSeat({required String title, required Color color}) {
  return Row(
    children: [
      Container(
        width: 20,
        height: 20,
        color: color,
      ),
      const SizedBox(width: 5),
      Text(
        title,
        style: GoogleFonts.openSans(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white.withOpacity(0.6),
        ),
      ),
    ],
  );
}

Widget descriptionCard({
  required String title,
  required String description,
}) {
  return Container(
    alignment: Alignment.center,
    width: 98,
    height: 52,
    decoration: BoxDecoration(
      border: Border.all(
        width: 1,
        color: Colors.white.withOpacity(0.15),
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          title,
          style: GoogleFonts.openSans(
            color: Colors.white.withOpacity(0.4),
            fontSize: 13,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          description,
          style: GoogleFonts.openSans(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
