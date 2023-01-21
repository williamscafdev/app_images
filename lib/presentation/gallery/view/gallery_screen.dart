import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/core.dart';
import 'gallery_vm.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GalleryViewModel>(
      create: (BuildContext screenContext) => GalleryViewModel(),
      child: Consumer<GalleryViewModel>(
        builder: (_, GalleryViewModel viewModel, __) => Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'gallery.title'.tr(),
            ),
          ),
          body: viewModel.images.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                  ),
                  child: GridView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: viewModel.images.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: viewModel.isMosaico ? 2 : 1,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1,
                        crossAxisSpacing: 16,
                      ),
                      itemBuilder: (context, index) {
                        return Image.file(
                          File(viewModel.images[index]),
                          fit: BoxFit.cover,
                          errorBuilder: (BuildContext context, Object exception,
                              StackTrace? stackTrace) {
                            return Center(
                              child: Image.asset(
                                ImgA.notImage.path,
                                height: 120,
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        );
                      }),
                )
              : const SizedBox.shrink(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.blue200,
            onPressed: () {
              viewModel.isMosaico = !viewModel.isMosaico;
            },
            child: Icon(
              viewModel.isMosaico
                  ? Icons.auto_awesome_motion_rounded
                  : Icons.auto_awesome_mosaic_rounded,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
