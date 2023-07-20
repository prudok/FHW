import 'package:birthday_app/core/asset_path.dart';
import 'package:birthday_app/features/animations/views/animation_view.dart';
import 'package:birthday_ui/birthday_ui.dart';
import 'package:flutter/material.dart';

class BirthTiles extends StatefulWidget {
  const BirthTiles({super.key});

  @override
  State<BirthTiles> createState() => _BirthTilesState();
}

class _BirthTilesState extends State<BirthTiles> with TickerProviderStateMixin {
  bool _isExpanded = false;

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
        BirthdayListTile(
          imagePath: AssetPath.greenCircle,
          title: 'Настольные игры',
          subTitle: 'Мафия, уно, домино, экивоки и другие',
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AnimationView()),
          ),
        ),
        const BirthdayListTile(
          imagePath: AssetPath.blueCircle,
          title: 'Бассейн',
          subTitle: 'Два Бассейна с подгоревом',
        ),
        SizeTransition(
          sizeFactor: _animation,
          axis: Axis.vertical,
          axisAlignment: -1,
          child: const Column(
            children: [
              BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: 'Настольные игры',
                subTitle: 'Мафия, уно, домино, экивоки и другие',
              ),
              BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: 'Настольные игры',
                subTitle: 'Мафия, уно, домино, экивоки и другие',
              ),
              BirthdayListTile(
                imagePath: AssetPath.greenCircle,
                title: 'Настольные игры',
                subTitle: 'Мафия, уно, домино, экивоки и другие',
              ),
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
        )
      ],
    );
  }
}

class BirthdayListTile extends StatelessWidget {
  const BirthdayListTile({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subTitle,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        imagePath,
        fit: BoxFit.cover,
      ),
      title: BirthdayText.custom(
        title,
        bodyStyle.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: BirthdayText.body(
        subTitle,
      ),
      trailing: IconButton(
        icon: Image.asset(AssetPath.rightArrow),
        onPressed: onTap,
      ),
      isThreeLine: true,
    );
  }
}
