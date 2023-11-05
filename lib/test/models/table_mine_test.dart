import 'package:flutter_test/flutter_test.dart';
import 'package:minefield/models/table_mine.dart';

main() {
  test('Ganhar o jogo', () {
    TableMine tableMine = TableMine(
      lines: 2,
      columns: 2,
      qntBombs: 0,
    );

    tableMine.fields[0].mine();
    tableMine.fields[3].mine();

    tableMine.fields[0].changeMarked();
    tableMine.fields[1].open();
    tableMine.fields[2].open();
    tableMine.fields[3].changeMarked();

    expect(tableMine.resolved, isTrue);
  });
}
