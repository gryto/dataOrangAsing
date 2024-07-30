import 'dart:convert';
import 'package:flutter/material.dart';
import '../../src/api.dart';
import '../../src/constant.dart';
import '../../src/custom_button_ptimary.dart';
import '../../src/loader.dart';
import '../../src/preference.dart';
import '../../src/utils.dart';
import 'package:http/http.dart' as http;
import 'component/detail.dart';

class KtpPage extends StatefulWidget {
  const KtpPage({super.key});

  @override
  State<KtpPage> createState() => _KtpPageState();
}

class _KtpPageState extends State<KtpPage> {
  SharedPref sharedPref = SharedPref();
  final _formKey = GlobalKey<FormState>();
  String message = "";
  bool isProcess = true;
  List listData = [];
  final fieldKeyword = TextEditingController();
  String search = "";

  final ctrlTanggal = TextEditingController();
  final List<FocusNode> _focusNodes = [
    FocusNode(),
  ];

  @override
  void initState() {
    setState(() {});
    checkSession();

    super.initState();
  }

  searchData(nik) {
    setState(() {
      isProcess = true;

      search = nik;

      listData = [];
    });

    getData(search);
  }

  void checkSession() async {
    getData(search);
  }

  getData(nik) async {
    try {
      final params = {
        'nik': nik,
      };
      var accessToken = await sharedPref.getPref("access_token");
      var url = Uri.parse(ApiService.listForeigner);
      var uri = url;
      final newURI = uri.replace(queryParameters: params);
      var bearerToken = 'Bearer $accessToken';
      var response = await http.get(
        newURI,
        headers: {
          "Authorization": bearerToken.toString(),
        },
      );

      // var content = json.decode(response.body);

      if (response.statusCode == 200) {
        var content = json.decode(response.body);
        print("datanya");
        listData = content['data'];
        print(listData);
      } else {
        // ignore: use_build_context_synchronously
        // onBasicAlertPressed(context, 'Error', content['message']);
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      // onBasicAlertPressed(context, 'Error', e.toString());
      // toastShort(context, e.toString());
    }

    setState(() {
      isProcess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final txtTanggal = Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              focusNode: _focusNodes[0],
              controller: fieldKeyword,
              maxLines: 1,
              decoration: InputDecoration(
                hoverColor: clrPrimary,
                labelText: 'Cari Username',
                hintText: 'Masukkan username pencarian',
                focusColor: clrPrimary,
                labelStyle: const TextStyle(color: Colors.grey),
                focusedBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                filled: true,
                fillColor: Colors.white24,
                border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.search,
                  color: _focusNodes[0].hasFocus ? clrPrimary : Colors.grey,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Masukkan Username Terlebih Dahulu!';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: clrPrimary,
        title: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            'Data Orang Asing',
            style: SafeGoogleFont(
              'SF Pro Text',
              fontSize: 20,
              fontWeight: FontWeight.w600,
              height: 1.2575,
              letterSpacing: 1,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: !isProcess ? bidangTabBar() : loaderDialog(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (BuildContext context) {
              return BottomSheet(
                enableDrag: false,
                onClosing: () {},
                builder: (BuildContext context) {
                  return StatefulBuilder(
                    builder: (BuildContext context, setState) => SafeArea(
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.remove,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "Masukka Data NIK orang asing",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      txtTanggal,
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        child: CustomButtonPrimary(
                                          text: 'Pencarian',
                                          onTap: () async {
                                            if (_formKey.currentState
                                                    ?.validate() ??
                                                false) {
                                              Navigator.pop(context);
                                              searchData(
                                                fieldKeyword.text,
                                              );
                                              print('Form is valid.');
                                            } else {
                                              print('Form is invalid.');
                                            }
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
        backgroundColor: clrPrimary,
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget bidangTabBar() {
    if (listData.isNotEmpty) {
      return ListView.separated(
        padding:
            const EdgeInsets.only(bottom: 5, top: 5, left: 5.0, right: 5.0),
        primary: false,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          var row = listData[index];
          print("lisdtdataforeigner");
          print(row);

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailKtpPage(
                    name: row['nama'].toString(),
                    nik: row['no_identitas'].toString(),
                    dateBirth: row['tanggal_lahir'].toString(),
                    placeBirth: row['tempat_lahir'].toString(),
                    gender: row['jenis_kelamin'].toString(),
                    religion: row['agama'].toString(),
                    status: row['status_perkawinan'].toString(),
                    work: row['pekerjaan'].toString(),
                    nationality: row['kewarganegaraan'].toString(),
                    statusInFamily: row['no_identitas_ibu'].toString(),
                    mothersNik: row['no_identitas_ibu'].toString(),
                    mothersName: row['nama_ibu'].toString(),
                  ),
                ),
              );
            },
            child: ListTile(
              leading: Image.asset('assets/icons/report.png'),
              title: Text(row['no_identitas'].toString()),
              subtitle: Text(
                row['nama'].toString(),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                color: clrSecondary,
                size: 20,
              ),
            ),
          );
        },
        separatorBuilder: (_, index) => const SizedBox(
          height: 5,
        ),
        itemCount: listData.isEmpty ? 0 : listData.length,
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_clock,
                  size: 90.0,
                  color: Colors.grey.shade400,
                ),
                Text(
                  "Ooops, NIK Yang Kamu Cari Tidak Ada Data, Silahkan Input Ulang NIK Yang Ingin Dicari!",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        ],
      );
    }
  }
}
