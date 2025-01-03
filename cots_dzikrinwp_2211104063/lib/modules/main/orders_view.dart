import 'package:flutter/material.dart';

import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          _buildHeader(),
          _buildFilterSection(),
          const SizedBox(height: 16),
          Expanded(
            child: _buildOrdersList(),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Pesanan', style: HeadingItems.h2),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: ColorsItems.grey.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Text('1', style: SubheadBodyItems.p4),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Column(
      children: [
        const TabBar(
          tabs: [
            Tab(text: 'Riwayat'),
            Tab(text: 'Dalam proses'),
            Tab(text: 'Terjadwal'),
          ],
          labelColor: ColorsItems.greengojek,
          unselectedLabelColor: ColorsItems.grey,
          indicatorColor: ColorsItems.greengojek,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              _buildFilterChip('GoFood'),
              const SizedBox(width: 8),
              _buildFilterChip('Status', showDropdown: true),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterChip(String label, {bool showDropdown = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorsItems.darkgrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: SubheadBodyItems.p3),
          if (showDropdown) ...[
            const SizedBox(width: 4),
            const Icon(Icons.arrow_drop_down, size: 18),
          ],
        ],
      ),
    );
  }

  Widget _buildOrdersList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildGopayTransaction(),
        const SizedBox(height: 16),
        _buildOrderItem(
          items: '1 item',
          date: '28 Des 11:30',
          price: 'Rp.58.800',
        ),
        const SizedBox(height: 16),
        _buildOrderItem(
          items: '3 item',
          date: '28 Des 11:30',
          price: 'Rp.58.800',
        ),
        const SizedBox(height: 16),
        _buildOrderItem(
          items: '3 item',
          date: '28 Des 11:30',
          price: 'Rp.58.800',
        ),
      ],
    );
  }

  Widget _buildGopayTransaction() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsItems.darkgrey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.account_balance_wallet, color: ColorsItems.greengojek),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Transaksi Gopay',
              style: SubheadBodyItems.p2,
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildOrderItem({
    required String items,
    required String date,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsItems.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset('assets/food_icon.png', height: 40),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ayam Benjoss, kedungkandang',
                        style: SubheadBodyItems.p2),
                    Text('2 Paket Ayam Bakar Jum...',
                        style: SubheadBodyItems.p4),
                  ],
                ),
              ),
              Text(price, style: SubheadBodyItems.p2),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Makanan sudah diantar $date',
                style: SubheadBodyItems.p4.copyWith(color: ColorsItems.grey),
              ),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: ColorsItems.greengojek),
                ),
                child: Text(
                  'Pesan lagi',
                  style: SubheadBodyItems.p4
                      .copyWith(color: ColorsItems.greengojek),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
