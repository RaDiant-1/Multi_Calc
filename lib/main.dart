import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const CalculatorApp());
  }


class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Multi-Purpose Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: const CalculatorHub(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHub extends StatelessWidget {
  const CalculatorHub({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF667eea),
              Color(0xFF764ba2),
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Multi-Purpose Calculator',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    children: [
                      _buildCategoryCard(
                        context,
                        'Student Tools',
                        '📚',
                        Colors.blue,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const StudentToolsScreen())),
                      ),
                      _buildCategoryCard(
                        context,
                        'Shopper Tools',
                        '🛒',
                        Colors.green,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ShopperToolsScreen())),
                      ),
                      _buildCategoryCard(
                        context,
                        'Trader Tools',
                        '📈',
                        Colors.orange,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TraderToolsScreen())),
                      ),
                      _buildCategoryCard(
                        context,
                        'Freelancer Tools',
                        '💼',
                        Colors.purple,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FreelancerToolsScreen())),
                      ),
                      _buildCategoryCard(
                        context,
                        'Fitness Tools',
                        '💪',
                        Colors.red,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FitnessToolsScreen())),
                      ),
                      _buildCategoryCard(
                        context,
                        'Basic Calculator',
                        '🧮',
                        Colors.teal,
                        () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BasicCalculatorScreen())),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(BuildContext context, String title, String emoji, Color color, VoidCallback onTap) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                color.withOpacity(0.8),
                color.withOpacity(0.6),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                emoji,
                style: const TextStyle(fontSize: 40),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Student Tools Screen
class StudentToolsScreen extends StatelessWidget {
  const StudentToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Tools'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4,
          children: [
            _buildToolCard(
              context,
              'Quadratic Solver',
              'Solve ax² + bx + c = 0',
              Colors.blue,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const QuadraticSolverScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Quadratic Solver Screen
class QuadraticSolverScreen extends StatefulWidget {
  const QuadraticSolverScreen({Key? key}) : super(key: key);

  @override
  State<QuadraticSolverScreen> createState() => _QuadraticSolverScreenState();
}

class _QuadraticSolverScreenState extends State<QuadraticSolverScreen> {
  final TextEditingController _aController = TextEditingController();
  final TextEditingController _bController = TextEditingController();
  final TextEditingController _cController = TextEditingController();
  String _result = '';

  void _solveQuadratic() {
    try {
      double a = double.parse(_aController.text);
      double b = double.parse(_bController.text);
      double c = double.parse(_cController.text);

      if (a == 0) {
        setState(() {
          _result = 'Error: Coefficient "a" cannot be zero in a quadratic equation.';
        });
        return;
      }

      double discriminant = b * b - 4 * a * c;
      
      setState(() {
        _result = 'Discriminant: $discriminant\n\n';
        
        if (discriminant > 0) {
          double x1 = (-b + math.sqrt(discriminant)) / (2 * a);
          double x2 = (-b - math.sqrt(discriminant)) / (2 * a);
          _result += 'Two real roots:\n';
          _result += 'x₁ = ${x1.toStringAsFixed(3)}\n';
          _result += 'x₂ = ${x2.toStringAsFixed(3)}';
        } else if (discriminant == 0) {
          double x = -b / (2 * a);
          _result += 'One real root:\n';
          _result += 'x = ${x.toStringAsFixed(3)}';
        } else {
          double realPart = -b / (2 * a);
          double imaginaryPart = math.sqrt(-discriminant) / (2 * a);
          _result += 'Two complex roots:\n';
          _result += 'x₁ = ${realPart.toStringAsFixed(3)} + ${imaginaryPart.toStringAsFixed(3)}i\n';
          _result += 'x₂ = ${realPart.toStringAsFixed(3)} - ${imaginaryPart.toStringAsFixed(3)}i';
        }
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers for all coefficients.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quadratic Solver'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Solve ax² + bx + c = 0',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _aController,
              decoration: const InputDecoration(
                labelText: 'Coefficient a',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _bController,
              decoration: const InputDecoration(
                labelText: 'Coefficient b',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _cController,
              decoration: const InputDecoration(
                labelText: 'Coefficient c',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _solveQuadratic,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Solve', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Shopper Tools Screen
class ShopperToolsScreen extends StatelessWidget {
  const ShopperToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopper Tools'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4,
          children: [
            _buildToolCard(
              context,
              'Discount Calculator',
              'Calculate savings and final prices',
              Colors.green,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const DiscountCalculatorScreen())),
            ),
            _buildToolCard(
              context,
              'Tip Calculator',
              'Calculate tips and split bills',
              Colors.green,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const TipCalculatorScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Discount Calculator Screen
class DiscountCalculatorScreen extends StatefulWidget {
  const DiscountCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<DiscountCalculatorScreen> createState() => _DiscountCalculatorScreenState();
}

class _DiscountCalculatorScreenState extends State<DiscountCalculatorScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController();
  String _result = '';

  void _calculateDiscount() {
    try {
      double originalPrice = double.parse(_priceController.text);
      double discountPercent = double.parse(_discountController.text);

      double discountAmount = originalPrice * (discountPercent / 100);
      double finalPrice = originalPrice - discountAmount;

      setState(() {
        _result = 'Original Price: \$${originalPrice.toStringAsFixed(2)}\n';
        _result += 'Discount (${discountPercent}%): \$${discountAmount.toStringAsFixed(2)}\n';
        _result += 'Final Price: \$${finalPrice.toStringAsFixed(2)}\n';
        _result += 'You Save: \$${discountAmount.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Discount Calculator'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(
                labelText: 'Original Price (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _discountController,
              decoration: const InputDecoration(
                labelText: 'Discount Percentage (%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateDiscount,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[300]!),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Tip Calculator Screen
class TipCalculatorScreen extends StatefulWidget {
  const TipCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<TipCalculatorScreen> createState() => _TipCalculatorScreenState();
}

class _TipCalculatorScreenState extends State<TipCalculatorScreen> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController(text: '15');
  final TextEditingController _peopleController = TextEditingController(text: '1');
  String _result = '';

  void _calculateTip() {
    try {
      double billAmount = double.parse(_billController.text);
      double tipPercent = double.parse(_tipController.text);
      int numberOfPeople = int.parse(_peopleController.text);

      double tipAmount = billAmount * (tipPercent / 100);
      double totalAmount = billAmount + tipAmount;
      double perPersonAmount = totalAmount / numberOfPeople;

      setState(() {
        _result = 'Bill Amount: \$${billAmount.toStringAsFixed(2)}\n';
        _result += 'Tip (${tipPercent}%): \$${tipAmount.toStringAsFixed(2)}\n';
        _result += 'Total Amount: \$${totalAmount.toStringAsFixed(2)}\n';
        if (numberOfPeople > 1) {
          _result += 'Per Person: \$${perPersonAmount.toStringAsFixed(2)}';
        }
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tip Calculator'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _billController,
              decoration: const InputDecoration(
                labelText: 'Bill Amount (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tipController,
              decoration: const InputDecoration(
                labelText: 'Tip Percentage (%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _peopleController,
              decoration: const InputDecoration(
                labelText: 'Number of People',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateTip,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.green[300]!),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Trader Tools Screen
class TraderToolsScreen extends StatelessWidget {
  const TraderToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Trader Tools'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4,
          children: [
            _buildToolCard(
              context,
              'Profit/Loss Calculator',
              'Calculate investment performance',
              Colors.orange,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfitLossCalculatorScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Profit/Loss Calculator Screen
class ProfitLossCalculatorScreen extends StatefulWidget {
  const ProfitLossCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<ProfitLossCalculatorScreen> createState() => _ProfitLossCalculatorScreenState();
}

class _ProfitLossCalculatorScreenState extends State<ProfitLossCalculatorScreen> {
  final TextEditingController _buyPriceController = TextEditingController();
  final TextEditingController _sellPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController(text: '1');
  String _result = '';
  Color _resultColor = Colors.black;

  void _calculateProfitLoss() {
    try {
      double buyPrice = double.parse(_buyPriceController.text);
      double sellPrice = double.parse(_sellPriceController.text);
      int quantity = int.parse(_quantityController.text);

      double totalBuy = buyPrice * quantity;
      double totalSell = sellPrice * quantity;
      double profitLoss = totalSell - totalBuy;
      double profitLossPercent = (profitLoss / totalBuy) * 100;

      setState(() {
        _result = 'Buy Price: \$${buyPrice.toStringAsFixed(2)} × $quantity = \$${totalBuy.toStringAsFixed(2)}\n';
        _result += 'Sell Price: \$${sellPrice.toStringAsFixed(2)} × $quantity = \$${totalSell.toStringAsFixed(2)}\n';
        _result += '${profitLoss >= 0 ? 'Profit' : 'Loss'}: \$${profitLoss.abs().toStringAsFixed(2)}\n';
        _result += 'Percentage: ${profitLossPercent >= 0 ? '+' : ''}${profitLossPercent.toStringAsFixed(2)}%';
        
        _resultColor = profitLoss >= 0 ? Colors.green : Colors.red;
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
        _resultColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profit/Loss Calculator'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _buyPriceController,
              decoration: const InputDecoration(
                labelText: 'Buy Price (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _sellPriceController,
              decoration: const InputDecoration(
                labelText: 'Sell Price (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _quantityController,
              decoration: const InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateProfitLoss,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _resultColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _resultColor.withOpacity(0.3)),
                ),
                child: Text(
                  _result,
                  style: TextStyle(fontSize: 16, color: _resultColor),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Freelancer Tools Screen
class FreelancerToolsScreen extends StatelessWidget {
  const FreelancerToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freelancer Tools'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4,
          children: [
            _buildToolCard(
              context,
              'Project Earnings Calculator',
              'Calculate earnings with tax deductions',
              Colors.purple,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ProjectEarningsCalculatorScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Project Earnings Calculator Screen
class ProjectEarningsCalculatorScreen extends StatefulWidget {
  const ProjectEarningsCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<ProjectEarningsCalculatorScreen> createState() => _ProjectEarningsCalculatorScreenState();
}

class _ProjectEarningsCalculatorScreenState extends State<ProjectEarningsCalculatorScreen> {
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _hoursController = TextEditingController();
  final TextEditingController _taxRateController = TextEditingController(text: '25');
  String _result = '';

  void _calculateEarnings() {
    try {
      double hourlyRate = double.parse(_hourlyRateController.text);
      double hours = double.parse(_hoursController.text);
      double taxRate = double.parse(_taxRateController.text);

      double grossEarnings = hourlyRate * hours;
      double taxAmount = grossEarnings * (taxRate / 100);
      double netEarnings = grossEarnings - taxAmount;

      setState(() {
        _result = 'Hourly Rate: \${hourlyRate.toStringAsFixed(2)}\n';
        _result += 'Hours Worked: ${hours.toStringAsFixed(1)}\n';
        _result += 'Gross Earnings: \${grossEarnings.toStringAsFixed(2)}\n';
        _result += 'Tax (${taxRate}%): \${taxAmount.toStringAsFixed(2)}\n';
        _result += 'Net Earnings: \${netEarnings.toStringAsFixed(2)}';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Earnings Calculator'),
        backgroundColor: Colors.purple,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _hourlyRateController,
              decoration: const InputDecoration(
                labelText: 'Hourly Rate (\$)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _hoursController,
              decoration: const InputDecoration(
                labelText: 'Hours Worked',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _taxRateController,
              decoration: const InputDecoration(
                labelText: 'Tax Rate (%)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateEarnings,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calculate', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.purple[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.purple[300]!),
                ),
                child: Text(
                  _result,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Fitness Tools Screen
class FitnessToolsScreen extends StatelessWidget {
  const FitnessToolsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fitness Tools'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 1,
          mainAxisSpacing: 16.0,
          childAspectRatio: 4,
          children: [
            _buildToolCard(
              context,
              'BMI Calculator',
              'Calculate Body Mass Index',
              Colors.red,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const BMICalculatorScreen())),
            ),
            _buildToolCard(
              context,
              'Calorie Calculator',
              'Calculate daily calorie needs',
              Colors.red,
              () => Navigator.push(context, MaterialPageRoute(builder: (context) => const CalorieCalculatorScreen())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildToolCard(BuildContext context, String title, String subtitle, Color color, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [color.withOpacity(0.1), color.withOpacity(0.05)],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BMI Calculator Screen
class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = '';
  Color _resultColor = Colors.black;

  void _calculateBMI() {
    try {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      
      double heightInMeters = height / 100;
      double bmi = weight / (heightInMeters * heightInMeters);
      
      String category;
      Color categoryColor;
      
      if (bmi < 18.5) {
        category = 'Underweight';
        categoryColor = Colors.blue;
      } else if (bmi < 25) {
        category = 'Normal';
        categoryColor = Colors.green;
      } else if (bmi < 30) {
        category = 'Overweight';
        categoryColor = Colors.orange;
      } else {
        category = 'Obesity';
        categoryColor = Colors.red;
      }

      setState(() {
        _result = 'Weight: ${weight.toStringAsFixed(1)} kg\n';
        _result += 'Height: ${height.toStringAsFixed(0)} cm\n';
        _result += 'BMI: ${bmi.toStringAsFixed(1)}\n';
        _result += 'Category: $category';
        _resultColor = categoryColor;
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
        _resultColor = Colors.red;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _weightController,
              decoration: const InputDecoration(
                labelText: 'Weight (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _heightController,
              decoration: const InputDecoration(
                labelText: 'Height (cm)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Calculate BMI', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 20),
            if (_result.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: _resultColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: _resultColor.withOpacity(0.3)),
                ),
                child: Text(
                  _result,
                  style: TextStyle(fontSize: 16, color: _resultColor, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

// Calorie Calculator Screen
class CalorieCalculatorScreen extends StatefulWidget {
  const CalorieCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalorieCalculatorScreen> createState() => _CalorieCalculatorScreenState();
}

class _CalorieCalculatorScreenState extends State<CalorieCalculatorScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  
  String _selectedGender = 'Male';
  String _selectedActivity = 'Sedentary';
  String _result = '';

  final Map<String, double> activityMultipliers = {
    'Sedentary': 1.2,
    'Lightly Active': 1.375,
    'Moderately Active': 1.55,
    'Very Active': 1.725,
    'Extremely Active': 1.9,
  };

  void _calculateCalories() {
    try {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text);
      int age = int.parse(_ageController.text);
      
      // Harris-Benedict Formula
      double bmr;
      if (_selectedGender == 'Male') {
        bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
      } else {
        bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
      }
      
      double tdee = bmr * activityMultipliers[_selectedActivity]!;
      double weightLoss = tdee - 500;
      double weightGain = tdee + 500;

      setState(() {
        _result = 'BMR (Base Metabolic Rate): ${bmr.toStringAsFixed(0)} calories/day\n\n';
        _result += 'TDEE (Total Daily Energy Expenditure): ${tdee.toStringAsFixed(0)} calories/day\n\n';
        _result += 'Calorie Goals:\n';
        _result += '• Weight Loss: ${weightLoss.toStringAsFixed(0)} calories/day\n';
        _result += '• Maintenance: ${tdee.toStringAsFixed(0)} calories/day\n';
        _result += '• Weight Gain: ${weightGain.toStringAsFixed(0)} calories/day';
      });
    } catch (e) {
      setState(() {
        _result = 'Error: Please enter valid numbers.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calorie Calculator'),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _ageController,
                decoration: const InputDecoration(
                  labelText: 'Age (years)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                ),
                items: ['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedGender = newValue!;
                  });
                },
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedActivity,
                decoration: const InputDecoration(
                  labelText: 'Activity Level',
                  border: OutlineInputBorder(),
                ),
                items: activityMultipliers.keys.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedActivity = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateCalories,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Calculate Calories', style: TextStyle(fontSize: 18)),
              ),
              const SizedBox(height: 20),
              if (_result.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red[300]!),
                  ),
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

// Basic Calculator Screen
class BasicCalculatorScreen extends StatefulWidget {
  const BasicCalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BasicCalculatorScreen> createState() => _BasicCalculatorScreenState();
}

class _BasicCalculatorScreenState extends State<BasicCalculatorScreen> {
  String _display = '0';
  String _previousOperand = '';
  String _operator = '';
  bool _waitingForOperand = false;

  void _inputDigit(String digit) {
    setState(() {
      if (_waitingForOperand) {
        _display = digit;
        _waitingForOperand = false;
      } else {
        _display = _display == '0' ? digit : _display + digit;
      }
    });
  }

  void _inputOperation(String nextOperator) {
    double inputValue = double.parse(_display);

    if (_previousOperand.isEmpty) {
      _previousOperand = inputValue.toString();
    } else if (_operator.isNotEmpty) {
      double previousValue = double.parse(_previousOperand);
      double result = _calculate(previousValue, inputValue, _operator);
      
      setState(() {
        _display = result.toString();
        _previousOperand = result.toString();
      });
    }

    setState(() {
      _waitingForOperand = true;
      _operator = nextOperator;
    });
  }

  double _calculate(double firstOperand, double secondOperand, String operator) {
    switch (operator) {
      case '+':
        return firstOperand + secondOperand;
      case '-':
        return firstOperand - secondOperand;
      case '×':
        return firstOperand * secondOperand;
      case '÷':
        return firstOperand / secondOperand;
      default:
        return secondOperand;
    }
  }

  void _performCalculation() {
    double inputValue = double.parse(_display);

    if (_previousOperand.isNotEmpty && _operator.isNotEmpty) {
      double previousValue = double.parse(_previousOperand);
      double result = _calculate(previousValue, inputValue, _operator);

      setState(() {
        _display = result.toString();
        _previousOperand = '';
        _operator = '';
        _waitingForOperand = true;
      });
    }
  }

  void _clear() {
    setState(() {
      _display = '0';
      _previousOperand = '';
      _operator = '';
      _waitingForOperand = false;
    });
  }

  Widget _buildButton(String text, Color color, Color textColor, VoidCallback onPressed) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(20),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Calculator'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Colors.black,
              ),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  _display,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('C', Colors.grey[400]!, Colors.black, _clear),
                        _buildButton('±', Colors.grey[400]!, Colors.black, () {}),
                        _buildButton('%', Colors.grey[400]!, Colors.black, () {}),
                        _buildButton('÷', Colors.orange, Colors.white, () => _inputOperation('÷')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('7', Colors.grey[600]!, Colors.white, () => _inputDigit('7')),
                        _buildButton('8', Colors.grey[600]!, Colors.white, () => _inputDigit('8')),
                        _buildButton('9', Colors.grey[600]!, Colors.white, () => _inputDigit('9')),
                        _buildButton('×', Colors.orange, Colors.white, () => _inputOperation('×')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('4', Colors.grey[600]!, Colors.white, () => _inputDigit('4')),
                        _buildButton('5', Colors.grey[600]!, Colors.white, () => _inputDigit('5')),
                        _buildButton('6', Colors.grey[600]!, Colors.white, () => _inputDigit('6')),
                        _buildButton('-', Colors.orange, Colors.white, () => _inputOperation('-')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        _buildButton('1', Colors.grey[600]!, Colors.white, () => _inputDigit('1')),
                        _buildButton('2', Colors.grey[600]!, Colors.white, () => _inputDigit('2')),
                        _buildButton('3', Colors.grey[600]!, Colors.white, () => _inputDigit('3')),
                        _buildButton('+', Colors.orange, Colors.white, () => _inputOperation('+')),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: const EdgeInsets.all(4),
                            child: ElevatedButton(
                              onPressed: () => _inputDigit('0'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[600],
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(20),
                              ),
                              child: const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  '0',
                                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                        _buildButton('.', Colors.grey[600]!, Colors.white, () => _inputDigit('.')),
                        _buildButton('=', Colors.orange, Colors.white, _performCalculation),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }}