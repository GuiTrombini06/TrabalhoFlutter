import 'package:flutter/material.dart';

void main() {
  runApp(CarrinhoApp());
}

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class CarrinhoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carrinho de Compras',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: CarrinhoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CarrinhoHomePage extends StatefulWidget {
  @override
  _CarrinhoHomePageState createState() => _CarrinhoHomePageState();
}

class _CarrinhoHomePageState extends State<CarrinhoHomePage> {
  final List<Produto> produtos = [
    Produto("Fone Bluetooth", 119.90,
        'https://m.media-amazon.com/images/I/61v7lVsfG-L._AC_SL1500_.jpg'),
    Produto("Smartwatch", 249.99,
        'https://m.media-amazon.com/images/I/71t7DfbpA9L._AC_SL1500_.jpg'),
    Produto("Jaqueta", 159.90,
        'https://cdn.dooca.store/2650/products/jaqueta-corta-vento-nike-preta_1646868496_zoom.jpg'),
    Produto("Óculos de Sol", 89.90,
        'https://images.tcdn.com.br/img/img_prod/652338/oculos_de_sol_masculino_original_esportivo_polarizado_flexivel_521_1_20201204095619.jpg'),
    Produto("Carteira", 49.99,
        'https://cdn.awsli.com.br/600x700/2445/2445851/produto/191293163/carteira-masculina-em-couro-legitimo-195-preta-marron-fosco-3f5188e2.jpg'),
    Produto("Garrafa Térmica", 69.90,
        'https://m.media-amazon.com/images/I/51KX-4xwM+L._AC_SL1000_.jpg'),
  ];

  double total = 0.0;

  void adicionarAoCarrinho(double preco) {
    setState(() {
      total += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('🛒 Carrinho de Compras'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: produtos.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.75,
            ),
            itemBuilder: (context, index) {
              final produto = produtos[index];
              return Container(
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4,
                      offset: Offset(2, 2),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: Image.network(produto.imagemUrl, fit: BoxFit.cover),
                    ),
                    SizedBox(height: 8),
                    Text(produto.nome,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("R\$ ${produto.preco.toStringAsFixed(2)}"),
                    SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () => adicionarAoCarrinho(produto.preco),
                      child: Text("Adicionar"),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.teal,
          padding: EdgeInsets.all(16),
          child: Text(
            "Total: R\$ ${total.toStringAsFixed(2)}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
