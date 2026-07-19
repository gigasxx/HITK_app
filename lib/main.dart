import 'dart:ui';
import 'package:flutter/material.dart';

void main() {
  runApp(const HeritageHubApp());
}

class HeritageHubApp extends StatelessWidget {
  const HeritageHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HIT Portal',
      theme: ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: const Color(0xFFF1F5F9),
        useMaterial3: true,
      ),
      home: const MainNavigationScreen(),
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const ProfilePage(),
    const ResultsPage(),
    const AttendancePage(),
    const LabAndAssignmentHub(),
    const NoticesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -50,
            left: -50,
            child: Container(
              width: 320,
              height: 320,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF2563EB).withOpacity(0.25),
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            right: -100,
            child: Container(
              width: 380,
              height: 380,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF34D399).withOpacity(0.2),
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: -100,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF8B5CF6).withOpacity(0.2),
              ),
            ),
          ),
          SafeArea(child: _pages[_currentIndex]),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          border: Border(top: BorderSide(color: Colors.white.withOpacity(0.6), width: 1.5)),
        ),
        child: ClipRRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withOpacity(0.4),
              selectedItemColor: const Color(0xFF1E40AF),
              unselectedItemColor: const Color(0xFF64748B),
              selectedFontSize: 11,
              unselectedFontSize: 11,
              elevation: 0,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.person_outline_rounded), activeIcon: Icon(Icons.person_rounded), label: 'Profile'),
                BottomNavigationBarItem(icon: Icon(Icons.analytics_outlined), activeIcon: Icon(Icons.analytics_rounded), label: 'Results'),
                BottomNavigationBarItem(icon: Icon(Icons.pie_chart_outline_rounded), activeIcon: Icon(Icons.pie_chart_rounded), label: 'Attendance'),
                BottomNavigationBarItem(icon: Icon(Icons.folder_open_outlined), activeIcon: Icon(Icons.folder_rounded), label: 'Lab & Tasks'),
                BottomNavigationBarItem(icon: Icon(Icons.campaign_outlined), activeIcon: Icon(Icons.campaign_rounded), label: 'Notices'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LiquidGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double borderRadius;

  const LiquidGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withOpacity(0.04),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            padding: padding ?? const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.65),
              borderRadius: BorderRadius.circular(borderRadius),
              border: Border.all(color: Colors.white.withOpacity(0.8), width: 1.5),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white.withOpacity(0.75), Colors.white.withOpacity(0.4)],
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _showLibraryCard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => const SizedBox(
        height: 650,
        child: LibraryCardBottomSheet(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const Text(
          'HERITAGE INSTITUTE OF TECHNOLOGY',
          style: TextStyle(fontSize: 11, color: Color(0xFF1E40AF), fontWeight: FontWeight.bold, letterSpacing: 2.0),
        ),
        const SizedBox(height: 4),
        const Text('Student Profile', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 20),
        LiquidGlassCard(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 112,
                    height: 112,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(colors: [Color(0xFF2563EB), Color(0xFF8B5CF6)]),
                    ),
                  ),
                  const CircleAvatar(
                    radius: 52,
                    backgroundColor: Color(0xFFF1F5F9),
                    child: Icon(Icons.person_rounded, size: 60, color: Color(0xFF1E40AF)),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Suvam Bagui', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF3B82F6).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Text(
                  'Information Technology',
                  style: TextStyle(color: Color(0xFF1D4ED8), fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: () => _showLibraryCard(context),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [Color(0xFF1E40AF), Color(0xFF2563EB)]),
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(color: const Color(0xFF1E40AF).withOpacity(0.25), blurRadius: 16, offset: const Offset(0, 8))
              ],
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.white.withOpacity(0.15), shape: BoxShape.circle),
                  child: const Icon(Icons.local_library_rounded, color: Colors.white, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Digital Library', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text('Library Card, Books, PYQs', style: TextStyle(color: Colors.white70, fontSize: 12)),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_forward_ios_rounded, color: Colors.white, size: 16),
              ],
            ),
          ),
        ),

        LiquidGlassCard(
          child: Column(
            children: [
              _buildProfileItem(Icons.badge_outlined, 'Roll Number', '2454080'),
              const Divider(color: Colors.black12, height: 24),
              _buildProfileItem(Icons.badge_outlined, 'Exam Roll Number', '12625002081'),
              const Divider(color: Colors.black12, height: 24),
              _buildProfileItem(Icons.badge_outlined, 'Registration Number', '251260121262'),
              const Divider(color: Colors.black12, height: 24),
              _buildProfileItem(Icons.calendar_month_outlined, 'Current Phase', '3rd Year 5th Semester'),
              const Divider(color: Colors.black12, height: 24),
              _buildProfileItem(Icons.alternate_email_rounded, 'Email', 'suvam.bagui.it28@heritageit.edu.in'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProfileItem(IconData icon, String label, String value) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(color: const Color(0xFF1E40AF).withOpacity(0.08), shape: BoxShape.circle),
          child: Icon(icon, color: const Color(0xFF1E40AF), size: 22),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
              const SizedBox(height: 2),
              Text(value, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
            ],
          ),
        )
      ],
    );
  }
}

// ================= LOCKER BOTTTOM SHEET: SCANNABLE PASS, BOOKS & PYQ VAULT =================
class LibraryCardBottomSheet extends StatelessWidget {
  const LibraryCardBottomSheet({super.key});

  void _triggerPdfMockDownload(BuildContext context, String subject, String year) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Downloading $subject ($year) PYQ Document...'),
        backgroundColor: const Color(0xFF1E40AF),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFF8FAFC),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(width: 40, height: 5, decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10))),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('HIT Library & Resources', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                    IconButton(icon: const Icon(Icons.close_rounded), onPressed: () => Navigator.pop(context)),
                  ],
                ),
              ),
              const TabBar(
                labelColor: Color(0xFF1E40AF),
                unselectedLabelColor: Color(0xFF64748B),
                indicatorColor: Color(0xFF1E40AF),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(text: 'My Account & Pass'),
                  Tab(text: 'PYQ Repository'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    // TAB 1: CARD PASS & RESERVES
                    ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(colors: [Color(0xFF0F172A), Color(0xFF1E293B)]),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Text('DIGITAL LIBRARY CARD', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1)),
                                  Text('HITK', style: TextStyle(color: Color(0xFF38BDF8), fontSize: 12, fontWeight: FontWeight.bold)),
                                ],
                              ),
                              const SizedBox(height: 25),
                              Container(
                                height: 50,
                                width: double.infinity,
                                color: Colors.white,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: List.generate(28, (index) => Container(width: (index % 3 == 0) ? 4 : 2, color: Colors.black)),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text('2   4   5   4   0   8   0', style: TextStyle(color: Colors.white54, fontSize: 12, letterSpacing: 4)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),
                        const Text('Active Book Reserves', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                        const SizedBox(height: 10),
                        _buildBookItem('Formal Language & Automata Theory', 'C.K. Nagpal', 'Due in 120 Days', Colors.green),
                        _buildBookItem('Pattern Recognization 4th Ed.', 'Theodorids, Kourtombus', 'Due in 120 Days', Colors.green),
                      ],
                    ),

                    // TAB 2: PYQ SYSTEM ARCHITECTURE LOCKER
                    ListView(
                      padding: const EdgeInsets.all(24),
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          decoration: BoxDecoration(color: Colors.black.withOpacity(0.04), borderRadius: BorderRadius.circular(12)),
                          child: const TextField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.search, color: Color(0xFF1E40AF)),
                              hintText: 'Search semester questions...',
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 14),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text('Semester 5 PYQs (2023 - 2025)', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF475569))),
                        const SizedBox(height: 8),
                        _buildPyqItem(context, 'Advanced Java & Web Technologies', 'INF3101', 'File Size: 2.4 MB'),
                        _buildPyqItem(context, 'Fundamentals of AIML', 'INF3102', 'File Size: 1.8 MB'),
                        _buildPyqItem(context, 'Operating Systems', 'INF3103', 'File Size: 3.1 MB'),
                        _buildPyqItem(context, 'Formal Language & Automata Theory', 'INF3104', 'File Size: 2.9 MB'),
                        _buildPyqItem(context, 'Fundamentals of Cyber Security', 'INF2133', 'File Size: 3.5 MB'),
                        _buildPyqItem(context, 'Indian Constitution & Civil Society', 'INC3016', 'File Size: 2.4 MB'),
                        _buildPyqItem(context, 'Digital Image Processing', 'ECE3121', 'File Size: 1.8 MB'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBookItem(String title, String author, String status, Color statusColor) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: Colors.black.withOpacity(0.03), borderRadius: BorderRadius.circular(16)),
      child: Row(
        children: [
          const Icon(Icons.book_rounded, color: Color(0xFF1E40AF)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text(author, style: const TextStyle(color: Colors.grey, fontSize: 12)),
              ],
            ),
          ),
          Text(status, style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildPyqItem(BuildContext context, String subject, String year, String sizeInfo) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: const Color(0xFFEF4444).withOpacity(0.08), borderRadius: BorderRadius.circular(12)),
            child: const Icon(Icons.picture_as_pdf_rounded, color: Color(0xFFDC2626), size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(subject, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF1E293B))),
                const SizedBox(height: 2),
                Text('$year    $sizeInfo', style: const TextStyle(color: Colors.grey, fontSize: 11)),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.file_download_outlined, color: Color(0xFF1E40AF)),
            onPressed: () => _triggerPdfMockDownload(context, subject, year),
          )
        ],
      ),
    );
  }
}

class LabAndAssignmentHub extends StatelessWidget {
  const LabAndAssignmentHub({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Course & Lab Hub', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          bottom: const TabBar(
            labelColor: Color(0xFF1E40AF),
            unselectedLabelColor: Color(0xFF64748B),
            indicatorColor: Color(0xFF1E40AF),
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
            tabs: [Tab(text: 'Assignments'), Tab(text: 'Lab Records')],
          ),
        ),
        body: const TabBarView(
          children: [
            AssignmentsTabContent(),
            LabRecordsTabContent(),
          ],
        ),
      ),
    );
  }
}

class AssignmentsTabContent extends StatelessWidget {
  const AssignmentsTabContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildAssignmentItem('CPU Scheduling & Process', 'Operating Systems', 'Tomorrow, 11:59 PM', true),
        _buildAssignmentItem('Finite State Machine', 'Formal Language & Automata Theory', 'July 26, 2026', false),
        _buildAssignmentItem('Pixel-Point Processing', 'Digital Image Processing', 'Completed', false, isDone: true),
      ],
    );
  }

  Widget _buildAssignmentItem(String title, String course, String deadline, bool urgent, {bool isDone = false}) {
    return LiquidGlassCard(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDone ? const Color(0xFF10B981).withOpacity(0.1) : (urgent ? const Color(0xFFEF4444).withOpacity(0.1) : const Color(0xFF3B82F6).withOpacity(0.1)),
              shape: BoxShape.circle,
            ),
            child: Icon(
              isDone ? Icons.check_circle_rounded : Icons.assignment_rounded,
              color: isDone ? const Color(0xFF059669) : (urgent ? const Color(0xFFDC2626) : const Color(0xFF2563EB)),
              size: 22,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    decoration: isDone ? TextDecoration.lineThrough : null,
                    color: isDone ? const Color(0xFF94A3B8) : const Color(0xFF1E293B),
                  ),
                ),
                const SizedBox(height: 2),
                Text(course, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13, fontWeight: FontWeight.w500)),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: isDone ? const Color(0xFF10B981).withOpacity(0.08) : (urgent ? const Color(0xFFEF4444).withOpacity(0.08) : Colors.black.withOpacity(0.03)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    isDone ? 'Submitted Successfully' : 'Deadline: $deadline',
                    style: TextStyle(
                      fontSize: 11,
                      color: isDone ? const Color(0xFF059669) : (urgent ? const Color(0xFFDC2626) : const Color(0xFF475569)),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LabRecordsTabContent extends StatelessWidget {
  const LabRecordsTabContent({super.key});

  void _showSnippetPopup(BuildContext context, String title, String code) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFFF8FAFC),
        content: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(12)),
          child: SingleChildScrollView(
            child: Text(
              code,
              style: const TextStyle(fontFamily: 'monospace', color: Color(0xFF38BDF8), fontSize: 13),
            ),
          ),
        ),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildLabFileItem(
          context,
          'Lab 4: Signal Interface & Handling',
          'Operating Systems Laboratory',
          'Status: Code Verified',
          true,
          '',
        ),
        _buildLabFileItem(
          context,
          'Lab 3: NumPy & Matplotlib',
          'Machine Learning Laboratory',
          'Status: Record Printed',
          true,
          '',
        ),
        _buildLabFileItem(
          context,
          'Lab 5: Asynchronous JavaScript',
          'Advanced Java Laboratory',
          'Status: Pending Compilation',
          false,
          '',
        ),
      ],
    );
  }

  Widget _buildLabFileItem(BuildContext context, String title, String course, String status, bool checked, String snippet) {
    return LiquidGlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(checked ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: checked ? const Color(0xFF10B981) : Colors.grey),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 36.0),
            child: Text(course, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: checked ? const Color(0xFF059669) : Colors.orange)),
              ),
              ElevatedButton.icon(
                onPressed: () => _showSnippetPopup(context, title, snippet),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E40AF).withOpacity(0.08),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.code_rounded, size: 16, color: Color(0xFF1E40AF)),
                label: const Text('View Snippet', style: TextStyle(fontSize: 12, color: Color(0xFF1E40AF), fontWeight: FontWeight.bold)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const Text('Academic Metrics', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: LiquidGlassCard(
                child: Column(
                  children: const [
                    Text('9.12', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF2563EB))),
                    SizedBox(height: 4),
                    Text('Last SGPA', style: TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: LiquidGlassCard(
                child: Column(
                  children: const [
                    Text('8.96', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF7C3AED))),
                    SizedBox(height: 4),
                    Text('Overall CGPA', style: TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text('Semester Breakdown', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 8),
        LiquidGlassCard(
          child: Column(
            children: [
              _buildSemesterRow('Semester 4', '9.12 SGPA'),
              const Divider(color: Colors.black12, height: 20),
              _buildSemesterRow('Semester 3', '8.85 SGPA'),
              const Divider(color: Colors.black12, height: 20),
              _buildSemesterRow('Semester 2', '8.98 SGPA'),
              const Divider(color: Colors.black12, height: 20),
              _buildSemesterRow('Semester 1', '8.90 SGPA'),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildSemesterRow(String sem, String sgpa) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(sem, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF334155))),
        Row(
          children: [
            Text(sgpa, style: const TextStyle(color: Color(0xFF1E40AF), fontWeight: FontWeight.w600)),
            const SizedBox(width: 12),
            const Icon(Icons.check_circle_rounded, color: Color(0xFF10B981), size: 20),
          ],
        )
      ],
    );
  }
}

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const Text('Attendance Tracker', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 16),
        LiquidGlassCard(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 140,
                    height: 140,
                    child: CircularProgressIndicator(
                      value: 0.82,
                      strokeWidth: 12,
                      color: const Color(0xFF2563EB),
                      backgroundColor: const Color(0xFF2563EB).withOpacity(0.1),
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text('82%', style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                      Text('Aggregate', style: TextStyle(color: Color(0xFF64748B), fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.gpp_good_rounded, color: Color(0xFF059669), size: 18),
                    SizedBox(width: 6),
                    Text('Safe Zone', style: TextStyle(color: Color(0xFF059669), fontSize: 13, fontWeight: FontWeight.bold)),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Text('Subject Overview', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 8),
        _buildAttendanceCard('Advanced Java & Web Technology', '28/32 Lectures', 0.87, const Color(0xFF10B981)),
        _buildAttendanceCard('Fundamentals of AIML', '22/30 Lectures', 0.73, const Color(0xFFF59E0B)),
        _buildAttendanceCard('Operating Systems', '34/36 Lectures', 0.94, const Color(0xFF10B981)),
        _buildAttendanceCard('Formal Language & Automata Theory', '12/14 Labs', 0.85, const Color(0xFF10B981)),
        _buildAttendanceCard('Fundamentals of Cyber Security', '28/32 Lectures', 0.83, const Color(0xFF10B981)),
        _buildAttendanceCard('Indian Constitution & Civil Society', '22/30 Lectures', 0.69, const Color(0xFFF59E0B)),
        _buildAttendanceCard('Digital Image Processing', '34/36 Lectures', 0.94, const Color(0xFF10B981)),
        _buildAttendanceCard('Advanced Java Laboratory', '12/14 Labs', 0.90, const Color(0xFF10B981)),
        _buildAttendanceCard('Machine Learning Laboratory', '28/32 Lectures', 0.98, const Color(0xFF10B981)),
        _buildAttendanceCard('Operating Systems Laboratory', '22/30 Lectures', 0.77, const Color(0xFFF59E0B)),
      ],
    );
  }

  Widget _buildAttendanceCard(String subject, String metric, double percent, Color indicatorColor) {
    return LiquidGlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text(subject, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)))),
              Text('${(percent * 100).toInt()}%', style: TextStyle(color: indicatorColor == const Color(0xFFF59E0B) ? const Color(0xFFD97706) : const Color(0xFF059669), fontWeight: FontWeight.bold, fontSize: 16)),
            ],
          ),
          const SizedBox(height: 4),
          Text(metric, style: const TextStyle(fontSize: 12, color: Color(0xFF64748B), fontWeight: FontWeight.w500)),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: LinearProgressIndicator(
              value: percent,
              minHeight: 6,
              color: indicatorColor,
              backgroundColor: indicatorColor.withOpacity(0.15),
            ),
          )
        ],
      ),
    );
  }
}

class NoticesPage extends StatelessWidget {
  const NoticesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      children: [
        const Text('Official Notices', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        const SizedBox(height: 16),
        _buildNoticeCard(
          'Odd Semester Examinations 2026 Registration',
          'Office of the Controller of Examinations',
          '2 hours ago',
          'All students must complete the online form fill-up protocols using their specific department IDs before the hard stop threshold.',
        ),
        _buildNoticeCard(
          'Odd Semester Course Mapping Directives',
          'Academic Administration Desk',
          '1 day ago',
          'The curriculum schema for the upcoming semester has been released. Track elective assignment pathways directly on your departmental dashboard.',
        ),
        _buildNoticeCard(
          'National Chess Tournament Enrollment Open',
          'HIT Sports Council',
          '3 days ago',
          'Registration pathways are now open for the annual inter-college chess tournament "Checkmate". Submit entry details to the campus sports council panel.',
        ),
      ],
    );
  }

  Widget _buildNoticeCard(String title, String authority, String time, String body) {
    return LiquidGlassCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(color: const Color(0xFF1E40AF).withOpacity(0.08), borderRadius: BorderRadius.circular(6)),
                child: Text(
                  authority.toUpperCase(),
                  style: const TextStyle(fontSize: 9, color: Color(0xFF1E40AF), fontWeight: FontWeight.bold, letterSpacing: 0.5),
                ),
              ),
              Text(time, style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
          const SizedBox(height: 8),
          Text(body, style: const TextStyle(fontSize: 13, color: Color(0xFF475569), height: 1.5)),
        ],
      ),
    );
  }
}