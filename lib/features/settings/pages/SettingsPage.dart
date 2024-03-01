import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medusa_js_admin/cubits/ThemeCubit.dart';

@RoutePage()
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
               Card(
                elevation: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          'https://www.pngkey.com/png/full/114-1149878_setting-user-avatar-in-specific-size-without-breaking.png'),
                    ),
                    title: Text('John Doe'),
                    subtitle: Text('john@doe.com'),
                    trailing: IconButton(onPressed: () => context.read<ThemeCubit>().toggleTheme(), icon: Icon(Icons.dark_mode)),
                  )
                ),
              ),
              ListView.builder(
                itemBuilder: (context, index) {
                  return SettingListTile(
                    icon: settingListData[index].icon,
                    title: settingListData[index].title,
                    subtitle: settingListData[index].subtitle,
                    onTap: settingListData[index].onTap,
                  );
                },
                itemCount: settingListData.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
              )
            ],
          ),
        ));
  }
}

List<SettingListData> settingListData = [
  SettingListData(
      icon: Icons.person,
      title: 'Personal information',
      subtitle: 'Update your personal information',
      onTap: () {
        print('Personal information');
      }),
  SettingListData(
      icon: Icons.location_on,
      title: 'Regions',
      subtitle: 'Select your region',
      onTap: () {
        print('Regions');
      }),
  SettingListData(
      icon: Icons.money,
      title: 'Currencies',
      subtitle: 'Select your currency',
      onTap: () {
        print('Currencies');
      }),
  SettingListData(
    icon: Icons.person,
    title: 'Users',
    subtitle: 'Manage users',
    onTap: () {
      print('Users');
    },
  ),
  SettingListData(
    icon: Icons.person,
    title: 'Return reasons',
    subtitle: 'Manage return reasons',
    onTap: () {
      print('Posts');
    },
  ),
  SettingListData(
    icon: Icons.person,
    title: 'Taxes',
    subtitle: 'Manage taxes',
    onTap: () {
      print('Taxes');
    },
  ),
];

class SettingListData {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  SettingListData(
      {required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap
    });
}

class SettingListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Function onTap;

  const SettingListTile(
      {Key? key,
      required this.icon,
      required this.title,
      required this.subtitle,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(icon),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        onTap: () {
          onTap();
        },
      ),
    );
  }
}
