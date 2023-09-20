import 'package:flutter/material.dart';
import 'package:notes_app/widgets/search_note_view_body.dart';

class SearchNotesView extends StatelessWidget {
  const SearchNotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SearchNoteViewBody(),
    );
  }
}