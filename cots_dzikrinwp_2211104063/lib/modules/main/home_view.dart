import 'package:flutter/material.dart';

import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSearchHeader(),
          const SizedBox(height: 16),
          _buildGopayCard(),
          const SizedBox(height: 24),
          _buildMainServices(),
          const SizedBox(height: 24),
          _buildTreasureProgress(),
          const SizedBox(height: 24),
          _buildNearbySection(),
        ],
      ),
    );
  }

  Widget _buildSearchHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: ColorsItems.darkgrey,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                children: [
                  Icon(Icons.search, color: ColorsItems.grey, size: 20),
                  const SizedBox(width: 12),
                  Text(
                    'Find services, food, or places',
                    style:
                        SubheadBodyItems.p3.copyWith(color: ColorsItems.grey),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsItems.darkgrey,
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.person_outline, color: ColorsItems.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildGopayCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0281A0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('lib/design_system/assets/gopay_logo.png',
                  height: 16),
              const SizedBox(width: 8),
              Text(
                'Rp7.434',
                style:
                    HeadingItems.h4.copyWith(color: ColorsItems.primarywhite),
              ),
              const Spacer(),
              Text(
                'Tap for history',
                style: SubheadBodyItems.p4
                    .copyWith(color: ColorsItems.primarywhite),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildGopayButton(Icons.add, 'Top Up'),
              _buildGopayButton(Icons.payments, 'Pay'),
              _buildGopayButton(Icons.explore, 'Explore'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGopayButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: ColorsItems.primarywhite,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: const Color(0xFF0281A0), size: 20),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: SubheadBodyItems.p4.copyWith(color: ColorsItems.primarywhite),
        ),
      ],
    );
  }

  Widget _buildMainServices() {
    final services = [
      {
        'icon': Icons.motorcycle,
        'label': 'GoRide',
        'color': ColorsItems.greengojek
      },
      {
        'icon': Icons.directions_car,
        'label': 'GoCar',
        'color': ColorsItems.greengojek
      },
      {
        'icon': Icons.restaurant,
        'label': 'GoFood',
        'color': ColorsItems.primary2
      },
      {
        'icon': Icons.local_shipping,
        'label': 'GoSend',
        'color': ColorsItems.greengojek
      },
      {
        'icon': Icons.shopping_cart,
        'label': 'GoMart',
        'color': ColorsItems.primary2
      },
      {
        'icon': Icons.phone_android,
        'label': 'GoPulsa',
        'color': ColorsItems.primary4
      },
      {'icon': Icons.star, 'label': 'GoClub', 'color': ColorsItems.primary5},
      {'icon': Icons.grid_view, 'label': 'More', 'color': ColorsItems.grey},
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemCount: services.length,
        itemBuilder: (context, index) {
          final service = services[index];
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: service['color'] as Color,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  service['icon'] as IconData,
                  color: ColorsItems.primarywhite,
                  size: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                service['label'] as String,
                style: SubheadBodyItems.p4,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildTreasureProgress() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Image.asset('assets/treasure_star.png', height: 32),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '121 XP to your next treasure',
                  style: SubheadBodyItems.p2,
                ),
                const SizedBox(height: 4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: LinearProgressIndicator(
                    value: 0.7,
                    backgroundColor: ColorsItems.darkgrey,
                    color: ColorsItems.greengojek,
                    minHeight: 4,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildNearbySection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.restaurant, color: ColorsItems.primary2),
              label: Text(
                'Restos near me',
                style: SubheadBodyItems.p3,
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: ColorsItems.grey.withOpacity(0.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.trending_up, color: ColorsItems.primary2),
              label: Text(
                'Best-seller in my area',
                style: SubheadBodyItems.p3,
              ),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: BorderSide(color: ColorsItems.grey.withOpacity(0.3)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
