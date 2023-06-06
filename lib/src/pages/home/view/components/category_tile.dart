import 'package:flutter/material.dart';

import '../../../../config/custom_colors.dart';

class CategoryTile extends StatelessWidget {
  //const Categorytile({super.key});
  const CategoryTile({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        /** 
         * quando clicamos e seguramos o btn em alguma categoria da listagem
         * ele ficar redondinho como o borderRadius no nosso InkWell  
         * */
        borderRadius: BorderRadius.circular(20),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 3,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color:
                  isSelected ? Colors.white : CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
