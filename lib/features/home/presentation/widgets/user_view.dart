import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: AppColors.primary,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.person, size: 50, color: AppColors.primary),
                    ),
                    SizedBox(height: 12),
                    Text(
                      'Alex Rivera',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'alex.rivera@example.com',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildMenuItem(Icons.shopping_bag_outlined, 'My Orders', () {}),
                _buildMenuItem(Icons.location_on_outlined, 'Delivery Address', () {}),
                _buildMenuItem(Icons.payment_outlined, 'Payment Methods', () {}),
                _buildMenuItem(Icons.card_giftcard_outlined, 'Vouchers', () {}),
                const Divider(height: 40),
                _buildMenuItem(Icons.settings_outlined, 'Settings', () {}),
                _buildMenuItem(Icons.help_outline, 'Help Center', () {}),
                _buildMenuItem(Icons.logout, 'Log Out', () => Navigator.pushReplacementNamed(context, '/signIn')),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.primary),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.chevron_right, color: AppColors.textHint),
      contentPadding: const EdgeInsets.symmetric(vertical: 4),
    );
  }
}
