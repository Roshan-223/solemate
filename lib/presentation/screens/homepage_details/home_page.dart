import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solemate/business_logic/brand_category/brand_category_bloc.dart';
import 'package:solemate/business_logic/brand_category/brand_category_event.dart';
import 'package:solemate/business_logic/brand_category/brand_category_state.dart';
import 'package:solemate/presentation/screens/homepage_details/widget/carousel_slider1.dart';
import 'package:solemate/presentation/widget/custom_textfield.dart';
import 'package:solemate/presentation/widget/homepage_brands_widget/homepage_containers.dart';
import 'brand_details.dart';
import '../utils/colors.dart';
import '../utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(),
      child: Scaffold(
        backgroundColor: kwhite,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: kwhite,
              pinned: true,
              floating: true,
              snap: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Column(
                  children: [
                    AppBar(
                      backgroundColor: kwhite,
                      elevation: 0,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          const Expanded(
                            child: CustomTextField(
                              hintText: 'Search',
                              icon: Icons.search,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.filter_list_alt),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 16.0, top: 15),
                      child: Text(
                        'Popular Brands',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                BrandContainer(
                                  label: 'All',
                                  showImage: false,
                                  isSelected: state.selectedBrand == 'All',
                                  onTap: () => _onBrandTap(context, 'All'),
                                ),
                                BrandContainer(
                                  label: 'Puma',
                                  imageUrl:
                                      'assests/images/Screenshot 2024-10-28 161501.png',
                                  showImage: true,
                                  isSelected: state.selectedBrand == 'Puma',
                                  onTap: () => _onBrandTap(context, 'Puma'),
                                ),
                                BrandContainer(
                                  label: 'Adidas',
                                  imageUrl:
                                      'assests/images/Screenshot 2024-10-28 161439.png',
                                  showImage: true,
                                  isSelected: state.selectedBrand == 'Adidas',
                                  onTap: () => _onBrandTap(context, 'Adidas'),
                                ),
                                BrandContainer(
                                  label: 'Jordan',
                                  imageUrl:
                                      'assests/images/Screenshot 2024-10-28 161420.png',
                                  showImage: true,
                                  isSelected: state.selectedBrand == 'Jordan',
                                  onTap: () => _onBrandTap(context, 'Jordan'),
                                ),
                                BrandContainer(
                                  label: 'Reebok',
                                  imageUrl:
                                      'assests/images/Screenshot 2024-10-28 161525.png',
                                  showImage: true,
                                  isSelected: state.selectedBrand == 'Reebok',
                                  onTap: () => _onBrandTap(context, 'Reebok'),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Trending',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  kheight10,
                  CarouselSlider1(),
                  kheight10,
                  Padding(
                    padding: EdgeInsets.only(left: 14.0),
                    child: Text(
                      'All Product',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  kheight10,
                ],
              ),
            ),
            SliverPadding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 10,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: kwhite,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onBrandTap(BuildContext context, String brand) {
    context.read<HomeBloc>().add(SelectBrandEvent(brand));

    if (brand != 'All') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BrandScreen(brandName: brand),
        ),
      ).then((_) {
        // Emit ResetBrandEvent when returning to the HomePage
        context.read<HomeBloc>().add(ResetBrandEvent());
      });
    }
  }
}
