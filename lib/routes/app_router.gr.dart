// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthenticationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthenticationPage(),
      );
    },
    CategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CategoriesPage(),
      );
    },
    CollectionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CollectionsPage(),
      );
    },
    CurrenciesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CurrenciesPage(),
      );
    },
    CustomerDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomerDetailPage(),
      );
    },
    CustomersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CustomersPage(),
      );
    },
    DiscountDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscountDetailPage(),
      );
    },
    DiscountsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DiscountsPage(),
      );
    },
    GiftCardDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GiftCardDetailPage(),
      );
    },
    GiftCardsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GiftCardsPage(),
      );
    },
    GroupDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const GroupDetailPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    InventoryRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const InventoryPage(),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationsPage(),
      );
    },
    OauthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OauthPage(),
      );
    },
    OrderDetailRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: OrderDetailPage(
          key: args.key,
          orderId: args.orderId,
        ),
      );
    },
    OrdersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const OrdersPage(),
      );
    },
    PersonalInformationRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonalInformationPage(),
      );
    },
    PricingDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PricingDetailPage(),
      );
    },
    PricingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PricingPage(),
      );
    },
    ProductCategoriesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductCategoriesPage(),
      );
    },
    ProductDetailRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ProductDetailPage(
          key: args.key,
          productId: args.productId,
        ),
      );
    },
    ProductsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProductsPage(),
      );
    },
    PublishableApiKeysRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PublishableApiKeysPage(),
      );
    },
    RegionsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RegionsPage(),
      );
    },
    ResourcesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ResourcesPage(),
      );
    },
    ReturnReasonsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ReturnReasonsPage(),
      );
    },
    SalesChannelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SalesChannelsPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SettingsPage(),
      );
    },
    SourcesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SourcesPage(),
      );
    },
    TaxesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const TaxesPage(),
      );
    },
    UsersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const UsersPage(),
      );
    },
  };
}

/// generated route for
/// [AuthenticationPage]
class AuthenticationRoute extends PageRouteInfo<void> {
  const AuthenticationRoute({List<PageRouteInfo>? children})
      : super(
          AuthenticationRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthenticationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CategoriesPage]
class CategoriesRoute extends PageRouteInfo<void> {
  const CategoriesRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CollectionsPage]
class CollectionsRoute extends PageRouteInfo<void> {
  const CollectionsRoute({List<PageRouteInfo>? children})
      : super(
          CollectionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CollectionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CurrenciesPage]
class CurrenciesRoute extends PageRouteInfo<void> {
  const CurrenciesRoute({List<PageRouteInfo>? children})
      : super(
          CurrenciesRoute.name,
          initialChildren: children,
        );

  static const String name = 'CurrenciesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomerDetailPage]
class CustomerDetailRoute extends PageRouteInfo<void> {
  const CustomerDetailRoute({List<PageRouteInfo>? children})
      : super(
          CustomerDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomerDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CustomersPage]
class CustomersRoute extends PageRouteInfo<void> {
  const CustomersRoute({List<PageRouteInfo>? children})
      : super(
          CustomersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscountDetailPage]
class DiscountDetailRoute extends PageRouteInfo<void> {
  const DiscountDetailRoute({List<PageRouteInfo>? children})
      : super(
          DiscountDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscountDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DiscountsPage]
class DiscountsRoute extends PageRouteInfo<void> {
  const DiscountsRoute({List<PageRouteInfo>? children})
      : super(
          DiscountsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscountsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GiftCardDetailPage]
class GiftCardDetailRoute extends PageRouteInfo<void> {
  const GiftCardDetailRoute({List<PageRouteInfo>? children})
      : super(
          GiftCardDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftCardDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GiftCardsPage]
class GiftCardsRoute extends PageRouteInfo<void> {
  const GiftCardsRoute({List<PageRouteInfo>? children})
      : super(
          GiftCardsRoute.name,
          initialChildren: children,
        );

  static const String name = 'GiftCardsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [GroupDetailPage]
class GroupDetailRoute extends PageRouteInfo<void> {
  const GroupDetailRoute({List<PageRouteInfo>? children})
      : super(
          GroupDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'GroupDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [InventoryPage]
class InventoryRoute extends PageRouteInfo<void> {
  const InventoryRoute({List<PageRouteInfo>? children})
      : super(
          InventoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'InventoryRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OauthPage]
class OauthRoute extends PageRouteInfo<void> {
  const OauthRoute({List<PageRouteInfo>? children})
      : super(
          OauthRoute.name,
          initialChildren: children,
        );

  static const String name = 'OauthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [OrderDetailPage]
class OrderDetailRoute extends PageRouteInfo<OrderDetailRouteArgs> {
  OrderDetailRoute({
    Key? key,
    required String orderId,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailRoute.name,
          args: OrderDetailRouteArgs(
            key: key,
            orderId: orderId,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailRoute';

  static const PageInfo<OrderDetailRouteArgs> page =
      PageInfo<OrderDetailRouteArgs>(name);
}

class OrderDetailRouteArgs {
  const OrderDetailRouteArgs({
    this.key,
    required this.orderId,
  });

  final Key? key;

  final String orderId;

  @override
  String toString() {
    return 'OrderDetailRouteArgs{key: $key, orderId: $orderId}';
  }
}

/// generated route for
/// [OrdersPage]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PersonalInformationPage]
class PersonalInformationRoute extends PageRouteInfo<void> {
  const PersonalInformationRoute({List<PageRouteInfo>? children})
      : super(
          PersonalInformationRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonalInformationRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PricingDetailPage]
class PricingDetailRoute extends PageRouteInfo<void> {
  const PricingDetailRoute({List<PageRouteInfo>? children})
      : super(
          PricingDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'PricingDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PricingPage]
class PricingRoute extends PageRouteInfo<void> {
  const PricingRoute({List<PageRouteInfo>? children})
      : super(
          PricingRoute.name,
          initialChildren: children,
        );

  static const String name = 'PricingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductCategoriesPage]
class ProductCategoriesRoute extends PageRouteInfo<void> {
  const ProductCategoriesRoute({List<PageRouteInfo>? children})
      : super(
          ProductCategoriesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductCategoriesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProductDetailPage]
class ProductDetailRoute extends PageRouteInfo<ProductDetailRouteArgs> {
  ProductDetailRoute({
    Key? key,
    required String productId,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailRoute.name,
          args: ProductDetailRouteArgs(
            key: key,
            productId: productId,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailRoute';

  static const PageInfo<ProductDetailRouteArgs> page =
      PageInfo<ProductDetailRouteArgs>(name);
}

class ProductDetailRouteArgs {
  const ProductDetailRouteArgs({
    this.key,
    required this.productId,
  });

  final Key? key;

  final String productId;

  @override
  String toString() {
    return 'ProductDetailRouteArgs{key: $key, productId: $productId}';
  }
}

/// generated route for
/// [ProductsPage]
class ProductsRoute extends PageRouteInfo<void> {
  const ProductsRoute({List<PageRouteInfo>? children})
      : super(
          ProductsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PublishableApiKeysPage]
class PublishableApiKeysRoute extends PageRouteInfo<void> {
  const PublishableApiKeysRoute({List<PageRouteInfo>? children})
      : super(
          PublishableApiKeysRoute.name,
          initialChildren: children,
        );

  static const String name = 'PublishableApiKeysRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RegionsPage]
class RegionsRoute extends PageRouteInfo<void> {
  const RegionsRoute({List<PageRouteInfo>? children})
      : super(
          RegionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegionsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResourcesPage]
class ResourcesRoute extends PageRouteInfo<void> {
  const ResourcesRoute({List<PageRouteInfo>? children})
      : super(
          ResourcesRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResourcesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ReturnReasonsPage]
class ReturnReasonsRoute extends PageRouteInfo<void> {
  const ReturnReasonsRoute({List<PageRouteInfo>? children})
      : super(
          ReturnReasonsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ReturnReasonsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SalesChannelsPage]
class SalesChannelsRoute extends PageRouteInfo<void> {
  const SalesChannelsRoute({List<PageRouteInfo>? children})
      : super(
          SalesChannelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SalesChannelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SourcesPage]
class SourcesRoute extends PageRouteInfo<void> {
  const SourcesRoute({List<PageRouteInfo>? children})
      : super(
          SourcesRoute.name,
          initialChildren: children,
        );

  static const String name = 'SourcesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [TaxesPage]
class TaxesRoute extends PageRouteInfo<void> {
  const TaxesRoute({List<PageRouteInfo>? children})
      : super(
          TaxesRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaxesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [UsersPage]
class UsersRoute extends PageRouteInfo<void> {
  const UsersRoute({List<PageRouteInfo>? children})
      : super(
          UsersRoute.name,
          initialChildren: children,
        );

  static const String name = 'UsersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
