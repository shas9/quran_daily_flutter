import 'package:flutter/material.dart';
import 'package:quran_daily/presentation/base/base_page.dart';
import 'package:quran_daily/presentation/common/custom_quran_card.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  // Data structure for settings sections
  static final List<SettingsSection> _sections = [
    SettingsSection(
      title: 'Quran Reading',
      items: [
        SettingItem(
          icon: Icons.format_size,
          title: 'Arabic Text Size',
          subtitle: 'Adjust the size of Arabic text',
        ),
        SettingItem(
          icon: Icons.translate,
          title: 'Translation Language',
          subtitle: 'Choose your preferred translation',
        ),
        SettingItem(
          icon: Icons.font_download,
          title: 'Arabic Font Style',
          subtitle: 'Select Quranic font type',
        ),
      ],
    ),
    SettingsSection(
      title: 'Prayer Times',
      items: [
        SettingItem(
          icon: Icons.location_on,
          title: 'Location Settings',
          subtitle: 'Set your location for accurate prayer times',
        ),
        SettingItem(
          icon: Icons.calculate,
          title: 'Calculation Method',
          subtitle: 'Choose prayer times calculation method',
        ),
      ],
    ),
    SettingsSection(
      title: 'Notifications',
      items: [
        SettingItem(
          icon: Icons.notifications,
          title: 'Prayer Time Notifications',
          subtitle: 'Receive alerts for prayer times',
          isSwitch: true,
        ),
        SettingItem(
          icon: Icons.book,
          title: 'Daily Verse Reminder',
          subtitle: 'Get daily Quran verses',
          isSwitch: true,
        ),
      ],
    ),
    SettingsSection(
      title: 'Appearance',
      items: [
        SettingItem(
          icon: Icons.dark_mode,
          title: 'Theme',
          subtitle: 'Choose light or dark mode',
        ),
      ],
    ),
    SettingsSection(
      title: 'Community & Support',
      items: [
        SettingItem(
          icon: Icons.share,
          title: 'Share App',
          subtitle: 'Spread the blessings with others',
        ),
        SettingItem(
          icon: Icons.star,
          title: 'Rate App',
          subtitle: 'Rate us on the Play Store',
        ),
        SettingItem(
          icon: Icons.email,
          title: 'Contact Us',
          subtitle: 'Get in touch with our team',
        ),
        SettingItem(
          icon: Icons.volunteer_activism,
          title: 'Support Our Mission',
          subtitle: 'Contribute to app development and maintenance',
        ),
      ],
    ),
    SettingsSection(
      title: 'About & Help',
      items: [
        SettingItem(
          icon: Icons.info,
          title: 'About',
          subtitle: 'App information and credits',
        ),
        SettingItem(
          icon: Icons.help,
          title: 'Help & Support',
          subtitle: 'Get assistance and contact support',
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: 'Settings',
      showBackButton: true,
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: _buildSettingsList(context),
      ),
    );
  }

  List<Widget> _buildSettingsList(BuildContext context) {
    final List<Widget> widgets = [];
    
    for (final section in _sections) {
      widgets.add(_buildSectionHeader(context, section.title));
      widgets.addAll(section.items.map((item) => _buildSettingCard(item)));
    }
    
    return widgets;
  }

  Widget _buildSettingCard(SettingItem item) {
    return CustomQuranCard(
      padding: const EdgeInsets.all(0),
      child: item.isSwitch
          ? _buildSwitchTile(item)
          : _buildSettingTile(
              icon: item.icon,
              title: item.title,
              subtitle: item.subtitle,
              onTap: () {},
            ),
    );
  }

  Widget _buildSwitchTile(SettingItem item) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      secondary: Icon(item.icon),
      title: Text(item.title),
      subtitle: Text(item.subtitle),
      value: true,
      onChanged: (bool value) {},
    );
  }

  Widget _buildSettingTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.green.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: Colors.green[700],
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Text(subtitle),
      ),
      trailing: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.chevron_right,
          size: 20,
        ),
      ),
      onTap: onTap,
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 24, 4, 12),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 24,
            decoration: BoxDecoration(
              color: Colors.green[700],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
              color: Colors.green[800],
            ),
          ),
        ],
      ),
    );
  }
}

// Data models for settings
class SettingsSection {
  final String title;
  final List<SettingItem> items;

  const SettingsSection({
    required this.title,
    required this.items,
  });
}

class SettingItem {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSwitch;

  const SettingItem({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.isSwitch = false,
  });
}