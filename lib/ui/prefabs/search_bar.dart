import 'package:flutter/material.dart';

abstract class CustomSearchBar extends StatefulWidget {
    final String searchLabel;
    final Color borderColor;

    final TextEditingController searchbarController = TextEditingController();

    CustomSearchBar({
        super.key,
        this.searchLabel = 'Default Search Label',
        this.borderColor = Colors.black,
    });

    // ================================
    // Functional Methods
    // ================================
    void search(String query);

    @override
    State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
    // ================================
    // Functional Methods
    // ================================
    @override
    Widget build(BuildContext context) {
        return TextField(
            controller: widget.searchbarController,
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: widget.borderColor),
                ),
                labelText: widget.searchLabel,
                suffixIcon: widget.searchbarController.text.isEmpty ? null : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                        widget.searchbarController.clear();
                        widget.search('');
                        setState(() {});
                    },
                )
            ),
            onChanged: (value) {
                setState(() {}); 
            },
            onSubmitted: widget.search,
        );
    }
}