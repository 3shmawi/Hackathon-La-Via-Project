import 'package:flutter/material.dart';

import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie_hackathon_project/shared/icons/icons.dart';

import '../../modules/mobile/search/search_mobile_screen.dart';
import 'constants.dart';

Widget defaultButton(
        {required String text,
        double? radius,
        double width = double.infinity,
        required Function onPressed,
        bool? isUpperCase = false}) =>
    Container(
      height: 50.0,
      width: width,
      decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0))),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          isUpperCase! ? text.toUpperCase() : text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget btnAppBarr({
  required String text,
  double? radius,
  required Function onPressed,
}) =>
    Container(
      width: 150.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0))),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget customBtn({
  required width,
  required height,
  required String text,
  double? radius,
  required Function onPressed,
  IconData? icon,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: defaultColor,
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0))),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );

Widget borderCustomBtn({
  required width,
  required height,
  required String text,
  double? radius,
  required Function onPressed,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: HexColor('#FFE3C5')),
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 0))),
      child: MaterialButton(
        onPressed: () {
          onPressed();
        },
        child: Text(
          text,
          style: TextStyle(color: defaultColor),
        ),
      ),
    );

Widget defaultTextBtn(
        {required String text,
        required Function onPressed,
        bool? isUpperCase = false}) =>
    TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(isUpperCase! ? text.toUpperCase() : text));

///*****************************
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  bool isHover = false;
  bool isHover2 = false;
  bool isHover3 = false;
  bool isHover4 = false;
  bool isHover5 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.transparent),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 25, 0, 0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'assets/images/icon.png',
                ),
                Image.asset(
                  'assets/images/icon2.png',
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover = value;
                        });
                      },
                      onTap: () {},
                      child: ItemAppBar(
                        isHover: isHover,
                        text: 'Home',
                        color: isHover ? Colors.green : Colors.black,
                      )),
                  SizedBox(width: 40.0),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover2 = value;
                        });
                      },
                      onTap: () {},
                      child: ItemAppBar(
                        isHover: isHover2,
                        text: 'Shop',
                        color: isHover2 ? Colors.green : Colors.black,
                      )),
                  SizedBox(
                    width: 40.0,
                  ),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover3 = value;
                        });
                      },
                      onTap: () {},
                      child: ItemAppBar(
                        isHover: isHover3,
                        text: 'Blog',
                        color: isHover3 ? Colors.green : Colors.black,
                      )),
                  SizedBox(width: 40.0),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover4 = value;
                        });
                      },
                      onTap: () {},
                      child: ItemAppBar(
                        isHover: isHover4,
                        text: 'About',
                        color: isHover4 ? Colors.green : Colors.black,
                      )),
                  SizedBox(width: 40.0),
                  InkWell(
                      onHover: (value) {
                        setState(() {
                          isHover5 = value;
                        });
                      },
                      onTap: () {},
                      child: ItemAppBar(
                        isHover: isHover5,
                        text: 'Community',
                        color: isHover5 ? Colors.green : Colors.black,
                      )),
                ],
              ),
            ),
            Spacer(),
            IconButton(
                onPressed: () {}, icon: Icon(Icons.shopping_cart_outlined)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications_none_outlined)),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: SizedBox(
                height: 25.0,
                child: CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 20.0,
                  child: Image.asset('assets/images/default_image.png'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemAppBar extends StatelessWidget {
  const ItemAppBar(
      {Key? key, required this.isHover, required this.text, this.color})
      : super(key: key);

  final bool isHover;
  final String text;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(fontSize: 20.0, color: color),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          color: Colors.white,
          width: 80.0,
          height: isHover ? 4.0 : 0.0,
        )
      ],
    );
  }
}

///***************************************

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget(
      {Key? key, required this.imagePath, required this.name})
      : super(
          key: key,
        );
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Image.asset(imagePath),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class BestSeller extends StatelessWidget {
  const BestSeller(
      {Key? key,
      required this.imagePath,
      required this.name,
      required this.price})
      : super(key: key);
  final String imagePath;
  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(imagePath),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          name,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          price,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class BlogsWidget extends StatelessWidget {
  const BlogsWidget({
    Key? key,
    required this.imagePath,
    required this.name,
    required this.description,
    required this.timeAgo,
  }) : super(key: key);
  final String imagePath;
  final String name;
  final String description;
  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      width: 340,
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '$timeAgo days ago',
              style: TextStyle(color: defaultColor, fontSize: 15),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              description,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}

//*************************************
//*************************************

Future<Object?> defaultNavigate(context, route) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => route,
      ),
    );

Future<Object?> defaultNavigateAndFinish(context, route) =>
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
        (route) => false);

class DefaultFormField extends StatelessWidget {
  final String header;
  final TextEditingController controller;
  final int maxLines;
  final TextInputType textInputType;

  const DefaultFormField({
    required this.textInputType,
    required this.header,
    required this.maxLines,
    required this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: TextStyle(
            color: HexColor('FF#6F6F6F'),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: textInputType,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            contentPadding: const EdgeInsets.all(8),
          ),
        ),
      ],
    );
  }
}

class DefaultElevatedButton extends StatelessWidget {
  final String header;
  final VoidCallback? onPressed;
  final bool icon;
  final IconData iconData;
  final double height;

  const DefaultElevatedButton({
    Key? key,
    this.height = 50,
    this.iconData = IconBroken.buy,
    this.header = '',
    required this.onPressed,
    this.icon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            onPrimary: Colors.white,
            primary: HexColor('FF#1ABC00'),
            fixedSize: const Size(1000, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: onPressed,
        child: icon
            ? Icon(
                iconData,
                color: Colors.white,
                size: 20,
              )
            : Text(header),
      ),
    );
  }
}

class DefaultOrLoginWith extends StatelessWidget {
  const DefaultOrLoginWith({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/google.png',
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.facebook,
            size: 35,
            color: Colors.blue,
          ),
        ),
      ],
    );
  }
}

class DefaultOnePost extends StatelessWidget {
  const DefaultOnePost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(25),
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          'assets/images/image.jpeg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          borderRadius: BorderRadius.circular(5),
                          child: Text(
                            'Mohamed Mohamed',
                            style:
                                Theme.of(context).textTheme.subtitle2?.copyWith(
                                      height: 1.4,
                                      fontSize: 15.50,
                                    ),
                          ),
                        ),
                        Text(
                          daysBetween(DateTime.now()),
                          style: Theme.of(context)
                              .textTheme
                              .caption
                              ?.copyWith(height: 1.4, fontSize: 10),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Mohamed Mohamed',
                    style: Theme.of(context).textTheme.subtitle2?.copyWith(
                        height: 1.4, fontSize: 15.50, color: Colors.green),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 20),
                  child: Text(
                    '{cubit.allPosts[index].postText} kjjhgjhgjhjhjhjhbjhjkhbjhbjhvbjhvnvcv kjkhjkh kjkjhkuh jhkjhlkjl ojhkljhkj kjh                                                                       ',
                    style: Theme.of(context).textTheme.caption,
                  ),
                ),
                Image.asset(
                  'assets/images/image.jpeg',
                  fit: BoxFit.cover,
                  height: 150.0,
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(10),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.favorite_outlined,
                        size: 16.0,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        '6 Likes',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 40,
              ),
              Text(
                '5 Replies',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class DefaultSearch extends StatelessWidget {
  final bool read;
  const DefaultSearch({Key? key,this.read =false,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: TextField(
        readOnly: read,
        textAlignVertical: TextAlignVertical.bottom,
        // textAlign: TextAlign.justify,
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle:
              Theme.of(context).textTheme.caption!.copyWith(height: 1.9),
          prefixIcon: Icon(
            IconBroken.search,
            color: Colors.grey,
            size: 20,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class DefaultNotFound extends StatelessWidget {
  final String text;

  const DefaultNotFound({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
      child: Column(
        children: [
          Image.asset(
            'assets/images/frame.png',
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Sorry, the keyword you entered cannot be found, please check again or search with another keyword.',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 15,
                ),
          ),
        ],
      ),
    );
  }
}

class DefaultTapBar extends StatelessWidget {
  final String text;
  final bool selected;

  const DefaultTapBar({
    required this.selected,
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1.5,
          color: selected ? Colors.green : Colors.transparent,
        ),
      ),
      child: Tab(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class DefaultTitle extends StatelessWidget {
  const DefaultTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class DefaultTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DefaultTextButton({
    Key? key,
    required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.hovered)) {
            return HexColor('FF#1ABC00');
          }
          return Colors.black;
        }),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
