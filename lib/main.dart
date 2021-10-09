import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:watch_ecommerce_ui/detail.dart';
import 'package:watch_ecommerce_ui/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headline6: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _menu = 0;
  int _tags = 0;

  void _menuTap(int index) {
    setState(() {
      _menu = index;
    });
  }

  void _tagsTap(int index) {
    setState(() {
      _tags = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: cPrimary),
        centerTitle: true,
        backgroundColor: cPrimary,
        elevation: 0,
        title: const Text('Top seles'),
        actions: [
          IconButton(
            icon: SvgPicture.asset(
              'asset/iconsax/notification-fill.svg',
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: cPrimary,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Column(
                children: [
                  SizedBox(
                    height: 64,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const SizedBox(width: 24),
                            tags(0, 'Watch'),
                            tags(1, 'Bracelet'),
                            tags(2, 'Chain'),
                            tags(3, 'Bezel'),
                            tags(4, 'Case'),
                            tags(5, 'Glass'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 24,
                        crossAxisSpacing: 24,
                        mainAxisExtent: 300,
                      ),
                      physics: const PageScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 8,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: [
                                  Hero(
                                    tag: 'watch$index',
                                    child: Container(
                                      height: 220,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'asset/watch$index.png'),
                                          fit: BoxFit.scaleDown,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10,
                                    top: 10,
                                    child: SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: SvgPicture.asset(
                                        'asset/iconsax/heart.svg',
                                        color: Colors.black,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Museum Watch',
                                      style: tText,
                                    ),
                                    const SizedBox(height: 6),
                                    const Text(
                                      '\$14,99',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Detail(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: 72,
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: _menu == 0
                  ? SvgPicture.asset('asset/iconsax/home-fill.svg',
                      color: Colors.white)
                  : SvgPicture.asset('asset/iconsax/home.svg',
                      color: Colors.white),
              label: '',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: _menu == 1
                  ? SvgPicture.asset('asset/iconsax/wallet-fill.svg',
                      color: Colors.white)
                  : SvgPicture.asset('asset/iconsax/wallet.svg',
                      color: Colors.white),
              label: '',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: _menu == 2
                  ? SvgPicture.asset('asset/iconsax/shopping-cart-fill.svg',
                      color: Colors.white)
                  : SvgPicture.asset('asset/iconsax/shopping-cart.svg',
                      color: Colors.white),
              label: '',
              tooltip: '',
            ),
            BottomNavigationBarItem(
              icon: _menu == 3
                  ? SvgPicture.asset('asset/iconsax/setting-fill.svg',
                      color: Colors.white)
                  : SvgPicture.asset('asset/iconsax/setting.svg',
                      color: Colors.white),
              label: '',
              tooltip: '',
            ),
          ],
          currentIndex: _menu,
          onTap: _menuTap,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
        ),
      ),
    );
  }

  Widget tags(int i, String a) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
          color: _tags == i ? cActive : cSecondary,
          borderRadius: const BorderRadius.all(
            Radius.circular(100),
          ),
        ),
        child: Text(
          a,
          style: TextStyle(
            color: _tags == i ? cPrimary : cText,
            fontSize: 18.0,
            letterSpacing: 1.5,
          ),
        ),
      ),
      onTap: () {
        _tagsTap(i);
      },
    );
  }
}
