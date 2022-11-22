import 'package:admin_panel/ui/add_product/add_product_page.dart';
import 'package:admin_panel/ui/add_resource/add_resource_page.dart';
import 'package:admin_panel/ui/app/app.dart';
import 'package:admin_panel/ui/auth/login_page.dart';
import 'package:admin_panel/ui/product_details/product_details_page.dart';
import 'package:admin_panel/ui/products_list/products_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: DashboardPage,
      children: [
        RedirectRoute(path: '', redirectTo: 'products'),
        CustomRoute(
          path: 'products',
          page: ProductsPage,
          initial: true,
          maintainState: false,
        ),
        CustomRoute(
            path: 'products/:gtin',
            page: ProductDetailsPage,
            transitionsBuilder: TransitionsBuilders.zoomIn),
        CustomRoute(path: 'products/new', page: AddProductPage),
        CustomRoute(path: 'products/:gtin/resources/new', page: AddResourcePage)
      ],
    ),
    AutoRoute(path: '/login', page: LoginPage)
  ],
)
class $MainRouter {}
