import 'package:flutter/material.dart';

class MusicPlayerHome extends StatefulWidget {
  @override
  _MusicPlayerHomeState createState() => _MusicPlayerHomeState();
}

class _MusicPlayerHomeState extends State<MusicPlayerHome> {
  bool isPlaying = false;
  double currentPosition = 0.3;
  
  List<Map<String, String>> playlist = [
    {'title': 'Song Title 1', 'artist': 'Artist Name 1', 'duration': '3:45'},
    {'title': 'Song Title 2', 'artist': 'Artist Name 2', 'duration': '4:12'},
    {'title': 'Song Title 3', 'artist': 'Artist Name 3', 'duration': '2:58'},
    {'title': 'Song Title 4', 'artist': 'Artist Name 4', 'duration': '5:23'},
    {'title': 'Song Title 5', 'artist': 'Artist Name 5', 'duration': '3:17'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Music Player', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Currently Playing Section
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                // Album Art
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.music_note,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                ),
                SizedBox(height: 16),
                
                // Song Info
                Text(
                  'Currently Playing Song',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Artist Name',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 16),
                
                // Progress Bar
                Column(
                  children: [
                    Slider(
                      value: currentPosition,
                      onChanged: (value) {
                        setState(() {
                          currentPosition = value;
                        });
                      },
                      activeColor: Colors.blue,
                      inactiveColor: Colors.grey[600],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1:23', style: TextStyle(color: Colors.grey[400])),
                          Text('3:45', style: TextStyle(color: Colors.grey[400])),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Control Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous, color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: Colors.white,
                          size: 36,
                        ),
                        onPressed: () {
                          setState(() {
                            isPlaying = !isPlaying;
                          });
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next, color: Colors.white, size: 32),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Playlist Section
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Playlist',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 12),
                  Expanded(
                    child: ListView.builder(
                      itemCount: playlist.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.music_note,
                                color: Colors.grey[400],
                              ),
                            ),
                            title: Text(
                              playlist[index]['title']!,
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              playlist[index]['artist']!,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            trailing: Text(
                              playlist[index]['duration']!,
                              style: TextStyle(color: Colors.grey[400]),
                            ),
                            onTap: () {
                              // Handle song selection
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Main app wrapper
class MusicPlayerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MusicPlayerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

void main() {
  runApp(MusicPlayerApp());
}