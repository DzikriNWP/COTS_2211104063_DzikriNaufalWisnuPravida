import 'package:flutter/material.dart';

import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class PromoPage extends StatelessWidget {
  const PromoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Promo', style: HeadingItems.h2),
            const SizedBox(height: 16),
            _buildTreasureCard(),
            const SizedBox(height: 16),
            _buildVoucherSection(),
            const SizedBox(height: 24),
            _buildPromoCodeInput(),
            const SizedBox(height: 24),
            _buildPromoSection(),
            const SizedBox(height: 24),
            _buildGopayPromoSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildTreasureCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsItems.darkgrey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.orange.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Image.asset('assets/treasure_icon.png', height: 40),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              '121 XP to your next treasure',
              style: SubheadBodyItems.p2,
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildVoucherSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildVoucherItem('13', 'Vouchers', 'All fresh today', Colors.orange),
        _buildVoucherItem('0', 'Langganan', 'Lagi asik', Colors.purple),
        _buildVoucherItem('0', 'Mission', 'Lagi on track', Colors.blue),
      ],
    );
  }

  Widget _buildVoucherItem(
      String number, String title, String subtitle, Color color) {
    return Column(
      children: [
        Text(number, style: HeadingItems.h2),
        Text(title, style: SubheadBodyItems.p3),
        Container(
          height: 2,
          width: 80,
          color: color,
        ),
        Text(subtitle,
            style: SubheadBodyItems.p4.copyWith(color: ColorsItems.grey)),
      ],
    );
  }

  Widget _buildPromoCodeInput() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsItems.grey.withOpacity(0.2)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.local_offer, color: ColorsItems.greengojek),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'Masukan kode promo',
              style: SubheadBodyItems.p2,
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }

  Widget _buildPromoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Promo menarik buat kamu', style: HeadingItems.h3),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildPromoChip('Apa aja'),
              _buildPromoChip('GoFood'),
              _buildPromoChip('GoPay'),
              _buildPromoChip('GoPayLater'),
              _buildPromoChip('GoRide'),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPromoChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Chip(
        label: Text(label),
        backgroundColor: ColorsItems.darkgrey,
      ),
    );
  }

  Widget _buildGopayPromoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.account_balance_wallet, color: ColorsItems.greengojek),
            const SizedBox(width: 8),
            Text('GoPay', style: HeadingItems.h3),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          'Promo menarik dari brand populer',
          style: HeadingItems.h4,
        ),
        const SizedBox(height: 4),
        Text(
          'Buat rileks atau produktif, kamu yang tentuin!',
          style: SubheadBodyItems.p3.copyWith(color: ColorsItems.grey),
        ),
      ],
    );
  }
}
