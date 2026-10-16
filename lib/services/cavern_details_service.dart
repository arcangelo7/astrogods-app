import 'package:material_ui/material_ui.dart';

import '../models/cavern_details.dart';
import '../i18n/translations.g.dart';

class CavernDetailsService {
  static List<CavernDetails> getAllCavernDetails(BuildContext context) {
    final t = Translations.of(context);
    return [
      CavernDetails(
        houseNumber: 1,
        title: t.caverns.firstCavernTitle,
        literalMeaning: t.caverns.firstCavernLiteralMeaning,
        esotericMeaning: t.caverns.firstCavernEsotericMeaning,
        imagePath: 'prima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 2,
        title: t.caverns.secondCavernTitle,
        literalMeaning: t.caverns.secondCavernLiteralMeaning,
        esotericMeaning: t.caverns.secondCavernEsotericMeaning,
        imagePath: 'seconda_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 3,
        title: t.caverns.thirdCavernTitle,
        literalMeaning: t.caverns.thirdCavernLiteralMeaning,
        esotericMeaning: t.caverns.thirdCavernEsotericMeaning,
        imagePath: 'terza_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 4,
        title: t.caverns.fourthCavernTitle,
        literalMeaning: t.caverns.fourthCavernLiteralMeaning,
        esotericMeaning: t.caverns.fourthCavernEsotericMeaning,
        imagePath: 'quarta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 5,
        title: t.caverns.fifthCavernTitle,
        literalMeaning: t.caverns.fifthCavernLiteralMeaning,
        esotericMeaning: t.caverns.fifthCavernEsotericMeaning,
        imagePath: 'quinta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 6,
        title: t.caverns.sixthCavernTitle,
        literalMeaning: t.caverns.sixthCavernLiteralMeaning,
        esotericMeaning: t.caverns.sixthCavernEsotericMeaning,
        imagePath: 'sesta_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 7,
        title: t.caverns.seventhCavernTitle,
        literalMeaning: t.caverns.seventhCavernLiteralMeaning,
        esotericMeaning: t.caverns.seventhCavernEsotericMeaning,
        imagePath: null,
      ),
      CavernDetails(
        houseNumber: 8,
        title: t.caverns.eighthCavernTitle,
        literalMeaning: t.caverns.eighthCavernLiteralMeaning,
        esotericMeaning: t.caverns.eighthCavernEsotericMeaning,
        imagePath: 'ottava_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 9,
        title: t.caverns.ninthCavernTitle,
        literalMeaning: t.caverns.ninthCavernLiteralMeaning,
        esotericMeaning: t.caverns.ninthCavernEsotericMeaning,
        imagePath: 'nona_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 10,
        title: t.caverns.tenthCavernTitle,
        literalMeaning: t.caverns.tenthCavernLiteralMeaning,
        esotericMeaning: t.caverns.tenthCavernEsotericMeaning,
        imagePath: 'decima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 11,
        title: t.caverns.eleventhCavernTitle,
        literalMeaning: t.caverns.eleventhCavernLiteralMeaning,
        esotericMeaning: t.caverns.eleventhCavernEsotericMeaning,
        imagePath: 'undicesima_caverna.webp',
      ),
      CavernDetails(
        houseNumber: 12,
        title: t.caverns.twelfthCavernTitle,
        literalMeaning: t.caverns.twelfthCavernLiteralMeaning,
        esotericMeaning: t.caverns.twelfthCavernEsotericMeaning,
        imagePath: 'dodicesima_caverna.webp',
      ),
    ];
  }

  static CavernDetails? getCavernDetailsByHouse(
    int houseNumber,
    BuildContext context,
  ) {
    try {
      return getAllCavernDetails(context)
          .firstWhere((cavern) => cavern.houseNumber == houseNumber);
    } catch (e) {
      return null;
    }
  }

  static String getHouseTag(int houseNumber) {
    return '[HOUSE_${houseNumber}_ILLUSTRATION]';
  }

  static int? getHouseNumberFromTag(String tag) {
    final RegExp regExp = RegExp(r'\[HOUSE_(\d+)_ILLUSTRATION\]');
    final match = regExp.firstMatch(tag);
    if (match != null) {
      return int.tryParse(match.group(1)!);
    }
    return null;
  }
}
