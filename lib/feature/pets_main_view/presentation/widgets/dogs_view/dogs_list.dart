import 'package:assesment_app/core/common/widgets/app_buttons.dart';
import 'package:assesment_app/core/common/widgets/error_widget.dart';
import 'package:assesment_app/core/common/widgets/loader.dart';
import 'package:assesment_app/core/common/widgets/no_data_widget.dart';
import 'package:assesment_app/core/extension/responsive_extension.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/manager/pets_manager.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/widgets/dogs_view/dogs_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DogsList extends ConsumerWidget {
  const DogsList({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(getDogsProvider);
    return provider.when(
        data: (data) {
          return data.fold(
            (failure) {
              return AppErrorWidget(
                widget: failure.errorWidget ?? const NoDataWidget(),
                errorTitle: failure.title,
                message: failure.message,
                onRetryPressed: () => ref.refresh(getDogsProvider.future),
              );
            },
            (dogsList) {
              return Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.screenWidth * 0.02),
                      child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: dogsList.length + 1,
                          padding: EdgeInsets.only(top: context.paddingFromTop),
                          physics: const BouncingScrollPhysics(),
                          separatorBuilder: (context, index) {
                            return Container(
                              height: context.dividerHeight,
                            );
                          },
                          itemBuilder: (context, i) {
                            if (i >= dogsList.length) {
                              if (context.showButtonAtBottomOfTheScreen(
                                  listLength: dogsList.length)) {
                                return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: AppButton(
                                        onPressed: () {},
                                        title: 'Button under the list '));
                              } else {
                                return const SizedBox();
                              }
                            }
                            return DogsItemWidget(
                              imageUrl: dogsList[i].url,
                              breed: dogsList[i].breeds,
                            );
                          }),
                    ),
                  ),
                  !context.showButtonAtBottomOfTheScreen(
                          listLength: dogsList.length)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            AppButton(
                              onPressed: () {},
                              title: 'Button At the Bottom',
                            )
                          ],
                        )
                      : const SizedBox()
                ],
              );
            },
          );
        },
        error: (erros, s) {
          return const NoDataWidget();
        },
        loading: () => const Loader(
              height: 40,
              width: 40,
            ));
  }
}
