import 'package:cached_network_image/cached_network_image.dart';
import 'package:dokani/screens/product_list/product_controller.dart';
import 'package:dokani/widgets/custom_button.dart';
import 'package:dokani/widgets/custom_progress.dart';
import 'package:dokani/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProductController>(
        init: ProductController(context),
        builder: (_controller) {
          return CustomProgress(
            isLoading: _controller.isLoading,
            child: Scaffold(
              backgroundColor: const Color(0xFFF8F8F8),
              body: Padding(
                padding: EdgeInsets.symmetric(horizontal: kWidth * 0.05),
                child: Column(
                  children: [
                    SizedBox(height: kHeight * 0.09),
                    titleRow(),
                    SizedBox(height: kHeight * 0.055),
                    GestureDetector(
                        onTap: () => Get.bottomSheet(
                              filterBottomSheet(kHeight, kWidth),
                            ),
                        child: filterContainer(kHeight, kWidth)),
                    SizedBox(height: kHeight * 0.02),
                    Expanded(
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: _controller.productList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1 / 1.75,
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
                                    topRight: Radius.circular(10),
                                  ),
                                  child: Container(
                                    color: const Color(0xFFD8EAEC),
                                    height: kHeight * 0.2,
                                    width: kWidth,
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          "${_controller.productList[index].images![0].src}",
                                      placeholder: (context, url) =>
                                          ImageLoader(),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(height: kHeight * 0.01),
                                Padding(
                                  padding: EdgeInsets.only(left: kWidth * 0.05),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: kHeight * 0.055,
                                        child: Text(
                                          '${_controller.productList[index].name}',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              fontFamily: 'Roboto'),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$ ${_controller.productList[index].price}',
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20,
                                                color: Color(0xFF000000),
                                                fontFamily: 'Roboto'),
                                          ),
                                          SizedBox(width: kWidth * 0.04),
                                          Visibility(
                                            visible: _controller
                                                .discountVisible(index),
                                            child: Text(
                                              '\$ ${_controller.productList[index].regularPrice}',
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                  color: Color(0xFF989FA8),
                                                  fontFamily: 'Roboto'),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: kHeight * 0.01),
                                      RatingBarIndicator(
                                        rating: double.parse(
                                            "${_controller.productList[index].averageRating}"),
                                        itemBuilder: (context, index) =>
                                            const Icon(
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
            ),
          );
        });
  }

  filterBottomSheet(double kHeight, double kWidth) {
    return GetBuilder<ProductController>(
        builder: (_controller) => Container(
              height: kHeight * .5,
              width: kWidth,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: kHeight * 0.03),
                  SvgPicture.asset('assets/svg/bottom_bar.svg'),
                  SizedBox(height: kHeight * 0.03),
                  Container(
                    width: kWidth,
                    padding: EdgeInsets.symmetric(horizontal: kWidth * .06),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Filter',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        SizedBox(height: kHeight * 0.02),
                        ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: _controller.filterItems.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () => _controller.onFilterSelec(index),
                              child: Padding(
                                padding:
                                    EdgeInsets.only(bottom: kHeight * 0.02),
                                child: Row(
                                  children: [
                                    SvgPicture.asset(
                                      _controller.filterItems[index].isSelected
                                          ? 'assets/svg/checked.svg'
                                          : 'assets/svg/unchecked.svg',
                                    ),
                                    SizedBox(width: kHeight * 0.02),
                                    Text(
                                      _controller.filterItems[index].name,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(height: kHeight * 0.04),
                        Row(
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () => Get.back(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: kHeight * 0.023),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          color: const Color(0xFF818995)),
                                      borderRadius: BorderRadius.circular(7)),
                                  width: kWidth,
                                  child: const Text(
                                    'Cancel',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF818995),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: kWidth * 0.05),
                            Flexible(
                              child: CustomButton(
                                backGroundColor: const Color(0xFF1ABC9C),
                                onTap: () {
                                  Get.back();
                                  _controller.filterAction();
                                },
                                title: 'Apply',
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ));
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
