import 'package:admin_panel/ui/add_product/add_product_page.dart';
import 'package:admin_panel/ui/app/app.dart';
import 'package:admin_panel/ui/firebase_auth_ui/login/view/login_view.dart';
import 'package:admin_panel/ui/product_details/product_details_page.dart';
import 'package:admin_panel/ui/products_list/products_page.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: 'login',
      page: LoginView,
      initial: true,
    ),
    AutoRoute(
      path: 'dashboard',
      page: DashboardPage,
      children: [
        RedirectRoute(path: 'dashboard', redirectTo: 'products'),
        CustomRoute(
          path: 'products',
          page: ProductsPage,
          maintainState: false,
          initial: true,
        ),
        CustomRoute(
            path: 'products/:gtin',
            page: ProductDetailsPage,
            transitionsBuilder: TransitionsBuilders.zoomIn),
        CustomRoute(path: 'products/new', page: AddProductPage),
      ],
    ),
  ],
)
class $MainRouter {}
