import 'package:flutter/material.dart';

class CurrentLocationHeader extends StatelessWidget {
  final String? location;
  final String? country;

  const CurrentLocationHeader({super.key, this.location, this.country});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on_rounded,
          color: Colors.white,
          size: 30,
          applyTextScaling: true,
        ),
        Text(
          location ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        const Spacer(),
        Text(
          country ?? "",
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )
      ],
    );
  }
}
