import 'package:flutter/material.dart';

void main() => runApp(const TicTacApp());

class TicTacApp extends StatelessWidget {
  const TicTacApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TIC TAC TOE",
      home: const TicTacGame(),
    );
  }
}

class TicTacGame extends StatefulWidget {
  const TicTacGame({super.key});

  @override
  State<TicTacGame> createState() => _TicTacGameState();
}

class _TicTacGameState extends State<TicTacGame> with SingleTickerProviderStateMixin {
  List<String> board = List.filled(9, '', growable: false);
  bool isXTurn = true;
  String gameResult = '';
  bool resetVisible = false; // Used for button animation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white10,
      appBar: AppBar(
        title: const Text(
          'TIC_TAC_TOE',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: gamePlan(),
    );
  }

  Widget gamePlan() {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            itemCount: 9,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => _handleTap(index: index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: board[index] == '' ? Colors.grey : Colors.black26,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    board[index],
                    style: const TextStyle(fontSize: 100, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                gameResult,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              AnimatedOpacity(
                opacity: resetVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 500),
                child: ElevatedButton(
                  onPressed: resetVisible ? _resetGame : null,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    backgroundColor: Colors.black,
                  ),
                  child: const Text(
                    "Reset Game",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _handleTap({required int index}) {
    if (board[index] == '' && gameResult == '') {
      setState(() {
        board[index] = isXTurn ? 'X' : 'O';
        isXTurn = !isXTurn;
        gameResult = _checkWinner();
        resetVisible = true;
      });
    }
  }

  String _checkWinner() {
    const winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == board[pattern[1]] &&
          board[pattern[1]] == board[pattern[2]] &&
          board[pattern[0]] != '') {
        return '${board[pattern[0]]} wins!';
      }
    }

    if (!board.contains('')) {
      return 'It\'s a Draw';
    }
    return '';
  }

  void _resetGame() {
    setState(() {
      board = List.filled(9, '', growable: false);
      gameResult = '';
      isXTurn = true;
      resetVisible = false;
    });
  }
}