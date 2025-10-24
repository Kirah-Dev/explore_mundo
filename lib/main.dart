import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  // 1. Correção: Adicionado 'const' ao construtor para otimização.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // A variável 'color' é usada para os botões.
    Color color = Theme.of(context).primaryColor;

    // --- Seção de Título
    final Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Oeschinen Lake Campground',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(
                  'Kandersteg, Switzerland',
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );

    // --- Seção de Botões
    final Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    // --- Seção de Texto
    final Widget textSection = Container(
      padding: const EdgeInsets.all(32),
      child: const Text(
        'O Lago Oeschinen fica aos pés do Blüemlisalp nos Alpes Berneses. Situado a '
        '1.578 metros acima do nível do mar, é um dos lagos alpinos mais amplos. Um '
        'passeio de teleférico a partir de Kandersteg, seguido por meia hora de '
        'caminhada por pastagens e floresta de pinheiros, leva você ao lago, que aquece '
        'até 20 graus Celsius no verão. As atividades desfrutadas aqui incluem remo e '
        'andar no tobogã de verão.',
        softWrap: true,
      ),
    );

    // 2. Correção: Apenas UM método build que retorna o layout completo.
    return MaterialApp(
      title: 'Explore Mundo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Explore Mundo')),
        // Usando ListView para organizar todos os elementos e permitir rolagem
        body: ListView(
          children: [
            Image.asset(
              'images/paisage.png', //
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
  }

  // Função auxiliar para criar colunas de botões
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
