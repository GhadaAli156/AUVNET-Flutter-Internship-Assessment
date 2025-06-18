import 'package:flutter/material.dart';

class GotACode extends StatelessWidget {
  const GotACode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Row(
            children: [
              Image(image: AssetImage("assets/images/Security Vault.png")),
              SizedBox(width: 12),
              Column(
                children: [
                  Text("Got a code!",style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),),
                  Text(
                    "Add your code",
                  ),
                ],
              ),
            ],
          ),
        )

    );
  }
}