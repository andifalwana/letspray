import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_pray/globals.dart';
import 'package:lets_pray/models/surah.dart';
import 'package:lets_pray/screens/detail_screen.dart';

class SurahTab extends StatelessWidget {
  const SurahTab({super.key});

  Future<List<Surah>> _getSurahList() async {
    String data = await rootBundle.loadString("assets/data/list_surah.json");
    return surahFromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Surah>>(
        future: _getSurahList(),
        builder: ((context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          }
          return ListView.separated(
              itemBuilder: (context, index) => _surahItem(
                  context: context, surah: snapshot.data!.elementAt(index)),
              separatorBuilder: (context, index) => Container(),
              itemCount: snapshot.data!.length);
        }));
  }


  Widget _surahItem({required Surah surah, required BuildContext context}) =>
      InkWell(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => DetailScreen(
                  noSurat: surah.nomor,
                ))),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Stack(
                  children: [
                    SvgPicture.asset('assets/svgs/ic_nosurah.svg'),
                    SizedBox(
                      height: 36,
                      width: 36,
                      child: Center(
                          child: Text(
                        "${surah.nomor}",
                        style: GoogleFonts.poppins(
                            color: primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      )),
                    )
                  ],
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      surah.namaLatin,
                      style: GoogleFonts.poppins(
                          color: primary, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Row( //dari
                      children: [
                        Text(surah.tempatTurun.name,
                            style: GoogleFonts.poppins(
                              color: text,
                              fontSize: 12,
                            )),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text('-'),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "${surah.jumlahAyat} Ayat",
                          style: GoogleFonts.poppins(
                              color: text,
                              fontWeight: FontWeight.w500,
                              fontSize: 12),
                        ),
                      ],
                    ) //sini
                  ],
                )),
                Text(surah.nama,
                    style: GoogleFonts.amiri(
                        color: primary,
                        fontSize: 20,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      );
}