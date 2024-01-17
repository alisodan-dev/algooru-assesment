import 'package:assesment_app/core/common/widgets/error_widget.dart';
import 'package:assesment_app/core/common/widgets/loader.dart';
import 'package:assesment_app/core/common/widgets/no_data_widget.dart';
import 'package:assesment_app/core/extension/responsive_extension.dart';
import 'package:assesment_app/core/utils/assets_manager.dart';
import 'package:assesment_app/feature/pets_main_view/presentation/manager/pets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CatsGrid extends ConsumerWidget {
  const CatsGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(getCatsProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        data.when(
            data: (data) => data.fold(
                  (failure) => AppErrorWidget(
                    widget: failure.errorWidget ?? const NoDataWidget(),
                    errorTitle: failure.title,
                    message: failure.message,
                    onRetryPressed: () => ref.refresh(getCatsProvider.future),
                  ),
                  (success) => Expanded(
                    child: GridView.builder(
                        itemCount: success.length,
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: context.screenWidth / 2,
                          childAspectRatio: 1,
                        ),
                        itemBuilder: (context, index) {
                          return GridTile(
                              child: FadeInImage.assetNetwork(
                            image: success[index].url,
                            fit: BoxFit.cover,
                            placeholder: AssetsManager.catLoading,
                            placeholderFit: BoxFit.scaleDown,
                          ));
                        }),
                  ),
                ),
            error: (erros, s) {
              return const NoDataWidget();
            },
            loading: () => const Loader(
                  height: 40,
                  width: 40,
                ))
      ],
    );
  }
}
