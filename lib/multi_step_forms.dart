import 'package:flutter/material.dart';

class StepForm extends StatelessWidget {
  const StepForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StepWidget(),
    );
  }
}

class StepWidget extends StatefulWidget {
  const StepWidget({Key? key}) : super(key: key);

  @override
  State<StepWidget> createState() => _StepWidgetState();
}

class _StepWidgetState extends State<StepWidget> {
  int currentStape = 0;
  bool isCompleted = false;

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final address = TextEditingController();
  final postcode = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Stepper Widget'),
      centerTitle: true,
    ),
    body: isCompleted
    ? buildCompleted()
    : Theme(
      data: Theme.of(context).copyWith(
        colorScheme: const ColorScheme.light(primary: Colors.red)
      ),
      child: Stepper(
        type: StepperType.horizontal,
        steps: getSteps(),
        currentStep: currentStape,
        onStepContinue: () {
          final isLastStep = currentStape == getSteps().length -1;
    
          if (isLastStep) {
            setState(() => isCompleted = true);
    
            print('Completed');
            // send data to server
          } else {
            setState(() => currentStape += 1);
          }
        },
        onStepTapped: (step) => setState(() => currentStape = step),
        onStepCancel: currentStape == 0 ? null : () => setState(() => currentStape -= 1),
        controlsBuilder: (context, details) {
          final isLastStep = currentStape == getSteps().length -1;

          return Container(
            margin: const EdgeInsets.only(top: 50),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    child: Text(isLastStep ? 'Confirm' : 'Next'),
                    onPressed: () {
                      final isLastStep = currentStape == getSteps().length -1;
    
                      if (isLastStep) {
                        setState(() => isCompleted = true);
    
                        print('Completed');
                        // send data to server
                      } else {
                        setState(() => currentStape += 1);
                      }
                    }
                    )
                ),
                const SizedBox(width: 12),
                if (currentStape != 0)
                Expanded(
                  child: ElevatedButton(
                    onPressed: currentStape == 0 ? null : () => setState(() => currentStape -= 1),
                    child: const Text('Back')
                  )
                )
              ],
            ),
          );
        },
      ),
    ),
  );

  List<Step> getSteps() => [
    Step(
      state: currentStape > 0 ? StepState.complete : StepState.indexed,
      isActive: currentStape >= 0,
      title: const Text('Account'),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: firstName,
            decoration: const InputDecoration(labelText: 'First Name'),
          ),
          TextFormField(
            controller: lastName,
            decoration: const InputDecoration(labelText: 'Last Name'),
          )
        ],
      )
    ),
    Step(
      state: currentStape > 1 ? StepState.complete : StepState.indexed,
      isActive: currentStape >= 1,
      title: const Text('address'),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: address,
            decoration: const InputDecoration(labelText: 'Address'),
          ),
          TextFormField(
            controller: postcode,
            decoration: const InputDecoration(labelText: 'PostCode'),
          )
        ],
      )
    ),
    Step(
      isActive: currentStape >= 2,
      title: const Text('Complete'),
      content: Column(
        children: <Widget>[
          Text('Name: ${firstName.text} ${lastName.text}'),
          Text('Address: ${address.text}'),
          Text('Post Code: ${postcode.text}')
        ],
      )
    )
  ];

  Widget buildCompleted() {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
          textStyle: const TextStyle(fontSize: 24),
          minimumSize: const Size.fromHeight(50)
        ),
        child: const SizedBox(
          height: 30.0,
          child: Text('Reset'),
        ),
        onPressed: () => setState(() {
          isCompleted = false;
          currentStape = 0;

          firstName.clear();
          lastName.clear();
          address.clear();
          postcode.clear();
        })
      ),
    );
  }
}