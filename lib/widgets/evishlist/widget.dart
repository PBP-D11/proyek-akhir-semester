import 'package:flutter/material.dart';
import '../../models/wishlist_model.dart';
import '../../screens/evishlist/detail_cars.dart';


class CarItem extends StatelessWidget {
  const CarItem({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(42, 44, 62, 1),
      margin: const EdgeInsets.fromLTRB(40, 20, 40, 2),
      // padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          // SizedBox(
          //   width: MediaQuery.of(context).size.width * 0.4,
          //   height: MediaQuery.of(context).size.height * 0.15,
          //   child: Image.network(
          //     car.fields.photo,
          //     fit: BoxFit.contain,
          //     errorBuilder: (context, error, stackTrace) {
          //       return Center(
          //         child: Icon(
          //           Icons.broken_image_outlined,
          //           color: Colors.red.withOpacity(0.4),
          //         ),
          //       );
          //     },
          //   ),
          // ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.height * 0.15,
                    child: Image.network(car.fields.photo, fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.broken_image_outlined,
                          color: Colors.red.withOpacity(0.4),
                        ),
                      );
                    })),
                ListTile(
                  title: Text(
                    car.fields.name,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    car.fields.price,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  // margin: const EdgeInsets.fromLTRB(40, 20, 40, 5),
                  padding: const EdgeInsets.only(left: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return DetailCarPage(model: car);
                      }));
                    },
                    child: const Text(
                      "See more",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CardEvishlist extends StatelessWidget {
  const CardEvishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromRGBO(42, 44, 62, 1),
      margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    "Evishlist",
                    style: const TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    "Find and add your best collection here!",
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              // padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.15,
              child: Image(image: AssetImage('assets/IconHeart.png'))),
        ],
      ),
    );
  }
}
