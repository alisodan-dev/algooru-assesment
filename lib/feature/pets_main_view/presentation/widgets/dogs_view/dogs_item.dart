import 'package:assesment_app/core/extension/responsive_extension.dart';
import 'package:assesment_app/core/utils/assets_manager.dart';
import 'package:assesment_app/core/utils/themes/font_manager.dart';
import 'package:assesment_app/feature/pets_main_view/domain/entities/breed_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DogsItemWidget extends StatelessWidget {
  const DogsItemWidget({
    super.key,
    required this.imageUrl,
    required this.breed,
  });
  final String imageUrl;
  final List<BreedEntity> breed;
  @override
  Widget build(BuildContext context) {
    final breedName = breed.map((e) => e.name).toList().join(' - ');
    final String breedDescription =
        breed.map((e) => e.description ?? e.temperament).toList().join(' - ');
    return SizedBox(
      height: context.listItemHeight,
      child: GridTile(
        footer: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          color: Colors.black45,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              2.h.vSpace,
              Text(
                breedName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: FontManagerStyle().mediumTextStyle,
              ),
              2.h.vSpace,
              Text(
                breedDescription,
                maxLines: 4,
                style: FontManagerStyle().subtitleTextStyle,
                overflow: TextOverflow.ellipsis,
              ),
              6.h.vSpace,
            ],
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(.2),
          child: FadeInImage.assetNetwork(
            height: context.listItemHeight,
            fit: BoxFit.cover,
            image: imageUrl,
            placeholder: AssetsManager.dogRunner,
            placeholderFit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
