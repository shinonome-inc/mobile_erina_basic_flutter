import 'package:flutter/material.dart';
import 'package:qiita_app/constants/app_colors.dart';

class TopPage extends StatelessWidget {
  const TopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildOverlay(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/background.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildOverlay() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.black.withOpacity(0.2),
    );
  }

  Widget _buildContent() {
    return Container(
      padding: const EdgeInsets.all(24.0),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          const SizedBox(
            height: 220,
          ),
          const Text(
            'Qiita Feed App',
            style: TextStyle(
              fontSize: 36,
              color: Colors.white,
              fontFamily: 'Pacifico',
            ),
          ),
          const SizedBox(),
          const Text(
            '-PlayGround-',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          _buildLoginButton(),
          const SizedBox(
            height: 16,
          ),
          _buildGuestButton(),
          const SizedBox(
            height: 64,
          ),
        ],
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // ログインボタンが押された時の処理
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: const Text(
          'ログイン',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildGuestButton() {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () {
          // ゲストログインボタンが押された時の処理
        },
        child: const Text(
          'ログインせずに利用する',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
