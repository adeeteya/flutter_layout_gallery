import 'package:flutter/material.dart';

class MenuTile extends StatelessWidget {
  const MenuTile(
      {Key? key,
      required this.name,
      required this.assetPath,
      required this.onTap})
      : super(key: key);
  final String name;
  final String assetPath;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Ink(
          height: 56,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15,
                ),
              ),
              Image.asset(
                assetPath,
                color: (Theme.of(context).brightness == Brightness.dark)
                    ? Colors.white
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
