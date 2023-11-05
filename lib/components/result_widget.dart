import 'package:flutter/material.dart';

class ResultWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool? won;
  final Function()? onRestart;

  const ResultWidget({
    super.key,
    this.won,
    this.onRestart,
  });

  Color _getColor() {
    if (won == null) {
      return Colors.yellow;
    } else if (won == true) {
      return Colors.green[300]!;
    } else {
      return Colors.red[300]!;
    }
  }

  IconData _getIcon() {
    if (won == null) {
      return Icons.sentiment_satisfied;
    } else if (won == true) {
      return Icons.sentiment_very_satisfied;
    } else {
      return Icons.sentiment_very_dissatisfied;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withOpacity(0.5),
      child: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            backgroundColor: _getColor(),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              icon: Icon(
                _getIcon(),
                color: Colors.black,
                size: 35,
              ),
              onPressed: onRestart,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
