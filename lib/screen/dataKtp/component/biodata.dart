import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import '../../../gen/assets.gen.dart';
import '../../../src/constant.dart';
import '../../../src/utils.dart';

// ignore: must_be_immutable
class BiodataPage extends StatefulWidget {
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
  BiodataPage(
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
  State<BiodataPage> createState() => _BiodataPageState();
}

class _BiodataPageState extends State<BiodataPage> {
  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                shadowColor: Colors.white,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 105,
                          height: 105,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Assets.images.user3.path),
                                fit: BoxFit.fill),
                            borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.rectangle,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              height: 1.2575,
                              letterSpacing: 1,
                            ),
                          ),
                          Text(
                            widget.nik,
                            style: SafeGoogleFont(
                              'SF Pro Text',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              height: 1.2575,
                              letterSpacing: 1,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.square,
                                  borderRadius: BorderRadius.circular(5),
                                  badgeColor: clrSecondary,
                                ),
                                position: badges.BadgePosition.custom(
                                    start: 10, top: 10),
                                badgeContent: const Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.location_on,
                                      size: 20,
                                    )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.nationality,
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  Text(
                                    widget.dateBirth,
                                    style: SafeGoogleFont(
                                      'SF Pro Text',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.2575,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              badges.Badge(
                                badgeStyle: badges.BadgeStyle(
                                  shape: badges.BadgeShape.square,
                                  borderRadius: BorderRadius.circular(5),
                                  badgeColor: clrSecondary,
                                ),
                                position: badges.BadgePosition.custom(
                                    start: 10, top: 10),
                                badgeContent: const Padding(
                                    padding: EdgeInsets.all(2),
                                    child: Icon(
                                      Icons.star,
                                      size: 20,
                                    )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                widget.gender,
                                style: SafeGoogleFont(
                                  'SF Pro Text',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.2575,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Card(
              //   shadowColor: Colors.white,
              //   color: Colors.white,
              //   child:

              Column(
                children: [
                  ListTile(
                    title: Text(
                      "Agama",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.religion,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Status Perkawinan",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.status,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Pekerjaan",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.work,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Kewarganegaraan",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.nationality,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Status dalam keluarga",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.statusInFamily,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "NIK Ibu",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.mothersNik,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(
                      "Nama Ibu Kandung",
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                    subtitle: Text(
                      widget.mothersName,
                      style: SafeGoogleFont(
                        'SF Pro Text',
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        height: 1.2575,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ],
              ),
              // )
            ],
          ),
        ),
      );
  }
}
