import 'package:flutter/material.dart';

class Chat {
  final String name;
  final String message;
  final String time;

  Chat(this.name, this.message, this.time);
}

void main() {
  runApp(ConnectionsPageApp());
}

class ConnectionsPageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.red, // Set the primary color to red
      ),
      home: ConnectionsPage(),
    );
  }
}

class ConnectionsPage extends StatelessWidget {
  final List<Chat> chats = [
    Chat('Jane', 'Hi there!', '10:00 AM'),
    Chat('John', 'Hello!', '10:05 AM'),
    Chat('Foga', 'Hey!', '10:10 AM'),
    Chat('Sickle Cell UK Group', 'Hey Everyone!', '10:10 PM'),
    Chat('Sickle Cell USA Group', 'Hey Everyone!', '11:10 AM'),
    // Add more chats as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connections'),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(chat.name[0]), // Display the first letter of the name
            ),
            title: Text(chat.name),
            subtitle: Text(chat.message),
            trailing: Text(chat.time),
            onTap: () {
              // Navigate to the chat screen for this user
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatScreen(chat),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final Chat chat;

  ChatScreen(this.chat);

  // Dummy chat messages for each chat
  final List<String> chatMessages = [
    'Hi Foga!',
    'Hello there!',
    'Hey Foga!',
    'What\'s up?',
    'I have a question...',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chat.name),
      ),
      body: Column(
        children: [
          // Chat messages using a ListView
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(chatMessages[index]),
                );
              },
            ),
          ),
          Divider(
            height: 1,
            color: Colors.grey,
          ),
          // Input field for sending messages
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle sending the message here
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
