import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_app/features/home/widgets/menu_grid_builder.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({
    super.key,
  });

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> with TickerProviderStateMixin {
  bool _isExpanded = false;
  final List<(String, String)> _items = [
    (AssetPath.categoryOne, 'Канапе'),
    (AssetPath.categoryTwo, 'Сырная тарелка'),
  ];
  final List<(String, String)> _animatedItems = [
    (AssetPath.categoryThree, 'Шашлык на мангале'),
    (AssetPath.categoryFour, 'Морепродукты'),
    (AssetPath.categoryFive, 'Свежие фрукты'),
    (AssetPath.categorySix, 'Авторские лимонады'),
  ];

  // controller to handle expanding animation
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MenuGridBuilder(items: _items),
        verticalSpaceSmall,
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: Column(
            children: [
              MenuGridBuilder(items: _animatedItems),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            _isExpanded ? _controller.reverse() : _controller.forward();
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: BirthdayText.custom(
            _isExpanded ? 'Свернуть ▲' : 'Развернуть ▼',
            bodyStyle.copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
