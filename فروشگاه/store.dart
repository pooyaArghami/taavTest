import 'dart:io';

void main() {
  List<Product> allProducts = [];

  while (true) {
    print('''

<= *** (choose from the menu below)*** =>-------------------------

  1- product registration
  2- show product list 
  3- delete product
  4- edit product
  5- show products close to completion
  6- exit the program  

  ----------------------------------------------------------------
  ''');

    try {
      int input = int.parse(stdin.readLineSync()!);

      if (input == 6) {
        print("\n ***  program stopped ***\n");
        break;
      } else if (input == 2) {
        Store store = Store(allProducts);
        Store.show_products_list(allProducts);
        continue;
      } else if (input == 5) {

        Store.show_limited_products(allProducts);
        // print(" \n The list of less than ten products is given below : \n");
        // for (int x = 0; x < limitedProducts.length; x++) {
        //   print("${x + 1} _ ${limitedProducts[x]}");
        // }
      } else if (input == 3) {
        print("select the desired product number to remove from the list \n (enter 0 to cancel)");
        Store.show_products_list(allProducts);
        print(" enter 0 to cancel");
        String deleteItemInput = stdin.readLineSync()!;
        int deleteItem;
        if (int.tryParse(deleteItemInput) != null) {
          deleteItem = int.parse(deleteItemInput);
        } else {
          print("***Invalid input. Please enter a number.***");
          continue;
        }
        if (deleteItem != 0) {
          for (int k = 0; k < allProducts.length; k++) {
            if (deleteItem - 1 == k) {
              print("${allProducts[deleteItem - 1]} was successfully deleted.");
              allProducts.removeAt(k);
            }
          }
        }
      } else if (input == 4) {
        print("select the desired product number to edit from the list \n (enter 0 to cancel)\n ");
        Store.show_products_list(allProducts);
        String editItemInput = stdin.readLineSync()!;
        int editItem;
        if (int.tryParse(editItemInput) != null) {
          editItem = int.parse(editItemInput);
        } else {
          print("**** Invalid input. Please enter a number.****");
          continue;
        }
        if (editItem != 0) {
          for (int j = 0; j <= allProducts.length; j++) {
            if (editItem == j) {
              print("enter new name of product :    (cancel=> enter 0 ) \n ");
              String newNameOfProduct = stdin.readLineSync()!;
              if (newNameOfProduct == "0") {
                break;
              }
              print("enter new price of product : just enter number (cancel=> enter 0 ) \n  ");
              String newPriceOfProductInput = stdin.readLineSync()!;
              double newPriceOfProduct;
              if (double.tryParse(newPriceOfProductInput) != null) {
                newPriceOfProduct = double.parse(newPriceOfProductInput);
              } else {
                print("***** Invalid input. Please enter a valid number.***");
                continue;
              }
              print("enter new number of product : just enter number   (cancel=> enter 0 ) \n  ");
              String newNumberOfProductInput = stdin.readLineSync()!;
              int newNumberOfProduct;
              if (int.tryParse(newNumberOfProductInput) != null) {
                newNumberOfProduct = int.parse(newNumberOfProductInput);
              } else {
                print("Invalid input. Please enter a valid number.");
                continue;
              }
              if (newNumberOfProduct != 0) {
                print(" ************* ( successfully product updated ) *********** ");
                print(" \n \n ");
                print("___________________________________________________________________________________");
                Product temp = Product(
                    nameProduct: newNameOfProduct,
                    priceProduct: newPriceOfProduct,
                    numberOfProduct: newNumberOfProduct);
                allProducts[editItem - 1] = temp;
              }
            }
          }
        }
      } else if (input == 1) {
        while (true) {
          print("enter name of product :    ( cancel => enter 0 )  ");
          String nameOfProduct = stdin.readLineSync()!;
          if (nameOfProduct == "0") {
            break;
          }
          print("enter price of product : just enter number ( cancel => enter 0 )  ");
          String priceOfProductInput = stdin.readLineSync()!;
          double priceOfProduct;
          if (double.tryParse(priceOfProductInput) != null) {
            priceOfProduct = double.parse(priceOfProductInput);
          } else {
            print("****  Invalid input. Please enter a valid number. ***");
            continue;
          }
          print("enter number of product :  just enter number  ( cancel => enter 0 )  ");
          String numberOfProductInput = stdin.readLineSync()!;
          int numberOfProduct;
          if (int.tryParse(numberOfProductInput) != null) {
            numberOfProduct = int.parse(numberOfProductInput);
          } else {
            print("Invalid input. Please enter a valid number.");
            continue;
          }
          if (numberOfProduct != 0) {
            print(" ***************( successfully product added )********************** ");
            print(" \n \n  ");
            print("______________________________________________________________________________________");
            Product product = Product(
                nameProduct: nameOfProduct,
                priceProduct: priceOfProduct,
                numberOfProduct: numberOfProduct);
            // for(int t=0;t<allProducts.length;t++){
            //
            // }
            // if(allProducts.contains(product))
            allProducts.add(product);

          }
          break;
        }
      }
    } catch (e) {
      print("invalid input $e");
      print("Please enter again.");
      continue;
    }
  }
}

class Product {
  late final String nameProduct;
  late final double priceProduct;
  late final int numberOfProduct;

  Product({required this.nameProduct, required this.priceProduct, required this.numberOfProduct});

  @override
  String toString() =>
      " $nameProduct are available for $priceProduct (toman) and  $numberOfProduct numbers \n";
}

class Store {
  List<Product> my_allProducts;

  Store(this.my_allProducts);

  static void show_products_list(List<Product> my_allProducts) {
    print("------------------------------------------------------------------------------------\n ");
    print("List of all products are below : ");
    for (int x = 0; x < my_allProducts.length; x++) {
      print("${x + 1} _ ${my_allProducts[x]}");

    }


    print("-------------------------------------------------------------------------------------\n ");
  }

  static void show_limited_products(List<Product> my_allProducts) {
    print("------------------------------------------------------------------------------------\n ");
    print("List of  products  less than 10 are below ==> : ");
    for (int x = 0; x < my_allProducts.length; x++) {
      if(my_allProducts[x].numberOfProduct<10){
        print("${x + 1} _ ${my_allProducts[x]}");
      }
    }


    print("-------------------------------------------------------------------------------------\n ");
  }






}