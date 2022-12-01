// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../../add_product/add_product_page.dart' as _i5;
import '../../auth/login/view/login_view.dart' as _i1;
import '../../product_details/product_details_page.dart' as _i4;
import '../../products_list/products_page.dart' as _i3;
import '../app.dart' as _i2;

class MainRouter extends _i6.RootStackRouter {
  MainRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    LoginView.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.LoginView(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i6.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i3.ProductsPage(),
        maintainState: false,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ProductDetailsRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProductDetailsRouteArgs>(
          orElse: () =>
              ProductDetailsRouteArgs(gtin: pathParams.getString('gtin')));
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailsPage(
          gtin: args.gtin,
          key: args.key,
        ),
        transitionsBuilder: _i6.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddProductRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddProductPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: 'login',
          fullMatch: true,
        ),
        _i6.RouteConfig(
          LoginView.name,
          path: 'login',
        ),
        _i6.RouteConfig(
          DashboardRoute.name,
          path: 'dashboard',
          children: [
            _i6.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'products',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              'dashboard#redirect',
              path: 'dashboard',
              parent: DashboardRoute.name,
              redirectTo: 'products',
              fullMatch: true,
            ),
            _i6.RouteConfig(
              ProductsRoute.name,
              path: 'products',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              ProductDetailsRoute.name,
              path: 'products/:gtin',
              parent: DashboardRoute.name,
            ),
            _i6.RouteConfig(
              AddProductRoute.name,
              path: 'products/new',
              parent: DashboardRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginView extends _i6.PageRouteInfo<void> {
  const LoginView()
      : super(
          LoginView.name,
          path: 'login',
        );

  static const String name = 'LoginView';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i6.PageRouteInfo<void> {
  const DashboardRoute({List<_i6.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: 'dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsRoute extends _i6.PageRouteInfo<void> {
  const ProductsRoute()
      : super(
          ProductsRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsRoute';
}

/// generated route for
/// [_i4.ProductDetailsPage]
class ProductDetailsRoute extends _i6.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required String gtin,
    _i7.Key? key,
  }) : super(
          ProductDetailsRoute.name,
          path: 'products/:gtin',
          args: ProductDetailsRouteArgs(
            gtin: gtin,
            key: key,
          ),
          rawPathParams: {'gtin': gtin},
        );

  static const String name = 'ProductDetailsRoute';
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.gtin,
    this.key,
  });

  final String gtin;

  final _i7.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{gtin: $gtin, key: $key}';
  }
}

/// generated route for
/// [_i5.AddProductPage]
class AddProductRoute extends _i6.PageRouteInfo<void> {
  const AddProductRoute()
      : super(
          AddProductRoute.name,
          path: 'products/new',
        );

  static const String name = 'AddProductRoute';
}
