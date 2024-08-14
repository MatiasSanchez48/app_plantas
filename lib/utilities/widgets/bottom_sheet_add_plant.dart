import 'dart:io';

import 'package:app_plantas/extensions/extensions.dart';
import 'package:app_plantas/features/dashboard/home/bloc/bloc_home.dart';
import 'package:app_plantas/models/models.dart';
import 'package:app_plantas/utilities/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheetAddPlant extends StatefulWidget {
  const BottomSheetAddPlant({super.key});

  @override
  State<BottomSheetAddPlant> createState() => _BottomSheetAddPlantState();
}

class _BottomSheetAddPlantState extends State<BottomSheetAddPlant>
    with SingleTickerProviderStateMixin {
  final FocusNode _focusNodeDescription = FocusNode();
  final FocusNode _focusNodeName = FocusNode();
  final _controllerDescription = TextEditingController();
  final _controllerName = TextEditingController();
  late final AnimationController _animationController;
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _animationController = BottomSheet.createAnimationController(this);
    _focusNodeName.addListener(
      () => setState(() {}),
    );
    _focusNodeDescription.addListener(
      () => setState(() {}),
    );
  }

  @override
  void dispose() {
    _focusNodeDescription.dispose();
    _focusNodeName.dispose();
    _controllerDescription.dispose();
    _animationController.dispose();
    _controllerName.dispose();
    _images.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return BottomSheet(
      onClosing: () {},
      animationController: _animationController,
      builder: (context) => GestureDetector(
        onTap: () {
          _focusNodeName.unfocus();
          _focusNodeDescription.unfocus();
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: _focusNodeDescription.hasFocus || _focusNodeName.hasFocus
              ? 750
              : 460,
          child: GestureDetector(
            onTap: () {
              _focusNodeName.unfocus();
              _focusNodeDescription.unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  Container(
                    width: 150,
                    height: 5,
                    decoration: BoxDecoration(
                      color: colors.secondary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PlantsTextFormField(
                      focusNode: _focusNodeName,
                      enabledBorder: InputBorder.none,
                      controller: _controllerName,
                      keyboardType: TextInputType.text,
                      hintText: 'Name...', // TODO: Add translations.
                    ),
                  ),
                  const SizedBox(height: 5),
                  Divider(
                    color: colors.greyNotImage,
                    thickness: 3,
                    endIndent: 25,
                    indent: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: PlantsTextFormField(
                      focusNode: _focusNodeDescription,
                      enabledBorder: InputBorder.none,
                      controller: _controllerDescription,
                      keyboardType: TextInputType.text,
                      hintText:
                          'Write Description...', // TODO: Add translations.
                      maxLines: 5,
                    ),
                  ),
                  Divider(
                    color: colors.greyNotImage,
                    thickness: 3,
                    endIndent: 25,
                    indent: 25,
                  ),
                  const SizedBox(height: 20),
                  _AddImages(
                    onImages: (p0) => setState(() => _images = p0),
                  ),
                  const SizedBox(height: 20),
                  _ButtonsCreateAndCancel(
                    controllerName: _controllerName,
                    controllerDescription: _controllerDescription,
                    images: _images,
                  ),
                  SizedBox(
                    height: _focusNodeDescription.hasFocus ||
                            _focusNodeName.hasFocus
                        ? 300
                        : 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _AddImages extends StatefulWidget {
  const _AddImages({required this.onImages});

  final void Function(List<File>) onImages;

  @override
  State<_AddImages> createState() => _AddImagesState();
}

class _AddImagesState extends State<_AddImages> {
  final ImagePicker _picker = ImagePicker();
  List<File> _images = [];

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      _images.add(File(pickedFile.path));
      widget.onImages(_images);
      setState(() {});
    }
  }

  Future<void> _pickImages() async {
    final pickedFiles = await _picker.pickMultiImage();

    if (pickedFiles.isNotEmpty) {
      _images = pickedFiles.map((pickedFile) => File(pickedFile.path)).toList();
      widget.onImages(_images);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (_images.isEmpty)
          SizedBox(
            height: 60,
            child: Center(
              child: Text(
                'No images selected.', // TODO: Add translations.
                style: TextStyle(
                  color: colors.onBackground,
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ),
          )
        else
          Scrollbar(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _images
                    .map(
                      (image) => _ImageWithRemove(
                        image: image,
                        onRemoveImage: (v) {
                          _images.remove(v);
                          widget.onImages(_images);
                          setState(() {});
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            PlantsBotton(
              backgoundColor: colors.background,
              onPressed: _pickImages,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.photo_outlined,
                    size: 30,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Select Image', // TODO: Add translations.
                    style: TextStyle(
                      color: colors.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            PlantsBotton(
              backgoundColor: colors.background,
              onPressed: _pickImageFromCamera,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_alt_rounded,
                    color: colors.primary,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Capture Image', // TODO: Add translations.
                    style: TextStyle(
                      color: colors.onBackground,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ImageWithRemove extends StatelessWidget {
  const _ImageWithRemove({
    required this.image,
    required this.onRemoveImage,
  });

  final File image;

  final void Function(File image) onRemoveImage;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Stack(
      children: [
        GestureDetector(
          onTap: () => openImage(
            image: Image.file(image),
            tag: image.path,
            context,
          ),
          child: PlantsImage(
            image: FileImage(image),
            tag: image.path,
            height: 60,
            width: 60,
          ),
        ),
        Positioned(
          top: -15,
          right: -15,
          child: IconButton(
            onPressed: () => onRemoveImage(image),
            icon: Icon(
              Icons.close,
              color: colors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

class _ButtonsCreateAndCancel extends StatelessWidget {
  const _ButtonsCreateAndCancel({
    required this.controllerDescription,
    required this.controllerName,
    required this.images,
  });

  final TextEditingController controllerDescription;
  final TextEditingController controllerName;

  final List<File> images;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: 20),
          Expanded(child: PlantsBotton.cancel(context)),
          const SizedBox(width: 20),
          Expanded(
            child: PlantsBotton(
              onPressed: () {
                context.read<BlocHome>().add(
                      BlocHomeEventCreatePlant(
                        newPlant: Plant(
                          color:
                              '', // TODO(anyone): Add logic to color in plant
                          descripcion: controllerDescription.text,
                          name: controllerName.text,
                        ),
                        images: images,
                      ),
                    );

                Navigator.of(context).pop();
              },
              text: 'Create', // TODO: Add translations.
            ),
          ),
          const SizedBox(width: 20),
        ],
      );
}
