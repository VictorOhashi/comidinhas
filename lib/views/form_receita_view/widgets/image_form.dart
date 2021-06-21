import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'submit_button.dart';

const String ImagemValueKey = 'imageFile';

class ImageForm extends StatefulWidget {
  final void Function(Map<String, dynamic> data) onSubmit;
  final void Function(Map<String, dynamic> data) onReturn;

  final Map<String, dynamic> initialValue;

  const ImageForm({
    Key? key,
    required this.onSubmit,
    required this.onReturn,
    required this.initialValue,
  }) : super(key: key);

  @override
  _ImageFormState createState() => _ImageFormState();
}

class _ImageFormState extends State<ImageForm> {
  File? _image;
  final picker = ImagePicker();

  Future selectImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void showModalImagePicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Wrap(children: [
        ListTile(
          leading: Icon(Icons.camera_alt),
          title: Text('Camera'),
          onTap: () {
            Navigator.pop(context);
            selectImage(ImageSource.camera);
          },
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Gallery'),
          onTap: () {
            Navigator.pop(context);
            selectImage(ImageSource.gallery);
          },
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    final boxSize = MediaQuery.of(context).size.width * 0.7;
    final imageUrl = widget.initialValue['imagem'];

    return Center(
      child: Column(
        children: [
          Text(
            'Adicione uma imagem:',
            style: Theme.of(context).textTheme.headline3,
          ),
          SizedBox(height: 15),
          InkWell(
            onTap: () => showModalImagePicker(context),
            child: Container(
              margin: EdgeInsets.all(15),
              height: boxSize,
              width: boxSize,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 20),
              ),
              child: _image == null
                  ? imageUrl == null
                      ? Icon(
                          Icons.add,
                          size: 50,
                        )
                      : Image.network(
                          imageUrl,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        )
                  : Image.file(
                      _image!,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(height: 15),
          SubmitButton(
            text: "Finalizar",
            onSubmit: () {
              widget.onSubmit({ImagemValueKey: _image});
            },
            onReturn: () => widget.onReturn({ImagemValueKey: _image}),
          ),
        ],
      ),
    );
  }
}
