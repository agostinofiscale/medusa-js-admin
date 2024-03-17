import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:medusa_js_admin/features/sources/pages/SourcesPage.dart';
import 'package:medusa_js_admin/features/authentication/pages/AuthenticationPage.dart';
import 'package:medusa_js_admin/features/home/pages/HomePage.dart';
import 'package:medusa_js_admin/features/resources/pages/ResourcesPage.dart';
import 'package:medusa_js_admin/features/notifications/pages/NotificationsPage.dart';
import 'package:medusa_js_admin/features/categories/pages/CategoriesPage.dart';
import 'package:medusa_js_admin/features/collections/pages/CollectionsPage.dart';
import 'package:medusa_js_admin/features/customers/pages/CustomersPage.dart';
import 'package:medusa_js_admin/features/customers/detail/pages/CustomerDetailPage.dart';
import 'package:medusa_js_admin/features/customers/detail/pages/GroupDetailPage.dart';
import 'package:medusa_js_admin/features/discounts/pages/DiscountsPage.dart';
import 'package:medusa_js_admin/features/discounts/detail/pages/DiscountDetailPage.dart';
import 'package:medusa_js_admin/features/gift-cards/pages/GiftCardsPage.dart';
import 'package:medusa_js_admin/features/gift-cards/detail/pages/GiftCardDetailPage.dart';
import 'package:medusa_js_admin/features/inventory/pages/InventoryPage.dart';
import 'package:medusa_js_admin/features/oauth/pages/OauthPage.dart';
import 'package:medusa_js_admin/features/orders/pages/orders_page.dart';
import 'package:medusa_js_admin/features/orders/order-detail/pages/order_detail_page.dart';
import 'package:medusa_js_admin/features/pricing/pages/PricingPage.dart';
import 'package:medusa_js_admin/features/pricing/detail/pages/PricingDetailPage.dart';
import 'package:medusa_js_admin/features/product-categories/pages/ProductCategoriesPage.dart';
import 'package:medusa_js_admin/features/products/pages/products_page.dart';
import 'package:medusa_js_admin/features/products/product-detail/pages/product_detail_page.dart';
import 'package:medusa_js_admin/features/publishable-api-keys/pages/PublishableApiKeysPage.dart';
import 'package:medusa_js_admin/features/sales-channels/pages/SalesChannelsPage.dart';
import 'package:medusa_js_admin/features/settings/pages/settings_page.dart';
import 'package:medusa_js_admin/features/settings/currencies/pages/CurrenciesPage.dart';
import 'package:medusa_js_admin/features/settings/personal-information/pages/PersonalInformationPage.dart';
import 'package:medusa_js_admin/features/settings/regions/pages/RegionsPage.dart';
import 'package:medusa_js_admin/features/settings/return-reasons/pages/ReturnReasonsPage.dart';
import 'package:medusa_js_admin/features/settings/taxes/pages/TaxesPage.dart';
import 'package:medusa_js_admin/features/settings/users/pages/UsersPage.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SourcesRoute.page),
        AutoRoute(page: AuthenticationRoute.page),
        AutoRoute(page: HomeRoute.page, children: [
          AutoRoute(page: ProductsRoute.page),
          AutoRoute(page: ResourcesRoute.page),
          AutoRoute(page: SettingsRoute.page),
          AutoRoute(page: NotificationsRoute.page)
        ]),
        AutoRoute(page: CategoriesRoute.page),
        AutoRoute(page: CollectionsRoute.page),
        AutoRoute(page: CustomersRoute.page),
        AutoRoute(page: CustomerDetailRoute.page),
        AutoRoute(page: GroupDetailRoute.page),
        AutoRoute(page: DiscountsRoute.page),
        AutoRoute(page: DiscountDetailRoute.page),
        AutoRoute(page: GiftCardsRoute.page),
        AutoRoute(page: GiftCardDetailRoute.page),
        AutoRoute(page: InventoryRoute.page),
        AutoRoute(page: OauthRoute.page),
        AutoRoute(page: OrdersRoute.page),
        AutoRoute(page: OrderDetailRoute.page),
        AutoRoute(page: PricingRoute.page),
        AutoRoute(page: PricingDetailRoute.page),
        AutoRoute(page: ProductCategoriesRoute.page),
        AutoRoute(page: ProductsRoute.page),
        AutoRoute(page: ProductDetailRoute.page),
        AutoRoute(page: PublishableApiKeysRoute.page),
        AutoRoute(page: SalesChannelsRoute.page),
        AutoRoute(page: SettingsRoute.page),
        AutoRoute(page: CurrenciesRoute.page),
        AutoRoute(page: PersonalInformationRoute.page),
        AutoRoute(page: RegionsRoute.page),
        AutoRoute(page: ReturnReasonsRoute.page),
        AutoRoute(page: TaxesRoute.page),
        AutoRoute(page: UsersRoute.page),
      ];
}
