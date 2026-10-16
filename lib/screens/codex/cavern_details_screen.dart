import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:go_router/go_router.dart';

import '../../config/image_urls.dart';
import '../../models/cavern_details.dart';
import '../../services/cavern_details_service.dart';
import '../../widgets/starry_night_background.dart';
import '../../widgets/formatted_markdown_content.dart';
import '../../constants/text_styles.dart';
import '../../i18n/translations.g.dart';

class CavernDetailsScreen extends StatefulWidget {
  final int houseNumber;
  final Map<String, dynamic>? extra;

  const CavernDetailsScreen({super.key, required this.houseNumber, this.extra});

  @override
  State<CavernDetailsScreen> createState() => _CavernDetailsScreenState();
}

class _CavernDetailsScreenState extends State<CavernDetailsScreen> {
  CavernDetails? _cavernDetails;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _loadCavernDetails();
  }

  void _loadCavernDetails() {
    setState(() {
      _cavernDetails = CavernDetailsService.getCavernDetailsByHouse(
        widget.houseNumber,
        context,
      );
    });
  }

  Widget _buildSection(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Title centered and constrained like text content
        Center(
          child: Container(
            width: _getConstrainedWidth(context),
            constraints: _getConstrainedWidth(context) != double.infinity
                ? const BoxConstraints(maxWidth: 700.0)
                : null,
            child: Text(title, style: AppTextStyles.getH4Style(context)),
          ),
        ),
        const SizedBox(height: 16),
        // Content can break out for tables
        FormattedMarkdownContent(content: content),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildNextCavernCard(BuildContext context, Translations t) {
    final nextHouse = widget.houseNumber + 1;
    final nextCavern = CavernDetailsService.getCavernDetailsByHouse(
      nextHouse,
      context,
    );
    if (nextCavern == null || nextCavern.literalMeaning.isEmpty) {
      return const SizedBox.shrink();
    }
    return Center(
      child: Container(
        width: _getConstrainedWidth(context),
        constraints: _getConstrainedWidth(context) != double.infinity
            ? const BoxConstraints(maxWidth: 700.0)
            : null,
        child: Card.filled(
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => context.push(
              '/codex/domification/book-of-caves/cavern/$nextHouse',
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      t.codex.nextSection(title: nextCavern.title),
                      style: AppTextStyles.getBodyLargeStyle(context),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double _getConstrainedWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxTextWidth = 700.0;
    return screenWidth > maxTextWidth ? maxTextWidth : double.infinity;
  }

  void _showFullImage(String imagePath, String alt) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext dialogContext) {
        final mediaQuery = MediaQuery.of(dialogContext);
        final padding = mediaQuery.padding;
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
          child: SizedBox.expand(
            child: Container(
              color: Colors.black.withValues(alpha: 0.95),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: InteractiveViewer(
                      panEnabled: true,
                      boundaryMargin: const EdgeInsets.all(100.0),
                      minScale: 1.0,
                      maxScale: 4.0,
                      child: Center(
                        child: CachedNetworkImage(
                          imageUrl: ImageUrls.image(
                            'caverns/$imagePath',
                            hd: true,
                          ),
                          fit: BoxFit.contain,
                          memCacheWidth:
                              (mediaQuery.size.width *
                                      mediaQuery.devicePixelRatio)
                                  .toInt(),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(
                                color: Colors.white,
                              ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.error_outline,
                            color: Colors.white,
                            size: 48,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: padding.top + 10,
                    right: 10,
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () => Navigator.of(dialogContext).pop(),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: padding.bottom + 20,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          alt,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
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
                title: Text(t.caverns.cavernDetailsTitle),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    if (context.canPop()) {
                      context.pop();
                    } else {
                      context.go('/codex');
                    }
                  },
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: _cavernDetails == null
                        ? Center(
                            child: Text(
                              t.caverns.cavernDetailsNotFound,
                              style: AppTextStyles.getBodyLargeStyle(context),
                            ),
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              const SizedBox(height: 20),
                              // Main title centered and constrained
                              Center(
                                child: Container(
                                  width: _getConstrainedWidth(context),
                                  constraints:
                                      _getConstrainedWidth(context) !=
                                          double.infinity
                                      ? const BoxConstraints(maxWidth: 700.0)
                                      : null,
                                  child: Text(
                                    _cavernDetails!.title,
                                    style: AppTextStyles.getH3Style(context),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Cavern image centered and constrained
                              if (_cavernDetails!.imagePath != null)
                                Center(
                                  child: Container(
                                    width: _getConstrainedWidth(context),
                                    constraints:
                                        _getConstrainedWidth(context) !=
                                            double.infinity
                                        ? const BoxConstraints(maxWidth: 700.0)
                                        : null,
                                    child: GestureDetector(
                                      onTap: () => _showFullImage(
                                        _cavernDetails!.imagePath!,
                                        _cavernDetails!.title,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withValues(
                                                  alpha: 0.2,
                                                ),
                                                blurRadius: 8,
                                                offset: const Offset(0, 2),
                                              ),
                                            ],
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                            child: Stack(
                                              children: [
                                                CachedNetworkImage(
                                                  imageUrl: ImageUrls.image(
                                                    'caverns/${_cavernDetails!.imagePath!}',
                                                  ),
                                                  fit: BoxFit.cover,
                                                  width: double.infinity,
                                                  memCacheWidth:
                                                      (MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              MediaQuery.of(
                                                                context,
                                                              ).devicePixelRatio)
                                                          .toInt(),
                                                  placeholder: (context, url) =>
                                                      Container(
                                                        height: 200,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .surfaceContainerHighest,
                                                        child: const Center(
                                                          child:
                                                              CircularProgressIndicator(),
                                                        ),
                                                      ),
                                                  errorWidget:
                                                      (
                                                        context,
                                                        url,
                                                        error,
                                                      ) => Container(
                                                        height: 200,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .surfaceContainerHighest,
                                                        child: const Center(
                                                          child: Icon(
                                                            Icons
                                                                .image_not_supported,
                                                            size: 48,
                                                          ),
                                                        ),
                                                      ),
                                                ),
                                                Positioned(
                                                  top: 8,
                                                  right: 8,
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(4),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withValues(
                                                            alpha: 0.5,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            4,
                                                          ),
                                                    ),
                                                    child: const Icon(
                                                      Icons.zoom_in,
                                                      color: Colors.white,
                                                      size: 20,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),

                              const SizedBox(height: 32),

                              // Link to the methodological note
                              Center(
                                child: Container(
                                  width: _getConstrainedWidth(context),
                                  constraints:
                                      _getConstrainedWidth(context) !=
                                          double.infinity
                                      ? const BoxConstraints(maxWidth: 700.0)
                                      : null,
                                  child: Card.filled(
                                    child: InkWell(
                                      borderRadius: BorderRadius.circular(12),
                                      onTap: () => context.push(
                                        '/codex/domification/book-of-caves/introduction',
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.menu_book_outlined,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                            const SizedBox(width: 12),
                                            Expanded(
                                              child: Text(
                                                t.codex.readMethodologicalNote,
                                                style:
                                                    AppTextStyles.getBodyLargeStyle(
                                                      context,
                                                    ),
                                              ),
                                            ),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 16,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .primary,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),

                              // Literal meaning
                              _buildSection(
                                t.caverns.literalMeaning,
                                _cavernDetails!.literalMeaning,
                              ),

                              // Esoteric meaning
                              if (_cavernDetails!.esotericMeaning.isNotEmpty)
                                _buildSection(
                                  t.caverns.esotericMeaning,
                                  _cavernDetails!.esotericMeaning,
                                ),

                              // Next cavern navigation
                              if (widget.houseNumber < 12)
                                _buildNextCavernCard(context, t),

                              SizedBox(
                                height:
                                    MediaQuery.of(context).padding.bottom + 16,
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
