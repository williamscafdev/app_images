import 'package:app_images/core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../home.dart';
import '../widget/widget.dart';

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
              title: const Text(
                'Inicio',
              ),
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
              onPressed: () {},
              child: const Icon(
                Icons.image_search_rounded,
                color: AppColors.white,
              ),
            )),
      ),
    );
  }
}
