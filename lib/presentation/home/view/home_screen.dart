import 'package:app_images/core/core.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../home.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeViewModel>(
      create: (BuildContext screenContext) => HomeViewModel(),
      child: Consumer<HomeViewModel>(
        builder: (_, HomeViewModel viewModel, __) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'home.title'.tr(),
            ),
            actions: [
              IconButton(
                onPressed: () => context.push(AppRoutes.routeLogin),
                icon: const Icon(
                  Icons.logout,
                  color: AppColors.red100,
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: padSy16,
              child: Column(
                children: [
                  InputLoadImage(
                    controller: viewModel.controllerUploadImage,
                    onPressed: viewModel.getImagePreview,
                  ),
                  gap16,
                  ImagePreviewDownload(
                    urlImage: viewModel.urlImage,
                    isNetwork: viewModel.isNetwork,
                  ),
                  gap16,
                  ButtonSaveImage(
                    onPressed: viewModel.saveImage,
                    hasImgUrl: viewModel.hasImgUrl,
                    messageError: viewModel.error,
                  ),
                  gap16,
                  ImagesPreview(
                    imagesPath: viewModel.images,
                    onView: viewModel.onViewImage,
                    onDeleteImage: viewModel.deleteImage,
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.ambar300,
            onPressed: () => context.push(AppRoutes.routeGallery),
            child: const Icon(
              Icons.image_search_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
