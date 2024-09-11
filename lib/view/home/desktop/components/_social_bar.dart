part of '../desktop_home_page_view.dart';

Method method = Method();


class _SocialBar extends StatelessWidget {
  const _SocialBar({required this.size});
  final Size size;

  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                    width: size.width * 0.09,
                    height: size.height - 82,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const LanguageWidget(),
                        const Spacer(),
                        IconButton(
                            icon: Icon(IconEnums.github.icon),                            
                            onPressed: () {
                              method.launchURL(ConsApplication.GITHUBADRESS);
                            }),
                        
                        IconButton(
                          icon: Icon(IconEnums.linkedin.icon),
                          
                          onPressed: () {
                            method.launchURL(ConsApplication.LINKEDINADRESS);
                          },
                          iconSize: 16.0,
                        ),
                        
                        IconButton(
                            icon: Icon(IconEnums.mail.icon),
                           
                            onPressed: () {
                              method.launchEmail();
                            }),
                            IconButton(
                            icon: Icon(IconEnums.instagram.icon),
                            
                            onPressed: () {
                              method.launchURL(ConsApplication.INSTAGRAMADRESS);
                            }),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: SizedBox(
                            height: size.height * 0.20,
                            width: 2,
                            child: const VerticalDivider(),
                          ),
                        ),
                      ],
                    ),
                  );
                  
  }
}