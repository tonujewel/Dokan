import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: kHeight * 0.09),
            titleRow(),
            SizedBox(height: kHeight * 0.055),
            filterContainer(kHeight, kWidth),
            SizedBox(height: kHeight * 0.02),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                //scrollDirection: Axis.horizontal,
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.73,
                  crossAxisSpacing: kHeight * 0.02,
                  mainAxisSpacing: kHeight * 0.02,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x1a395ab8),
                          offset: Offset(0, 3),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          child: Container(
                            color: const Color(0xFFD8EAEC),
                            height: kHeight * 0.24,
                            width: kWidth,
                            child: Image.asset(
                              'assets/images/demo_product_image.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(height: kHeight * 0.01),
                        Padding(
                          padding: EdgeInsets.only(left: kWidth * 0.05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: kHeight * 0.055,
                                child: const Text(
                                  'Man Stylish Dresse sdddd',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      fontFamily: 'Roboto'),
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '\$ 150',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color(0xFF989FA8),
                                        fontFamily: 'Roboto'),
                                  ),
                                  SizedBox(width: kWidth * 0.04),
                                  const Text(
                                    '\$ 79.00',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 20,
                                        color: Color(0xFF000000),
                                        fontFamily: 'Roboto'),
                                  ),
                                ],
                              ),
                              SizedBox(height: kHeight * 0.01),
                              RatingBarIndicator(
                                rating: 2.5,
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container filterContainer(double kHeight, double kWidth) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: kHeight * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color(0x1a395ab8),
            offset: Offset(0, 3),
            blurRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(width: kWidth * 0.05),
          SvgPicture.asset('assets/svg/filter.svg'),
          SizedBox(width: kWidth * 0.03),
          const Text(
            'Filter',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Color(0xFF818995),
                fontWeight: FontWeight.w400),
          ),
          const Spacer(),
          const Text(
            'Sort by',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto',
                color: Color(0xFF818995),
                fontWeight: FontWeight.w400),
          ),
          SizedBox(width: kWidth * 0.02),
          SvgPicture.asset('assets/svg/down.svg'),
          SizedBox(width: kWidth * 0.03),
          SvgPicture.asset('assets/svg/menu.svg'),
          SizedBox(width: kWidth * 0.03),
        ],
      ),
    );
  }

  Row titleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Text(
          'Product list',
          style: TextStyle(
              fontSize: 22,
              fontFamily: 'Roboto',
              color: Color(0xFF222455),
              fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        SvgPicture.asset(
          'assets/svg/search.svg',
          color: const Color(0xFF222455),
        ),
      ],
    );
  }
}
