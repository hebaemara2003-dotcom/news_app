import '../utils/app_assets.dart';

class Category{
  String id;
  String title;
  String image;

  Category({required this.id,
  required this.title,
  required this.image});
  /*business entertainment general
  health science sports technology

   */
static List<Category> getCategoriesList(bool isDark){
  return [
    Category (
      id: 'general',
      title: 'General',
      image: isDark ? AppAssets.generalLightImage :
          AppAssets.generalDarkImage
    ),
    Category (
        id: 'business',
        title: 'Business',
        image: isDark ? AppAssets.busniessLightImage :
        AppAssets.busniessDarkImage
    ),
    Category (
        id: 'sports',
        title: 'Sports',
        image: isDark ? AppAssets.sportLightImage :
        AppAssets.sportDarkImage
    ),
    Category (
        id: 'technology',
        title: 'Technology',
        image: isDark ? AppAssets.technologyLightImage :
        AppAssets.technologyDarkImage
    ),
    Category (
        id: 'health',
        title: 'Health',
        image: isDark ? AppAssets.helthLightImage :
        AppAssets.helthDarkImage
    ),
    Category (
        id: 'entertainment',
        title: 'Entertainment',
        image: isDark ? AppAssets.entertainmentLightImage :
        AppAssets.entertainmentDarkImage
    ),
    Category (
        id: 'science',
        title: 'science',
        image: isDark ? AppAssets.scienceLightImage :
        AppAssets.scienceDarkImage
    ),
  ];
}
}