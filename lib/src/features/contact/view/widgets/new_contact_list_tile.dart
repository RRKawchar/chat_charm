import 'package:flutter/material.dart';

class NewContactListTile extends StatelessWidget {
  final String btnText;
  final IconData icon;
  final VoidCallback onTap;
  const NewContactListTile({
    super.key,
    required this.btnText,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(100),
              ),
              child:  Icon(
              icon,
            ),
            ),
            const SizedBox(width: 20),
            Text(
             btnText,
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
    );
  }
}
