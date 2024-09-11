part of '../about_view.dart';

class _PersonalInfo extends StatelessWidget {
  const _PersonalInfo({required this.about});
  final About? about;
  @override
  Widget build(BuildContext context) {
    return _body(context);
  }


    Widget  _body(BuildContext context)
   {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextTitleLarge(text: about?.profession ?? ""/* , color: ConsColor.titleTextColor */,),
              ),
              const Padding(
                padding:  EdgeInsets.all(8.0),
                child: TextTitleSmall(text: LocaleKeys.general_personalInfo, isMultiLang: true,),
              ),
              context.width < ConsApplication.DESKTOPWIDTH ? _mobileInfo() : _desktopInfo()
        
      ],
    );
   }

   _desktopInfo()
   {
    return   Column(
      children: [
        Row(
          children: [
            Expanded(child: _personalInfo(title: LocaleKeys.general_birthday, value: about?.birthday ?? ""),),
            
            Expanded(child: _personalInfo(title: LocaleKeys.general_degree, value: about?.degree ?? ""),),

            
          ],
        ),
        Row(
          children: [
            Expanded(child: _personalInfo(title: LocaleKeys.general_militaryService, value: about?.militaryService ?? ""),),

            
            Expanded(child: _personalInfo(title: LocaleKeys.general_drivingLicence, value: about?.drivingLicence ?? ""),),

            
          ],
        ),
        Row(
          children: [
            Expanded(child: _personalInfo(title: LocaleKeys.general_phone, value: about?.phone ?? ""),),

            
            Expanded(child: _personalInfo(title: LocaleKeys.general_eMail, value: about?.email ?? ""),),

            
          ],
        ),
        Row(
          children: [
            Expanded(child: _personalInfo(title: LocaleKeys.general_freelance, value: about?.freelance ?? ""),),

            
            Expanded(child: _personalInfo(title: LocaleKeys.general_city, value: about?.city ?? ""),),

            
          ],
        )
      ],
    );
   }

   _mobileInfo()
   {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Column(
        children: [
          _personalInfo(title: LocaleKeys.general_birthday, value: about?.birthday ?? ""),
          _personalInfo(title: LocaleKeys.general_degree, value: about?.degree ?? ""),
          _personalInfo(title: LocaleKeys.general_militaryService, value: about?.militaryService ?? ""),
          _personalInfo(title: LocaleKeys.general_drivingLicence, value: about?.drivingLicence ?? ""),
          _personalInfo(title: LocaleKeys.general_phone, value: about?.phone ?? ""),
          _personalInfo(title: LocaleKeys.general_eMail, value: about?.email ?? ""),
          _personalInfo(title: LocaleKeys.general_freelance, value: about?.freelance ?? ""),
          _personalInfo(title: LocaleKeys.general_city, value: about?.city ?? "")
        ],
      ),
    );
   }

   _personalInfo({required String title, required String value})
   {
    return  Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(children: [
        Icon(IconEnums.substance.icon),
        TextBodyMedium(text: title, fontWeight: FontWeight.bold,/*  color: Colors.white, */ isMultiLang: true,),
        const TextBodyMedium(text: ":"),
        const SizedBox(width: 10,),
        Expanded(child: TextBodyMedium(text: value, textOverflow: TextOverflow.ellipsis, fontWeight: FontWeight.w400, /* color: Colors.white54, */))
      
      ],),
    );
   }
}
