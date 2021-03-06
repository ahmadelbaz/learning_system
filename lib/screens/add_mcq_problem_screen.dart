import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_system/functions/add_choice.dart';
import 'package:learning_system/screens/home_screen.dart';

// state provider to check if choice is true or not
final isTrueStateProvider = StateProvider<bool>((ref) => false);
// state provider for controller for name textfield
final nameTextEditingController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
// state provider for controller for problem head textfield
final headTextEditingController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
// state provider for controller for problem head textfield
final textValueTextEditingController =
    StateProvider<TextEditingController>((ref) => TextEditingController());
// state provider for controller for number of generated problems textfield
final noOfGeneratedProblemsStateProvider =
    StateProvider<TextEditingController>((ref) => TextEditingController());

class AddMCQProblemScreen extends ConsumerWidget {
  const AddMCQProblemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    // mediaquery for responsive sizes
    final _size = MediaQuery.of(context).size;
    // watching the providers
    final _mcqProblemsProvider = ref.watch(problemsChangeNotifierProvider);
    var _isTrue = ref.watch(isTrueStateProvider);
    var _noOfGeneratedProblemsTextEditingController =
        ref.watch(noOfGeneratedProblemsStateProvider.state);
    var _nameTextEditingController = ref.watch(nameTextEditingController.state);
    var _headTextEditingController = ref.watch(headTextEditingController.state);
    var _textValueTextEditingController =
        ref.watch(textValueTextEditingController.state);
    // get the arguments from navigation
    final _args = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      // backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: Text(_mcqProblemsProvider.getProblemById(_args).name.isEmpty
            ? 'New Problem'
            : _mcqProblemsProvider.getProblemById(_args).name),
      ),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          SizedBox(
            height: _size.height * 0.02,
          ),
          Center(
            child: Text(
              _mcqProblemsProvider.getProblemById(_args).head.isEmpty
                  ? 'Add something'
                  : _mcqProblemsProvider.getProblemById(_args).head,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
          SizedBox(
            width: _size.width,
            height: _size.height * 0.1,
            child: ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount:
                  _mcqProblemsProvider.getProblemById(_args).choices.length,
              itemBuilder: (context, index) {
                return SizedBox(
                  width: _size.width * 0.4,
                  child: RadioListTile(
                    title: FittedBox(
                      child: Text(
                        _mcqProblemsProvider
                            .getProblemById(_args)
                            .choices[index]
                            .keys
                            .first,
                        style: const TextStyle(fontSize: 22),
                      ),
                    ),
                    value: false,
                    groupValue: true,
                    onChanged: (value) {},
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: _size.height * 0.02,
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _nameTextEditingController.state,
                    decoration: InputDecoration(
                      labelText: 'Problem Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      _mcqProblemsProvider.editName(
                          _args, _nameTextEditingController.state.text);
                      _nameTextEditingController.state.text = '';
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    textCapitalization: TextCapitalization.sentences,
                    controller: _headTextEditingController.state,
                    decoration: InputDecoration(
                      labelText: 'Problem head',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      _mcqProblemsProvider.editHead(
                          _args, _headTextEditingController.state.text);
                      _headTextEditingController.state.text = '';
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller:
                        _noOfGeneratedProblemsTextEditingController.state,
                    decoration: InputDecoration(
                      labelText: 'No. of generated problems',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: _size.width * 0.02,
                ),
                ElevatedButton(
                    onPressed: () {
                      _mcqProblemsProvider.editNoOfGeneratedProblems(
                          _args,
                          int.parse(_noOfGeneratedProblemsTextEditingController
                              .state.text));
                      _noOfGeneratedProblemsTextEditingController.state.text =
                          '';
                    },
                    child: const Text('Add'))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                addChoice(context, _textValueTextEditingController.state,
                    _isTrue, _mcqProblemsProvider, _args);
              },
              child: const Text('Add choice'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                _mcqProblemsProvider.generateMCQProblems(_args);
              },
              child: const Text('Generate Problem'),
            ),
          ),
        ],
      ),
    );
  }
}
