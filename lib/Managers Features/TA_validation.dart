import 'package:flutter/material.dart';

class TravelAllowanceValidationScreen extends StatefulWidget {
  const TravelAllowanceValidationScreen({Key? key}) : super(key: key);

  @override
  _TravelAllowanceValidationScreenState createState() => _TravelAllowanceValidationScreenState();
}

class _TravelAllowanceValidationScreenState extends State<TravelAllowanceValidationScreen> {
  final List<Claim> _claims = List.generate(10, (index) => Claim(id: index, amount: (index + 1) * 100, description: 'Claim $index'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TA Validation'),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Travel Allowance Claims',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _claims.length,
                itemBuilder: (context, index) {
                  final claim = _claims[index];
                  return ClaimTile(claim: claim, onApprove: () => _approveClaim(claim), onReject: () => _rejectClaim(claim));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _approveClaim(Claim claim) {
    setState(() {
      // Logic to approve claim
      _claims.remove(claim);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Claim ${claim.id} approved')));
    });
  }

  void _rejectClaim(Claim claim) {
    setState(() {
      // Logic to reject claim
      _claims.remove(claim);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Claim ${claim.id} rejected')));
    });
  }
}

class Claim {
  final int id;
  final double amount;
  final String description;

  Claim({required this.id, required this.amount, required this.description});
}

class ClaimTile extends StatelessWidget {
  final Claim claim;
  final VoidCallback onApprove;
  final VoidCallback onReject;

  const ClaimTile({required this.claim, required this.onApprove, required this.onReject});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text('Claim ${claim.id}'),
        subtitle: Text('Amount: \$${claim.amount}\nDescription: ${claim.description}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.check, color: Colors.green),
              onPressed: onApprove,
            ),
            IconButton(
              icon: Icon(Icons.close, color: Colors.red),
              onPressed: onReject,
            ),
          ],
        ),
      ),
    );
  }
}
