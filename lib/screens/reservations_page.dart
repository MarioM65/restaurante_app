import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/reservation.dart';

class ReservationsPage extends StatefulWidget {
  const ReservationsPage({super.key});

  @override
  State<ReservationsPage> createState() => _ReservationsPageState();
}

class _ReservationsPageState extends State<ReservationsPage> {
  final _formKey = GlobalKey<FormState>();
  final ApiService _apiService = ApiService();

  final TextEditingController _numberOfPeopleController = TextEditingController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _submitReservation() async {
    if (_formKey.currentState!.validate()) {
      if (_selectedDate == null || _selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Por favor, selecione a data e a hora.')),
        );
        return;
      }

      final reservation = Reservation(
        numberOfPeople: int.parse(_numberOfPeopleController.text),
        date: _selectedDate!,
        time: DateTime(
          _selectedDate!.year,
          _selectedDate!.month,
          _selectedDate!.day,
          _selectedTime!.hour,
          _selectedTime!.minute,
        ),
      );

      try {
        await _apiService.createReservation(reservation);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Reserva enviada com sucesso!')),
        );
        _formKey.currentState!.reset();
        setState(() {
          _selectedDate = null;
          _selectedTime = null;
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Erro ao enviar reserva: $e')),
        );
      }
    }
  }

  @override
  void dispose() {
    _numberOfPeopleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            const Text(
              'Faça sua Reserva',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _numberOfPeopleController,
              decoration: const InputDecoration(
                labelText: 'Número de pessoas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.group),
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Por favor, insira o número de pessoas';
                }
                if (int.tryParse(value) == null) {
                  return 'Por favor, insira um número válido';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(text: _selectedDate == null ? '' : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              decoration: const InputDecoration(
                labelText: 'Data',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.calendar_today),
              ),
              onTap: () => _selectDate(context),
              validator: (value) {
                if (_selectedDate == null) {
                  return 'Por favor, selecione a data';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              readOnly: true,
              controller: TextEditingController(text: _selectedTime == null ? '' : _selectedTime!.format(context)),
              decoration: const InputDecoration(
                labelText: 'Hora',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
              onTap: () => _selectTime(context),
              validator: (value) {
                if (_selectedTime == null) {
                  return 'Por favor, selecione a hora';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              onPressed: _submitReservation,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                textStyle: const TextStyle(fontSize: 18),
              ),
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Confirmar Reserva'),
            ),
          ],
        ),
      ),
    );
  }
}
