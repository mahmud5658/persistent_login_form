import 'package:flutter/material.dart';
import '../../../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}
class _ProductListScreenState extends State<ProductListScreen> {
  final ScrollController _scrollController = ScrollController();
  final int _batchSize = 10;
  final List<int> _items = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _loadMoreData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 100 &&
          !_isLoading) {
        _loadMoreData();
      }
    });
  }
  Future<void> _loadMoreData() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    final nextIndex = _items.length;
    final newItems = List.generate(_batchSize, (i) => nextIndex + i);
    setState(() {
      _items.addAll(newItems);
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
      ),
      body: ListView.separated(
        controller: _scrollController,
        itemCount: _items.length + 1,
        itemBuilder: (context, index) {
          if (index < _items.length) {
            return ProductCard(index: _items[index]);
          } else {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("No more items"),
              ),
            );
          }
        },
        separatorBuilder: (_, __) => const SizedBox(height: 1),
      ),
    );
  }
}
