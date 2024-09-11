import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:online_cv/core/init/lang/product_localization.dart';
import 'package:online_cv/product/enums/lang_enums.dart';
import 'package:online_cv/product/provider/all_provider.dart';
import 'package:online_cv/service/firebase_service.dart';

class LanguageCombobox extends ConsumerStatefulWidget {
  const LanguageCombobox({super.key});

  @override
  ConsumerState<LanguageCombobox> createState() => _LanguageComboboxState();
}

class _LanguageComboboxState extends ConsumerState<LanguageCombobox> {
  
  late List<CountryFlag> countryFlags;

  @override
  void initState() {
  
    super.initState();
    countryFlags = [];
    for(LanguageEnums lang in LanguageEnums.values)
    {
      countryFlags.add(CountryFlag.fromCountryCode(lang.countryCode, shape: const RoundedRectangle(6),));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    
    return  _dropButton();
  }
    _dropButton()
  {
    LanguageEnums activeLang = ref.watch(provideLanguage);

     CountryFlag _selectedValue = countryFlags.where((e)=> e.flagCode == activeLang.countryCode).toList().first;

   return Theme(
       data: Theme.of(context).copyWith(
         buttonTheme: ButtonTheme.of(context).copyWith(
           alignedDropdown: true,  
         )
       ),
       child: DropdownButtonHideUnderline( 
         child: DropdownButton<CountryFlag>(
           borderRadius: BorderRadius.circular(6),
           padding: EdgeInsets.zero,
           items: countryFlags.map((CountryFlag value){
             return DropdownMenuItem<CountryFlag>(
               value: value,
               child: _label(countryCode: value.flagCode!),
             );
           }).toList(),
           onChanged: (CountryFlag? flag) async{
                       if(flag != null)
                       {
                         LanguageEnums lang = LanguageEnums.values.where((e)=> e.countryCode == flag.flagCode).toList().first;
                           ProductLocalization.updateLanguage(context: context, value: lang);
                           ref.read(provideLanguage.notifier).state = lang;
                           LanguageEnums activeLang = ref.watch(provideLanguage);
                           await FirebaseService().getPrograms(activeLang).then((value)
                           {
                             ref.read(provideProgramList.notifier).state = value;
                           });
                           await FirebaseService().getAbout(activeLang).then((value)
                           {
                             ref.read(provideAbout.notifier).state = value;
                           });
                     
                           await FirebaseService().getExperience(activeLang).then((value)
                           {
                             ref.read(provideExperienceList.notifier).state = value;
                           });
                           await FirebaseService().getReferences(activeLang).then((value)
                            {
                              ref.read(provideReferences.notifier).state = value;
                            });
                            await FirebaseService().getResume(activeLang).then((value)
                            {
                              ref.read(provideResume.notifier).state = value;
                            });
                       }
                       
                     },
           value: _selectedValue,  // displaying the selected value
         ),
       )
   );
  }


  Widget _label({required String countryCode})
  {
    return SizedBox(
            width: 28,
            height: 18,
            child: Center(
              child: AspectRatio(
              aspectRatio: 1.8,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: CountryFlag.fromCountryCode(countryCode, shape: const RoundedRectangle(6),),
              ),
                        ),
            ),
    );
  }
}

