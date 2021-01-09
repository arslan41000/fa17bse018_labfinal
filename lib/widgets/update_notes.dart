eturn Dismissible(key: Key('$item'),
onDismissed: (direction){
setState(() {
Provider.of<NoteProvider>(context, listen: false)
    .updateNote(item.id);
// item.removeAt(i);
});
Scaffold.of(context)
    .showSnackBar(SnackBar(content: Text("Updated Successfully ")));
},
background: Container(color: Colors.red),
child: ListItem(
id: item.id,
title: item.title,
content: item.content,
imagePath: item.imagePath,
date: item.date,
),
);