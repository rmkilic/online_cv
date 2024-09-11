part of '../projects_view.dart';

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.program});
  final Program program;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 300
        ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                context.width < ConsApplication.DESKTOPWIDTH ?  _mobile() : _desktop()               
              ],
            ),
          ),
        ),
      ),
    );
  }
  _mobile()
  {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: AspectRatio(aspectRatio: 3.2,
          child: _image(),),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            minHeight: 200
          ),
          child: _description())
      ],
    );
  }
  _desktop()
  {
    return Row(
                 children: [
                   Expanded(child: _image()),
                   const SizedBox(width: 10,),
                   Expanded(
                     flex: 4,
                     child: _description())
                 ],
               );
  }
  _image()
  {
    return (program.images?? "").isEmpty ? const SizedBox() : ImageFromFirebaseStorage(imageUrl: program.images ?? "",);
  }

  _description()
  {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          minHeight: 300
        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: TextTitleLarge(text: program.name, letterSpacing: 1.2, /* color: ConsColor.titleTextColor, */)),
                           
                            TextTitleMedium(text: program.description,/*  color: ConsColor.subTextColor, */),
                            _featuresWidget(program.features ?? ""),
                            TextTitleSmall(text: program.platform,/*  color: ConsColor.subTextColor, */)
                            
                          ],
                        ),
                      );
  }

  _featuresWidget(String features)
  {
    List<String> featureList = features.split('-');
    featureList.removeAt(0);
    return Column(
      children: List.generate(featureList.length, (index) => _featureItem(featureList[index]) ),
    );
  }
  _featureItem(String feature)
  {
    return ListTile(
      leading: Icon(IconEnums.substance.icon, ),
      title: TextTitleMedium(text: feature,/*  color: ConsColor.subTextColor, */),
    );
  }


}