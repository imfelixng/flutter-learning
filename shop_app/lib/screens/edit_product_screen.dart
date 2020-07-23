import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';

class EditUserProduct extends StatefulWidget {
  static const routeName = '/edit_user_product';

  @override
  _EditUserProductState createState() => _EditUserProductState();
}

class _EditUserProductState extends State<EditUserProduct> {
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imgURLFocusNode = FocusNode();
  final _imgURLController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var _editedProdcut = Product(
    id: null,
    title: '',
    description: '',
    imageUrl: '',
    price: null,
  );

  @override
  void initState() {
    _imgURLFocusNode.addListener(_updateImageURL);
    super.initState();
  }

  @override
  void dispose() {
    _imgURLFocusNode.removeListener(_updateImageURL);

    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imgURLFocusNode.dispose();

    _imgURLController.dispose();
    super.dispose();
  }

  void _updateImageURL() {
    if (!_imgURLFocusNode.hasFocus) {
      // rebuild widget
      var validURL = true;
      if (_imgURLController.text.isEmpty) {
        validURL = false;
      }
      if (!_imgURLController.text.startsWith('http') && !_imgURLController.text.startsWith('https')) {
        validURL = false;
      }
      if (!_imgURLController.text.endsWith('.png') && !_imgURLController.text.endsWith('.jpg') && !_imgURLController.text.endsWith('.jpeg')) {
        validURL = false;
      }

      if (validURL) {
        setState(() {});
      }
    }
  }

  void _saveForm() {
    var isValid = _formKey.currentState.validate();
    if (!isValid) {
      _formKey.currentState.save();
      Provider.of<Products>(context, listen: false).addProduct(_editedProdcut);
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            tooltip: 'Save',
            color: Colors.white,
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                    hintText: 'Enter title of product',
                  ),
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  autofocus: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter title for product';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedProdcut = Product(
                      title: value,
                      description: _editedProdcut.description,
                      imageUrl: _editedProdcut.imageUrl,
                      price: _editedProdcut.price,
                      id: _editedProdcut.id,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Price',
                    hintText: 'Enter price of product',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  focusNode: _priceFocusNode,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter price for product.';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number.';
                    }
                    if (double.parse(value) < 0) {
                      return 'Please enter a number greater and equal zero.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedProdcut = Product(
                      title: _editedProdcut.title,
                      description: _editedProdcut.description,
                      imageUrl: _editedProdcut.imageUrl,
                      price: double.parse(value),
                      id: _editedProdcut.id,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter description of product',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.multiline,
                  focusNode: _descriptionFocusNode,
                  maxLines: 3,
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_imgURLFocusNode);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter description for product';
                    }
                    if (value.length < 10) {
                      return 'Product\'s description should be have at least 10 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _editedProdcut = Product(
                      title: _editedProdcut.title,
                      description: value,
                      imageUrl: _editedProdcut.imageUrl,
                      price: _editedProdcut.price,
                      id: _editedProdcut.id,
                    );
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      margin: EdgeInsets.only(top: 8, right: 10),
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                      ),
                      child: _imgURLController.text.isEmpty
                          ? Text('Enter a URL')
                          : FittedBox(
                              child: Image.network(
                                _imgURLController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Image URL',
                        ),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imgURLController,
                        focusNode: _imgURLFocusNode,
                        onFieldSubmitted: (_) => _saveForm(),
                        onSaved: (value) {
                          _editedProdcut = Product(
                            title: _editedProdcut.title,
                            description: _editedProdcut.description,
                            imageUrl: value,
                            price: _editedProdcut.price,
                            id: _editedProdcut.id,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter image URL for product.';
                          }
                          if (!value.startsWith('http') && !value.startsWith('https')) {
                            return 'Please enter a valid URL.';
                          }
                          if (!value.endsWith('.png') && !value.endsWith('.jpg') && !value.endsWith('.jpeg')) {
                            return 'Please enter a valid image URL.';
                          }
                          return null;
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
