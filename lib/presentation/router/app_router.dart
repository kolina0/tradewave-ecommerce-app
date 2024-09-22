import 'package:estore/presentation/screens/category_screens/all_categories.dart';
import 'package:estore/presentation/screens/authentication/forgot_password_screens/email_sent_screen.dart';
import 'package:estore/presentation/screens/authentication/forgot_password_screens/forgot_password.dart';
import 'package:estore/presentation/screens/authentication/sign_up_screens/more_info_screen.dart';
import 'package:estore/presentation/screens/authentication/sign_in_screens/sign_in_email.dart';
import 'package:estore/presentation/screens/authentication/sign_in_screens/sign_in_password.dart';
import 'package:estore/presentation/screens/authentication/sign_up_screens/sign_up.dart';
import 'package:estore/presentation/screens/cart_screens/cart_screen.dart';
import 'package:estore/presentation/screens/category_screens/category_products.dart';
import 'package:estore/presentation/screens/home_layout/home_layout.dart';
import 'package:estore/presentation/screens/product_screen.dart';
import 'package:estore/presentation/screens/search_screen/search_screen.dart';
import 'package:estore/presentation/screens/setting_screens/address_screens/address_screen.dart';
import 'package:estore/presentation/screens/setting_screens/address_screens/edit_address_screen.dart';
import 'package:estore/presentation/screens/setting_screens/favourite_screen.dart';
import 'package:estore/presentation/screens/setting_screens/payment_screens/edit_payment_screen.dart';
import 'package:estore/presentation/screens/setting_screens/payment_screens/payment_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart' as screens;
import '../screens/cart_screens/checkout_screen.dart';
import '../screens/cart_screens/order_details.dart';
import '../screens/cart_screens/order_placed_screen.dart';

class AppRouter {
  late Widget startScreen;
  Route? onGenerateRoute(RouteSettings settings) {
    startScreen = const HomeLayout();
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => startScreen);
      case screens.signInEmailScreen:
        return MaterialPageRoute(builder: (_) => const SignInEmailScreen());
      case screens.signInPasswordScreen:
        return MaterialPageRoute(builder: (_) => const SignInPasswordScreen());
      case screens.forgotPasswordScreen:
        return MaterialPageRoute(builder: (_) => const ForgotPassword());
      case screens.emailSentScreen:
        return MaterialPageRoute(builder: (_) => const EmailSentScreen());
      case screens.signUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case screens.moreInfoScreen:
        return MaterialPageRoute(builder: (_) => const MoreInfoScreen());
      case screens.homeLayout:
        return MaterialPageRoute(builder: (_) => const HomeLayout());
      case screens.allCategoriesScreen:
        return MaterialPageRoute(builder: (_) => const AllCategories());
      case screens.categoryProducts:
        return MaterialPageRoute(builder: (_) => const CategoryProducts());
      case screens.orderDetailsScreen:
        return MaterialPageRoute(builder: (_) => const OrderDetailsScreen());
      case screens.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case screens.productScreen:
        return MaterialPageRoute(builder: (_) => const ProductScreen());
      case screens.cartScreen:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case screens.checkoutScreen:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case screens.orderPlacedScreen:
        return MaterialPageRoute(builder: (_) => const OrderPlacedScreen());
      case screens.addressScreen:
        return MaterialPageRoute(builder: (_) => const AddressScreen());
      case screens.editAddressScreen:
        return MaterialPageRoute(builder: (_) => const EditAddressScreen());
      case screens.paymentScreen:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case screens.editPaymentScreen:
        return MaterialPageRoute(builder: (_) => const EditPaymentScreen());
      case screens.favouriteScreen:
        return MaterialPageRoute(builder: (_) => const FavouriteScreen());
      default:
        return null;
    }
  }
}
