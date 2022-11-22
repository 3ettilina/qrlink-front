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
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;

import '../../add_product/add_product_page.dart' as _i5;
import '../../add_resource/add_resource_page.dart' as _i6;
import '../../auth/login_page.dart' as _i2;
import '../../product_details/product_details_page.dart' as _i4;
import '../../products_list/products_page.dart' as _i3;
import '../app.dart' as _i1;

class MainRouter extends _i7.RootStackRouter {
  MainRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    DashboardRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i7.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    ProductsRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
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
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: _i4.ProductDetailsPage(
          gtin: args.gtin,
          key: args.key,
        ),
        transitionsBuilder: _i7.TransitionsBuilders.zoomIn,
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddProductRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i5.AddProductPage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
    AddResourceRoute.name: (routeData) {
      return _i7.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i6.AddResourcePage(),
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(
          DashboardRoute.name,
          path: '/',
          children: [
            _i7.RouteConfig(
              '#redirect',
              path: '',
              parent: DashboardRoute.name,
              redirectTo: 'products',
              fullMatch: true,
            ),
            _i7.RouteConfig(
              ProductsRoute.name,
              path: 'products',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              ProductDetailsRoute.name,
              path: 'products/:gtin',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              AddProductRoute.name,
              path: 'products/new',
              parent: DashboardRoute.name,
            ),
            _i7.RouteConfig(
              AddResourceRoute.name,
              path: 'products/:gtin/resources/new',
              parent: DashboardRoute.name,
            ),
          ],
        ),
        _i7.RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
      ];
}

/// generated route for
/// [_i1.DashboardPage]
class DashboardRoute extends _i7.PageRouteInfo<void> {
  const DashboardRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i7.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i3.ProductsPage]
class ProductsRoute extends _i7.PageRouteInfo<void> {
  const ProductsRoute()
      : super(
          ProductsRoute.name,
          path: 'products',
        );

  static const String name = 'ProductsRoute';
}

/// generated route for
/// [_i4.ProductDetailsPage]
class ProductDetailsRoute extends _i7.PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required String gtin,
    _i8.Key? key,
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

  final _i8.Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{gtin: $gtin, key: $key}';
  }
}

/// generated route for
/// [_i5.AddProductPage]
class AddProductRoute extends _i7.PageRouteInfo<void> {
  const AddProductRoute()
      : super(
          AddProductRoute.name,
          path: 'products/new',
        );

  static const String name = 'AddProductRoute';
}

/// generated route for
/// [_i6.AddResourcePage]
class AddResourceRoute extends _i7.PageRouteInfo<void> {
  const AddResourceRoute()
      : super(
          AddResourceRoute.name,
          path: 'products/:gtin/resources/new',
        );

  static const String name = 'AddResourceRoute';
}
