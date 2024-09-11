
enum NetworkPath{
  about,
  experience,
  program,
  resume,
  references


}

extension NetworkPathExtension on NetworkPath
{

  String get getPath
  {
    switch(this)
    {
      case NetworkPath.about:
        return '/about';
      case NetworkPath.experience:
        return '/experience';
      case NetworkPath.program:
        return '/programs';
      case NetworkPath.resume:
        return '/resume';
      case NetworkPath.references:
        return '/references';


    }
  }

  String get getNetworkPath => "$getPath.json";



}