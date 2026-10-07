import 'package:flutter/material.dart';
class pagessf extends StatefulWidget {
  const pagessf({super.key});

  @override
  State<pagessf> createState() => _pagessfState();
}

class _pagessfState extends State<pagessf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Preview"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            /// Top Image Section
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              color: Colors.white,
              child: Row(
                children: [

                  Expanded(
                    child: Image.asset(
                    "amazon.png",
                      height: 280,
                      fit: BoxFit.contain,
                    ),
                  ),

                  const SizedBox(width: 30),

                  const Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [

                        Text(
                          "FIND\nANYTHING ON\nA WEB PAGE:",
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          ),
                        ),

                        SizedBox(height: 20),

                        Text(
                          "A SIMPLE\nSTEP-BY-STEP\nGUIDE",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Share & Save
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.share),
                      label: const Text("Share"),
                    ),
                  ),

                  const SizedBox(width: 20),

                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(Icons.bookmark_border),
                      label: const Text("Save"),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            /// Related Images
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [

                  imageCard("assets/1.jpg"),
                  imageCard("assets/2.jpg"),
                  imageCard("assets/3.jpg"),
                  imageCard("assets/4.jpg"),
                  imageCard("assets/5.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget imageCard(String image) {
    return Container(
      width: 220,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}



