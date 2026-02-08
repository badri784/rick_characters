import 'package:flutter/material.dart';

import '../theming/colors.dart';

class CharacterDetailCard extends StatelessWidget {
  final Text? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;

  const CharacterDetailCard({
    super.key,
    this.title,
    this.subtitle,
    this.trailing,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
      child: Container(
        height: 65,
        width: double.infinity,
        color: ColorsManger.gray,
        child: ListTile(
          title: title,
          subtitle: subtitle,
          trailing: trailing,
          leading: leading,
        ),
      ),
    );
  }
}
