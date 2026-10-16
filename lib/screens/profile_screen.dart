import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../i18n/translations.g.dart';
import '../providers/auth_provider.dart';
import '../widgets/starry_night_background.dart';
import '../widgets/location_search_field.dart';
import '../widgets/date_picker_field.dart';
import '../widgets/time_picker_field.dart';
import '../widgets/mystical_text_field.dart';
import '../widgets/unknown_time_checkbox.dart';
import '../widgets/birth_time_check.dart';
import '../constants/text_styles.dart';
import '../utils/snackbar_utils.dart';
import '../utils/date_utils.dart' as app_date_utils;
import '../utils/error_utils.dart';
import '../models/location.dart';
import '../services/api_client.dart';
import '../services/birth_chart_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _givenNameController = TextEditingController();
  final _familyNameController = TextEditingController();
  final _birthPlaceController = TextEditingController();
  final _birthDateController = TextEditingController();
  final _birthTimeController = TextEditingController();
  DateTime? _selectedBirthDate;
  TimeOfDay? _selectedBirthTime;
  PlaceDetails? _selectedLocation;
  bool _unknownTime = false;
  final _birthTime = BirthTimeController();
  bool _isEditing = false;
  bool _isLoading = false;
  final ImagePicker _picker = ImagePicker();
  File? _profileImage;
  Uint8List? _profileImageBytes;
  String _imageRefreshKey = DateTime.now().millisecondsSinceEpoch.toString();
  BirthChartService? _birthChartService;

  @override
  void initState() {
    super.initState();
    _birthChartService = BirthChartService(context: context);
    _loadUserData();
  }

  @override
  void dispose() {
    _givenNameController.dispose();
    _familyNameController.dispose();
    _birthPlaceController.dispose();
    _birthDateController.dispose();
    _birthTimeController.dispose();
    _birthChartService?.dispose();
    _birthTime.dispose();
    super.dispose();
  }

  void _loadUserData() {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.currentUser;

    if (user != null) {
      _givenNameController.text = user.givenName ?? '';
      _familyNameController.text = user.familyName ?? '';
      _birthPlaceController.text = user.birthPlace ?? '';
      _selectedBirthDate = user.birthDatetime;
      _unknownTime = user.unknownTime ?? false;
      _birthTime.reset();
      final birthTimeFold = user.birthTimeFold;
      if (birthTimeFold != null) {
        _birthTime.choose(birthTimeFold);
      }

      // If we have a birth place, create a PlaceDetails object
      if (user.birthPlace != null && user.birthPlace!.isNotEmpty) {
        _selectedLocation = PlaceDetails(
          placeId: '',
          name: user.birthPlace!,
          formattedAddress: user.birthPlace!,
        );
      }

      if (user.birthDatetime != null && !_unknownTime) {
        _selectedBirthTime = TimeOfDay.fromDateTime(user.birthDatetime!);
      }

      // Populate date and time controllers
      if (user.birthDatetime != null) {
        _birthDateController.text =
            '${user.birthDatetime!.day}/${user.birthDatetime!.month}/${user.birthDatetime!.year}';
        if (!_unknownTime) {
          final time = TimeOfDay.fromDateTime(user.birthDatetime!);
          _birthTimeController.text =
              '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}';
        }
      }
    }
  }

  String? _getCombinedDateTime() {
    if (_selectedBirthDate == null) return null;

    if (_unknownTime) {
      return app_date_utils.DateUtils.toBirthDateTimeIso(
        _selectedBirthDate!,
        const TimeOfDay(hour: 12, minute: 0),
      );
    }

    if (_selectedBirthTime == null) return null;

    return app_date_utils.DateUtils.toBirthDateTimeIso(
      _selectedBirthDate!,
      _selectedBirthTime!,
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final t = Translations.of(context);

    final combinedDateTime = _getCombinedDateTime();

    final profileData = <String, dynamic>{
      'givenName': _givenNameController.text.trim().isEmpty
          ? null
          : _givenNameController.text.trim(),
      'familyName': _familyNameController.text.trim().isEmpty
          ? null
          : _familyNameController.text.trim(),
      'birthPlace':
          _selectedLocation?.formattedAddress ??
          (_birthPlaceController.text.trim().isEmpty
              ? null
              : _birthPlaceController.text.trim()),
      'birthPlaceId': _selectedLocation?.placeId,
      'birthDateTime': combinedDateTime,
      'unknownTime': _unknownTime,
      'birthTimeFold': _birthTime.fold,
    };

    final success = await authProvider.updateProfile(profileData);
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    if (success) {
      setState(() {
        _isEditing = false;
      });

      SnackbarUtils.showSuccess(context, t.ui.profileUpdatedSuccessfully);

      _syncPersonalCharts();
    } else if (!_birthTime.handle(
      authProvider.errorKey,
      authProvider.errorMessage!,
    )) {
      SnackbarUtils.showError(
        context,
        translateConnectionError(context, authProvider.errorMessage!),
      );
    }
  }

  Future<void> _syncPersonalCharts() async {
    if (_birthChartService == null) return;

    try {
      await _birthChartService!.syncPersonalChart();
    } catch (e) {
      // Ignora errori di sincronizzazione per non interrompere l'UX
    }
  }

  void _toggleEdit() {
    setState(() {
      _isEditing = !_isEditing;
      if (_isEditing) {
        // Load current data when starting edit
        _loadUserData();
      } else {
        // Reset to saved data when canceling edit
        _selectedLocation = null;
        _birthDateController.clear();
        _birthTimeController.clear();
        _loadUserData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    // Controllo autenticazione senza Consumer per evitare rebuilds
    if (authProvider.isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (!authProvider.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      body: StarryNightBackground(
        showPlanet: false,
        subtle: true,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                iconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (GoRouter.of(context).canPop()) {
                      context.pop();
                    } else {
                      context.go('/');
                    }
                  },
                ),
                title: Text(
                  t.ui.profileTitle,
                  style: AppTextStyles.getH4Style(context),
                ),
                actions: [
                  if (!_isLoading)
                    IconButton(
                      icon: Icon(_isEditing ? Icons.close : Icons.edit),
                      onPressed: _toggleEdit,
                    ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 16,
                    bottom: MediaQuery.of(context).padding.bottom + 16,
                  ),
                  child: Consumer<AuthProvider>(
                    builder: (context, authProvider, child) {
                      final user = authProvider.currentUser;
                      if (user == null) {
                        return Center(child: Text(t.ui.userNotFound));
                      }

                      return Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            _buildProfileImageSection(
                              user,
                              isDark,
                              authProvider,
                            ),
                            const SizedBox(height: 16),
                            Card(
                              color: Theme.of(context).colorScheme.surface
                                  .withValues(alpha: 0.85),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.ui.personalInfo,
                                      style: AppTextStyles.getH5Style(context),
                                    ),
                                    const SizedBox(height: 16),
                                    if (_isEditing) ...[
                                      MysticalTextField(
                                        controller: _givenNameController,
                                        labelText: t.ui.firstName,
                                        enabled: !_isLoading,
                                      ),
                                      const SizedBox(height: 16),
                                      MysticalTextField(
                                        controller: _familyNameController,
                                        labelText: t.ui.lastName,
                                        enabled: !_isLoading,
                                      ),
                                    ] else ...[
                                      _buildInfoRow(
                                        t.ui.firstName,
                                        user.givenName ?? t.ui.notProvided,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildInfoRow(
                                        t.ui.lastName,
                                        user.familyName ?? t.ui.notProvided,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildInfoRow(t.ui.email, user.email),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Card(
                              color: Theme.of(context).colorScheme.surface
                                  .withValues(alpha: 0.85),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      t.ui.birthInfo,
                                      style: AppTextStyles.getH5Style(context),
                                    ),
                                    const SizedBox(height: 16),
                                    if (_isEditing) ...[
                                      LocationSearchField(
                                        controller: _birthPlaceController,
                                        labelText: t.ui.birthPlace,
                                        language: Localizations.localeOf(
                                          context,
                                        ).languageCode,
                                        validator: (value) {
                                          // Birth place is optional in profile
                                          return null;
                                        },
                                        onLocationSelected:
                                            (PlaceDetails? location) {
                                              setState(() {
                                                _selectedLocation = location;
                                              });
                                              _birthTime.reset();
                                            },
                                      ),
                                      const SizedBox(height: 16),
                                      MysticalDatePickerField(
                                        controller: _birthDateController,
                                        selectedDate: _selectedBirthDate,
                                        labelText: t.ui.birthDate,
                                        onDateSelected: (date) {
                                          setState(() {
                                            _selectedBirthDate = date;
                                          });
                                          _birthTime.reset();
                                        },
                                        enabled: !_isLoading,
                                      ),
                                      const SizedBox(height: 16),
                                      UnknownTimeCheckbox(
                                        value: _unknownTime,
                                        onChanged: (value) {
                                          setState(() {
                                            _unknownTime = value;
                                            if (_unknownTime) {
                                              _selectedBirthTime = null;
                                            }
                                          });
                                          _birthTime.reset();
                                        },
                                        enabled: !_isLoading,
                                      ),
                                      const SizedBox(height: 16),
                                      if (!_unknownTime) ...[
                                        MysticalTimePickerField(
                                          controller: _birthTimeController,
                                          birthTime: _birthTime,
                                          selectedTime: _selectedBirthTime,
                                          labelText: t.ui.birthTime,
                                          onTimeSelected: (time) {
                                            setState(() {
                                              _selectedBirthTime = time;
                                            });
                                            _birthTime.reset();
                                          },
                                          enabled: !_isLoading,
                                        ),
                                      ],
                                      RepeatedTimeChoice(
                                        controller: _birthTime,
                                      ),
                                    ] else ...[
                                      _buildInfoRow(
                                        t.ui.birthPlace,
                                        user.birthPlace ?? t.ui.notProvided,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildInfoRow(
                                        t.ui.birthDate,
                                        user.birthDatetime != null
                                            ? app_date_utils
                                                  .DateUtils.formatDate(
                                                context,
                                                user.birthDatetime!,
                                              )
                                            : t.ui.notProvided,
                                      ),
                                      const SizedBox(height: 8),
                                      _buildInfoRow(
                                        t.ui.birthTime,
                                        user.unknownTime == true
                                            ? t.ui.unknown
                                            : user.birthDatetime != null
                                            ? TimeOfDay.fromDateTime(
                                                user.birthDatetime!,
                                              ).format(context)
                                            : t.ui.notProvided,
                                      ),
                                    ],
                                  ],
                                ),
                              ),
                            ),
                            if (_isEditing) ...[
                              const SizedBox(height: 24),
                              ElevatedButton(
                                onPressed: _isLoading ? null : _saveProfile,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primary,
                                  foregroundColor: Theme.of(context)
                                      .colorScheme
                                      .onPrimary,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                Theme.of(context)
                                                    .colorScheme
                                                    .onPrimary,
                                              ),
                                        ),
                                      )
                                    : Text(t.ui.saveChanges),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileImageSection(
    dynamic user,
    bool isDark,
    AuthProvider authProvider,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Center(
            child: Stack(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 3,
                    ),
                  ),
                  child: ClipOval(
                    child: _profileImage != null || _profileImageBytes != null
                        ? kIsWeb && _profileImageBytes != null
                              ? Image.memory(
                                  _profileImageBytes!,
                                  fit: BoxFit.cover,
                                )
                              : !kIsWeb && _profileImage != null
                              ? Image.file(_profileImage!, fit: BoxFit.cover)
                              : _buildDefaultProfileImage(isDark)
                        : authProvider.currentUser?.profilePicture != null
                        ? CachedNetworkImage(
                            imageUrl:
                                '${ApiClient.baseUrl}/profile-picture/${authProvider.currentUser!.profilePicture!}',
                            cacheKey:
                                '${authProvider.currentUser!.profilePicture!}_$_imageRefreshKey',
                            fit: BoxFit.cover,
                            memCacheWidth:
                                (120 * MediaQuery.of(context).devicePixelRatio)
                                    .toInt(),
                            memCacheHeight:
                                (120 * MediaQuery.of(context).devicePixelRatio)
                                    .toInt(),
                            placeholder: (context, url) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                            errorWidget: (context, url, error) {
                              return _buildDefaultProfileImage(isDark);
                            },
                          )
                        : _buildDefaultProfileImage(isDark),
                  ),
                ),
                if (_isEditing)
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          color: Theme.of(context).colorScheme.onPrimary,
                          size: 20,
                        ),
                        iconSize: 20,
                        onPressed: _pickProfileImage,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            authProvider.currentUser?.fullName ?? '',
            style: AppTextStyles.getH5Style(context),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Future<void> _pickProfileImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (image != null) {
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          setState(() {
            _profileImageBytes = bytes;
          });
        } else {
          setState(() {
            _profileImage = File(image.path);
          });
        }

        await _uploadProfileImage();
      }
    } catch (e) {
      if (mounted) {
        SnackbarUtils.showError(
          context,
          'Error picking image: ${e.toString()}',
        );
      }
    }
  }

  Future<void> _uploadProfileImage() async {
    if (_profileImage == null && _profileImageBytes == null) return;

    setState(() {
      _isLoading = true;
    });

    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final t = Translations.of(context);

    final updatedUser = kIsWeb
        ? await authProvider.uploadProfilePictureBytes(_profileImageBytes!)
        : await authProvider.uploadProfilePicture(_profileImage!);

    setState(() {
      _isLoading = false;
    });

    if (updatedUser != null) {
      setState(() {
        _profileImage = null;
        _profileImageBytes = null;
        _imageRefreshKey = DateTime.now().millisecondsSinceEpoch.toString();
      });
      if (mounted) {
        SnackbarUtils.showSuccess(context, t.ui.profileUpdatedSuccessfully);
      }
    } else {
      if (mounted) {
        SnackbarUtils.showError(
          context,
          translateConnectionError(context, authProvider.errorMessage!),
        );
      }
    }
  }

  Widget _buildDefaultProfileImage(bool isDark) {
    return Container(
      color: Theme.of(context).colorScheme.surface,
      child: Icon(
        Icons.person,
        size: 60,
        color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.7),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            '$label:',
            style: AppTextStyles.getBodyStyle(context)
                .copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        Expanded(
          child: Text(value, style: AppTextStyles.getBodyStyle(context)),
        ),
      ],
    );
  }
}
