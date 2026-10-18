import 'package:flutter/material.dart';

class BMIScreen extends StatefulWidget {
  const BMIScreen({super.key});

  @override
  State<BMIScreen> createState() => _BMIScreenState();
}

class _BMIScreenState extends State<BMIScreen> {
  final _bbController = TextEditingController();
  final _tbController = TextEditingController();

  String _jenisKelamin = 'Laki-laki';
  double? _hasilBMI;
  String _keterangan = "Masukkan Data Anda!!!";

  void _hitungBMI() {
    final double bb = double.tryParse(_bbController.text) ?? 0;
    final double tbCm = double.tryParse(_tbController.text) ?? 0;

    setState(() {
      if (bb > 0 && tbCm > 0) {
        final double tbM = tbCm / 100;
        final double hasil = bb / (tbM * tbM);
        _hasilBMI = hasil;

        if (_jenisKelamin == 'Laki-laki') {
          if (hasil < 18.5) {
            _keterangan = "Kurus (Kekurangan Berat Badan)";
          } else if (hasil >= 18.5 && hasil < 25.0) {
            _keterangan = "Normal / Ideal ✨";
          } else if (hasil >= 25.0 && hasil < 30.0) {
            _keterangan = "Kelebihan Berat Badan";
          } else {
            _keterangan = "Obesitas";
          }
        } else {
          if (hasil < 18.0) {
            _keterangan = "Kurus (Kekurangan Berat Badan)";
          } else if (hasil >= 18.0 && hasil < 24.0) {
            _keterangan = "Normal / Ideal ✨";
          } else if (hasil >= 24.0 && hasil < 29.0) {
            _keterangan = "Kelebihan Berat Badan";
          } else {
            _keterangan = "Obesitas";
          }
        }
      } else {
        _hasilBMI = null;
        _keterangan = "Data Tidak Valid / Masukkan Angka Benar!!!";
      }
    });
  }

  void _resetForm() {
    setState(() {
      _bbController.clear();
      _tbController.clear();
      _hasilBMI = null;
      _keterangan = "Masukkan Data Anda!!!";
      _jenisKelamin = 'Laki-laki';
    });
  }

  @override
  void dispose() {
    _bbController.dispose();
    _tbController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        title: const Text(
          'Kalkulator BMI',
          style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1),
        ),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Pilih Jenis Kelamin',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _jenisKelamin = 'Laki-laki'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _jenisKelamin == 'Laki-laki'
                              ? Colors.indigo
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _jenisKelamin == 'Laki-laki'
                                ? Colors.indigo
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            if (_jenisKelamin == 'Laki-laki')
                              BoxShadow(
                                color: Colors.indigo.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.male,
                              color: _jenisKelamin == 'Laki-laki'
                                  ? Colors.white
                                  : Colors.indigo,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Laki-laki',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _jenisKelamin == 'Laki-laki'
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => _jenisKelamin = 'Perempuan'),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: _jenisKelamin == 'Perempuan'
                              ? Colors.pink
                              : Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: _jenisKelamin == 'Perempuan'
                                ? Colors.pink
                                : Colors.grey.shade300,
                            width: 2,
                          ),
                          boxShadow: [
                            if (_jenisKelamin == 'Perempuan')
                              BoxShadow(
                                color: Colors.pink.withOpacity(0.3),
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: _jenisKelamin == 'Perempuan'
                                  ? Colors.white
                                  : Colors.pink,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Perempuan',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: _jenisKelamin == 'Perempuan'
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _bbController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.monitor_weight_outlined,
                    color: Colors.indigo,
                  ),
                  labelText: 'Berat Badan (kg)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.indigo,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _tbController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                decoration: InputDecoration(
                  prefixIcon: const Icon(
                    Icons.height_outlined,
                    color: Colors.indigo,
                  ),
                  labelText: 'Tinggi Badan (cm)',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Colors.indigo,
                      width: 2,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: _hitungBMI,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        elevation: 4,
                        shadowColor: Colors.indigo.withOpacity(0.4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Hitung BMI',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton(
                      onPressed: _resetForm,
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: const BorderSide(
                          color: Colors.redAccent,
                          width: 1.5,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: const Text(
                        'Reset',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.redAccent,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                  border: Border.all(color: Colors.grey.shade100),
                ),
                child: Column(
                  children: [
                    const Text(
                      'Hasil Perhitungan BMI',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      _hasilBMI?.toStringAsFixed(1) ?? '--',
                      style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _keterangan,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
