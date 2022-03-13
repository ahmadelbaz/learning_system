import 'package:flutter/material.dart';

import '../providers/problems_provider.dart';

void addChoice(
    BuildContext context,
    TextEditingController _textValueTextEditingController,
    bool _isTrue,
    ProblemsProvider _mcqProblemsProvider,
    String _args) {
  // mediaquery for responsive sizes
  final _size = MediaQuery.of(context).size;
  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Select choice type'),
      content: SizedBox(
        height: _size.height * 0.2,
        child: ListView(
          children: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (ctx) => StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Add variable'),
                        content: SizedBox(
                          height: _size.height * 0.2,
                          child: ListView(
                            children: [
                              TextField(
                                autofocus: true,
                                controller: _textValueTextEditingController,
                                decoration: InputDecoration(
                                  labelText: 'Value',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                    borderSide: const BorderSide(),
                                  ),
                                ),
                              ),
                              CheckboxListTile(
                                  title: const Text('True?'),
                                  value: _isTrue,
                                  onChanged: (value) {
                                    setState(() {
                                      _isTrue = value!;
                                    });
                                  })
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _mcqProblemsProvider.addChoice(
                                  _args,
                                  _textValueTextEditingController.text,
                                  _isTrue);
                              _textValueTextEditingController.text = '';
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              child: const Text('Text'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (ctx) => StatefulBuilder(
                    builder: (context, setState) {
                      return AlertDialog(
                        title: const Text('Add variable'),
                        content: Column(
                          children: [
                            TextField(
                              autofocus: true,
                              keyboardType: TextInputType.number,
                              controller: _textValueTextEditingController,
                              decoration: InputDecoration(
                                labelText: 'Value',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: const BorderSide(),
                                ),
                              ),
                            ),
                            CheckboxListTile(
                              title: const Text('True?'),
                              value: _isTrue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    _isTrue = value!;
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _mcqProblemsProvider.addChoice(
                                  _args,
                                  _textValueTextEditingController.text,
                                  _isTrue);
                              _textValueTextEditingController.text = '';
                            },
                            child: const Text('Add'),
                          ),
                        ],
                      );
                    },
                  ),
                );
              },
              child: const Text('Number'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Image'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Sound'),
            ),
          ],
        ),
      ),
    ),
  );
}
