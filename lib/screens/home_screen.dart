import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lets_pray/globals.dart';
import 'package:lets_pray/tabs/doa_tab.dart';
import 'package:lets_pray/tabs/surah_tab.dart';
import 'package:lets_pray/tabs/tahlil_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        appBar: _appBar(),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) => [
                      SliverToBoxAdapter(
                        child: _greeting(),
                      ),
                      SliverAppBar(
                        pinned: true,
                        elevation: 0,
                        backgroundColor: background,
                        automaticallyImplyLeading: false,
                        shape: Border(
                            bottom: BorderSide(
                                width: 3,
                                color:
                                    const Color(0xffaaaaaa).withOpacity(.1))),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(0),
                          child: _tab(),
                        ),
                      )
                    ],
                body: const TabBarView(
                  children: [SurahTab(), MainPage()],
                )),
          ),
        ));
  }

  TabBar _tab() {
    return TabBar(
        unselectedLabelColor: text,
        labelColor: primary,
        indicatorColor: primary,
        tabs: [
          _tabItem(label: "Surat"),
          _tabItem(label: "Shalat"),
          
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Column _greeting() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          'Assalamualaikum',
          style: GoogleFonts.poppins(
            color: primary,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          'Akhi Ukhti',
          style: GoogleFonts.poppins(
              color: primary, fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 24,
        ),
        _lastRead()
      ],
    );
  }

  Stack _lastRead() {
    return Stack(
      children: [
        Container(
          height: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 94, 145, 223),
                    Color.fromARGB(255, 68, 104, 202),
                    Color.fromARGB(255, 29, 86, 172)
                  ])),
        ),
        Positioned(
            bottom: 0,
            right: 16,
            child: Image.asset(
              'assets/images/quran.png',
              scale: 1.1,
            )),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Text(
                'Selamat Membaca',
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: background,
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/svgs/ic_menu.svg')),
          Text(
            'LETS PRAY',
            style: GoogleFonts.poppins(
                color: primary, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 24,
          )
        ],
      ),
    );
  }
}