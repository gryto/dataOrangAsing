import 'package:data_orang_asing/screen/monitory/page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../src/constant.dart';
import 'biodata.dart';

// ignore: must_be_immutable
class DetailKtpPage extends StatefulWidget {
  String name,
      nik,
      dateBirth,
      placeBirth,
      gender,
      religion,
      status,
      work,
      nationality,
      statusInFamily,
      mothersNik,
      mothersName;
  DetailKtpPage(
      {super.key,
      required this.name,
      required this.nik,
      required this.dateBirth,
      required this.placeBirth,
      required this.gender,
      required this.religion,
      required this.status,
      required this.work,
      required this.nationality,
      required this.statusInFamily,
      required this.mothersNik,
      required this.mothersName});

  @override
  State<DetailKtpPage> createState() => _DetailKtpPageState();
}

class _DetailKtpPageState extends State<DetailKtpPage>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  int selectedIndex = 0;


  @override
  void initState() {
    controller = TabController(vsync: this, length: 7);
    setState(() {});

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: clrPrimary,
        foregroundColor: Colors.white,
        title: const Text(
          "Rincian Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: bidangTabBar(),
    );
  }

  Widget bidangTabBar() {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          labelColor: clrPrimary,
          indicatorColor: clrSecondary,
          unselectedLabelColor: clrBackground,
          tabs: const <Tab>[
            Tab(text: 'Biodata'),
            Tab(text: 'Imigrasi'),
            Tab(text: 'Perkara'),
            Tab(text: 'Kunjungan'),
            Tab(text: 'Kepegawaian'),
            Tab(text: 'Pertahanan'),
            Tab(text: 'Kendaraan'),
          ],
          controller: controller,
          onTap: (int index) {
            setState(() {
              selectedIndex = index;
              controller.animateTo(index);
            });
          },
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              SingleChildScrollView(
                child: BiodataPage(
                  name: widget.name,
                  nik: widget.nik,
                  dateBirth: widget.dateBirth,
                  placeBirth: widget.placeBirth,
                  gender: widget.gender,
                  religion: widget.religion,
                  status: widget.status,
                  work: widget.work,
                  nationality: widget.nationality,
                  statusInFamily: widget.statusInFamily,
                  mothersNik: widget.mothersNik,
                  mothersName: widget.mothersName,
                ),
              ),
              MonitoryPage(),
              MonitoryPage(),
              MonitoryPage(),
              MonitoryPage(),
              MonitoryPage(),
              MonitoryPage(),
            ],
          ),
        ),
      ],
    );
  }
}
