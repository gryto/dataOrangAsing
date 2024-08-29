import 'package:data_orang_asing/src/constant.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: clrPrimary,
        foregroundColor: Colors.white,
        title: const Text(
          "Daftar Probabilitas",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.asset('assets/icons/help.png'),
            title: const Text("3201135011760004"),
            subtitle: const Text(
              "Skor: 7.8",
              style: TextStyle(color: Colors.green),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: clrSecondary,
              size: 20,
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icons/help.png'),
            title: const Text("3201135011760004"),
            subtitle: const Text(
              "Skor: 7.33",
              style: TextStyle(color: Colors.green),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: clrSecondary,
              size: 20,
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icons/help.png'),
            title: const Text("3201135011760004"),
            subtitle: const Text(
              "Skor: 7.20",
              style: TextStyle(color: Colors.green),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: clrSecondary,
              size: 20,
            ),
          ),
          ListTile(
            leading: Image.asset('assets/icons/help.png'),
            title: const Text("3201135011760004"),
            subtitle: const Text(
              "Skor: 6.81",
              style: TextStyle(color: Colors.orange),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              color: clrSecondary,
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
