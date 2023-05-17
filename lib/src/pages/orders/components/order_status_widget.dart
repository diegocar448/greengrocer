import 'package:flutter/material.dart';
import 'package:greengrocer/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  // const OrderStatusWidget({super.key});
  const OrderStatusWidget({
    Key? key,
    required this.isOverdue,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _StatusDot(isActive: true, title: "Teste de pagamento"),
        _StatusDot(isActive: false, title: "Pagamento efetuado"),
      ],
    );
  }
}

//Aqui temos o nosso checked true ou false
class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;
  const _StatusDot({
    Key? key,
    required this.isActive,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      // Dot
      Container(
        alignment: Alignment.center,
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: CustomColors.customSwatchColor,
          ),
          color: isActive ? CustomColors.customSwatchColor : Colors.transparent,
        ),
        child: isActive
            ? const Icon(
                Icons.check,
                size: 13,
                color: Colors.white,
              )
            : const SizedBox.shrink(),
      ),

      const SizedBox(width: 5),

      // Texto
      /** Expanded faz a quebra de linha evitando um overflow */
      Expanded(
        child: Text(title),
      ),
    ]);
  }
}
