import 'package:flutter/material.dart';
import 'package:cupertino_stepper/cupertino_stepper.dart';

class InformationB extends StatefulWidget {
  @override
  InformationBState createState() => InformationBState();
}

class InformationBState extends State<InformationB> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("خطوات التقديم للفئة - B",style: TextStyle(
          color: Colors.black,
          fontFamily: "cairo"
        ),),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
            switch (orientation) {
              case Orientation.portrait:
                return _buildStepper(StepperType.vertical);
              case Orientation.landscape:
                return _buildStepper(StepperType.horizontal);
              default:
                throw UnimplementedError(orientation.toString());
            }
          },
        ),
      ),
    );
  }

  CupertinoStepper _buildStepper(StepperType type) {
    final canCancel = currentStep > 0;
    final canContinue = currentStep < 3;
    return CupertinoStepper(
      type: type,
      currentStep: currentStep,
      onStepTapped: (step) => setState(() => currentStep = step),
      onStepCancel: canCancel ? () => setState(() => --currentStep) : null,
      onStepContinue: canContinue ? () => setState(() => ++currentStep) : null,
      steps: [
        for (var i = 0; i < 3; ++i)
          _buildStep(
            title: Text('${i + 1} الخطوة ',style: TextStyle(
              fontFamily: "cairo"
            ),),
            isActive: i == currentStep,
            state: i == currentStep
                ? StepState.editing
                : i < currentStep ? StepState.complete : StepState.indexed,
          ),
        _buildStep(
          title: Text('خطوة غير مكتملة',style: TextStyle(
              fontFamily: "cairo"
          ),),
          state: StepState.error,
        ),
        _buildStep(
          title: Text('الخطوه القادمة',style: TextStyle(
              fontFamily: "cairo"
          ),),
          state: StepState.disabled,
        )
      ],
    );
  }

  Step _buildStep({
    Widget title,
    StepState state = StepState.indexed,
    bool isActive = false,
  }) {
    return Step(
      title: title,
      subtitle: Text('أختبار'),
      state: state,
      isActive: isActive,
      content: LimitedBox(
        maxWidth: 300,
        maxHeight: 300,
        child: Container(
          color: Colors.grey[300],
          child: Column(
          children: [
            Center(child: Text("الخطوة",style: TextStyle(
              color: Colors.black,
              fontFamily: "cairo",
              fontSize: 30
            ),),),
            SizedBox(
              height: 5,
            ),
            Center(child: Text("تم تنفيذ الخطوة",style: TextStyle(
                color: Colors.green,
                fontFamily: "cairo",
                fontSize: 20
            ),),),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset("assets/completed-.png"),
              )
            )
          ],
        ),),
      ),
    );
  }
}