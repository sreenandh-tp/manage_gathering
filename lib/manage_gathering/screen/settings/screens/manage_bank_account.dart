import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ManageBankAccountPage extends StatelessWidget {
  const ManageBankAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          leading: const CloseButton(),
          title: Text(
            "Bank Account",
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
              child: Text(
                "LINED BANK ACCOUNT",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(top: 10, right: 15, left: 15),
              leading: Container(
                height: 70,
                width: 60,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 226, 226, 226),
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.account_balance_outlined),
              ),
              title: Text(
                "ACCOUNT HOLDER",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "4220******0126",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Text(
                    "Canera Bank ,Thalassery",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
              trailing: const Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 10, top: 25),
              child: Text(
                "UPDATED ACCOUNT DETAILS",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                obscureText: true,
                decoration:
                    const InputDecoration(label: Text("Account Number")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextField(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    label: Text("Corfirm account number")),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextField(
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(label: Text("IFSC Code")),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(label: Text("Account holder name")),
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {},
                child: const Text("Update"),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
