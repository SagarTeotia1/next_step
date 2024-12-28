import 'package:flutter/material.dart';
import 'package:next_step/Const/const_colo.dart';
import 'package:next_step/Const/const_img.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String userName = "Alex Smith";
  final String userEmail = "alex.smith@example.com";
  final String recoveryStatus = "Recovery Stage: Detox";
  final double recoveryProgress = 0.6;

  final List<Map<String, String>> recoveryAchievements = [
    {"title": "7 Days Sober", "date": "2024-12-20"},
    {"title": "Completed Group Session", "date": "2024-12-18"},
  ];

  final List<Map<String, String>> recoveryActivities = [
    {"action": "Meditation for 20 mins", "date": "2024-12-20"},
    {"action": "Track your mood", "date": "2024-12-19"},
  ];

  final List<Map<String, String>> recoveryGoals = [
    {"title": "Stay sober for 30 days", "date": "2024-12-01"},
    {"title": "Complete individual therapy", "date": "2024-12-05"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homeBg,
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF4B5945),
      //   elevation: 0,
      //   title: const Text("Profile", style: TextStyle(color: Colors.white)),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        child: Column(
          
          children: [
            SizedBox(height: 40,),
            _buildHeaderSection(),
            _buildProgressCard(),
            _buildSectionCard(
              title: "Recovery Achievements",
              items: recoveryAchievements,
              icon: Icons.emoji_events,
            ),
            _buildSectionCard(
              title: "Recovery Activities",
              items: recoveryActivities,
              icon: Icons.history,
            ),
            _buildSectionCard(
              title: "Recovery Goals",
              items: recoveryGoals,
              icon: Icons.flag,
            ),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: const BoxDecoration(
      color: Color(0xFF4B5945),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    ),
    child: Row(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: const AssetImage(logo),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                userEmail,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF66785F),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  recoveryStatus,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
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


  Widget _buildProgressCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF4B5945), Color(0xFFB2C9AD)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${(recoveryProgress * 100).toInt()}%",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Recovery Progress",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Keep up the great work!",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required List<Map<String, String>> items,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFB2C9AD), Color(0xFF66785F)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.white, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ...items.map(
              (item) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item["title"] ?? item["action"]!,
                        style: const TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    Text(
                      item["date"]!,
                      style: const TextStyle(fontSize: 14, color: Colors.white70),
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

  Widget _buildActionButtons() {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: ElevatedButton(
        onPressed: () {
          // Add logout functionality here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4B5945),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text(
          "Logout",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    ),
  );
}

}
