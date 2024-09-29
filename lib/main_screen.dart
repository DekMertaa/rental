import 'package:flutter/material.dart';
import 'package:rentalmotor/detail_screen.dart';
import 'package:rentalmotor/model/rental_place.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<RentalPlace> rentalPlaceListFiltered = rentalPlaceList;
  List<RentalPlace> favoritePlaces = []; // List untuk menyimpan motor favorit
  TextEditingController searchController = TextEditingController();

  void _filterRentalPlaces(String query) {
    setState(() {
      if (query.isEmpty) {
        rentalPlaceListFiltered = rentalPlaceList;
      } else {
        rentalPlaceListFiltered = rentalPlaceList
            .where((place) =>
                place.name.toLowerCase().contains(query.toLowerCase()) ||
                place.location.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _logout() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Logout", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Apakah Anda yakin ingin logout?", style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal", style: TextStyle(color: Colors.teal)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Logout", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushReplacementNamed('/login');
              },
            ),
          ],
        );
      },
    );
  }

  void _toggleFavorite(RentalPlace place) {
    setState(() {
      if (favoritePlaces.contains(place)) {
        favoritePlaces.remove(place);
      } else {
        favoritePlaces.add(place);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Motor Bali'),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text(
                'Rental Motor Bali',
                style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.favorite, color: Colors.red),
              title: const Text('Favorit'),
              onTap: () {
                // Navigasi ke halaman favorit
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FavoriteScreen(
                      favoritePlaces: favoritePlaces,
                      onDelete: (place) {
                        _showDeleteConfirmationDialog(context, place);
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color: Color.fromARGB(255, 243, 5, 5)),
              title: const Text('Logout'),
              onTap: _logout,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: 'Cari...',
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                suffixIcon: const Icon(Icons.search, size: 18),
              ),
              style: const TextStyle(fontSize: 16.0),
              onChanged: _filterRentalPlaces,
            ),
          ),
          Expanded(
            child: rentalPlaceListFiltered.isEmpty
                ? Center(
                    child: Text(
                      'Motor yang dicari tidak ada',
                      style: TextStyle(fontSize: 16.0, color: Colors.grey[600]),
                    ),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 4 / 3,
                    ),
                    padding: const EdgeInsets.all(8.0),
                    itemCount: rentalPlaceListFiltered.length,
                    itemBuilder: (context, index) {
                      final RentalPlace place = rentalPlaceListFiltered[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                            return DetailScreen(place: place);
                          }));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Stack(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                      child: Image.asset(
                                        place.imageAsset,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          place.name,
                                          style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(place.location, style: TextStyle(color: Colors.grey[700])),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 8,
                                right: 8,
                                child: IconButton(
                                  icon: Icon(
                                    favoritePlaces.contains(place)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () => _toggleFavorite(place),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, RentalPlace place) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Apakah Anda yakin ingin menghapus motor ini dari favorit?", style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal", style: TextStyle(color: Colors.teal)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
               // Panggil fungsi untuk menghapus dari daftar favorit
              },
            ),
          ],
        );
      },
    );
  }
}

// Halaman untuk menampilkan motor favorit
class FavoriteScreen extends StatelessWidget {
  final List<RentalPlace> favoritePlaces;
  final Function(RentalPlace) onDelete; // Callback untuk menghapus item

  const FavoriteScreen({super.key, required this.favoritePlaces, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Motor Favorit'),
        backgroundColor: Colors.teal,
      ),
      body: favoritePlaces.isEmpty
          ? const Center(child: Text('Belum ada motor favorit.'))
          : ListView.builder(
              itemCount: favoritePlaces.length,
              itemBuilder: (context, index) {
                final RentalPlace place = favoritePlaces[index];
                return ListTile(
                  title: Text(place.name),
                  subtitle: Text(place.location),
                  leading: Image.asset(place.imageAsset, width: 50, fit: BoxFit.cover),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Tampilkan dialog konfirmasi sebelum menghapus
                      _showDeleteConfirmationDialog(context, place);
                    },
                  ),
                );
              },
            ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, RentalPlace place) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Konfirmasi Hapus", style: TextStyle(fontWeight: FontWeight.bold)),
          content: const Text("Apakah Anda yakin ingin menghapus motor ini dari favorit?", style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            TextButton(
              child: const Text("Batal", style: TextStyle(color: Colors.teal)),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Hapus", style: TextStyle(color: Colors.red)),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                onDelete(place); // Panggil fungsi untuk menghapus dari daftar favorit
              },
            ),
          ],
        );
      },
    );
  }
}
