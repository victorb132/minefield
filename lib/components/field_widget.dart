import 'package:flutter/material.dart';
import 'package:minefield/models/field.dart';

class FieldWidget extends StatelessWidget {
  final Field field;
  final void Function(Field) onOpen;
  final void Function(Field) onChangeMarked;

  const FieldWidget({
    super.key,
    required this.field,
    required this.onOpen,
    required this.onChangeMarked,
  });

  Widget _getImage() {
    if (field.opened && field.mined && field.exploded) {
      return Image.asset('assets/images/bomba_0.jpeg');
    } else if (field.opened && field.mined) {
      return Image.asset('assets/images/bomba_1.jpeg');
    } else if (field.opened) {
      return Image.asset('assets/images/aberto_${field.quantityMines}.jpeg');
    } else if (field.marked) {
      return Image.asset('assets/images/bandeira.jpeg');
    } else {
      return Image.asset('assets/images/fechado.jpeg');
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpen(field),
      onLongPress: () => onChangeMarked(field),
      child: _getImage(),
    );
  }
}
