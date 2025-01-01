import 'package:flutter/material.dart';
import 'item_model.dart';

class DetailsPage extends StatefulWidget {
  final ItemModel item;

  const DetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), 
    );
    
    // Define the scale animation
    _scaleAnimation = Tween<double>(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut, 
      ),
    );

    // Start the animation when the widget is first built
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose(); // Dispose the controller when not needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: Text(
          'Item Details',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
        backgroundColor: Colors.teal.shade700, 
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             
              Center(
                child: ScaleTransition(
                  scale: _scaleAnimation, 
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(widget.item.image ?? 'https://via.placeholder.com/150'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              
              Text(
                widget.item.title ?? 'Untitled',
                style: TextStyle(
                  fontSize: 22, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.teal.shade700, 
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 10),

             
              Text(
                widget.item.description ?? 'No description available.',
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),

             
              if (widget.item.cost != null)
                Text(
                  '\$${widget.item.cost?.toStringAsFixed(2) ?? '0.00'}',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade700,
                  ),
                ),
              const SizedBox(height: 20),

              // Like and Dislike Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.thumb_up, color: Colors.green),
                    onPressed: () {
                     
                      print('Liked: ${widget.item.title}');
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.thumb_down, color: Colors.red),
                    onPressed: () {
                      
                      print('Disliked: ${widget.item.title}');
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),

            
            ],
          ),
        ),
      ),
    );
  }
}
