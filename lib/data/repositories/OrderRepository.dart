import 'package:flutter_bloc_patterns/details.dart';
import 'package:flutter_bloc_patterns/paged_filter_list.dart';
import 'package:flutter_bloc_patterns/paged_list.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

class OrderRepository
    implements DetailsRepository<Order, String>, PagedListRepository<Order> {
  final Medusa medusa;

  OrderRepository(this.medusa);

  @override
  Future<List<Order>> getAll(Page page) async {
    AdminOrdersListRes res = await medusa.admin.orders.list(
      query: AdminGetOrdersParams(
        limit: page.size,
        offset: page.number * page.size,
      ),
    );

    return res.orders;
  }

  @override
  Future<Order> getById(String id) async {
    AdminOrdersRes res = await medusa.admin.orders.retrieve(id);

    return res.order;
  }
}
