import 'package:flutter/material.dart';
import '../../design_system/styles/color.dart';
import '../../design_system/styles/typography.dart';

class GojekLoginScreen extends StatefulWidget {
  const GojekLoginScreen({Key? key}) : super(key: key);

  @override
  State<GojekLoginScreen> createState() => _GojekLoginScreenState();
}

class _GojekLoginScreenState extends State<GojekLoginScreen> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsItems.primarywhite,
      appBar: AppBar(
        backgroundColor: ColorsItems.primarywhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsItems.dark),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline, color: ColorsItems.dark),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Login', style: HeadingItems.h2),
            const SizedBox(height: 8),
            Text(
              'Enter your registered phone number to log in',
              style: SubheadBodyItems.sh2.copyWith(color: ColorsItems.grey),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: ColorsItems.grey.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 16),
                    child: Row(
                      children: [
                        Image.network(
                          'https://flagcdn.com/w20/id.png',
                          width: 24,
                          height: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '+62',
                          style: SubheadBodyItems.p2,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone number',
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Issue with number?',
                style:
                    SubheadBodyItems.p3.copyWith(color: ColorsItems.greengojek),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                //onpressed ini untuk melanjutkan ke arah main page
                onPressed: () {
                  Navigator.pushNamed(context, '/main');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsItems.greengojek,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Continue',
                  style: SubheadBodyItems.p2.copyWith(
                    color: ColorsItems.primarywhite,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(bottom: 24),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 1.5,
                children: List.generate(12, (index) {
                  if (index == 9) {
                    return const SizedBox.shrink();
                  }
                  if (index == 10) {
                    return _buildKeypadButton('0');
                  }
                  if (index == 11) {
                    return _buildKeypadButton('⌫');
                  }
                  return _buildKeypadButton('${index + 1}');
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKeypadButton(String text) {
    return TextButton(
      onPressed: () {
        if (text == '⌫') {
          if (_phoneController.text.isNotEmpty) {
            _phoneController.text = _phoneController.text.substring(
              0,
              _phoneController.text.length - 1,
            );
          }
        } else {
          _phoneController.text += text;
        }
      },
      child: Text(
        text,
        style: HeadingItems.h3,
      ),
    );
  }
}
