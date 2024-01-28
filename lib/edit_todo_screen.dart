import 'package:flutter/material.dart';
import 'package:user_interface/todo.dart';
class EditScreen extends StatefulWidget {
  const EditScreen({super.key, required this.todo});

  final Todo todo;

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  final TextEditingController _tittleTEController = TextEditingController();
  final TextEditingController _descriptionTEController = TextEditingController();

  @override
  void initState(){
    super.initState();
    _tittleTEController.text = widget.todo.tittle;
    _descriptionTEController.text = widget.todo.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('edit'),
      ),
      body: Padding(

        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _tittleTEController,
                decoration: InputDecoration(
                  hintText: 'todos',
                ),
                validator: (String? value){
                  final v = value ?? '';
                  if (v.trim().isEmpty){
                    return 'Enter your tittle';
                  }
                },
              ),
              SizedBox(height: 20,),
              TextFormField(
                controller: _descriptionTEController,
                maxLines: 5,
                maxLength: 100,
                decoration: InputDecoration(
                  hintText: 'description',

                ),
                validator: (String? value){
                  final v = value ?? '';
                  if (value?.trim().isEmpty ?? true){
                    return 'Enter your description';
                  }
                },
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                    onPressed: () {
                      if(_formkey.currentState!.validate()){
                        Todo todo = Todo(_tittleTEController.text.trim(),
                            _descriptionTEController.text.trim(),
                            DateTime.now());
                        Navigator.pop(context, todo);
                      }
                    },
                    child: Text("Update")),
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose(){
    _tittleTEController.dispose();
    _descriptionTEController.dispose();
    super.dispose();
  }
}
