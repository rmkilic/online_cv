part of '../about_view.dart';

class _SkillsInfo extends ConsumerStatefulWidget {
  const _SkillsInfo({required this.skills});
  final List<Skill> skills;

  @override
  ConsumerState<_SkillsInfo> createState() => _SkillsInfoState();
}

class _SkillsInfoState extends ConsumerState<_SkillsInfo> {
  @override
  Widget build(BuildContext context) {
    
    return context.width < ConsApplication.DESKTOPWIDTH ? _bodyMobile : _bodyDesktop;
  }

  Widget get _bodyMobile
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextTitleLarge(text: LocaleKeys.general_skills, isMultiLang: true, /* color: ConsColor.titleTextColor, */),
              ),
             
        Expanded(
          child: ListView.builder(
            itemCount: widget.skills.length,
            padding: const EdgeInsets.only(left: 8),                
            itemBuilder: (context, index) => skillView(widget.skills[index]),
                   
          ),
        ),
      ],
    );
  }

  Widget get _bodyDesktop
  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
                padding: EdgeInsets.all(8.0),
                child: TextTitleLarge(text: LocaleKeys.general_skills, isMultiLang: true,/*  color: ConsColor.titleTextColor, */),
              ),
             
        Expanded(
          child: LayoutBuilder(
            builder: (ctx, constrain) {
              double aspect = (constrain.maxWidth /2) / (constrain.maxHeight / (widget.skills.length / 2).ceilToDouble());
              return GridView.builder(
                itemCount: widget.skills.length,
                padding: EdgeInsets.zero,
                
                       gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: aspect),
              itemBuilder: (ctx, index) => skillView(widget.skills[index]),
                       
              );
            }
          ),
        ),
      ],
    );
  }

  Widget skillView( Skill skill) {
    ref.watch(provideThemeLight);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [        
              TextBodyMedium(text: skill.name,fontWeight: FontWeight.bold, /*  color: ConsColor.subTextColor */),
              TextBodyMedium(text: "${skill.level}%", fontWeight: FontWeight.bold,/*  color: ConsColor.subTextColor */),
            ],          
          ),
          Row(
            children: [
              Expanded(
                flex: skill.level,
                child: Container(
                  height: 5.0,
                  color: context.dividerColor,
                  child: const SizedBox(),
                ),
              ),
              Expanded(
                flex: 100 - skill.level,
                child: Container(
                  height: 5.0,
                  color: context.dividerColor.withOpacity(.4),
                  child: const SizedBox(),
                ))
            
            ],
          )
        ],
      ),
    );
  }
}