// ignore_for_file: must_be_immutable

part of '../mobile_home_view.dart';

class _Drawer extends StatefulWidget {
   _Drawer({required this.autoScrollController});
  final AutoScrollController autoScrollController;

  @override
  State<_Drawer> createState() => _DrawerState();
}

class _DrawerState extends State<_Drawer> {

    


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: 
      
      Column(
        children: [
          _drawerHeader,
          Expanded(
            child: ListView(
              children: _tabs,
            ),
          ),
          
        ]
      ),
    );
  }

  Widget get _drawerHeader
  {
    return SizedBox(
            height: 300,
            
            child: Column(
              children: [
                _profileImage,
                _links
              ],
            ),
          );
  }

  Widget get _profileImage
  {
    return  Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: ClipOval(
                    child: Container(
                      height: 140,
                      width: 130,
                      color: context.dividerColor.withOpacity(.3),
                      child: const Center(
                        child: ClipOval(
                          child: SizedBox(
                                      height: 130,
                                      width: 120,
                                      child: AspectRatio(
                                        aspectRatio: 3.2,
                                        child: ProfileImage(),),
                                    ),
                        ),
                      ),
                    ),
                  ),
                );
  }

  Widget get _links
  {
    return Column(
      children: [
        const TextTitleMedium(text: LocaleKeys.general_links, isMultiLang:true),
        const SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _linkItem(icon: IconEnums.github.icon, onTap: _openGithub),
                        _linkItem(icon: IconEnums.linkedin.icon, onTap: _openLinkedin),
                        _linkItem(icon: IconEnums.mail.icon, onTap: _openMail),
                        _linkItem(icon: IconEnums.instagram.icon, onTap: _openInstagram),
                      ],
                    )
      ],
    );
  }

  _linkItem({required IconData icon, required VoidCallback? onTap})
  {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: context.dividerColor.withOpacity(.2)),
              child: Icon(icon),
              ),
        ),
    );
  }

  _openGithub()=> method.launchURL("https://github.com/rmkilic");

  _openLinkedin()=> method.launchURL("https://www.linkedin.com/in/rauf-kilicarslan-471669154/");

  _openMail()=> method.launchEmail();

  _openInstagram()=> method.launchURL("https://www.instagram.com/mumin_kilicarslan/");

    List<String> tabMenuItem = [
    LocaleKeys.general_about,
    LocaleKeys.general_experience,
    LocaleKeys.general_references,
    LocaleKeys.general_resume,
    LocaleKeys.general_projects
  ];

  List<Widget> get _tabs
  {
    return 
    List.generate(tabMenuItem.length, (int index)=> CustomTabItem(index: index, autoScrollController: widget.autoScrollController,));
    //_tabItems(index));
  }



}