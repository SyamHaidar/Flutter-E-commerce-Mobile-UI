import 'package:flutter/material.dart';
import 'package:watch_ecommerce_ui/style.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final colors = [
    const Color(0xff54593a),
    const Color(0xff253a71),
    const Color(0xfffbd28e),
    const Color(0xff858585),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cPrimary,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            const CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: 'watch0',
                child: Image.asset(
                  'asset/watch0.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      Text('Museum Watch', style: tTitle),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Color', style: tTextWhite),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: List.generate(
                        colors.length,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: SizedBox(
                              child: CircleAvatar(
                                backgroundColor: colors[index],
                              ),
                              width: 24,
                              height: 24,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: cActive,
                        radius: 5,
                      ),
                      const SizedBox(width: 6),
                      Text('Description', style: tTitle2),
                      const SizedBox(width: 16),
                      Text('Spesification', style: tText),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                    style: tTextDesc,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('\$14,99', style: tTitle),
                      TextButton.icon(
                        icon: const Icon(Icons.shopping_cart_outlined),
                        label: const Text(
                          'Add to chart',
                          style: TextStyle(fontSize: 18),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: cActive,
                          primary: cPrimary,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
