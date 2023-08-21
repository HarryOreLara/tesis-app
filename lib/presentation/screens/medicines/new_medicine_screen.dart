
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tesis_app/presentation/blocs/new_medicine/new_medicines_cubit.dart';
import 'package:tesis_app/presentation/widgets/widgets.dart';

class NewMedicineScreen extends StatelessWidget {
  static const String name = 'newMedicine_screen';
  const NewMedicineScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 22, 205, 255),
          elevation: 3,
          title: const Text('Nuevo Medicamento'),
          centerTitle: true,
        ),
        body: Scaffold(

            body: BlocProvider(
          create: (context) => NewMedicinesCubit(),
          child: const _NewMedicineView(),
        )));
  }
}

class _NewMedicineView extends StatelessWidget {
  const _NewMedicineView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              _FormMedicine(),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _FormMedicine extends StatelessWidget {
  const _FormMedicine();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final newMedicinesCubit = context.watch<NewMedicinesCubit>();
    final nombreMedicine = newMedicinesCubit.state.nombreMedicine;
    final cantidadPastillas = newMedicinesCubit.state.cantidadPastillas;
    final horaInicio = newMedicinesCubit.state.horaInicio;
    final horaFin = newMedicinesCubit.state.horaFin;


    return Form(
      child: Column(
        children: [
          InputTextFormField(
            label: 'Nombre de Medicina',
            onChanged: newMedicinesCubit.nameMedicineChange,
            erroMessage: nombreMedicine.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          InputTextFormField(
            label: 'Cantidad de pastillas a tomar',
            onChanged: newMedicinesCubit.amountPillsChange,
            erroMessage: cantidadPastillas.errorMessage,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: size.width * 0.4,
                child: InputTextFormField(
                  label: 'Hora de inicio',
                  onChanged: newMedicinesCubit.hoursStartChange,
                  erroMessage: horaInicio.errorMessage,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: size.width * 0.4,
                child: InputTextFormField(
                  label: 'Hora Fin',
                  onChanged: newMedicinesCubit.hoursEndChange,
                  erroMessage: horaFin.errorMessage,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          FilledButton.tonalIcon(
              onPressed: () {
                //newMedicinesCubit.onSubmit();
                newMedicinesCubit.guardarBaseDatos();

              },
              icon: const Icon(Icons.save),
              label: const Text('Guardar Medicina'))
        ],
      ),
    );
  }
}
