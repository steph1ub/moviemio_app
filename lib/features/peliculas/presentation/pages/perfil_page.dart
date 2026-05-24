import 'package:flutter/material.dart';

class AdminMoviePanel extends StatelessWidget {
  const AdminMoviePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panel de Administración'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
         
         
            
            // Sección de Formulario (Alta)
            _buildSectionTitle("Nueva Película", Icons.add_circle_outline),
            const MovieForm(buttonText: "Registrar en Catálogo", buttonColor: Colors.blueAccent),
            
            const SizedBox(height: 10),
            
            // Sección de Tabla (Vista previa y Baja)
            _buildSectionTitle("Catálogo Actual", Icons.list_alt),
            const MoviePreviewTable(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent),
          const SizedBox(width: 10),
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

// --- TABLA DE VISTA PREVIA ---
class MoviePreviewTable extends StatelessWidget {
  const MoviePreviewTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(26), blurRadius: 10)],
      ),
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(Colors.grey[100]),
        columns: const [
          DataColumn(label: Text('Póster')),
          DataColumn(label: Text('Título')),
          DataColumn(label: Text('Director')),
          DataColumn(label: Text('Acción')),
        ],
        rows: [
          _buildDataRow("Back to the Future", "Robert Zemeckis", "assets/images/future.png"),
          _buildDataRow("Mario Galaxy", "Christopher Nolan", "assets/images/mario.png"),
          _buildDataRow("The Matrix", "Lana Wachowski", "assets/images/matrix.png"),
        ],
      ),
    );
  }

  DataRow _buildDataRow(String title, String director, String imageUrl) {
    return DataRow(cells: [
      DataCell(Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(imageUrl, width: 35, height: 50, fit: BoxFit.cover),
        ),
      )),
      DataCell(Text(title, style: const TextStyle(fontWeight: FontWeight.w500))),
      DataCell(Text(director)),
      DataCell(
    Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // BOTÓN EDITAR
          IconButton(
            icon: const Icon(Icons.edit_note, color: Colors.blueAccent),
            tooltip: 'Editar película',
            onPressed: () {
              // Lógica para cargar los datos en el formulario
              
            },
          ),
          // BOTÓN ELIMINAR
          IconButton(
            icon: const Icon(Icons.delete_sweep_outlined, color: Colors.redAccent),
            tooltip: 'Eliminar película',
            onPressed: () {
              
            },
          ),
        ],
      ),
    ),
  ]);
}
}

// --- FORMULARIO ---
class MovieForm extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;

  const MovieForm({super.key, required this.buttonText, required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _inputField("Título", Icons.movie_filter),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(child: _inputField("Año", Icons.calendar_today, keyboard: TextInputType.number)),
                const SizedBox(width: 15),
                Expanded(child: _inputField("Género", Icons.theater_comedy)),
              ],
            ),
            const SizedBox(height: 15),
            _inputField("Director", Icons.person_pin),
            const SizedBox(height: 15),
            _inputField("Resumen / Sinopsis", Icons.notes, maxLines: 2),
            const SizedBox(height: 15),
            _inputField("URL de la Imagen (Poster)", Icons.image),
        const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(buttonText),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, IconData icon, {int maxLines = 1, TextInputType keyboard = TextInputType.text}) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboard,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 20),
        isDense: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}