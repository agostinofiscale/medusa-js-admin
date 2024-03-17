import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_patterns/paged_list.dart';
import 'package:flutter_bloc_patterns/view.dart';
import 'package:get_it/get_it.dart';
import 'package:medusa_js_admin/data/repositories/OrderRepository.dart';
import 'package:medusa_js_admin/features/orders/widgets/orders_list_paged.dart';
import 'package:medusa_js_dart/medusa_js_dart.dart';

typedef OrdersBloc = PagedListBloc<Order>;

@RoutePage()
class OrdersPage extends StatelessWidget {
  const OrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Medusa medusa = GetIt.I.get<Medusa>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Orders'),
            bottom: TabBar(
              tabs: [
                Tab(
                  text: 'Orders',
                ),
                Tab(
                  text: 'Drafts',
                ),
              ],
            )),
        body: BlocProvider<OrdersBloc>(
          create: (context) =>
              OrdersBloc(OrderRepository(medusa))..loadFirstPage(pageSize: 10),
          child: ViewStateBuilder<PagedList<Order>, PagedListBloc<Order>>(
            loading: (context) => const CircularProgressIndicator(),
            data: (context, page) => OrdersListPaged(
              page,
              onLoadNextPage: context.read<OrdersBloc>().loadNextPage,
            ),
            error: (context, error) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ),
    );
  }
}
