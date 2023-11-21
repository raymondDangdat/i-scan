// import 'dart:convert';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hash_it/resources/constants/string_constants.dart';
// import 'package:hash_it/ui/shortcuts/marketplace/marketplace_main_screens/marketplace_main_screen.dart';
// import 'package:hash_it/ui/shortcuts/savings/lock_savings/lock_savings_screen.dart';
// import '../model/product_categories_model.dart';
// import '../model/products_model.dart';
// import '../model/saved_product_model.dart';
// import '../model/single_product_model.dart';
// import '../model/store_model.dart';
// import '../resources/constants/connectivity.dart';
// import '../resources/constants/endpoints.dart';
// import 'package:http/http.dart' as http;
//
// class MarketplaceNonEarnersProvider extends ChangeNotifier {
//
//
//   String _resMessage = "";
//   String get resMessage => _resMessage;
//
//
//   ActiveLockSavingPlans? _selectedLockSavingPlan;
//   ActiveLockSavingPlans? get selectedLockSavingPlan => _selectedLockSavingPlan;
//
//   void updateActiveLockSavingPlan(ActiveLockSavingPlans? plan){
//     _selectedLockSavingPlan = plan;
//     notifyListeners();
//   }
//
//   bool _isFromStash = true;
//   bool get isFromStash => _isFromStash;
//
//   void updateIsFromStash(bool value){
//     _isFromStash = value;
//     notifyListeners();
//   }
//
//
//   final storeNameController = TextEditingController();
//   final locationAddressController = TextEditingController();
//   final descriptionController = TextEditingController();
//
//
//   MarketplaceTabs _selectedMarketplaceTab = marketplaceTabs[0];
//   MarketplaceTabs get selectedMarketplaceTab => _selectedMarketplaceTab;
//   void changeSelectedMarketplaceTab(MarketplaceTabs tab){
//     _selectedMarketplaceTab = tab;
//     _selectedMyProductTab = allProducts;
//     notifyListeners();
//   }
//
//
//   ProductCategoriesModel? _productCategoryModel;
//   ProductCategoriesModel? get productCategoryModel => _productCategoryModel;
//   bool _gettingProductCategories = false;
//   bool get gettingProductCategories => _gettingProductCategories;
//   ProductCategoryData? _selectedProductCategory;
//   ProductCategoryData? get selectedProductCategory => _selectedProductCategory;
//   void updateSelectedProductCategory(ProductCategoryData? category){
//     _selectedProductCategory = category;
//     _products = [];
//     _products = _productsModel!.data.where((product) => product.category.name == _selectedProductCategory?.name).toList();
//     notifyListeners();
//   }
//   List<ProductCategoryData> _productCategories = [];
//   List<ProductCategoryData> get productCategories => _productCategories;
//   Future<bool> getProductCategories({
//     required String token,
//   }) async {
//     bool productCategoriesFetched = false;
//     debugPrint("TOKEN: $token ${'$basedURL/$productCategoriesEndpoint'}");
//     final connected = await connectionChecker();
//     if (connected) {
//       if(_productCategories.isEmpty){
//         _gettingProductCategories = true;
//         notifyListeners();
//       }
//
//       try {
//         final response =
//         await http.get(Uri.parse("$basedURL/$productCategoriesEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             } );
//         // print("Product categories  response: ${response.body}");
//         // print("Product categories Status Code: ${response.statusCode}");
//         final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           _productCategoryModel = productCategoriesModelFromJson(response.body);
//           debugPrint("Product categories:::${_productCategoryModel?.data.length}");
//           productCategoriesFetched = true;
//           _gettingProductCategories = false;
//           _productCategories = _productCategoryModel?.data ?? [];
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _gettingProductCategories = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _gettingProductCategories = false;
//           notifyListeners();
//         } else {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _gettingProductCategories = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _gettingProductCategories = false;
//         notifyListeners();
//       } catch (e) {
//         _resMessage = "Please try again";
//         _gettingProductCategories = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _gettingProductCategories = false;
//       notifyListeners();
//     }
//     return productCategoriesFetched;
//   }
//
//
//   List<Product> _products = [];
//   List<Product> get products => _products;
//   ProductsModel? _productsModel;
//   ProductsModel? get productsModel => _productsModel;
//   bool _isLoadingProducts = false;
//   bool get isLoadingProducts => _isLoadingProducts;
//
//
//
//   Product? _selectedProduct;
//   Product? get selectedProduct => _selectedProduct;
//   updateSelectedProduct(Product? product){
//     _selectedProduct = product;
//     notifyListeners();
//   }
//   Future<bool> getProducts({
//     required String token,
//   }) async {
//     bool productsFetched = false;
//     debugPrint("TOKEN: $token ${'$basedURL/$productsEndpoint'}");
//     final connected = await connectionChecker();
//     if (connected) {
//       if(_products.isEmpty){
//         _isLoadingProducts = true;
//         notifyListeners();
//       }
//
//       try {
//         final response =
//         await http.get(Uri.parse("$basedURL/$productsEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             } );
//         print("Get Products  response: ${response.body}");
//         print("Get Products  Status Code: ${response.statusCode}");
//         final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           _productsModel = productsModelFromJson(response.body);
//           debugPrint("Products Length:::${_productCategoryModel?.data.length}");
//           productsFetched = true;
//           _isLoadingProducts = false;
//           _products = _productsModel?.data ?? [];
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingProducts = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingProducts = false;
//           notifyListeners();
//         } else {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingProducts = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _isLoadingProducts = false;
//         notifyListeners();
//       } catch (e) {
//         _resMessage = "Please try again";
//         _isLoadingProducts = false;
//         debugPrint("Get My Products Exception: ${e.toString()}");
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _isLoadingProducts = false;
//       notifyListeners();
//     }
//     return productsFetched;
//   }
//
//
//
//
//
//   StoreModel? _storeModel;
//   StoreModel? get storeModel => _storeModel;
//   bool _gettingStores = false;
//   bool get gettingStores => _gettingStores;
//   Future<bool> getStore({
//     required String token,
//   }) async {
//     bool storesFetched = false;
//     debugPrint("TOKEN: $token ${'$basedURL/$storeEndpoint'}");
//     final connected = await connectionChecker();
//     if (connected) {
//       if(_storeModel == null){
//         _gettingStores = true;
//         notifyListeners();
//       }
//
//       try {
//         final response =
//         await http.get(Uri.parse("$basedURL/$storeEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             } );
//         // print("Get Stores  response: ${response.body}");
//         // print("Get Stores Status Code: ${response.statusCode}");
//         // final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           _storeModel = storeModelFromJson(response.body);
//           storesFetched = true;
//           _gettingStores = false;
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingStores = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingStores = false;
//           notifyListeners();
//         } else {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingStores = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _gettingStores = false;
//         notifyListeners();
//       } catch (e) {
//         debugPrint("Get Store exception: ${e.toString()}");
//         _resMessage = "Please try again";
//         _gettingStores = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _gettingStores = false;
//       notifyListeners();
//     }
//     return storesFetched;
//   }
//
//
//   SingleProductModel? _singleProductModel;
//   SingleProductModel? get singleProductModel => _singleProductModel;
//   bool _gettingSingleProduct = false;
//   bool get gettingSingleProduct => _gettingSingleProduct;
//   Gallery? _selectedProductImage;
//   Gallery? get selectedProductImage => _selectedProductImage;
//   void updateSelectedProductImage(Gallery? productImage){
//     _selectedProductImage = productImage;
//     notifyListeners();
//   }
//
//   Future<bool> getSingleProduct({
//     required String token,
//   }) async {
//     _singleProductModel = null;
//     _selectedProductImage = null;
//     notifyListeners();
//     bool singleProductFetched = false;
//     String url = '$basedURL/$productsEndpoint/${_selectedProduct?.id?? ""}';
//     debugPrint("The URL IS: $url");
//     final connected = await connectionChecker();
//     if (connected) {
//       if(_singleProductModel == null){
//         _gettingSingleProduct = true;
//         notifyListeners();
//       }
//
//       try {
//         final response =
//         await http.get(Uri.parse(url),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             } );
//         // print("Get Single Product  response: ${response.body}");
//         // print("Get Single Product Status Code: ${response.statusCode}");
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           _singleProductModel = singleProductModelFromJson(response.body);
//           _selectedProduct = _singleProductModel?.data;
//           //UPDATE THE IMAGE AT THE FIRST INDEX AS THE SELECTED IMAGE
//           if(_selectedProduct != null){
//             if(_selectedProduct!.gallery.isNotEmpty){
//               _selectedProductImage = _selectedProduct!.gallery[0];
//               notifyListeners();
//             }
//           }
//           singleProductFetched = true;
//           _gettingSingleProduct = false;
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingSingleProduct = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingSingleProduct = false;
//           notifyListeners();
//         } else {
//           // _resMessage = _resMessage = decodedResponse['message'];
//           _gettingSingleProduct = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _gettingSingleProduct = false;
//         notifyListeners();
//       } catch (e) {
//         debugPrint("Get Single Product exception: ${e.toString()}");
//         _resMessage = "Please try again";
//         _gettingSingleProduct = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _gettingSingleProduct = false;
//       notifyListeners();
//     }
//     return singleProductFetched;
//   }
//
//
//
//   bool _settingUpStore = false;
//   bool get settingUpStore => _settingUpStore;
//   Future<bool> setupStore({
//     required String token,
//   }) async {
//     bool networkOperatorsFetched = false;
//     final connected = await connectionChecker();
//     if (connected) {
//       _settingUpStore = true;
//       notifyListeners();
//       final body = {
//         "name": storeNameController.text,
//         "description": descriptionController.text,
//         "address": locationAddressController.text,
//         "logo": ""
//       };
//       // debugPrint("Setup store Payload: $body    Telco Body=======");
//       try {
//         final response =
//         await http.post(Uri.parse("$basedURL/$storeEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             },
//             body: json.encode(body));
//         print("Setup store  response: ${response.body}");
//         print("Setup store Status Code: ${response.statusCode}");
//         final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           networkOperatorsFetched = true;
//           _settingUpStore = false;
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _settingUpStore = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _settingUpStore = false;
//           notifyListeners();
//         } else {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _settingUpStore = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _settingUpStore = false;
//         notifyListeners();
//       } catch (e) {
//         _resMessage = "Please try again";
//         _settingUpStore = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _settingUpStore = false;
//       notifyListeners();
//     }
//     return networkOperatorsFetched;
//   }
//
//   bool _savingProduct = false;
//   bool get savingProduct => _savingProduct;
//   Future<bool> saveProduct({
//     required String token,
//   }) async {
//     bool productSaved = false;
//     final connected = await connectionChecker();
//     if (connected) {
//       _savingProduct = true;
//       notifyListeners();
//       final body = {
//         "product_id": _selectedProduct?.id.toString(),
//       };
//       debugPrint("Setup store Payload: $body    Telco Body=======");
//       try {
//         final response =
//         await http.post(Uri.parse("$basedURL/$saveProductEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             },
//             body: json.encode(body));
//         print("Save product  response: ${response.body}");
//         print("Save product Status Code: ${response.statusCode}");
//         final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           productSaved = true;
//           _savingProduct = false;
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _savingProduct = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _savingProduct = false;
//           notifyListeners();
//         } else {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _savingProduct = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _savingProduct = false;
//         notifyListeners();
//       } catch (e) {
//         _resMessage = "Please try again";
//         _savingProduct = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _savingProduct = false;
//       notifyListeners();
//     }
//     return productSaved;
//   }
//
//
//   List<SavedProduct> _savedProducts = [];
//   List<SavedProduct> get savedProducts => _savedProducts;
//   SavedProductModel? _savedProductsModel;
//   SavedProductModel? get savedProductsModel => _savedProductsModel;
//   bool _isLoadingSavedProducts = false;
//   bool get isLoadingSavedProducts => _isLoadingSavedProducts;
//
//   SavedProductData? _selectedSavedProduct;
//   SavedProductData? get selectedSavedProduct => _selectedSavedProduct;
//   updateSelectedSavedProduct(SavedProductData? product){
//     _selectedSavedProduct = product;
//     notifyListeners();
//   }
//   Future<bool> getSavedProducts({
//     required String token,
//   }) async {
//     bool savedProductsFetched = false;
//     debugPrint("TOKEN: $token ${'$basedURL/$productsEndpoint'}");
//     final connected = await connectionChecker();
//     if (connected) {
//       if(_savedProducts.isEmpty){
//         _isLoadingSavedProducts = true;
//         notifyListeners();
//       }
//
//       try {
//         final response =
//         await http.get(Uri.parse("$basedURL/$productsEndpoint"),
//             headers: {
//               'Content-Type': 'application/json',
//               'Authorization': 'Bearer $token'
//             } );
//         // print("Get Saved Products  response: ${response.body}");
//         // print("Get Saved Products  Status Code: ${response.statusCode}");
//         final decodedResponse = json.decode(response.body);
//         if (response.statusCode == 200 || response.statusCode == 201) {
//           _savedProductsModel = savedProductModelFromJson(response.body);
//           debugPrint("Products Length:::${_savedProductsModel?.data.length}");
//           savedProductsFetched = true;
//           _isLoadingSavedProducts = false;
//           _savedProducts = _savedProductsModel?.data ?? [];
//           notifyListeners();
//         } else if (response.statusCode == 404) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingSavedProducts = false;
//           notifyListeners();
//         } else if (response.statusCode == 422) {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingSavedProducts = false;
//           notifyListeners();
//         } else {
//           _resMessage = _resMessage = decodedResponse['message'];
//           _isLoadingSavedProducts = false;
//           notifyListeners();
//         }
//       } on SocketException catch (_) {
//         _resMessage = "Internet connection is not available";
//         _isLoadingSavedProducts = false;
//         notifyListeners();
//       } catch (e) {
//         _resMessage = "Please try again";
//         _isLoadingSavedProducts = false;
//         notifyListeners();
//       }
//     } else {
//       _resMessage = "Internet connection is not available";
//       _isLoadingSavedProducts = false;
//       notifyListeners();
//     }
//     return savedProductsFetched;
//   }
//
//
//   String? _selectedMyProductTab = myProducts;
//   String? get selectedMyProductTab => _selectedMyProductTab;
//
//   void updateSelectedMyProductTab(String? tab){
//     _selectedMyProductTab = tab;
//     notifyListeners();
//   }
//
//
//   void clear() {
//     _resMessage = "";
//     notifyListeners();
//   }
//
//
// }
