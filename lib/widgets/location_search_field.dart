import 'package:material_ui/material_ui.dart';

import '../models/location.dart';
import '../services/location_service.dart';
import '../constants/text_styles.dart';

class LocationSearchField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;
  final ValueChanged<PlaceDetails?>? onLocationSelected;
  final String language;

  const LocationSearchField({
    super.key,
    required this.controller,
    required this.labelText,
    this.validator,
    this.onLocationSelected,
    this.language = 'it',
  });

  @override
  State<LocationSearchField> createState() => _LocationSearchFieldState();
}

class _LocationSearchFieldState extends State<LocationSearchField> {
  final LocationService _locationService = LocationService();
  final FocusNode _focusNode = FocusNode();
  List<PlaceSearchResult> _suggestions = [];
  bool _isSearching = false;
  String? _selectedText;

  @override
  void initState() {
    super.initState();
    _selectedText = widget.controller.text;
    _focusNode.addListener(_handleFocusChange);
    widget.controller.addListener(_handleTextChange);
  }

  @override
  void dispose() {
    _locationService.dispose();
    widget.controller.removeListener(_handleTextChange);
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (!_focusNode.hasFocus) {
      _locationService.cancelPendingRequests();
      setState(() {
        _suggestions = [];
        _isSearching = false;
      });
    }
  }

  void _handleTextChange() {
    final text = widget.controller.text;
    if (!_focusNode.hasFocus) {
      _selectedText = text;
      return;
    }
    if (text == _selectedText) return;

    if (_selectedText != null) {
      _selectedText = null;
      widget.onLocationSelected?.call(null);
    }

    if (text.trim().length >= 2) {
      _searchPlaces(text);
    } else {
      _locationService.cancelPendingRequests();
      setState(() {
        _suggestions = [];
        _isSearching = false;
      });
    }
  }

  Future<void> _searchPlaces(String query) async {
    setState(() => _isSearching = true);

    List<PlaceSearchResult> results;
    try {
      results = await _locationService.searchPlacesDebounced(
        query,
        language: widget.language,
      );
    } on LocationServiceException {
      results = [];
    }

    if (!mounted || !_focusNode.hasFocus || widget.controller.text != query) {
      return;
    }
    setState(() {
      _suggestions = results;
      _isSearching = false;
    });
    if (results.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Scrollable.ensureVisible(
            context,
            duration: const Duration(milliseconds: 200),
          );
        }
      });
    }
  }

  void _selectPlace(PlaceSearchResult place) {
    _selectedText = place.description;
    widget.controller.text = place.description;
    _focusNode.unfocus();

    widget.onLocationSelected?.call(
      PlaceDetails(
        placeId: place.placeId,
        name: place.mainText,
        formattedAddress: place.description,
      ),
    );
  }

  Widget _buildSuggestions(ThemeData theme) {
    return TextFieldTapRegion(
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          color: theme.colorScheme.surface,
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(8),
            itemCount: _suggestions.length,
            separatorBuilder: (context, index) => Divider(
              height: 1,
              color: theme.colorScheme.outline.withValues(alpha: 0.1),
            ),
            itemBuilder: (context, index) {
              final suggestion = _suggestions[index];
              return ListTile(
                dense: true,
                leading: Icon(
                  Icons.location_on_outlined,
                  color: theme.colorScheme.primary,
                  size: 20,
                ),
                title: Text(
                  suggestion.mainText,
                  style: AppTextStyles.getLocationMainStyle(context),
                ),
                subtitle: suggestion.secondaryText.isNotEmpty
                    ? Text(
                        suggestion.secondaryText,
                        style: AppTextStyles.getLocationSecondaryStyle(context),
                      )
                    : null,
                onTap: () => _selectPlace(suggestion),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          validator: widget.validator,
          maxLines: null,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          style: AppTextStyles.getBodyStyle(context),
          decoration: InputDecoration(
            labelText: widget.labelText,
            labelStyle: AppTextStyles.getFormLabelStyle(context),
            floatingLabelStyle: AppTextStyles.getFormLabelStyle(context),
            suffixIcon: _isSearching
                ? Container(
                    width: 20,
                    height: 20,
                    padding: const EdgeInsets.all(12),
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: theme.colorScheme.primary,
                    ),
                  )
                : Icon(
                    Icons.location_on_outlined,
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    size: 20,
                  ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.outline.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: theme.colorScheme.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: theme.colorScheme.error, width: 1),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            filled: true,
            fillColor: theme.colorScheme.surfaceContainerHighest.withValues(
              alpha: 0.3,
            ),
          ),
        ),
        if (_suggestions.isNotEmpty) _buildSuggestions(theme),
      ],
    );
  }
}
