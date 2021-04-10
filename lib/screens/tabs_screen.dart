//import 'package:InstaCook/ml/ml_test2.dart';
import 'package:InstaCook/dummy_data.dart';
import 'package:InstaCook/models/category.dart';
import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import './favorites_screen.dart';
import './categories_screen.dart';
import '../models/meal.dart';


void selectImageClassifier(BuildContext context){
  Navigator.of(context).pushNamed('/image_classifier');
}
void selectChatBot(BuildContext context){
  Navigator.of(context).pushNamed('/chatbot');
}

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  TabsScreen(this.favoriteMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'DigiCook',
      },
      {
        'page': FavoritesScreen(widget.favoriteMeals),
        'title': 'Your Favorite',
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
        // actions: <Widget>[
        //   IconButton(onPressed: (){
        //     showSearch(context: context, delegate: FoodItemsSearch());
        //   },
        //   icon: Icon(Icons.search),
        //   ),
        // ],
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            title: Text('Categories'),
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            title: Text('Favorites'),
          ),
        ],
      ),
    //  floatingActionButton: FloatingActionButton(
      //  child: Icon(
        //    Icons.camera
        //),
        //backgroundColor: Colors.blue,
        //onPressed: () => selectImageClassifier(context),
      //),
      floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () => selectImageClassifier(context),
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.camera),
                  heroTag: null,
                ),
                FloatingActionButton(
                  onPressed: () => selectChatBot(context),
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.message),
                  heroTag: null,
                )
              ],
            ),
          )

    );
  }
}

// class FoodItemsSearch extends SearchDelegate<Category>{
//   @override
//   List<Widget> buildActions(BuildContext context) {
      
//       return [IconButton(icon: Icon(Icons.clear), onPressed: (){
//         query="";
//       },)];
//     }
  
//     @override
//     Widget buildLeading(BuildContext context) {
      
//       return IconButton(onPressed: (){
//         close(context,null);
//       },icon:Icon(Icons.arrow_back),);
//     }
  
//     @override
//     Widget buildResults(BuildContext context) {
//      return Center(child: Text(query,style: TextStyle(fontSize: 20),),);
//     }
  
//     @override
//     Widget buildSuggestions(BuildContext context) {
    
//      final mylist=query.isEmpty?Category
//      : Category.where((p) => p.title.startsWith(query)).toList();
     
//      return mylist.isEmpty?Text('No Results found...',style: TextStyle(fontSize:20),):
//       ListView.builder(
//        itemCount: mylist.length,
//        itemBuilder: (context,index){
//          final Meal listitem=mylist[index];
//          return ListTile(
//            onTap: (){
//              showResults(context);
//            },
//            title: 
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children:<Widget>[
//               Text(listitem.title,style:TextStyle(fontSize:20),),
              
//               Divider()    
//              ],
//            ),
//          );

//        });
//   }

// }
