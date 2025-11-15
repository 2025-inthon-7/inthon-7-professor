import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TutorialDialog extends StatefulWidget {
  const TutorialDialog({Key? key}) : super(key: key);

  @override
  _TutorialDialogState createState() => _TutorialDialogState();
}

class _TutorialDialogState extends State<TutorialDialog> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_TutorialPage> _pages = [
    _TutorialPage(
      icon: Icons.person_off_outlined,
      title: '로그인 없이 바로 시작',
      description: '번거로운 회원가입이나 로그인 없이\n바로 수업을 시작할 수 있습니다.',
      color: Colors.blue,
    ),
    _TutorialPage(
      icon: Icons.event_note_outlined,
      title: '이벤트 기반 캡처',
      description: '모든 화면을 녹화하지 않습니다.\n질문이나 피드백이 있을 때만\n화면을 캡처합니다.',
      color: Colors.green,
    ),
    _TutorialPage(
      icon: Icons.chat_bubble_outline,
      title: '실시간 피드백',
      description: '어려운 내용이 있거나 질문이 있을 때\n학생들이 실시간으로\n피드백과 질문을 보낼 수 있습니다.',
      color: Colors.orange,
    ),
    _TutorialPage(
      icon: Icons.assessment_outlined,
      title: '나중에 정리하여 확인',
      description: '교수님은 수업 후\n학생들의 피드백과 질문을\n확인할 수 있습니다.',
      color: Colors.purple,
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _pages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  void _skip() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      child: Container(
        height: 500,
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // Close button
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: _skip,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),
            // PageView
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final page = _pages[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          color: page.color.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(page.icon, size: 60, color: page.color),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        page.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        page.description,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            // Page indicators
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _pages.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == index ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == index
                        ? _pages[_currentPage].color
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Buttons
            Row(
              children: [
                if (_currentPage < _pages.length - 1)
                  TextButton(onPressed: _skip, child: const Text('건너뛰기')),
                const Spacer(),
                ShadButton(
                  onPressed: _nextPage,

                  child: Text(_currentPage < _pages.length - 1 ? '다음' : '닫기'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _TutorialPage {
  final IconData icon;
  final String title;
  final String description;
  final Color color;

  _TutorialPage({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });
}
