import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:gpt_markdown/gpt_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../config/image_urls.dart';
import '../constants/text_styles.dart';
import '../utils/email_utils.dart';
import '../constants/cavern_names.dart';
import '../i18n/translations.g.dart';
import 'cavern_tables.dart';
import 'codex/placido_diagram.dart';
import 'codex/celestial_sphere_diagram.dart';
import 'codex/ecliptic_horizon_diagram.dart';
import 'codex/ecliptic_rising_comparison_diagram.dart';
import 'codex/equator_ecliptic_diagram.dart';
import 'codex/latitude_sky_diagram.dart';
import 'codex/semidiurnal_arc_diagram.dart';
import 'codex/precession_diagram.dart';
import 'codex/whole_sign_houses_diagram.dart';

enum _MatchType { image, table, illustration }

class _ParsedMatch {
  final _MatchType type;
  final int start;
  final int end;
  final String? alt;
  final String? src;
  final String? tag;

  const _ParsedMatch({
    required this.type,
    required this.start,
    required this.end,
    this.alt,
    this.src,
    this.tag,
  });
}

void _preloadPdfImage(String webpFilename) {
  final jpgFilename = cavernWebpToPdfMap[webpFilename];
  if (jpgFilename != null) {
    final url = ImageUrls.cavernPdf(jpgFilename);
    DefaultCacheManager().getSingleFile(url);
  }
}

String _buildImageUrl(String path, {bool hd = false}) {
  if (!path.contains('/')) {
    final category = path.contains('_divisione') ? 'divisions' : 'caverns';
    path = '$category/$path';
  }
  return ImageUrls.image(path, hd: hd);
}

class FormattedMarkdownContent extends StatefulWidget {
  final String content;
  final EdgeInsets? padding;

  const FormattedMarkdownContent({
    super.key,
    required this.content,
    this.padding,
  });

  @override
  State<FormattedMarkdownContent> createState() =>
      _FormattedMarkdownContentState();
}

class _FormattedMarkdownContentState extends State<FormattedMarkdownContent> {
  late List<_ParsedMatch> _cachedMatches;
  String? _lastParsedContent;
  Map<String, Map<String, String>> _illustrationMap = {};

  static final _imageRegex = RegExp(r'!\[([^\]]*)\]\(([^)]+)\)');
  static final _citationQuoteRegex = RegExp(
    r'\[([^\]]+)\]\(([^)]+)\)\{\{(.+?)\}\}',
    dotAll: true,
  );

  static final _tableMap = <String, Widget Function(BuildContext)>{
    '[TABLE_CAVERNA_1]': CavernTables.getPrimaDivisioneTable,
    '[TABLE_CAVERNA_2]': CavernTables.getSecondaDivisioneTable,
    '[TABLE_CAVERNA_3]': CavernTables.getTerzaDivisioneTable,
    '[TABLE_CAVERNA_4]': CavernTables.getQuartaDivisioneTable,
    '[TABLE_CAVERNA_5]': CavernTables.getQuintaDivisioneTable,
    '[TABLE_CAVERNA_6]': CavernTables.getSestaDivisioneTable,
    '[PLACIDO_DIAGRAM]': (_) => const PlacidoDiagram(),
    '[ECLIPTIC_HORIZON_DIAGRAM]': (_) => const EclipticHorizonDiagram(),
    '[ECLIPTIC_RISING_COMPARISON_DIAGRAM]': (_) =>
        const EclipticRisingComparisonDiagram(),
    '[CELESTIAL_SPHERE_DIAGRAM]': (_) => const CelestialSphereDiagram(),
    '[EQUATOR_ECLIPTIC_DIAGRAM]': (_) => const EquatorEclipticDiagram(),
    '[LATITUDE_SKY_DIAGRAM]': (_) => const LatitudeSkyDiagram(),
    '[SEMIDIURNAL_ARC_DIAGRAM]': (_) => const SemidiurnalArcDiagram(),
    '[PRECESSION_DIAGRAM]': (_) => const PrecessionDiagram(),
    '[WHOLE_SIGN_HOUSES_DIAGRAM]': (_) => const WholeSignHousesDiagram(),
  };

  static String? _diagramCaption(String tag, BuildContext context) {
    final t = Translations.of(context);
    return switch (tag) {
      '[CELESTIAL_SPHERE_DIAGRAM]' => t.codex.diagramCaptionCelestialSphere,
      '[EQUATOR_ECLIPTIC_DIAGRAM]' => t.codex.diagramCaptionEquatorEcliptic,
      '[LATITUDE_SKY_DIAGRAM]' => t.codex.diagramCaptionLatitudeSky,
      '[ECLIPTIC_RISING_COMPARISON_DIAGRAM]' =>
        t.codex.diagramCaptionEclipticRising,
      '[ECLIPTIC_HORIZON_DIAGRAM]' => t.codex.diagramCaptionEclipticHorizon,
      '[SEMIDIURNAL_ARC_DIAGRAM]' => t.codex.diagramCaptionSemidiurnalArc,
      '[PLACIDO_DIAGRAM]' => t.codex.diagramCaptionPlacido,
      '[PRECESSION_DIAGRAM]' => t.codex.diagramCaptionPrecession,
      '[WHOLE_SIGN_HOUSES_DIAGRAM]' => t.codex.diagramCaptionWholeSign,
      _ => null,
    };
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final t = Translations.of(context);
    _illustrationMap = {
      '[HOUSE_1_ILLUSTRATION]': {
        'image': 'prima_caverna.webp',
        'alt': t.caverns.house1Alt,
      },
      '[HOUSE_2_ILLUSTRATION]': {
        'image': 'seconda_caverna.webp',
        'alt': t.caverns.house2Alt,
      },
      '[HOUSE_3_ILLUSTRATION]': {
        'image': 'terza_caverna.webp',
        'alt': t.caverns.house3Alt,
      },
      '[HOUSE_4_ILLUSTRATION]': {
        'image': 'quarta_caverna.webp',
        'alt': t.caverns.house4Alt,
      },
      '[HOUSE_5_ILLUSTRATION]': {
        'image': 'quinta_caverna.webp',
        'alt': t.caverns.house5Alt,
      },
      '[HOUSE_6_ILLUSTRATION]': {
        'image': 'sesta_caverna.webp',
        'alt': t.caverns.house6Alt,
      },
      '[HOUSE_8_ILLUSTRATION]': {
        'image': 'ottava_caverna.webp',
        'alt': t.caverns.house8Alt,
      },
      '[HOUSE_9_ILLUSTRATION]': {
        'image': 'nona_caverna.webp',
        'alt': t.caverns.house9Alt,
      },
      '[HOUSE_10_ILLUSTRATION]': {
        'image': 'decima_caverna.webp',
        'alt': t.caverns.house10Alt,
      },
      '[HOUSE_11_ILLUSTRATION]': {
        'image': 'undicesima_caverna.webp',
        'alt': t.caverns.house11Alt,
      },
      '[HOUSE_12_ILLUSTRATION]': {
        'image': 'dodicesima_caverna.webp',
        'alt': t.caverns.house12Alt,
      },
    };
  }

  static const _tableTags = [
    '[TABLE_CAVERNA_1]',
    '[TABLE_CAVERNA_2]',
    '[TABLE_CAVERNA_3]',
    '[TABLE_CAVERNA_4]',
    '[TABLE_CAVERNA_5]',
    '[TABLE_CAVERNA_6]',
    '[PLACIDO_DIAGRAM]',
    '[ECLIPTIC_HORIZON_DIAGRAM]',
    '[ECLIPTIC_RISING_COMPARISON_DIAGRAM]',
    '[CELESTIAL_SPHERE_DIAGRAM]',
    '[EQUATOR_ECLIPTIC_DIAGRAM]',
    '[LATITUDE_SKY_DIAGRAM]',
    '[SEMIDIURNAL_ARC_DIAGRAM]',
    '[PRECESSION_DIAGRAM]',
    '[WHOLE_SIGN_HOUSES_DIAGRAM]',
  ];

  static const _illustrationTags = [
    '[HOUSE_1_ILLUSTRATION]',
    '[HOUSE_2_ILLUSTRATION]',
    '[HOUSE_3_ILLUSTRATION]',
    '[HOUSE_4_ILLUSTRATION]',
    '[HOUSE_5_ILLUSTRATION]',
    '[HOUSE_6_ILLUSTRATION]',
    '[HOUSE_8_ILLUSTRATION]',
    '[HOUSE_9_ILLUSTRATION]',
    '[HOUSE_10_ILLUSTRATION]',
    '[HOUSE_11_ILLUSTRATION]',
    '[HOUSE_12_ILLUSTRATION]',
  ];

  void _parseContentIfNeeded() {
    if (_lastParsedContent == widget.content) return;
    _lastParsedContent = widget.content;

    final matches = <_ParsedMatch>[];

    for (final match in _imageRegex.allMatches(widget.content)) {
      matches.add(
        _ParsedMatch(
          type: _MatchType.image,
          start: match.start,
          end: match.end,
          alt: match.group(1) ?? '',
          src: match.group(2) ?? '',
        ),
      );
    }

    for (final tag in _tableTags) {
      var startIndex = 0;
      while (true) {
        final index = widget.content.indexOf(tag, startIndex);
        if (index == -1) break;
        matches.add(
          _ParsedMatch(
            type: _MatchType.table,
            start: index,
            end: index + tag.length,
            tag: tag,
          ),
        );
        startIndex = index + tag.length;
      }
    }

    for (final tag in _illustrationTags) {
      var startIndex = 0;
      while (true) {
        final index = widget.content.indexOf(tag, startIndex);
        if (index == -1) break;
        matches.add(
          _ParsedMatch(
            type: _MatchType.illustration,
            start: index,
            end: index + tag.length,
            tag: tag,
          ),
        );
        startIndex = index + tag.length;
      }
    }

    matches.sort((a, b) => a.start.compareTo(b.start));
    _cachedMatches = matches;
  }

  int? _extractHouseNumberFromPath(String imagePath) {
    if (!imagePath.contains('_caverna.webp')) return null;

    if (imagePath.contains('prima_caverna')) return 1;
    if (imagePath.contains('seconda_caverna')) return 2;
    if (imagePath.contains('terza_caverna')) return 3;
    if (imagePath.contains('quarta_caverna')) return 4;
    if (imagePath.contains('quinta_caverna')) return 5;
    if (imagePath.contains('sesta_caverna')) return 6;
    if (imagePath.contains('settima_caverna')) return 7;
    if (imagePath.contains('ottava_caverna')) return 8;
    if (imagePath.contains('nona_caverna')) return 9;
    if (imagePath.contains('decima_caverna')) return 10;
    if (imagePath.contains('undicesima_caverna')) return 11;
    if (imagePath.contains('dodicesima_caverna')) return 12;

    return null;
  }

  void _showFullImage(
    BuildContext context,
    String imagePath,
    String alt,
    int? houseNumber,
  ) {
    showDialog(
      context: context,
      useSafeArea: false,
      builder: (BuildContext dialogContext) {
        final padding = MediaQuery.of(dialogContext).padding;
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
                        child: _LoadableImage(
                          imagePath: imagePath,
                          hd: !imagePath.startsWith('codex/'),
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
                      child: houseNumber != null
                          ? ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(dialogContext).pop();
                                context.push(
                                  '/codex/domification/book-of-caves/cavern/$houseNumber',
                                );
                              },
                              icon: const Icon(Icons.explore, size: 18),
                              label: Text(
                                Translations.of(context).codex.exploreMore,
                              ),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 12,
                                ),
                              ),
                            )
                          : Container(
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
                                textAlign: TextAlign.center,
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

  Widget _buildClickableImage(
    Map<String, String> imageData,
    BuildContext context,
  ) {
    return _buildClickableImageWidget(
      imageData['image']!,
      imageData['alt']!,
      context,
    );
  }

  Widget _buildClickableImageWidget(
    String src,
    String alt,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxImageWidth = 700.0;
    final containerWidth = screenWidth > maxImageWidth
        ? maxImageWidth
        : double.infinity;

    final imagePath = src;
    final houseNumber = _extractHouseNumberFromPath(imagePath);

    _preloadPdfImage(src);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Center(
        child: Container(
          width: containerWidth,
          constraints: containerWidth != double.infinity
              ? const BoxConstraints(maxWidth: maxImageWidth)
              : null,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _showFullImage(context, imagePath, alt, houseNumber),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: _buildImageUrl(src),
                        width: double.infinity,
                        fit: BoxFit.cover,
                        memCacheWidth:
                            (MediaQuery.of(context).size.width *
                                    MediaQuery.of(context).devicePixelRatio)
                                .toInt(),
                        placeholder: (context, url) => Container(
                          height: 200,
                          color: Theme.of(context)
                              .colorScheme
                              .surfaceContainerHighest,
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          return Container(
                            height: 200,
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_not_supported,
                                    size: 32,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                  if (alt.isNotEmpty) ...[
                                    const SizedBox(height: 8),
                                    Text(
                                      alt,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.black.withValues(alpha: 0.5),
                            borderRadius: BorderRadius.circular(4),
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
    );
  }

  List<Widget> _buildContentWithTablesFullWidth(BuildContext context) {
    final content = widget.content;
    final widgets = <Widget>[];

    int lastEnd = 0;
    for (final match in _cachedMatches) {
      if (match.start > lastEnd) {
        final textBefore = content.substring(lastEnd, match.start);
        if (textBefore.trim().isNotEmpty) {
          widgets.add(_buildConstrainedMarkdownContent(textBefore, context));
        }
      }

      switch (match.type) {
        case _MatchType.image:
          widgets.add(
            _buildClickableImageWidget(match.src!, match.alt!, context),
          );
        case _MatchType.table:
          final tableBuilder = _tableMap[match.tag];
          if (tableBuilder != null) {
            final caption = _diagramCaption(match.tag!, context);
            widgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: caption != null
                    ? Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          tableBuilder(context),
                          Center(
                            child: Container(
                              constraints: const BoxConstraints(
                                maxWidth: 700.0,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 8,
                              ),
                              child: Text(
                                caption,
                                style: AppTextStyles.getMarkdownParagraphStyle(
                                  context,
                                ).copyWith(fontStyle: FontStyle.italic),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    : tableBuilder(context),
              ),
            );
          }
        case _MatchType.illustration:
          final imageData = _illustrationMap[match.tag];
          if (imageData != null) {
            widgets.add(_buildClickableImage(imageData, context));
          }
      }

      lastEnd = match.end;
    }

    if (lastEnd < content.length) {
      final remainingText = content.substring(lastEnd);
      if (remainingText.trim().isNotEmpty) {
        widgets.add(_buildConstrainedMarkdownContent(remainingText, context));
      }
    }

    if (widgets.isEmpty) {
      widgets.add(_buildConstrainedMarkdownContent(content, context));
    }

    return widgets;
  }

  Widget _buildConstrainedMarkdownContent(
    String content,
    BuildContext context,
  ) {
    final screenWidth = MediaQuery.of(context).size.width;
    const maxTextWidth = 700.0;
    final containerWidth = screenWidth > maxTextWidth
        ? maxTextWidth
        : double.infinity;

    return Center(
      child: Container(
        width: containerWidth,
        constraints: containerWidth != double.infinity
            ? const BoxConstraints(maxWidth: maxTextWidth)
            : null,
        padding: widget.padding ?? const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.2),
            width: 1,
          ),
          color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.85),
        ),
        child: _buildMarkdownWidget(content, context),
      ),
    );
  }

  static Map<String, String> _extractCitationQuotes(String content) {
    final quotes = <String, String>{};
    final urlCount = <String, int>{};
    for (final match in _citationQuoteRegex.allMatches(content)) {
      final url = match.group(2)!;
      final count = urlCount[url] ?? 0;
      urlCount[url] = count + 1;
      final key = count == 0 ? url : '$url#cite-$count';
      quotes[key] = match.group(3)!;
    }
    return quotes;
  }

  static String _stripCitationQuotes(String content) {
    final urlCount = <String, int>{};
    return content.replaceAllMapped(_citationQuoteRegex, (match) {
      final url = match.group(2)!;
      final count = urlCount[url] ?? 0;
      urlCount[url] = count + 1;
      final key = count == 0 ? url : '$url#cite-$count';
      return '[${match.group(1)}]($key)';
    });
  }

  Future<void> _launchUrl(String url, BuildContext context) async {
    if (url.startsWith('/')) {
      context.go(url);
      return;
    }
    if (url.startsWith('mailto:')) {
      await openEmail(context, url.substring('mailto:'.length));
      return;
    }
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  static String _cleanCiteFragment(String url) =>
      url.replaceFirst(RegExp(r'#cite-\d+$'), '');

  void _showCitationSheet(BuildContext context, String url, String quote) {
    url = _cleanCiteFragment(url);
    final t = Translations.of(context);
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (sheetContext) => Padding(
        padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(sheetContext).colorScheme.onSurfaceVariant
                      .withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '\u00AB$quote\u00BB',
              style: AppTextStyles.getMarkdownParagraphStyle(sheetContext)
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {
                  Navigator.pop(sheetContext);
                  _launchUrl(url, context);
                },
                icon: const Icon(Icons.open_in_new, size: 18),
                label: Text(t.ui.visitSource),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMarkdownWidget(String content, BuildContext context) {
    final citationQuotes = _extractCitationQuotes(content);
    content = _stripCitationQuotes(content);

    String fixedContent = content
        .replaceAllMapped(
          RegExp(r'(\S)\s+(##\s+)'),
          (match) => '${match.group(1)}\n\n${match.group(2)}',
        )
        .replaceAllMapped(
          RegExp(r'(\S)\s+(###\s+)'),
          (match) => '${match.group(1)}\n\n${match.group(2)}',
        )
        .replaceAllMapped(
          RegExp(r'(\S)\s+(####\s+)'),
          (match) => '${match.group(1)}\n\n${match.group(2)}',
        );

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final linkColor = isDark
        ? Colors.blue[300]!
        : Theme.of(context).colorScheme.primary;
    final linkStyle = AppTextStyles.getMarkdownParagraphStyle(context).copyWith(
      color: linkColor,
      decoration: TextDecoration.underline,
      decorationColor: linkColor,
    );

    void handleTap(String url) {
      final quote = citationQuotes[url];
      if (quote != null) {
        _showCitationSheet(context, url, quote);
      } else {
        _launchUrl(url, context);
      }
    }

    return GptMarkdown(
      fixedContent,
      style: AppTextStyles.getMarkdownParagraphStyle(context),
      onLinkTap: (url, title) => handleTap(url),
      inlineLinkBuilder: (link) => link.asWidgetSpan(
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Text(link.label, style: linkStyle),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _parseContentIfNeeded();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: _buildContentWithTablesFullWidth(context),
    );
  }
}

class _LoadableImage extends StatelessWidget {
  final String imagePath;
  final bool hd;

  const _LoadableImage({required this.imagePath, this.hd = true});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: _buildImageUrl(imagePath, hd: hd),
      fit: BoxFit.contain,
      memCacheWidth:
          (MediaQuery.of(context).size.width *
                  MediaQuery.of(context).devicePixelRatio)
              .toInt(),
      placeholder: (context, url) => Container(
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.7),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              Translations.of(context).ui.loadingImage,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Icon(Icons.error_outline, color: Colors.white, size: 48),
      ),
    );
  }
}
