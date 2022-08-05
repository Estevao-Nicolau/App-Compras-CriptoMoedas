import 'package:conta_cripto/src/config/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
String selectedCategory = 'Moedas';

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return CategoryTiles(
                  onPressed: () {
                    setState(() {
                      selectedCategory = selectedCategory;
                    });
                  },
                  category: selectedCategory,
                  isSelected: true,
                );
              },
              separatorBuilder: (_, index) => SizedBox(width: 10),
              itemCount: selectedCategory.length,
            ),
          );
  }
}

class CategoryTiles extends StatelessWidget {
  const CategoryTiles(
      {Key? key,
      required this.category,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color:
                isSelected ? CustomColors.customSwathColor : Colors.transparent,
          ),
          child: Text(category,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : CustomColors.customContrastColor2,
                fontWeight: FontWeight.bold,
                fontSize: isSelected ? 16 : 14,
              )),
        ),
      ),
    );
  }
}
