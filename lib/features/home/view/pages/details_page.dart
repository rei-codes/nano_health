import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nano_health/core/widgets/custom_button.dart';
import 'package:nano_health/features/home/providers/product_provider.dart';
import 'package:nano_health/features/home/view/widgets/shadow_container.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../core/utils/colors.dart';
import '../widgets/rating_section.dart';

class DetailsPage extends ConsumerWidget {
  const DetailsPage(this.id, {super.key});
  final int id;

  @override
  Widget build(BuildContext context, ref) {
    final asyncData = ref.watch(productProvider(id));
    return Scaffold(
      backgroundColor: Colors.white,
      body: asyncData.when(
        error: (_, __) => const Center(
          child: CircularProgressIndicator(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        data: (item) {
          return NestedScrollView(
            headerSliverBuilder: (_, __) {
              return [
                SliverAppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 104,
                  expandedHeight: 400,
                  leading: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: ShadowContainer(
                      child: IconButton(
                        onPressed: Navigator.of(context).pop,
                        icon: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(item.image),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: ShadowContainer(
                        child: PopupMenuButton(
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.black,
                          ),
                          onSelected: (_) {},
                          itemBuilder: (_) => [
                            const PopupMenuItem(
                              value: '1',
                              child: Text('Item 1'),
                            ),
                            const PopupMenuItem(
                              value: '2',
                              child: Text('Item 2'),
                            ),
                            const PopupMenuItem(
                              value: '3',
                              child: Text('Item 3'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.only(top: 32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(28),
                    topLeft: Radius.circular(28),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      offset: const Offset(0, -12),
                      blurRadius: 12,
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: AppColors.blue,
                      size: 42,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        ShadowContainer(
                          child: IconButton(
                            onPressed: () => Share.share('${item.id}'),
                            icon: const Icon(
                              Icons.ios_share_rounded,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: CustomButton(
                            text: 'Order Now',
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('$id added to card'),
                                  backgroundColor: Colors.orange,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Description',
                        style: TextStyle(
                          color: Color(0xFF444B51),
                          fontStyle: FontStyle.italic,
                          fontSize: 16,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      item.description,
                      style: const TextStyle(
                        height: 1.8,
                        letterSpacing: .35,
                        color: Color(0xFF838396),
                      ),
                    ),
                    const SizedBox(height: 24),
                    RatingSection(item.rating),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
