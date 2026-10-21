///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  _meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		_meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	final TranslationMetadata<AppLocale, Translations> _meta;
	@override TranslationMetadata<AppLocale, Translations> get $meta => _meta;

	/// Access flat map
	dynamic operator[](String key) => _meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final Translations$about$en about = Translations$about$en._(_root);
	late final Translations$caverns$en caverns = Translations$caverns$en._(_root);
	late final Translations$codex$en codex = Translations$codex$en._(_root);
	late final Translations$legal$en legal = Translations$legal$en._(_root);
	late final Translations$releaseNotes$en releaseNotes = Translations$releaseNotes$en._(_root);
	late final Translations$ui$en ui = Translations$ui$en._(_root);
}

// Path: about
class Translations$about$en {
	Translations$about$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About and FAQ'
	String get aboutAndFaq => 'About and FAQ';

	/// en: 'Table of contents'
	String get aboutFaqTableOfContents => 'Table of contents';

	/// en: 'About AstroGods'
	String get aboutFaqTitle => 'About AstroGods';

	/// en: '### Legal action The User's Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services. The User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities. ### Additional information about User's Personal Data In addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request. ### System logs and maintenance For operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) or use other Personal Data (such as the IP Address) for this purpose. ### Information not contained in this policy More details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document. Users are also encouraged to check the privacy policies of any third-party services used by this Application. ### Changes to this privacy policy The Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom. Should the changes affect processing activities performed on the basis of the User's consent, the Owner shall collect new consent from the User, where required.'
	String get additionalInfoContent => '### Legal action\n\nThe User\'s Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services.\n\nThe User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities.\n\n### Additional information about User\'s Personal Data\n\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request.\n\n### System logs and maintenance\n\nFor operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) or use other Personal Data (such as the IP Address) for this purpose.\n\n### Information not contained in this policy\n\nMore details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document.\n\nUsers are also encouraged to check the privacy policies of any third-party services used by this Application.\n\n### Changes to this privacy policy\n\nThe Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom.\n\nShould the changes affect processing activities performed on the basis of the User\'s consent, the Owner shall collect new consent from the User, where required.';

	/// en: 'Additional information'
	String get additionalInfoSection => 'Additional information';

	/// en: 'Nourish to be nourished'
	String get chooseAstrologicalPath => 'Nourish to be nourished';

	/// en: 'AI plays a minor role in AstroGods. The interpretations are handwritten and curated by Jacopo Trombetti and Arcangelo Massari. The astronomical calculations use the Swiss Ephemeris, the most precise in the world. AI only assembles the various interpretive pieces into coherent sentences, nothing more.'
	String get faq1Answer => 'AI plays a minor role in AstroGods. The interpretations are handwritten and curated by Jacopo Trombetti and Arcangelo Massari. The astronomical calculations use the Swiss Ephemeris, the most precise in the world. AI only assembles the various interpretive pieces into coherent sentences, nothing more.';

	/// en: 'Does artificial intelligence make interpretations random?'
	String get faq1Question => 'Does artificial intelligence make interpretations random?';

	/// en: 'According to this interpretive approach, the human energy constitution articulates across seven chakras corresponding to seven planets, from the Moon to Saturn. Beyond these, the human constitution simply has no receptive channels for superior planetary powers. These planets have an impact, but of a generational type: for example, Pluto in Scorpio (1983-1995) characterizes an entire generation. They are more useful for studying historical periods than individuals, and therefore are not included.'
	String get faq2Answer => 'According to this interpretive approach, the human energy constitution articulates across seven chakras corresponding to seven planets, from the Moon to Saturn. Beyond these, the human constitution simply has no receptive channels for superior planetary powers. These planets have an impact, but of a generational type: for example, Pluto in Scorpio (1983-1995) characterizes an entire generation. They are more useful for studying historical periods than individuals, and therefore are not included.';

	/// en: 'Why are Uranus, Neptune, and Pluto not included?'
	String get faq2Question => 'Why are Uranus, Neptune, and Pluto not included?';

	/// en: 'Domification is the method used to calculate the twelve astrological Houses. Most apps use Placidus, which divides the sky based on time, creating unequal Houses that vary by latitude: some can be enormous, others tiny. We use Vehlow, which divides the zodiac into twelve equal Houses of 30 degrees each. It makes no symbolic sense to divide the human soul into unequal parts: no area of life is less important than another.'
	String get faq3Answer => 'Domification is the method used to calculate the twelve astrological Houses. Most apps use Placidus, which divides the sky based on time, creating unequal Houses that vary by latitude: some can be enormous, others tiny. We use Vehlow, which divides the zodiac into twelve equal Houses of 30 degrees each. It makes no symbolic sense to divide the human soul into unequal parts: no area of life is less important than another.';

	/// en: 'Why are the planets in different Houses compared to other apps?'
	String get faq3Question => 'Why are the planets in different Houses compared to other apps?';

	/// en: 'The Ascendant and Houses depend on the exact birth time. The entire chart rotates completely in 24 hours. Without the time of birth, we can only analyze planetary positions in signs, missing half of the symbolic picture: the Houses that describe in which areas of life planetary energies manifest.'
	String get faq4Answer => 'The Ascendant and Houses depend on the exact birth time. The entire chart rotates completely in 24 hours. Without the time of birth, we can only analyze planetary positions in signs, missing half of the symbolic picture: the Houses that describe in which areas of life planetary energies manifest.';

	/// en: 'Why is the birth time important?'
	String get faq4Question => 'Why is the birth time important?';

	/// en: 'We use the Swiss Ephemeris, the most precise astronomical tables in the world. Developed and maintained by Astrodienst (astro.com), they calculate exact planetary positions for any date in history or the future. They are the standard reference for professional astrological software.'
	String get faq5Answer => 'We use the Swiss Ephemeris, the most precise astronomical tables in the world. Developed and maintained by Astrodienst (astro.com), they calculate exact planetary positions for any date in history or the future. They are the standard reference for professional astrological software.';

	/// en: 'What is the source of the astrological calculations?'
	String get faq5Question => 'What is the source of the astrological calculations?';

	/// en: 'Egypt is the hermetic matrix of Western culture. Horoscopic Astrology was born in Alexandria, Egypt, where Pharaoh Nechepso and priest Petosiris wrote the foundational texts (~150-120 BCE) from which all Greek and Roman astrologers drew. Ptolemy, author of the Tetrabiblos (foundation of Western Astrology), worked in Alexandria. Hermes Trismegistus, the fusion of Greek Hermes and Egyptian Thoth, is considered the founder of this tradition. Egyptian Astrology is not a variant: it is the original source.'
	String get faq6Answer => 'Egypt is the hermetic matrix of Western culture. Horoscopic Astrology was born in Alexandria, Egypt, where Pharaoh Nechepso and priest Petosiris wrote the foundational texts (~150-120 BCE) from which all Greek and Roman astrologers drew. Ptolemy, author of the Tetrabiblos (foundation of Western Astrology), worked in Alexandria. Hermes Trismegistus, the fusion of Greek Hermes and Egyptian Thoth, is considered the founder of this tradition. Egyptian Astrology is not a variant: it is the original source.';

	/// en: 'Why Egyptian Astrology?'
	String get faq6Question => 'Why Egyptian Astrology?';

	/// en: 'No. Astrological elements have multiple symbolic meanings, and interpreting them within a specific energetic constitution requires an exchange between souls, hearts, and sensibilities. Moreover, the birth chart reveals a person's potentials, but not how much these have been developed or transcended: two individuals with identical charts can live in radically different ways. Only an astrologer, by knowing the person, can calibrate the interpretation.'
	String get faq7Answer => 'No. Astrological elements have multiple symbolic meanings, and interpreting them within a specific energetic constitution requires an exchange between souls, hearts, and sensibilities. Moreover, the birth chart reveals a person\'s potentials, but not how much these have been developed or transcended: two individuals with identical charts can live in radically different ways. Only an astrologer, by knowing the person, can calibrate the interpretation.';

	/// en: 'Does this app replace consultation with an astrologer?'
	String get faq7Question => 'Does this app replace consultation with an astrologer?';

	/// en: 'Not serious stuff'
	String get faqNotSeriousSectionTitle => 'Not serious stuff';

	/// en: ' and we'll refund you. We'll ask what went wrong because we want to improve, but you don't have to answer.'
	String get faqRefundAnswerAfter => ' and we\'ll refund you. We\'ll ask what went wrong because we want to improve, but you don\'t have to answer.';

	/// en: 'Yes. Email '
	String get faqRefundAnswerBefore => 'Yes. Email ';

	/// en: 'I didn't like the service, can I get a refund?'
	String get faqRefundQuestion => 'I didn\'t like the service, can I get a refund?';

	/// en: 'Frequently asked questions'
	String get faqSectionTitle => 'Frequently asked questions';

	/// en: 'Serious stuff'
	String get faqSeriousSectionTitle => 'Serious stuff';

	/// en: 'Our mission'
	String get missionSectionTitle => 'Our mission';

	/// en: 'Ours is first and foremost a research mission: we ourselves are curious to discover what is possible with this tool. We use software that considers all factors simultaneously to reach increasingly precise interpretations. AstroGods makes astrological interpretation more accessible to non-experts, while also simplifying the work of astrologers: no matter how skilled or experienced, they must symbolically blend infinite elements. Having a tool that keeps them all in consideration means nothing gets forgotten: a support that enhances, not replaces, human expertise.'
	String get missionText => 'Ours is first and foremost a research mission: we ourselves are curious to discover what is possible with this tool. We use software that considers all factors simultaneously to reach increasingly precise interpretations. AstroGods makes astrological interpretation more accessible to non-experts, while also simplifying the work of astrologers: no matter how skilled or experienced, they must symbolically blend infinite elements. Having a tool that keeps them all in consideration means nothing gets forgotten: a support that enhances, not replaces, human expertise.';

	/// en: 'Our story'
	String get storySectionTitle => 'Our story';

	/// en: 'AstroGods was born from a friendship. Arcangelo has always been struck by Jacopo's ability to describe people with precision based only on their birth date, and to read moments of his life with an inexplicable depth. He wanted to always carry that perspective with him, and so AstroGods was born: an attempt to translate into an algorithm the method Jacopo uses to decipher reality through Astrology.'
	String get storyText => 'AstroGods was born from a friendship. Arcangelo has always been struck by Jacopo\'s ability to describe people with precision based only on their birth date, and to read moments of his life with an inexplicable depth. He wanted to always carry that perspective with him, and so AstroGods was born: an attempt to translate into an algorithm the method Jacopo uses to decipher reality through Astrology.';

	/// en: 'Student of Jacopo and responsible for the technical side of AstroGods. Passionate about Astrology, studying the subject since 2016.'
	String get teamMemberArcangeloDescription => 'Student of Jacopo and responsible for the technical side of AstroGods. Passionate about Astrology, studying the subject since 2016.';

	/// en: 'Technical development'
	String get teamMemberArcangeloRole => 'Technical development';

	/// en: 'Arcangelo Massari'
	String get teamMemberArcangeloTitle => 'Arcangelo Massari';

	/// en: 'Explorer of various paths of self-knowledge, Corrado is responsible for spreading AstroGods to the world and building bridges between Astrology and other disciplines.'
	String get teamMemberCorradoDescription => 'Explorer of various paths of self-knowledge, Corrado is responsible for spreading AstroGods to the world and building bridges between Astrology and other disciplines.';

	/// en: 'Community'
	String get teamMemberCorradoRole => 'Community';

	/// en: 'Corrado Camponeschi'
	String get teamMemberCorradoTitle => 'Corrado Camponeschi';

	/// en: 'Trained at the Accademia di Astrologia Egizia founded by Pascal Fabio Patruno, Jacopo is a brilliant astrologer capable of computing synastry mentally, memorizing degrees and planets from charts he has seen only once in his life.'
	String get teamMemberJacopoDescription => 'Trained at the Accademia di Astrologia Egizia founded by Pascal Fabio Patruno, Jacopo is a brilliant astrologer capable of computing synastry mentally, memorizing degrees and planets from charts he has seen only once in his life.';

	/// en: 'Astrologer'
	String get teamMemberJacopoRole => 'Astrologer';

	/// en: 'Jacopo Trombetti'
	String get teamMemberJacopoTitle => 'Jacopo Trombetti';

	/// en: 'The team'
	String get teamSectionTitle => 'The team';
}

// Path: caverns
class Translations$caverns$en {
	Translations$caverns$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Cavern ${number} - Coming Soon'
	String cavernComingSoon({required Object number}) => 'Cavern ${number} - Coming Soon';

	/// en: 'Cavern details not found'
	String get cavernDetailsNotFound => 'Cavern details not found';

	/// en: 'Book of Caverns'
	String get cavernDetailsTitle => 'Book of Caverns';

	/// en: 'central scene'
	String get centralScene => 'central scene';

	/// en: 'Structure of the third division'
	String get divisionStructureAlt3 => 'Structure of the third division';

	/// en: 'Structure of the fourth division'
	String get divisionStructureAlt4 => 'Structure of the fourth division';

	/// en: '## The cavern of divine assistance and spiritual discernment According to Angelini, the Eighth Cavern represents first and foremost **divine assistance for spiritual ascension**. The deities who "carry those seated upon them to heaven" concretely symbolize how higher spiritual forces provide a vehicle of elevation through profound introspection. ## Discernment between truth and falsehood The cavern's very name - "She who judges, distinguishing truth from falsehood" - reveals its essential function. The deities described as "judges of souls" represent not an external tribunal, but the **inner discernment process** that every spiritual seeker must develop. The prostrate figures (Groups 3, 4, 5) show the dangers of this search: "Those who mourn for Ra" warn of possible deviations in metaphysical studies and afterlife research. ## The duality of spiritual and material resources While the second cavern governs earnings from one's own work, the eighth rules **resources received through others**: "Those who carry gifts" and "Those who carry offerings" (Groups 4 and 7) indicate both material gifts (inheritances, legacies) and transformative experiences that arrive unexpectedly. Angelini specifies that these "gifts" may also derive from marriage to wealthier individuals. ## The danger of occult research The prostrate figures represent the **death-bringing significance of the eighth house**: research in supernatural studies carries real risks. "The Tired Ones" (Group 5) symbolize "those who reach life's end" for having incorrectly traveled the path of hidden knowledge. However, those who succeed in "distinguishing truth from falsehood" can "pass through the Wide Hall of the Two Truths." ## The eighth house as alchemical process This cavern represents the **alchemical process of death and rebirth** - the dissolution of old forms to allow new spiritual growth. It is the house of radical transformation, where investigation into "hidden things" can lead to both illumination and spiritual destruction.'
	String get eighthCavernEsotericMeaning => '## The cavern of divine assistance and spiritual discernment\n\nAccording to Angelini, the Eighth Cavern represents first and foremost **divine assistance for spiritual ascension**. The deities who "carry those seated upon them to heaven" concretely symbolize how higher spiritual forces provide a vehicle of elevation through profound introspection.\n\n## Discernment between truth and falsehood\n\nThe cavern\'s very name - "She who judges, distinguishing truth from falsehood" - reveals its essential function. The deities described as "judges of souls" represent not an external tribunal, but the **inner discernment process** that every spiritual seeker must develop. The prostrate figures (Groups 3, 4, 5) show the dangers of this search: "Those who mourn for Ra" warn of possible deviations in metaphysical studies and afterlife research.\n\n## The duality of spiritual and material resources\n\nWhile the second cavern governs earnings from one\'s own work, the eighth rules **resources received through others**: "Those who carry gifts" and "Those who carry offerings" (Groups 4 and 7) indicate both material gifts (inheritances, legacies) and transformative experiences that arrive unexpectedly. Angelini specifies that these "gifts" may also derive from marriage to wealthier individuals.\n\n## The danger of occult research\n\nThe prostrate figures represent the **death-bringing significance of the eighth house**: research in supernatural studies carries real risks. "The Tired Ones" (Group 5) symbolize "those who reach life\'s end" for having incorrectly traveled the path of hidden knowledge. However, those who succeed in "distinguishing truth from falsehood" can "pass through the Wide Hall of the Two Truths."\n\n## The eighth house as alchemical process\n\nThis cavern represents the **alchemical process of death and rebirth** - the dissolution of old forms to allow new spiritual growth. It is the house of radical transformation, where investigation into "hidden things" can lead to both illumination and spiritual destruction.';

	/// en: 'The Eighth Cavern, called **"She who protects the Souls, She who judges, distinguishing truth from falsehood"**, is organized into **seven groups of deities**, each with specific functions in the divine organization of the Netherworld. ![Structure of the eighth division](ottava_divisione.webp) ## Different representations across sources Ancient sources present two modes of representation: - **In the Osireion at Abydos**: Each group is depicted *in extenso* with all deities (generally four per group) shown in procession - **In papyri** (such as British Museum 10.478 shown above): **Each group is symbolically represented by a single figure inscribed in a rectangle**, with the number of group members indicated below the figure. This single deity represents the entire collective. ## The Seven Groups of Deities ### Group 1: "Those who carry [the ones who are seated] upon them" **Papyrus representation**: A deity walking carrying a female child seated on the shoulder, with the number "4" below. **Meaning**: Four deities who guarantee the deceased "sees Ra at his rising" and follows him "in Ra's bark." ### Group 2: "Those who carry the ones who are [seated] upon them" **Papyrus representation**: A deity carrying a male child seated on the shoulder, with the number "4". **Meaning**: Four deities who transport specifically male seated figures, granting the same benefits as the first group. ### Group 3: "Those who mourn for Ra" **Papyrus representation**: A goddess prostrate face down with hair locks hanging before her face and hands raised, with the number "4". **Meaning**: Four figures who guarantee "offerings come to the deceased as they come to Ra's followers at his setting." ### Group 4: "Those who carry gifts" **Papyrus representation**: A goddess prostrate face down with hands raised, with the number "4". **Meaning**: Four figures who hold round bread and grant the deceased to "be like those who are in the Netherworld." ### Group 5: "The Tired Ones" **Papyrus representation**: A goddess prostrate with hair before her face and hands raised inward. **Meaning**: Four figures who allow the deceased to "pass through the Wide Hall of the Two Truths." ### Group 6: "Those who render homage" **Papyrus representation**: A bowing god, with the number "4". **Meaning**: Four deities who guarantee the deceased can "follow Ra in his bark." ### Group 7: "Those who carry offerings" **Papyrus representation**: A god walking holding a conical object. **Meaning**: Four deities who grant "offerings and food to the deceased in the Necropolis."'
	String get eighthCavernLiteralMeaning => 'The Eighth Cavern, called **"She who protects the Souls, She who judges, distinguishing truth from falsehood"**, is organized into **seven groups of deities**, each with specific functions in the divine organization of the Netherworld.\n\n![Structure of the eighth division](ottava_divisione.webp)\n\n## Different representations across sources\n\nAncient sources present two modes of representation:\n\n- **In the Osireion at Abydos**: Each group is depicted *in extenso* with all deities (generally four per group) shown in procession\n- **In papyri** (such as British Museum 10.478 shown above): **Each group is symbolically represented by a single figure inscribed in a rectangle**, with the number of group members indicated below the figure. This single deity represents the entire collective.\n\n## The Seven Groups of Deities\n\n### Group 1: "Those who carry [the ones who are seated] upon them"\n**Papyrus representation**: A deity walking carrying a female child seated on the shoulder, with the number "4" below.\n**Meaning**: Four deities who guarantee the deceased "sees Ra at his rising" and follows him "in Ra\'s bark."\n\n### Group 2: "Those who carry the ones who are [seated] upon them"\n**Papyrus representation**: A deity carrying a male child seated on the shoulder, with the number "4".\n**Meaning**: Four deities who transport specifically male seated figures, granting the same benefits as the first group.\n\n### Group 3: "Those who mourn for Ra"\n**Papyrus representation**: A goddess prostrate face down with hair locks hanging before her face and hands raised, with the number "4".\n**Meaning**: Four figures who guarantee "offerings come to the deceased as they come to Ra\'s followers at his setting."\n\n### Group 4: "Those who carry gifts"\n**Papyrus representation**: A goddess prostrate face down with hands raised, with the number "4".\n**Meaning**: Four figures who hold round bread and grant the deceased to "be like those who are in the Netherworld."\n\n### Group 5: "The Tired Ones"\n**Papyrus representation**: A goddess prostrate with hair before her face and hands raised inward.\n**Meaning**: Four figures who allow the deceased to "pass through the Wide Hall of the Two Truths."\n\n### Group 6: "Those who render homage"\n**Papyrus representation**: A bowing god, with the number "4".\n**Meaning**: Four deities who guarantee the deceased can "follow Ra in his bark."\n\n### Group 7: "Those who carry offerings"\n**Papyrus representation**: A god walking holding a conical object.\n**Meaning**: Four deities who grant "offerings and food to the deceased in the Necropolis."';

	/// en: 'Eighth cavern - The cavern of transformation'
	String get eighthCavernTitle => 'Eighth cavern - The cavern of transformation';

	/// en: '## The cavern of spiritual friendship According to Angelini, the Eleventh Cavern **"She who covers the Tired One, who conceals that which is hidden"** reveals its **friendly characteristics** while encompassing both the **joys and sorrows that friendships can bring** in both material and spiritual domains. ## Divine support and protection of the weary soul The cavern's name reveals its fundamental role: "She who covers the Tired One" refers to **divine protection for the soul weary** from the long spiritual journey. "The Swallower" (Group 1) and "The Soul of the West" (Group 2) represent forces that **welcome and sustain** those needing rest and regeneration. "Those who acclaim" (Group 4) show the **celestial companionship** that encourages the soul toward peace. ## Regeneration through sacred mourning "The Ennead of Mourners" (Group 10) and "The Ennead of Watchers" (Group 9) reveal a profound aspect: the **regenerative power of shared sorrow**. As the goddesses weep for Osiris guaranteeing his resurrection, so authentic friendships traverse trials together, transforming suffering into spiritual strength. The nine jackals on standards "protect the awakening" showing how true friends watch over our spiritual rebirth. ## The serpents of the Enveloper: protection and transformation "The Enveloper" (Group 15) and "Those who are in the Enveloper" (Group 16) show how **apparent constraints** can become protection. Like the serpent Mehen that wraps Osiris to protect him, so the limitations imposed by authentic friendships become means of spiritual growth. ## Material and spiritual benefits Angelini specifies that this cavern governs **"financial situations dependent on the influence of protections and legacies from friends, or strokes of fortune"**. The protective groups show how spiritual friendships manifest concretely: "The Souls of the Earth" (Group 3) grant "pure things," while "The Summoner" (Group 11) brings together the right people at the right time. ## The eleventh astrological house This cavern corresponds to the **eleventh house**: the house of friendship, hopes, wishes, and **deep scientific and philosophical interests**. Through authentic friendships the soul can reach higher levels of understanding, passing from shared trials (the mourning) to spiritual freedom and transformative protection (the Enveloper).'
	String get eleventhCavernEsotericMeaning => '## The cavern of spiritual friendship\n\nAccording to Angelini, the Eleventh Cavern **"She who covers the Tired One, who conceals that which is hidden"** reveals its **friendly characteristics** while encompassing both the **joys and sorrows that friendships can bring** in both material and spiritual domains.\n\n## Divine support and protection of the weary soul\n\nThe cavern\'s name reveals its fundamental role: "She who covers the Tired One" refers to **divine protection for the soul weary** from the long spiritual journey. "The Swallower" (Group 1) and "The Soul of the West" (Group 2) represent forces that **welcome and sustain** those needing rest and regeneration. "Those who acclaim" (Group 4) show the **celestial companionship** that encourages the soul toward peace.\n\n## Regeneration through sacred mourning\n\n"The Ennead of Mourners" (Group 10) and "The Ennead of Watchers" (Group 9) reveal a profound aspect: the **regenerative power of shared sorrow**. As the goddesses weep for Osiris guaranteeing his resurrection, so authentic friendships traverse trials together, transforming suffering into spiritual strength. The nine jackals on standards "protect the awakening" showing how true friends watch over our spiritual rebirth.\n\n## The serpents of the Enveloper: protection and transformation\n\n"The Enveloper" (Group 15) and "Those who are in the Enveloper" (Group 16) show how **apparent constraints** can become protection. Like the serpent Mehen that wraps Osiris to protect him, so the limitations imposed by authentic friendships become means of spiritual growth.\n\n## Material and spiritual benefits\n\nAngelini specifies that this cavern governs **"financial situations dependent on the influence of protections and legacies from friends, or strokes of fortune"**. The protective groups show how spiritual friendships manifest concretely: "The Souls of the Earth" (Group 3) grant "pure things," while "The Summoner" (Group 11) brings together the right people at the right time.\n\n## The eleventh astrological house\n\nThis cavern corresponds to the **eleventh house**: the house of friendship, hopes, wishes, and **deep scientific and philosophical interests**. Through authentic friendships the soul can reach higher levels of understanding, passing from shared trials (the mourning) to spiritual freedom and transformative protection (the Enveloper).';

	/// en: 'The Eleventh Cavern, called **"She who covers the Tired One, who conceals that which is hidden"**, contains **eighteen groups of deities** embodying themes of protection, regeneration, and spiritual support. ![Structure of the eleventh division](undicesima_divisione.webp) ## The cavern's name The name reveals this dwelling's protective nature: "She who covers the Tired One" refers to divine care for those weary from spiritual journey, while "who conceals that which is hidden" indicates protection of sacred mysteries. ## Differences between ancient sources As in other caverns: **In the Osireion at Abydos**: Each group is shown with all its deities - for example, the ninth group shows nine jackals on standards, the tenth group shows nine prostrate mourning goddesses. **In funerary papyri**: Symbolic representation with one figure per group and an indicative number - a single jackal with "9" representing the nine guardians. ## The Eighteen Groups of Deities ### Group 1: "The Swallower" **Representation**: Standing goddess with upright serpent before her, number "1". **Meaning**: A goddess who guarantees "prosperity, life, stability and wealth for the Great God in the netherworld". ### Group 2: "The Soul of the West" **Representation**: Striding god with scepter, number "1". **Meaning**: One deity who guarantees "an invocation offering in the Necropolis". ### Group 3: "The Souls of the Earth" **Representation**: Four striding gods. **Meaning**: Four deities who grant "all pure things on earth and before the Great God". ### Group 4: "Those who acclaim" **Representation**: Four striding gods with raised arms. **Meaning**: Four deities who "acclaim so that Osiris may be at ease among those in heaven". ### Group 5: "The Ennead of the Ruler of the West" **Representation**: Nine mummified gods lying on beds (on serpents in the Osireion). **Meaning**: Nine guardians who watch over the western realm of the dead. ### Group 6: "The Ennead in the following of Ra" **Representation**: Nine mummified gods with hidden arms, lying on serpents and beds. **Meaning**: Nine deities who accompany Ra on his journey. ### Group 7: "Ikh" (cryptic name) **Representation**: Striding god with scepter, number "1". **Meaning**: Deity who guarantees being "at the side of the Great God when he traverses the sky". ### Group 8: "The Vivifiers of Osiris" (uncertain name) **Representation**: Four standing mummiform gods. **Meaning**: Deities who give life to Osiris. ### Group 9: "The Ennead of Watchers" **Representation**: Nine jackals on standards (in the Osireion). **Meaning**: Nine guardians who "protect Osiris's awakening so he may never be annihilated". ### Group 10: "The Ennead of Mourners" **Representation**: Nine prostrate goddesses with hair before faces and hands raised. **Meaning**: Nine goddesses who "grant the deceased the same ritual mourning that was done for the god Osiris", ensuring the same funerary honors that enabled divine resurrection. ### Group 11: "The Summoner" **Representation**: Striding god with one hand raised, number "1". **Meaning**: Deity who "summons Osiris before Ra near his ennead". ### Group 12: "Iqeheren" (divine name) **Representation**: Striding god with scepter, number "1". **Meaning**: Deity who "drives away all evil from Osiris forever". ### Group 13: "Sacred Head" **Representation**: Coiled cobra with woman's head, number "1". **Meaning**: Sacred serpent who "helps Osiris to have power over the waters". ### Group 14: "Those who are in the Sacred Head" **Representation**: Three standing mummiform gods (four in the Osireion). **Meaning**: Deities who "help Osiris to enter and exit freely, to move as Lord of the netherworld". ### Group 15: "The Enveloper" **Representation**: Coiled cobra, number "1". **Meaning**: Serpent who wraps and protects. ### Group 16: "Those who are in the Enveloper" **Representation**: Four striding gods. **Meaning**: Deities who enable one to "walk unhindered in the sacred place". ### Group 17: "The Ennead of those who conceal Osiris" **Representation**: Nine kneeling gods looking back (in the Osireion), prostrate goddess looking back (in papyri). **Meaning**: Nine deities who "grant that Osiris be happy in the place he desires". ### Group 18: "Ferocious Face" **Representation**: Standing mummiform god, number "1". **Meaning**: Deity who "opens the eyes to Osiris so he can see Ra's light".'
	String get eleventhCavernLiteralMeaning => 'The Eleventh Cavern, called **"She who covers the Tired One, who conceals that which is hidden"**, contains **eighteen groups of deities** embodying themes of protection, regeneration, and spiritual support.\n\n![Structure of the eleventh division](undicesima_divisione.webp)\n\n## The cavern\'s name\n\nThe name reveals this dwelling\'s protective nature: "She who covers the Tired One" refers to divine care for those weary from spiritual journey, while "who conceals that which is hidden" indicates protection of sacred mysteries.\n\n## Differences between ancient sources\n\nAs in other caverns:\n\n**In the Osireion at Abydos**: Each group is shown with all its deities - for example, the ninth group shows nine jackals on standards, the tenth group shows nine prostrate mourning goddesses.\n\n**In funerary papyri**: Symbolic representation with one figure per group and an indicative number - a single jackal with "9" representing the nine guardians.\n\n## The Eighteen Groups of Deities\n\n### Group 1: "The Swallower"\n**Representation**: Standing goddess with upright serpent before her, number "1".\n**Meaning**: A goddess who guarantees "prosperity, life, stability and wealth for the Great God in the netherworld".\n\n### Group 2: "The Soul of the West"\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: One deity who guarantees "an invocation offering in the Necropolis".\n\n### Group 3: "The Souls of the Earth"\n**Representation**: Four striding gods.\n**Meaning**: Four deities who grant "all pure things on earth and before the Great God".\n\n### Group 4: "Those who acclaim"\n**Representation**: Four striding gods with raised arms.\n**Meaning**: Four deities who "acclaim so that Osiris may be at ease among those in heaven".\n\n### Group 5: "The Ennead of the Ruler of the West"\n**Representation**: Nine mummified gods lying on beds (on serpents in the Osireion).\n**Meaning**: Nine guardians who watch over the western realm of the dead.\n\n### Group 6: "The Ennead in the following of Ra"\n**Representation**: Nine mummified gods with hidden arms, lying on serpents and beds.\n**Meaning**: Nine deities who accompany Ra on his journey.\n\n### Group 7: "Ikh" (cryptic name)\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: Deity who guarantees being "at the side of the Great God when he traverses the sky".\n\n### Group 8: "The Vivifiers of Osiris" (uncertain name)\n**Representation**: Four standing mummiform gods.\n**Meaning**: Deities who give life to Osiris.\n\n### Group 9: "The Ennead of Watchers"\n**Representation**: Nine jackals on standards (in the Osireion).\n**Meaning**: Nine guardians who "protect Osiris\'s awakening so he may never be annihilated".\n\n### Group 10: "The Ennead of Mourners"\n**Representation**: Nine prostrate goddesses with hair before faces and hands raised.\n**Meaning**: Nine goddesses who "grant the deceased the same ritual mourning that was done for the god Osiris", ensuring the same funerary honors that enabled divine resurrection.\n\n### Group 11: "The Summoner"\n**Representation**: Striding god with one hand raised, number "1".\n**Meaning**: Deity who "summons Osiris before Ra near his ennead".\n\n### Group 12: "Iqeheren" (divine name)\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: Deity who "drives away all evil from Osiris forever".\n\n### Group 13: "Sacred Head"\n**Representation**: Coiled cobra with woman\'s head, number "1".\n**Meaning**: Sacred serpent who "helps Osiris to have power over the waters".\n\n### Group 14: "Those who are in the Sacred Head"\n**Representation**: Three standing mummiform gods (four in the Osireion).\n**Meaning**: Deities who "help Osiris to enter and exit freely, to move as Lord of the netherworld".\n\n### Group 15: "The Enveloper"\n**Representation**: Coiled cobra, number "1".\n**Meaning**: Serpent who wraps and protects.\n\n### Group 16: "Those who are in the Enveloper"\n**Representation**: Four striding gods.\n**Meaning**: Deities who enable one to "walk unhindered in the sacred place".\n\n### Group 17: "The Ennead of those who conceal Osiris"\n**Representation**: Nine kneeling gods looking back (in the Osireion), prostrate goddess looking back (in papyri).\n**Meaning**: Nine deities who "grant that Osiris be happy in the place he desires".\n\n### Group 18: "Ferocious Face"\n**Representation**: Standing mummiform god, number "1".\n**Meaning**: Deity who "opens the eyes to Osiris so he can see Ra\'s light".';

	/// en: 'Eleventh cavern - The cavern of the weary protector'
	String get eleventhCavernTitle => 'Eleventh cavern - The cavern of the weary protector';

	/// en: 'Esoteric meaning'
	String get esotericMeaning => 'Esoteric meaning';

	/// en: '## The fifth astrological house This cavern corresponds to the **fifth house**: the house of love, creativity and generation. It is the place where vital energy expresses itself through creation, both material and spiritual. It represents children, artistic expression and everything born from the individual's creative impulse.'
	String get fifthCavernEsotericMeaning => '## The fifth astrological house\n\nThis cavern corresponds to the **fifth house**: the house of love, creativity and generation. It is the place where vital energy expresses itself through creation, both material and spiritual. It represents children, artistic expression and everything born from the individual\'s creative impulse.';

	/// en: 'Division Five represents **the beginning of the rebirth of the sun god Ra**, as clearly indicated in the ancient texts. It is structured in three registers with fourteen scenes: [TABLE_CAVERNA_5] ![Structure of the fifth division](quinta_divisione.webp) The start of the rebirth process is symbolized by the **large image of Nut** at the beginning of the division, the sky goddess who gives birth to the sun each morning. At the center of the division appears the **large figure of ithyphallic Osiris** - Osiris depicted with an erect phallus, symbol of regenerative power and resurrection - that continues the Solar-Osirian unity process: the temporary nightly union of Ra (the sun) with Osiris (regenerative death) necessary for the sun to be reborn each morning. Rebirth is further symbolized by **two seated children in an oval** (R1, S3-1), called "The Youth Ra" and "The Child Ra", representing the first manifestations of the sun god. In scene **R1, S1(2)** appear the **pieces of flesh of Osiris**, elements of the dismembered body that must be reassembled to allow resurrection.'
	String get fifthCavernLiteralMeaning => 'Division Five represents **the beginning of the rebirth of the sun god Ra**, as clearly indicated in the ancient texts. It is structured in three registers with fourteen scenes:\n\n[TABLE_CAVERNA_5]\n\n![Structure of the fifth division](quinta_divisione.webp)\n\nThe start of the rebirth process is symbolized by the **large image of Nut** at the beginning of the division, the sky goddess who gives birth to the sun each morning.\n\nAt the center of the division appears the **large figure of ithyphallic Osiris** - Osiris depicted with an erect phallus, symbol of regenerative power and resurrection - that continues the Solar-Osirian unity process: the temporary nightly union of Ra (the sun) with Osiris (regenerative death) necessary for the sun to be reborn each morning.\n\nRebirth is further symbolized by **two seated children in an oval** (R1, S3-1), called "The Youth Ra" and "The Child Ra", representing the first manifestations of the sun god. In scene **R1, S1(2)** appear the **pieces of flesh of Osiris**, elements of the dismembered body that must be reassembled to allow resurrection.';

	/// en: 'Fifth cavern - The cavern of divine children'
	String get fifthCavernTitle => 'Fifth cavern - The cavern of divine children';

	/// en: '## Sons of earth At the entrance to the caverns, Ra addresses the three guardian serpents with the words: "O son of earth". This invocation introduces the fundamental theme of the **terrestrial dimension of domification**: astrological houses are born from the encounter between heaven (the zodiac) and earth (the horizon at the time of birth), rooting cosmic energies in the concrete reality of human experience. ## Ovals as magnetic envelopes The **ovals that enclose the deities** are traditionally identified as sarcophagi. However, at a deeper level of interpretation, they are to be interpreted as **magnetic envelopes**: auras that surround the divine entities preventing their energies from dispersing. The bodies in their sepulchers are therefore bundles of energies that resolve into matter, enveloped by this magnetic ampule. ## The first house In astrological terms, the first cavern corresponds to the **first house**: the house of the ascendant, of the self and individual identity. This cavern represents the beginning of the initiatory journey through the twelve astrological houses, where the human soul must confront terrestrial and celestial forces to complete its process of spiritual evolution.'
	String get firstCavernEsotericMeaning => '## Sons of earth\n\nAt the entrance to the caverns, Ra addresses the three guardian serpents with the words: "O son of earth". This invocation introduces the fundamental theme of the **terrestrial dimension of domification**: astrological houses are born from the encounter between heaven (the zodiac) and earth (the horizon at the time of birth), rooting cosmic energies in the concrete reality of human experience.\n\n## Ovals as magnetic envelopes\n\nThe **ovals that enclose the deities** are traditionally identified as sarcophagi. However, at a deeper level of interpretation, they are to be interpreted as **magnetic envelopes**: auras that surround the divine entities preventing their energies from dispersing. The bodies in their sepulchers are therefore bundles of energies that resolve into matter, enveloped by this magnetic ampule.\n\n## The first house\n\nIn astrological terms, the first cavern corresponds to the **first house**: the house of the ascendant, of the self and individual identity. This cavern represents the beginning of the initiatory journey through the twelve astrological houses, where the human soul must confront terrestrial and celestial forces to complete its process of spiritual evolution.';

	/// en: 'The first division is composed of five registers (R) and 13 scenes (S), with a precise iconographic structure: [TABLE_CAVERNA_1] ![Division structure](prima_divisione.webp) This division begins with three serpentine guardians that Ra must convince to allow him to enter the afterlife. This division also contains the first appearance of deities enclosed in ovals and the first appearance of Osiris in a sanctuary. It also includes elements of Osiris' body, represented by the two discs raised above the heads of the deities and by the pieces of flesh that appear in the mounds in R4, S3. The inclusion of parts of Osiris' body symbolizes the elements necessary for **solar-Osirian unity** - the process through which Ra (the daytime sun) and Osiris (the nighttime sun and the regenerative force of death) merge to complete the cosmic cycle of death and rebirth, allowing the daily resurrection of the sun. The lower register is finally reserved for the punishment of the enemies of Ra and Osiris.'
	String get firstCavernLiteralMeaning => 'The first division is composed of five registers (R) and 13 scenes (S), with a precise iconographic structure:\n\n[TABLE_CAVERNA_1]\n\n![Division structure](prima_divisione.webp)\n\nThis division begins with three serpentine guardians that Ra must convince to allow him to enter the afterlife.\n\nThis division also contains the first appearance of deities enclosed in ovals and the first appearance of Osiris in a sanctuary. It also includes elements of Osiris\' body, represented by the two discs raised above the heads of the deities and by the pieces of flesh that appear in the mounds in R4, S3. The inclusion of parts of Osiris\' body symbolizes the elements necessary for **solar-Osirian unity** - the process through which Ra (the daytime sun) and Osiris (the nighttime sun and the regenerative force of death) merge to complete the cosmic cycle of death and rebirth, allowing the daily resurrection of the sun.\n\nThe lower register is finally reserved for the punishment of the enemies of Ra and Osiris.';

	/// en: 'First cavern - The entrance portal'
	String get firstCavernTitle => 'First cavern - The entrance portal';

	/// en: 'First Division'
	String get firstDivisionTitle => 'First Division';

	/// en: '## The cavern of family According to Angelini, the Fourth Cavern represents the **root, paternal home, origin and hearth**. The central figures are members of the divine family: Osiris (the father), Horus (the son and heir), Isis and Nephthys (the sisters who protect and regenerate). These family relationships show how this cavern is the foundation of existence. ## The fourth astrological house This cavern corresponds to the **fourth house**: the house of family origins and ancestral roots. It is the place where the individual finds their primary identity and sense of belonging. It represents the emotional foundations on which existence is built, the family nucleus that provides security and continuity.'
	String get fourthCavernEsotericMeaning => '## The cavern of family\n\nAccording to Angelini, the Fourth Cavern represents the **root, paternal home, origin and hearth**. The central figures are members of the divine family: Osiris (the father), Horus (the son and heir), Isis and Nephthys (the sisters who protect and regenerate). These family relationships show how this cavern is the foundation of existence.\n\n## The fourth astrological house\n\nThis cavern corresponds to the **fourth house**: the house of family origins and ancestral roots. It is the place where the individual finds their primary identity and sense of belonging. It represents the emotional foundations on which existence is built, the family nucleus that provides security and continuity.';

	/// en: 'Division Four consists of 3 registers (R) and 9 scenes (S), the contents of which are contained in the following chart: [TABLE_CAVERNA_4] ![Structure of the fourth division](quarta_divisione.webp) In this division the theme of **Solar-Osirian unity** that began in Division Three continues. The theme is present in the first register (R1, S1) which shows an image of Osiris bent in a crescent shape, with a sun disk at his feet, being lifted by Isis and Nephthys.'
	String get fourthCavernLiteralMeaning => 'Division Four consists of 3 registers (R) and 9 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_4]\n\n![Structure of the fourth division](quarta_divisione.webp)\n\nIn this division the theme of **Solar-Osirian unity** that began in Division Three continues. The theme is present in the first register (R1, S1) which shows an image of Osiris bent in a crescent shape, with a sun disk at his feet, being lifted by Isis and Nephthys.';

	/// en: 'Fourth cavern - The cavern of origins'
	String get fourthCavernTitle => 'Fourth cavern - The cavern of origins';

	/// en: 'Career and public image'
	String get house10Alt => 'Career and public image';

	/// en: 'Friendships and innovation'
	String get house11Alt => 'Friendships and innovation';

	/// en: 'Transcendence and hidden realms'
	String get house12Alt => 'Transcendence and hidden realms';

	/// en: 'Identity and self-expression'
	String get house1Alt => 'Identity and self-expression';

	/// en: 'Material resources and values'
	String get house2Alt => 'Material resources and values';

	/// en: 'Communication and learning'
	String get house3Alt => 'Communication and learning';

	/// en: 'Family and emotional foundation'
	String get house4Alt => 'Family and emotional foundation';

	/// en: 'Creativity and self-expression'
	String get house5Alt => 'Creativity and self-expression';

	/// en: 'Work and health'
	String get house6Alt => 'Work and health';

	/// en: 'Transformation and hidden matters'
	String get house8Alt => 'Transformation and hidden matters';

	/// en: 'Higher knowledge and spirituality'
	String get house9Alt => 'Higher knowledge and spirituality';

	/// en: 'Large Ithyphallic Osiris'
	String get largeIthyphallicOsiris => 'Large Ithyphallic Osiris';

	/// en: 'Large Nut'
	String get largeNut => 'Large Nut';

	/// en: 'Literal meaning'
	String get literalMeaning => 'Literal meaning';

	/// en: '## The cavern of metaphysical order and profound religiosity According to Angelini, the Ninth Cavern represents the **metaphysical, religious, juridical, and mystical order**. Group 1 - "The gods in their temples above the Watery Abyss" - immediately reveals the **profound religiosity** of this house, where the mummified figure of Osiris in the temple establishes the sacred and spiritual character of the domain. ## The higher spiritual principles The deities "in their temples above the Waters of the Abyss (Nu)" (Group 1) represent the **higher spiritual principles** that govern from above. These fourteen gods who allow one to "drink from the middle of the stream" symbolize access to higher knowledge through **elevated consciousness** that transcends the chaotic primordial waters. ## The duality of divine justice The numerous groups (5, 8, 10, 12, 13, 14, 17) that Angelini identifies as the realm of justice show the **dual nature** of this cavern. The "Hidden-Armed Figures" (Groups 12-14) represent those who have lost worldly means: the "gods without hands" symbolize loss of work and material means. However, through this loss one can reach **higher knowledge** - the mystic's path that gains spiritual wealth through material renunciation. ## Magical power and earthly justice The bulls on standards with uraeus (Groups 4, 6, 7) who "give power to Osiris in heaven and earth" represent **magical power** operating through natural forces. This can manifest both as divine justice and as **loss of freedom** through earthly tribunal judgments. The "Protective Deities" (Groups 8-11) show how moral discipline and spiritual ascension allow one to reach **self-knowledge** through infinite trials: illness, infirmities, worldly losses. ## Spiritual religion through adversity "The Souls who come forth" (Group 16) and "The Bright Ones" (Group 19) indicate the positive result of the spiritual path, while "He of the Repugnant Face" (Group 18) warns of the dangers of deviation. The house reveals how through **moral discipline and spiritual ascension** one can reach authentic spiritual religion, transforming trials into higher wisdom. ## The ninth astrological house This cavern corresponds to the **ninth house**: the house of philosophy, religion, law, higher studies, and long journeys. Angelini clearly identifies this domain as the realm of **metaphysical, religious, juridical, and mystical order**. Here both divine and earthly justice manifest - the tribunals that can take away freedom, but also the moral discipline that leads to spiritual liberation. It is the house where one accesses **higher knowledge** through direct experience of spiritual trials, transforming adversity into wisdom.'
	String get ninthCavernEsotericMeaning => '## The cavern of metaphysical order and profound religiosity\n\nAccording to Angelini, the Ninth Cavern represents the **metaphysical, religious, juridical, and mystical order**. Group 1 - "The gods in their temples above the Watery Abyss" - immediately reveals the **profound religiosity** of this house, where the mummified figure of Osiris in the temple establishes the sacred and spiritual character of the domain.\n\n## The higher spiritual principles\n\nThe deities "in their temples above the Waters of the Abyss (Nu)" (Group 1) represent the **higher spiritual principles** that govern from above. These fourteen gods who allow one to "drink from the middle of the stream" symbolize access to higher knowledge through **elevated consciousness** that transcends the chaotic primordial waters.\n\n## The duality of divine justice\n\nThe numerous groups (5, 8, 10, 12, 13, 14, 17) that Angelini identifies as the realm of justice show the **dual nature** of this cavern. The "Hidden-Armed Figures" (Groups 12-14) represent those who have lost worldly means: the "gods without hands" symbolize loss of work and material means. However, through this loss one can reach **higher knowledge** - the mystic\'s path that gains spiritual wealth through material renunciation.\n\n## Magical power and earthly justice\n\nThe bulls on standards with uraeus (Groups 4, 6, 7) who "give power to Osiris in heaven and earth" represent **magical power** operating through natural forces. This can manifest both as divine justice and as **loss of freedom** through earthly tribunal judgments. The "Protective Deities" (Groups 8-11) show how moral discipline and spiritual ascension allow one to reach **self-knowledge** through infinite trials: illness, infirmities, worldly losses.\n\n## Spiritual religion through adversity\n\n"The Souls who come forth" (Group 16) and "The Bright Ones" (Group 19) indicate the positive result of the spiritual path, while "He of the Repugnant Face" (Group 18) warns of the dangers of deviation. The house reveals how through **moral discipline and spiritual ascension** one can reach authentic spiritual religion, transforming trials into higher wisdom.\n\n## The ninth astrological house\n\nThis cavern corresponds to the **ninth house**: the house of philosophy, religion, law, higher studies, and long journeys. Angelini clearly identifies this domain as the realm of **metaphysical, religious, juridical, and mystical order**. Here both divine and earthly justice manifest - the tribunals that can take away freedom, but also the moral discipline that leads to spiritual liberation. It is the house where one accesses **higher knowledge** through direct experience of spiritual trials, transforming adversity into wisdom.';

	/// en: 'The Ninth Cavern, called **"She of mysterious forms, who cuts off the [vital] air"**, is organized into **twenty groups of deities**, the most complex among all caverns. ![Structure of the ninth division](nona_divisione.webp) ## Different representations across sources As with the Eighth Cavern, sources present two modes: - **In the Osireion at Abydos**: Each group shown with all deities - **In papyri**: Symbolic representation with one figure per group ## The Twenty Groups of Deities ### Group 1: "The gods who are in their shrines above the Watery Abyss" **Representation**: Mummified figure of Osiris with Upper Egyptian crown in shrine with serpents, number "14". **Meaning**: Fourteen deities who guarantee the deceased "may drink from the middle of the stream". ### Group 2: "The gods and goddesses who are in the following of Osiris" **Representation**: Standing goddess followed by god with scepter, number "24". **Meaning**: Twenty-four deities (12 gods and 12 goddesses) who enable the deceased to "repose with his mummy". ### Group 3: "The Standing One" **Representation**: Striding god with scepter, number "1". **Meaning**: One deity who guarantees the deceased "may adore Ra at his rising". ### Groups 4, 6-7: Taurine Deities **Group 4**: "Amun-Osiris" - Bull on standard with uraeus who grants "power in the Wide Hall of Geb". The **uraeus** is the sacred rearing cobra, symbol of sovereignty and divine protection, that adorned pharaohs' foreheads and represented the goddess Wadjet. **Group 6**: "He who nourishes Osiris" - Bull on standard carried by mummiform god, grants bread and beer to the deceased **Group 7**: "He who makes Osiris inaccessible" - Bull on standard that protects Osiris in the underworld, grants mastery of steps in the Holy Place ### Group 5: "The Mysterious One" **Representation**: Standing mummiform god. **Meaning**: Deity who guarantees the deceased "an enduring and healthy body". ### Groups 8-11: Protective Deities **Group 8**: "The Protector" - Mummiform god who does not allow evil to approach the deceased **Group 9**: "He who Tows Osiris" - Deity who guides Osiris through the afterlife, allows seeing Ra **Group 10**: "The Dark One" - Mummiform god who grants glory on earth and power in the West **Group 11**: "He-who-is-between-the-two-eyes" - Crocodile-headed god who brings the deceased before the sacred braziers ### Groups 12-14: Hidden-Armed Figures **Group 12**: "The assistants of Osiris" - Four mummified goddesses who accompany the deceased beside the Great God of the West **Group 13**: "Those with hidden arms" (masculine) - Four mummiform gods with arms concealed under garments, guarantee the deceased remains in the Necropolis forever **Group 14**: "Those with hidden arms" (feminine) - Four mummified goddesses with concealed arms, ensure prosperity and lasting offerings ### Groups 15-20: Specialized Deities **Group 15**: "He who hides the limbs" - God with scepter **Group 16**: "The Souls who come forth" - Four birds on trees **Group 17**: "Those of the sycamores" - Four mummified gods **Group 18**: "He of the Repugnant Face" - Mummiform god **Group 19**: "The Bright Ones" - Nine gods with solar disks **Group 20**: "Those who rest on their beds" - Nine reclining gods'
	String get ninthCavernLiteralMeaning => 'The Ninth Cavern, called **"She of mysterious forms, who cuts off the [vital] air"**, is organized into **twenty groups of deities**, the most complex among all caverns.\n\n![Structure of the ninth division](nona_divisione.webp)\n\n## Different representations across sources\n\nAs with the Eighth Cavern, sources present two modes:\n- **In the Osireion at Abydos**: Each group shown with all deities\n- **In papyri**: Symbolic representation with one figure per group\n\n## The Twenty Groups of Deities\n\n### Group 1: "The gods who are in their shrines above the Watery Abyss"\n**Representation**: Mummified figure of Osiris with Upper Egyptian crown in shrine with serpents, number "14".\n**Meaning**: Fourteen deities who guarantee the deceased "may drink from the middle of the stream".\n\n### Group 2: "The gods and goddesses who are in the following of Osiris"\n**Representation**: Standing goddess followed by god with scepter, number "24".\n**Meaning**: Twenty-four deities (12 gods and 12 goddesses) who enable the deceased to "repose with his mummy".\n\n### Group 3: "The Standing One"\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: One deity who guarantees the deceased "may adore Ra at his rising".\n\n### Groups 4, 6-7: Taurine Deities\n**Group 4**: "Amun-Osiris" - Bull on standard with uraeus who grants "power in the Wide Hall of Geb". The **uraeus** is the sacred rearing cobra, symbol of sovereignty and divine protection, that adorned pharaohs\' foreheads and represented the goddess Wadjet.\n**Group 6**: "He who nourishes Osiris" - Bull on standard carried by mummiform god, grants bread and beer to the deceased\n**Group 7**: "He who makes Osiris inaccessible" - Bull on standard that protects Osiris in the underworld, grants mastery of steps in the Holy Place\n\n### Group 5: "The Mysterious One"\n**Representation**: Standing mummiform god.\n**Meaning**: Deity who guarantees the deceased "an enduring and healthy body".\n\n### Groups 8-11: Protective Deities\n**Group 8**: "The Protector" - Mummiform god who does not allow evil to approach the deceased\n**Group 9**: "He who Tows Osiris" - Deity who guides Osiris through the afterlife, allows seeing Ra\n**Group 10**: "The Dark One" - Mummiform god who grants glory on earth and power in the West\n**Group 11**: "He-who-is-between-the-two-eyes" - Crocodile-headed god who brings the deceased before the sacred braziers\n\n### Groups 12-14: Hidden-Armed Figures\n**Group 12**: "The assistants of Osiris" - Four mummified goddesses who accompany the deceased beside the Great God of the West\n**Group 13**: "Those with hidden arms" (masculine) - Four mummiform gods with arms concealed under garments, guarantee the deceased remains in the Necropolis forever\n**Group 14**: "Those with hidden arms" (feminine) - Four mummified goddesses with concealed arms, ensure prosperity and lasting offerings\n\n### Groups 15-20: Specialized Deities\n**Group 15**: "He who hides the limbs" - God with scepter\n**Group 16**: "The Souls who come forth" - Four birds on trees\n**Group 17**: "Those of the sycamores" - Four mummified gods\n**Group 18**: "He of the Repugnant Face" - Mummiform god\n**Group 19**: "The Bright Ones" - Nine gods with solar disks\n**Group 20**: "Those who rest on their beds" - Nine reclining gods';

	/// en: 'Ninth cavern - The cavern of divine wisdom'
	String get ninthCavernTitle => 'Ninth cavern - The cavern of divine wisdom';

	/// en: '## The cavern of nourishment According to Angelini, the Second Cavern has nourishment and abundance as its central theme. Ra addresses the deities: "I illuminate you, oh afflicted ones, and make you satisfied with your sustenance". The **Nariu** are primeval gods of abundance and nourishment, represented with catfish heads. ## The second astrological house This cavern corresponds to the **second house**: the place where the individual finds the resources necessary for their physical survival. It is the house of earnings and income, which reveals the impulse to gather and accumulate everything needed to maintain and protect material existence.'
	String get secondCavernEsotericMeaning => '## The cavern of nourishment\n\nAccording to Angelini, the Second Cavern has nourishment and abundance as its central theme. Ra addresses the deities: "I illuminate you, oh afflicted ones, and make you satisfied with your sustenance". The **Nariu** are primeval gods of abundance and nourishment, represented with catfish heads.\n\n## The second astrological house\n\nThis cavern corresponds to the **second house**: the place where the individual finds the resources necessary for their physical survival. It is the house of earnings and income, which reveals the impulse to gather and accumulate everything needed to maintain and protect material existence.';

	/// en: 'Division Two consists of five registers (R) and 10 scenes (S), the contents of which are contained in the following chart: [TABLE_CAVERNA_2] ![Structure of the second division](seconda_divisione.webp) This division begins, like the first, with serpent doorkeepers whom Ra must convince to gain access to the Underworld. It contains various groups of ovals with solar and Osirian elements. ## The catfish-headed deities The **catfish-headed deities** (R1, S2) are called **Nariu** and are associated with the inscription: "O Nariu, lords of sustenance, who have become as Osiris...". ## The death of Osiris The death of Osiris is highlighted by the **deities who mourn him** (R2, S1) and by the deities who guard a **chest containing the body of Osiris** (R3, S2).'
	String get secondCavernLiteralMeaning => 'Division Two consists of five registers (R) and 10 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_2]\n\n![Structure of the second division](seconda_divisione.webp)\n\nThis division begins, like the first, with serpent doorkeepers whom Ra must convince to gain access to the Underworld. It contains various groups of ovals with solar and Osirian elements.\n\n## The catfish-headed deities\n\nThe **catfish-headed deities** (R1, S2) are called **Nariu** and are associated with the inscription: "O Nariu, lords of sustenance, who have become as Osiris...".\n\n## The death of Osiris\n\nThe death of Osiris is highlighted by the **deities who mourn him** (R2, S1) and by the deities who guard a **chest containing the body of Osiris** (R3, S2).';

	/// en: 'Second cavern - The cavern of sustenance'
	String get secondCavernTitle => 'Second cavern - The cavern of sustenance';

	/// en: 'Division Two'
	String get secondDivisionTitle => 'Division Two';

	/// en: '## The seventh astrological house This cavern corresponds to the **seventh house**: the house of partnerships, marriage, open enemies, and legal contracts. However, according to Angelini, **"Della settima casa nulla si può dire poichè non si hanno elementi di discusione"** ("Of the seventh house nothing can be said since there are no elements for discussion"). ## The passage from night to day The seventh cavern represents **the passage from the nocturnal to the diurnal part of domification**, namely that below the ascendant line and that above the ascendant line. The complete absence of this cavern from all sources - both the Osireion reliefs and the papyri - keeps hidden the esoteric meaning of this transitional house.'
	String get seventhCavernEsotericMeaning => '## The seventh astrological house\n\nThis cavern corresponds to the **seventh house**: the house of partnerships, marriage, open enemies, and legal contracts. However, according to Angelini, **"Della settima casa nulla si può dire poichè non si hanno elementi di discusione"** ("Of the seventh house nothing can be said since there are no elements for discussion").\n\n## The passage from night to day\n\nThe seventh cavern represents **the passage from the nocturnal to the diurnal part of domification**, namely that below the ascendant line and that above the ascendant line. The complete absence of this cavern from all sources - both the Osireion reliefs and the papyri - keeps hidden the esoteric meaning of this transitional house.';

	/// en: 'Following Angelo Angelini's interpretation, the **first six caverns** correspond to the six sections of the Book of the Twelve Caverns in the Osireion at Abydos, while the **other caverns are represented only in papyri**. According to this interpretation, the Seventh Cavern has **no attestation** in either source: it is absent from the Osireion reliefs and **"Manca nei Papiri"** ("Missing in the Papyri") as Angelini explicitly states.'
	String get seventhCavernLiteralMeaning => 'Following Angelo Angelini\'s interpretation, the **first six caverns** correspond to the six sections of the Book of the Twelve Caverns in the Osireion at Abydos, while the **other caverns are represented only in papyri**.\n\nAccording to this interpretation, the Seventh Cavern has **no attestation** in either source: it is absent from the Osireion reliefs and **"Manca nei Papiri"** ("Missing in the Papyri") as Angelini explicitly states.';

	/// en: 'Seventh cavern - The cavern of the sacred union'
	String get seventhCavernTitle => 'Seventh cavern - The cavern of the sacred union';

	/// en: '## The sixth astrological house This cavern corresponds to the **sixth house**: the house of work, health and service, which **ends the dark zone of domification**. It is the house of **defeating chaos**, symbolized by the decapitated heads (R3, S1) representing the forces of disorder definitively vanquished. The Sixth House represents the **fulcrum of spiritual transformation through sacrifice**. It is the place where, through discipline, service and acceptance of difficulties, the individual defeats inner chaos and can access higher planes of awareness. Just as Ra is reborn every morning after defeating the forces of nightly chaos, so sacrifice becomes an instrument of regeneration, transforming suffering into spiritual growth.'
	String get sixthCavernEsotericMeaning => '## The sixth astrological house\n\nThis cavern corresponds to the **sixth house**: the house of work, health and service, which **ends the dark zone of domification**. It is the house of **defeating chaos**, symbolized by the decapitated heads (R3, S1) representing the forces of disorder definitively vanquished.\n\nThe Sixth House represents the **fulcrum of spiritual transformation through sacrifice**. It is the place where, through discipline, service and acceptance of difficulties, the individual defeats inner chaos and can access higher planes of awareness. Just as Ra is reborn every morning after defeating the forces of nightly chaos, so sacrifice becomes an instrument of regeneration, transforming suffering into spiritual growth.';

	/// en: 'Division Six represents **the completion of the rebirth process** begun in the fifth division. It is structured in three registers with thirteen scenes: [TABLE_CAVERNA_6] ![Structure of the sixth division](sesta_divisione.webp) The central theme is the **imminent birth of the sun god Ra**. This is symbolized by the figure of the **scarab beetle emerging from between two mounds** (R2, S1), an image representing the sun god about to be born after completing his nightly journey through the Underworld. The division also contains other figures connected to rebirth: the image of **Tatenen** (R2, S3), funerary deity representing the land that emerged from primordial Chaos, creator of primordial energy, **rams** (R1, S2) and **ram heads** (R1, S3 and R2, S3), all symbols associated with the sun god and the regenerative process. The lower register maintains the customary representation of **decapitated enemies** (R3, S1), symbolizing the defeat of the forces of chaos that oppose solar rebirth.'
	String get sixthCavernLiteralMeaning => 'Division Six represents **the completion of the rebirth process** begun in the fifth division. It is structured in three registers with thirteen scenes:\n\n[TABLE_CAVERNA_6]\n\n![Structure of the sixth division](sesta_divisione.webp)\n\nThe central theme is the **imminent birth of the sun god Ra**. This is symbolized by the figure of the **scarab beetle emerging from between two mounds** (R2, S1), an image representing the sun god about to be born after completing his nightly journey through the Underworld.\n\nThe division also contains other figures connected to rebirth: the image of **Tatenen** (R2, S3), funerary deity representing the land that emerged from primordial Chaos, creator of primordial energy, **rams** (R1, S2) and **ram heads** (R1, S3 and R2, S3), all symbols associated with the sun god and the regenerative process.\n\nThe lower register maintains the customary representation of **decapitated enemies** (R3, S1), symbolizing the defeat of the forces of chaos that oppose solar rebirth.';

	/// en: 'Sixth cavern - The cavern of service'
	String get sixthCavernTitle => 'Sixth cavern - The cavern of service';

	/// en: '3 coiled serpents'
	String get table1R1S1 => '3 coiled serpents';

	/// en: '9 cobras'
	String get table1R1S2 => '9 cobras';

	/// en: '9 bull-headed deities'
	String get table1R1S3 => '9 bull-headed deities';

	/// en: '9 male deities in ovals'
	String get table1R2S1 => '9 male deities in ovals';

	/// en: '9 jackal-headed deities'
	String get table1R2S2 => '9 jackal-headed deities';

	/// en: 'Male and female deity holding a disc above their heads'
	String get table1R2S3 => 'Male and female deity holding a disc above their heads';

	/// en: '11 deities'
	String get table1R3S1 => '11 deities';

	/// en: 'Osiris in a sanctuary with 8 male and female deities in ovals surrounding him'
	String get table1R3S2 => 'Osiris in a sanctuary with 8 male and female deities in ovals surrounding him';

	/// en: '9 female deities standing on baskets'
	String get table1R4S1 => '9 female deities standing on baskets';

	/// en: '8 female deities in ovals'
	String get table1R4S2 => '8 female deities in ovals';

	/// en: '2 male deities on sides of a mound; 2 female deities on sides of a mound; Mongoose-headed deity'
	String get table1R4S3 => '2 male deities on sides of a mound; 2 female deities on sides of a mound; Mongoose-headed deity';

	/// en: '3 coiled serpents'
	String get table1R5S1 => '3 coiled serpents';

	/// en: '16 male enemies (8 decapitated)'
	String get table1R5S2 => '16 male enemies (8 decapitated)';

	/// en: 'Serpent raised on its tail + 4 coiled serpents'
	String get table2R1S1 => 'Serpent raised on its tail + 4 coiled serpents';

	/// en: '4 catfish-headed deities and 8 shrewmouse-headed deities in ovals + two hawk-headed deities'
	String get table2R1S2 => '4 catfish-headed deities and 8 shrewmouse-headed deities in ovals + two hawk-headed deities';

	/// en: '7 female deities in ovals + male deity'
	String get table2R1S3 => '7 female deities in ovals + male deity';

	/// en: 'Shrewmouse-headed deity + 9 male mourners'
	String get table2R2S1 => 'Shrewmouse-headed deity + 9 male mourners';

	/// en: '12 mummified male deities in ovals + ram-headed deity'
	String get table2R2S2 => '12 mummified male deities in ovals + ram-headed deity';

	/// en: 'Ram-headed deity + 9 male deities'
	String get table2R3S1 => 'Ram-headed deity + 9 male deities';

	/// en: '4 males around the chest of Osiris + 4 ram-headed standards + 4 jackal-headed standards'
	String get table2R3S2 => '4 males around the chest of Osiris + 4 ram-headed standards + 4 jackal-headed standards';

	/// en: 'Hawk-headed deity + 12 Osiride figures in ovals + male deity'
	String get table2R4S1 => 'Hawk-headed deity + 12 Osiride figures in ovals + male deity';

	/// en: 'Ram-headed deity + 9 ram-headed deities in ovals + 1 ram-headed deity'
	String get table2R4S2 => 'Ram-headed deity + 9 ram-headed deities in ovals + 1 ram-headed deity';

	/// en: '4 male deities with bullhorns holding knives + 16 male enemies (4 are decapitated; 4 are laying face down; last 8 are upside down)'
	String get table2R5S1 => '4 male deities with bullhorns holding knives + 16 male enemies (4 are decapitated; 4 are laying face down; last 8 are upside down)';

	/// en: 'Sun disk + 2 coiled serpents + 1 male deity in an oval'
	String get table3R1S1 => 'Sun disk + 2 coiled serpents + 1 male deity in an oval';

	/// en: '7 catfish-headed deities standing under a serpent'
	String get table3R1S2 => '7 catfish-headed deities standing under a serpent';

	/// en: '2 mummified ram-headed deities in mounds'
	String get table3R1S3 => '2 mummified ram-headed deities in mounds';

	/// en: '3 male and female deities in ovals'
	String get table3R1S4 => '3 male and female deities in ovals';

	/// en: 'Osiris in a shrine + 10 male and female deities in ovals'
	String get table3R1S5 => 'Osiris in a shrine + 10 male and female deities in ovals';

	/// en: 'Ram-headed deity'
	String get table3R2S1 => 'Ram-headed deity';

	/// en: '4 Osiride figures'
	String get table3R2S2 => '4 Osiride figures';

	/// en: 'Double sphinx Aker + reposing ithyphallic Osiris encircled by a serpent'
	String get table3R2S3 => 'Double sphinx Aker + reposing ithyphallic Osiris encircled by a serpent';

	/// en: '3 ovals encircled by an ouroboros serpent + 4 male deities'
	String get table3R2S4 => '3 ovals encircled by an ouroboros serpent + 4 male deities';

	/// en: 'Mongoose-headed deity standing on a serpent + 2 male deities'
	String get table3R2S5 => 'Mongoose-headed deity standing on a serpent + 2 male deities';

	/// en: '4 upside down male figures + 4 upside down female figures + 1 male figure'
	String get table3R3S1 => '4 upside down male figures + 4 upside down female figures + 1 male figure';

	/// en: '8 upside down male enemies (4 decapitated)'
	String get table3R3S2 => '8 upside down male enemies (4 decapitated)';

	/// en: '4 upside down female enemies + 4 upside down ba birds'
	String get table3R3S3 => '4 upside down female enemies + 4 upside down ba birds';

	/// en: 'Human Osiris bent in crescent shape lifted by Isis and Nephthys'
	String get table4R1S1 => 'Human Osiris bent in crescent shape lifted by Isis and Nephthys';

	/// en: 'Anubis + human Osiris + Horus'
	String get table4R1S2 => 'Anubis + human Osiris + Horus';

	/// en: 'Male deity with bull horns + 2 ovals'
	String get table4R1S3 => 'Male deity with bull horns + 2 ovals';

	/// en: 'Ram-headed deity + 3 human Osiris figures'
	String get table4R2S1 => 'Ram-headed deity + 3 human Osiris figures';

	/// en: 'Horus + coiled serpent separating 2 ovals, each containing a mummiform figure'
	String get table4R2S2 => 'Horus + coiled serpent separating 2 ovals, each containing a mummiform figure';

	/// en: 'Anubis + human Osiris + ba bird'
	String get table4R2S3 => 'Anubis + human Osiris + ba bird';

	/// en: '4 upside down male enemies + cat-headed deity'
	String get table4R3S1 => '4 upside down male enemies + cat-headed deity';

	/// en: 'Lion-headed female deity + 1 female deity + 1 reposing male deity'
	String get table4R3S2 => 'Lion-headed female deity + 1 female deity + 1 reposing male deity';

	/// en: '4 upside down male enemies + male figure'
	String get table4R3S3 => '4 upside down male enemies + male figure';

	/// en: 'Fifth Division'
	String get table5Division => 'Fifth Division';

	/// en: 'Human Osiris + 4 standing serpents with human heads'
	String get table5R1S1P1 => 'Human Osiris + 4 standing serpents with human heads';

	/// en: 'Oval flanked by a male deity and a ram-headed deity'
	String get table5R1S1P2 => 'Oval flanked by a male deity and a ram-headed deity';

	/// en: 'Tatenen flanked by 2 male deities'
	String get table5R1S2P1 => 'Tatenen flanked by 2 male deities';

	/// en: 'Male deity + 2 ovals'
	String get table5R1S3P1 => 'Male deity + 2 ovals';

	/// en: '4 hawk-headed mummies + Anubis + oval'
	String get table5R2S1P1 => '4 hawk-headed mummies + Anubis + oval';

	/// en: 'Ram-headed deity + female deity'
	String get table5R2S1P2 => 'Ram-headed deity + female deity';

	/// en: '4 female deities each in an oval'
	String get table5R2S2P1 => '4 female deities each in an oval';

	/// en: 'Human Osiris with Horus with a ram head between them'
	String get table5R2S2P2 => 'Human Osiris with Horus with a ram head between them';

	/// en: 'Female deity holding a pole in each hand, with 2 kneeling male enemies in front of them'
	String get table5R3S1P1 => 'Female deity holding a pole in each hand, with 2 kneeling male enemies in front of them';

	/// en: '2 kneeling female deities on either side of a cauldron containing 4 upside down ba birds + 4 fans'
	String get table5R3S1P2 => '2 kneeling female deities on either side of a cauldron containing 4 upside down ba birds + 4 fans';

	/// en: 'Serpent headed (?) figure kneeling in front of a cauldron containing 4 heads and 4 hearts'
	String get table5R3S2P1 => 'Serpent headed (?) figure kneeling in front of a cauldron containing 4 heads and 4 hearts';

	/// en: '2 cobras on either side of a cauldron containing 4 upside down decapitated male enemies'
	String get table5R3S3P1 => '2 cobras on either side of a cauldron containing 4 upside down decapitated male enemies';

	/// en: 'Sixth Division'
	String get table6Division => 'Sixth Division';

	/// en: 'Anubis standing between two ovals, each containing a mummified deity + a ba bird on top of each oval'
	String get table6R1S1 => 'Anubis standing between two ovals, each containing a mummified deity + a ba bird on top of each oval';

	/// en: 'Anubis + three ovals'
	String get table6R1S2 => 'Anubis + three ovals';

	/// en: '2 female deities flanking 2 ovals'
	String get table6R1S3 => '2 female deities flanking 2 ovals';

	/// en: 'Osiris-Orion standing on top of a mound containing a decapitated enemy + male deity + hawk sitting on top of a mound'
	String get table6R1S4 => 'Osiris-Orion standing on top of a mound containing a decapitated enemy + male deity + hawk sitting on top of a mound';

	/// en: 'Scarab emerging between 2 mounds + 4 male deities'
	String get table6R2S1 => 'Scarab emerging between 2 mounds + 4 male deities';

	/// en: 'Scarab surrounded by a serpent + 2 male deities in ovals'
	String get table6R2S2 => 'Scarab surrounded by a serpent + 2 male deities in ovals';

	/// en: 'Mound with coiled serpent and ram head emerging + Tatenen in a mound emerging from the ground + 2 male deities'
	String get table6R2S3 => 'Mound with coiled serpent and ram head emerging + Tatenen in a mound emerging from the ground + 2 male deities';

	/// en: '2 deities in ovals'
	String get table6R2S4 => '2 deities in ovals';

	/// en: '4 decapitated enemies in ovals'
	String get table6R2S5 => '4 decapitated enemies in ovals';

	/// en: '4 decapitated enemies + male and female deities with knives + female deity'
	String get table6R3S1 => '4 decapitated enemies + male and female deities with knives + female deity';

	/// en: '2 Anubis-headed female deities + 4 female enemies'
	String get table6R3S2 => '2 Anubis-headed female deities + 4 female enemies';

	/// en: 'Male and female deities + 4 kneeling male enemies'
	String get table6R3S3 => 'Male and female deities + 4 kneeling male enemies';

	/// en: 'Osiris emerging from between a serpent + 2 upside down male figures with their heads in the ground'
	String get table6R3S4 => 'Osiris emerging from between a serpent + 2 upside down male figures with their heads in the ground';

	/// en: 'Tap to explore this cavern'
	String get tapToExploreCavern => 'Tap to explore this cavern';

	/// en: '## The cavern of worldly achievement and divine recognition According to Angelini, the Tenth Cavern is **associated with solar illumination** and demonstrates how **elevation and popularity are achievable through sacrifice**, revealing that social position results from sustained effort and divine favor. ## The sacred clamor and inviolable mysteries The name "the Clamorous One whose mysteries are sacred" reveals this house's paradoxical nature: **public success** (the clamor) must coexist with **protection of inner mysteries** (the sacred). "Those who belong to the light" (Group 1) represent the illumination that comes from achieving social position and guarantee one "may see Ra at his rising". ## The vigilant divine council "The Ennead who guard those who are in the earth" (Group 3) represents the **cosmic oversight** that governs worldly success. These nine guardians lying on ritual beds show how earthly power requires constant vigilance and divine protection. Their gift of "the breath of life" indicates that true authority derives from alignment with cosmic vital forces. ## The paradox of hidden power "The Ennead of those whose arm is hidden" (Group 4) reveals a profound teaching: **true power is often exercised invisibly**. The concealed arms symbolize influence operating behind the scenes, subtle diplomacy, and the wisdom of not displaying all one's capabilities. This group guarantees being "glorious as the accomplished spirits," indicating that true glory derives from inner mastery, not ostentation. ## Transformation through sacrifice "The souls of the gods who came into being from the limbs of Osiris" (Group 6) - thirty-one deities emanated from the dismembered body of the god - teach that **lasting success requires sacrifice and transformation**. As Osiris was dismembered and reassembled, so those who aspire to power must be willing to sacrifice parts of themselves to be reborn in a higher form. The number 31 (or 21) suggests the days of the lunar month, indicating cycles of rise and fall in power. ## Refreshment in the place of heat "Those with repulsive faces" (Group 8) who paradoxically grant "refreshment in the place of heat" reveal a profound truth: the **most difficult challenges** (the repulsive faces) in achieving and maintaining power can bring the greatest relief and satisfaction. The "place of heat" represents the pressure and stress of elevated positions, while "refreshment" is the inner peace that comes from overcoming such trials. ## The tenth astrological house This cavern corresponds to the **tenth house**: the house of career, reputation, public status, and social achievement. It represents the **culmination of earthly ambitions** when aligned with divine will. The groups of deities show that true success requires: illumination (Group 1), ability to "seize" opportunities (Group 2), divine protection (Group 3), hidden wisdom (Group 4), personal mystery (Group 5), transformative sacrifice (Group 6), devotion (Group 7), and the ability to transform adversities into blessings (Group 8).'
	String get tenthCavernEsotericMeaning => '## The cavern of worldly achievement and divine recognition\n\nAccording to Angelini, the Tenth Cavern is **associated with solar illumination** and demonstrates how **elevation and popularity are achievable through sacrifice**, revealing that social position results from sustained effort and divine favor.\n\n## The sacred clamor and inviolable mysteries\n\nThe name "the Clamorous One whose mysteries are sacred" reveals this house\'s paradoxical nature: **public success** (the clamor) must coexist with **protection of inner mysteries** (the sacred). "Those who belong to the light" (Group 1) represent the illumination that comes from achieving social position and guarantee one "may see Ra at his rising".\n\n## The vigilant divine council\n\n"The Ennead who guard those who are in the earth" (Group 3) represents the **cosmic oversight** that governs worldly success. These nine guardians lying on ritual beds show how earthly power requires constant vigilance and divine protection. Their gift of "the breath of life" indicates that true authority derives from alignment with cosmic vital forces.\n\n## The paradox of hidden power\n\n"The Ennead of those whose arm is hidden" (Group 4) reveals a profound teaching: **true power is often exercised invisibly**. The concealed arms symbolize influence operating behind the scenes, subtle diplomacy, and the wisdom of not displaying all one\'s capabilities. This group guarantees being "glorious as the accomplished spirits," indicating that true glory derives from inner mastery, not ostentation.\n\n## Transformation through sacrifice\n\n"The souls of the gods who came into being from the limbs of Osiris" (Group 6) - thirty-one deities emanated from the dismembered body of the god - teach that **lasting success requires sacrifice and transformation**. As Osiris was dismembered and reassembled, so those who aspire to power must be willing to sacrifice parts of themselves to be reborn in a higher form. The number 31 (or 21) suggests the days of the lunar month, indicating cycles of rise and fall in power.\n\n## Refreshment in the place of heat\n\n"Those with repulsive faces" (Group 8) who paradoxically grant "refreshment in the place of heat" reveal a profound truth: the **most difficult challenges** (the repulsive faces) in achieving and maintaining power can bring the greatest relief and satisfaction. The "place of heat" represents the pressure and stress of elevated positions, while "refreshment" is the inner peace that comes from overcoming such trials.\n\n## The tenth astrological house\n\nThis cavern corresponds to the **tenth house**: the house of career, reputation, public status, and social achievement. It represents the **culmination of earthly ambitions** when aligned with divine will. The groups of deities show that true success requires: illumination (Group 1), ability to "seize" opportunities (Group 2), divine protection (Group 3), hidden wisdom (Group 4), personal mystery (Group 5), transformative sacrifice (Group 6), devotion (Group 7), and the ability to transform adversities into blessings (Group 8).';

	/// en: 'The Tenth Cavern, called **"the Clamorous One whose mysteries are sacred"**, contains **eight groups of deities** embodying themes of divine illumination and sacred protection. ![Structure of the tenth division](decima_divisione.webp) ## The cavern's name The name "the Clamorous One" refers to the ritual sounds and sacred invocations that resonate in this domain, while "whose mysteries are sacred" emphasizes the inviolable nature of the divine secrets guarded here. ## Differences between ancient sources As with other caverns in the Book of the Twelve Caverns, two modes of representation exist: **In the Osireion at Abydos** (Seti I's underground temple): Each group is represented with all its deities - for example, the first group shows eight striding gods arranged in two registers, the second group shows eight goddesses pouring water, and so forth. **In funerary papyri** (such as British Museum 10.478): For space economy, each group is represented by **a single symbolic figure** accompanied by a number indicating how many deities it represents. Thus a single goddess pouring water with the number "8" represents the entire group of eight goddesses. ## The Eight Groups of Deities ### Group 1: "Those who belong to the light" **Representation**: Eight striding gods arranged in two registers (in the Osireion). **Meaning**: Eight solar deities who guarantee the deceased "may see Ra at his rising" and participate in divine luminosity. ### Group 2: "Those who seize" **Representation**: Eight goddesses pouring water from vessels topped with Anubis heads (in the Osireion). **Meaning**: Eight female deities who "seize" souls, guaranteeing the deceased "may be in jubilation". ### Group 3: "The Ennead who guard those who are in the earth" **Representation**: Nine mummified gods lying on ritual beds. **Meaning**: Nine guardians who watch over the dead, granting "the breath of life on earth and in the Necropolis". ### Group 4: "The Ennead of those whose arm is hidden" **Representation**: Nine standing mummiform gods (in the Osireion, eight gods spitting water). **Meaning**: Nine deities with concealed arms who guarantee the deceased "may be glorious as the accomplished spirits". ### Group 5: "The Mysterious One" **Representation**: A standing goddess, sometimes with the Eye of Horus (Wedjat). **Meaning**: A female deity who causes "the soul to endure and the body to prosper like those of the gods in the netherworld". ### Group 6: "The souls of the gods who came into being from the limbs of Osiris" **Representation**: Thirty-one (or twenty-one in papyri) recumbent deities, organized in groups. **Meaning**: Divine souls emanated from Osiris's body, who grant "peace" to the deceased. ### Group 7: "The Adorers" **Representation**: Four striding gods. **Meaning**: Four adorers of Ra who ensure "there is no opposition to the deceased at any gate of the netherworld". ### Group 8: "Those with repulsive faces" **Representation**: Four striding gods (sometimes represented as a goddess). **Meaning**: Four terrifying-looking deities who paradoxically grant "refreshment in the place of heat".'
	String get tenthCavernLiteralMeaning => 'The Tenth Cavern, called **"the Clamorous One whose mysteries are sacred"**, contains **eight groups of deities** embodying themes of divine illumination and sacred protection.\n\n![Structure of the tenth division](decima_divisione.webp)\n\n## The cavern\'s name\n\nThe name "the Clamorous One" refers to the ritual sounds and sacred invocations that resonate in this domain, while "whose mysteries are sacred" emphasizes the inviolable nature of the divine secrets guarded here.\n\n## Differences between ancient sources\n\nAs with other caverns in the Book of the Twelve Caverns, two modes of representation exist:\n\n**In the Osireion at Abydos** (Seti I\'s underground temple): Each group is represented with all its deities - for example, the first group shows eight striding gods arranged in two registers, the second group shows eight goddesses pouring water, and so forth.\n\n**In funerary papyri** (such as British Museum 10.478): For space economy, each group is represented by **a single symbolic figure** accompanied by a number indicating how many deities it represents. Thus a single goddess pouring water with the number "8" represents the entire group of eight goddesses.\n\n## The Eight Groups of Deities\n\n### Group 1: "Those who belong to the light"\n**Representation**: Eight striding gods arranged in two registers (in the Osireion).\n**Meaning**: Eight solar deities who guarantee the deceased "may see Ra at his rising" and participate in divine luminosity.\n\n### Group 2: "Those who seize"\n**Representation**: Eight goddesses pouring water from vessels topped with Anubis heads (in the Osireion).\n**Meaning**: Eight female deities who "seize" souls, guaranteeing the deceased "may be in jubilation".\n\n### Group 3: "The Ennead who guard those who are in the earth"\n**Representation**: Nine mummified gods lying on ritual beds.\n**Meaning**: Nine guardians who watch over the dead, granting "the breath of life on earth and in the Necropolis".\n\n### Group 4: "The Ennead of those whose arm is hidden"\n**Representation**: Nine standing mummiform gods (in the Osireion, eight gods spitting water).\n**Meaning**: Nine deities with concealed arms who guarantee the deceased "may be glorious as the accomplished spirits".\n\n### Group 5: "The Mysterious One"\n**Representation**: A standing goddess, sometimes with the Eye of Horus (Wedjat).\n**Meaning**: A female deity who causes "the soul to endure and the body to prosper like those of the gods in the netherworld".\n\n### Group 6: "The souls of the gods who came into being from the limbs of Osiris"\n**Representation**: Thirty-one (or twenty-one in papyri) recumbent deities, organized in groups.\n**Meaning**: Divine souls emanated from Osiris\'s body, who grant "peace" to the deceased.\n\n### Group 7: "The Adorers"\n**Representation**: Four striding gods.\n**Meaning**: Four adorers of Ra who ensure "there is no opposition to the deceased at any gate of the netherworld".\n\n### Group 8: "Those with repulsive faces"\n**Representation**: Four striding gods (sometimes represented as a goddess).\n**Meaning**: Four terrifying-looking deities who paradoxically grant "refreshment in the place of heat".';

	/// en: 'Tenth cavern - The cavern of sacred clamor'
	String get tenthCavernTitle => 'Tenth cavern - The cavern of sacred clamor';

	/// en: '## The cavern of spiritual qualities According to Angelini, the Third Cavern is characterized by the presence of **Neheb-Kau**, the great primeval serpent god. His name means "He who unites the Ka" and is also conceptually translated as "Bestower of dignities", that is, he who assigns positions and honors in the afterlife. The **Ka** in Egyptian conception is the life force, the spiritual double that distinguishes the living from the dead and must be nourished and preserved to ensure continuity in the afterlife. ## The unifier of attributes Neheb-Kau is called in ancient texts "unifier of attributes", that is, he who reunites and coordinates the different spiritual qualities and characteristics necessary for complete existence in the afterlife. He is considered the "Ka of every god" and his function was to endow gods and humans with life. ## The third astrological house This cavern corresponds to the **third house**: the place of gathering elements for the formation of the Spirit. It is the house of instruction, of ideas that form the new personality and of relationships with others. According to Angelini, it represents the centripetal movement directed toward acquiring qualities that nourish the Spirit.'
	String get thirdCavernEsotericMeaning => '## The cavern of spiritual qualities\n\nAccording to Angelini, the Third Cavern is characterized by the presence of **Neheb-Kau**, the great primeval serpent god. His name means "He who unites the Ka" and is also conceptually translated as "Bestower of dignities", that is, he who assigns positions and honors in the afterlife. The **Ka** in Egyptian conception is the life force, the spiritual double that distinguishes the living from the dead and must be nourished and preserved to ensure continuity in the afterlife.\n\n## The unifier of attributes\n\nNeheb-Kau is called in ancient texts "unifier of attributes", that is, he who reunites and coordinates the different spiritual qualities and characteristics necessary for complete existence in the afterlife. He is considered the "Ka of every god" and his function was to endow gods and humans with life.\n\n## The third astrological house\n\nThis cavern corresponds to the **third house**: the place of gathering elements for the formation of the Spirit. It is the house of instruction, of ideas that form the new personality and of relationships with others. According to Angelini, it represents the centripetal movement directed toward acquiring qualities that nourish the Spirit.';

	/// en: 'Division Three consists of 3 registers (R) and 13 scenes (S), the contents of which are contained in the following chart: [TABLE_CAVERNA_3] ![Structure of the third division](terza_divisione.webp) In this division Ra physically enters the Underworld after gaining access from the doorkeepers. This division is the starting point for the **Solar-Osirian unity**, a process necessary for the sun god Ra to be reborn in the morning. The unity is represented in the central scene (R2, S3) where the reposing ithyphallic Osiris appears with a sun disk above his erect phallus. ## The catfish-headed deities In the first register (R1, S2) appear **7 catfish-headed deities** standing under a serpent. These are associated with the text addressing the "gods who are in the sheepfold of Neheb-Kau". ## The double sphinx Aker The central scene shows the **double sphinx Aker** with ithyphallic Osiris encircled by a serpent, representing the moment when the unity between Ra and Osiris begins. Aker is the ancient Egyptian earth deity and guardian of the Underworld, depicted as a double sphinx that protects the sun god during his nightly journey through the afterlife.'
	String get thirdCavernLiteralMeaning => 'Division Three consists of 3 registers (R) and 13 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_3]\n\n![Structure of the third division](terza_divisione.webp)\n\nIn this division Ra physically enters the Underworld after gaining access from the doorkeepers. This division is the starting point for the **Solar-Osirian unity**, a process necessary for the sun god Ra to be reborn in the morning. The unity is represented in the central scene (R2, S3) where the reposing ithyphallic Osiris appears with a sun disk above his erect phallus.\n\n## The catfish-headed deities\n\nIn the first register (R1, S2) appear **7 catfish-headed deities** standing under a serpent. These are associated with the text addressing the "gods who are in the sheepfold of Neheb-Kau".\n\n## The double sphinx Aker\n\nThe central scene shows the **double sphinx Aker** with ithyphallic Osiris encircled by a serpent, representing the moment when the unity between Ra and Osiris begins. Aker is the ancient Egyptian earth deity and guardian of the Underworld, depicted as a double sphinx that protects the sun god during his nightly journey through the afterlife.';

	/// en: 'Third cavern - The cavern of formative relationships'
	String get thirdCavernTitle => 'Third cavern - The cavern of formative relationships';

	/// en: '## The cavern of the ultimate shore where domification ends According to Angelini, **"With the XII Cavern one reaches the end of domification, one reaches the shore beyond which the sea exists"**. This dwelling represents **"the end of domification, the closure of this subliminal circuit"**, poetically compared to **"a shore where one must stop"**. ## The great journeys beyond the shore Angelini specifies that **"The Twelfth House with the first vignettes indicates the end of domification, but also great journeys, sojourns beyond the shore"** - journeys that are not limited to the ninth house but extend beyond the boundaries of earthly experience. The **Shore Deities** ("He who controls the shore," "The Chief of the shore," "The gods who are on the shore") govern this ultimate boundary where the individual meets the infinite. ## The Mysterious Head on the shore: spirituality and suffering The **"Mysterious Head on the shore"** (Group 7) - **"a ram's head placed on a pole"** - reveals according to Angelini **"the spirituality of this house, but also, and above all, its negative part, woven with suffering, ineluctable bonds, constraints"**. ## The constraining coils and the paradox of liberation The distinctive trait of the twelfth house is its **"constraining, immobilizing function, with the many coils of the serpent that trap the god"**. The **"Gods who are in the following of the Enveloper"** and **"The gods who are in the coils"** (Groups 3 and 8) show divine figures **"wrapped in serpent coils"**, representing those who are **"immobilized by external and internal circumstances"**. However, as Angelini observes in the general context of the Book of Caverns, apparent constraints can become means of spiritual liberation. The coils that immobilize are also those that protect, following the model of Mehen, the great serpent that wraps Osiris to guard him in his journey of regeneration. ## The twelfth astrological house This cavern corresponds to the **twelfth house**: the domain of hidden realities, spiritual sacrifice, and ultimate transcendence. It is the place where **"the Neter Kether ends"** (the hidden world) and where earthly domification gives way to the infinite sea of transcendent existence, reached paradoxically through acceptance of final constraints.'
	String get twelfthCavernEsotericMeaning => '## The cavern of the ultimate shore where domification ends\n\nAccording to Angelini, **"With the XII Cavern one reaches the end of domification, one reaches the shore beyond which the sea exists"**. This dwelling represents **"the end of domification, the closure of this subliminal circuit"**, poetically compared to **"a shore where one must stop"**.\n\n## The great journeys beyond the shore\n\nAngelini specifies that **"The Twelfth House with the first vignettes indicates the end of domification, but also great journeys, sojourns beyond the shore"** - journeys that are not limited to the ninth house but extend beyond the boundaries of earthly experience. The **Shore Deities** ("He who controls the shore," "The Chief of the shore," "The gods who are on the shore") govern this ultimate boundary where the individual meets the infinite.\n\n## The Mysterious Head on the shore: spirituality and suffering\n\nThe **"Mysterious Head on the shore"** (Group 7) - **"a ram\'s head placed on a pole"** - reveals according to Angelini **"the spirituality of this house, but also, and above all, its negative part, woven with suffering, ineluctable bonds, constraints"**.\n\n## The constraining coils and the paradox of liberation\n\nThe distinctive trait of the twelfth house is its **"constraining, immobilizing function, with the many coils of the serpent that trap the god"**. The **"Gods who are in the following of the Enveloper"** and **"The gods who are in the coils"** (Groups 3 and 8) show divine figures **"wrapped in serpent coils"**, representing those who are **"immobilized by external and internal circumstances"**.\n\nHowever, as Angelini observes in the general context of the Book of Caverns, apparent constraints can become means of spiritual liberation. The coils that immobilize are also those that protect, following the model of Mehen, the great serpent that wraps Osiris to guard him in his journey of regeneration.\n\n## The twelfth astrological house\n\nThis cavern corresponds to the **twelfth house**: the domain of hidden realities, spiritual sacrifice, and ultimate transcendence. It is the place where **"the Neter Kether ends"** (the hidden world) and where earthly domification gives way to the infinite sea of transcendent existence, reached paradoxically through acceptance of final constraints.';

	/// en: 'The Twelfth Cavern, called **"She who unites the gods and embraces their manifestations"**, contains **nine groups of deities** organized around the theme of the sacred shore as the final boundary of the netherworld. ![Structure of the twelfth division](dodicesima_divisione.webp) ## The Nine Groups of Deities ### Groups 1-2, 4-6: The Shore Deities **Group 1: "He who controls the shore"** - A striding deity with scepter who guarantees the deceased "may be Lord of the Island of the Just." **Group 2: "The gods who are on the shore of the netherworld"** - Thirteen deities (in the Osireion) symbolically represented by one figure in papyri, who grant "truth in the Wide Hall of the Two Truths." **Group 4: "The gods who belong to the shore"** - Four mummified deities who "give an island in the Fields of Iaru." **Group 5: "The Chief of the shore"** - A deity with scepter who grants "an endowment in the Field of Offerings." **Group 6: "The gods who are on the shore"** - Eight deities (four in papyri) who guarantee "offerings, food, and a great quantity of meat in the Necropolis." ### Group 7: The Mysterious Heads **"The Mysterious Heads on the shore"** - Eleven ram's heads mounted on staffs (in the Osireion), symbolically represented by a single head in papyri. They grant "their protection as it is done for Tired-Heart." ### Groups 3 and 8: The Figures in Coils **Group 3: "The gods who are in the following of the Enveloper"** - Fourteen recumbent deities wrapped in serpent coils (in the Osireion), who guarantee the deceased "may be in any place in which his Ka desires him to be." **Group 8: "The gods who are in the coils"** - Fourteen deities similarly wrapped, who grant "the sight of the Solar Disk." ### Group 9: The Bowing Ones **Group 9: "iwwtyw"** (cryptic name) - Four bowing deities who guarantee "rest in the beautiful West."'
	String get twelfthCavernLiteralMeaning => 'The Twelfth Cavern, called **"She who unites the gods and embraces their manifestations"**, contains **nine groups of deities** organized around the theme of the sacred shore as the final boundary of the netherworld.\n\n![Structure of the twelfth division](dodicesima_divisione.webp)\n\n## The Nine Groups of Deities\n\n### Groups 1-2, 4-6: The Shore Deities\n\n**Group 1: "He who controls the shore"** - A striding deity with scepter who guarantees the deceased "may be Lord of the Island of the Just."\n\n**Group 2: "The gods who are on the shore of the netherworld"** - Thirteen deities (in the Osireion) symbolically represented by one figure in papyri, who grant "truth in the Wide Hall of the Two Truths."\n\n**Group 4: "The gods who belong to the shore"** - Four mummified deities who "give an island in the Fields of Iaru."\n\n**Group 5: "The Chief of the shore"** - A deity with scepter who grants "an endowment in the Field of Offerings."\n\n**Group 6: "The gods who are on the shore"** - Eight deities (four in papyri) who guarantee "offerings, food, and a great quantity of meat in the Necropolis."\n\n### Group 7: The Mysterious Heads\n\n**"The Mysterious Heads on the shore"** - Eleven ram\'s heads mounted on staffs (in the Osireion), symbolically represented by a single head in papyri. They grant "their protection as it is done for Tired-Heart."\n\n### Groups 3 and 8: The Figures in Coils\n\n**Group 3: "The gods who are in the following of the Enveloper"** - Fourteen recumbent deities wrapped in serpent coils (in the Osireion), who guarantee the deceased "may be in any place in which his Ka desires him to be."\n\n**Group 8: "The gods who are in the coils"** - Fourteen deities similarly wrapped, who grant "the sight of the Solar Disk."\n\n### Group 9: The Bowing Ones\n\n**Group 9: "iwwtyw"** (cryptic name) - Four bowing deities who guarantee "rest in the beautiful West."';

	/// en: 'Twelfth cavern - The cavern of the final shore'
	String get twelfthCavernTitle => 'Twelfth cavern - The cavern of the final shore';
}

// Path: codex
class Translations$codex$en {
	Translations$codex$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Astronomy fundamentals'
	String get astronomyFundamentalsTitle => 'Astronomy fundamentals';

	/// en: 'Book of Caverns'
	String get bookOfCaverns => 'Book of Caverns';

	/// en: '## Egyptian Funerary Texts and Astrology This treatment of the **12 astrological houses** is based on Egyptian funerary texts from the New Kingdom describing the sun god Ra's journey through the underworld, following Angelo Angelini's astrological interpretation. ## The Two Source Texts The twelve caverns presented here derive from two distinct Egyptian texts: ### Caverns 1-6: The Book of Caverns Proper A Ramesside funerary text describing Ra's nocturnal journey through six sections of the Duat. Characterized by scenes of punishment for Ra and Osiris's enemies, this text is attested in its most complete versions in the tomb of Ramses VI (KV9) and the Osireion of Seti I at Abydos. Contemporary Egyptology maintains that the Book of Caverns actually contains all twelve caverns, organized with multiple caverns per section ([Power, 2015](https://doi.org/10.17638/03032971)). For this astrological treatment, however, we follow Angelini's interpretation that assimilates each of the six sections to an astrological house. ### Caverns 8-12: The Book of the Twelve Caves Also known as **Spell of the Twelve Caves**, this text was long considered part of the Book of the Dead. Alexandre Piankoff demonstrated it is an independent composition with a benevolent liturgical character: deities grant favors to the deceased without scenes of punishment. The first seven caverns of the Book of the Twelve Caves are represented in an extremely synthetic and schematic manner, providing very little information about their content, while only the last five (from 8 to 12) are described in detail. Angelo Angelini interprets the eighth cavern of the Book of the Twelve Caves as the eighth astrological house—a symbolic, not philological connection. ## The Meaning of "Cavern" In Egyptian: **Kerreret** or **Kerret** ![Hieroglyph of Kerreret](caverna.webp) According to Angelo Angelini, the hieroglyph combines: - **Q** (triangle): matter to be worked - **Seeds**: time - **Open rectangle**: space The term thus indicates "a temporal space"—the essence of astrological domification, where celestial time (planetary transits) crystallizes into earthly experience. ## Sources ### Book of Caverns (caverns 1-6) - **Philological reconstruction**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l'Institut français d'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059) - **Iconographic interpretation**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Doctoral dissertation]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971) - **Iconographic source**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomb of Ramses VI ### Book of the Twelve Caves (caverns 8-12) - **Philological reconstruction**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77) - **Iconographic interpretation**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian) - **Iconographic source**: [Papyrus EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum ### Astrological Interpretation - Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi. **Note**: Colors in illustrations of caverns 1-6 are suggestive and serve a communicative function to evoke the underworld atmosphere, not philological, as the originals on tomb walls are heavily deteriorated. For caverns 8-12, original colors from Papyrus EA 10478 of the British Museum have been used.'
	String get bookOfCavernsIntroduction => '## Egyptian Funerary Texts and Astrology\n\nThis treatment of the **12 astrological houses** is based on Egyptian funerary texts from the New Kingdom describing the sun god Ra\'s journey through the underworld, following Angelo Angelini\'s astrological interpretation.\n\n## The Two Source Texts\n\nThe twelve caverns presented here derive from two distinct Egyptian texts:\n\n### Caverns 1-6: The Book of Caverns Proper\nA Ramesside funerary text describing Ra\'s nocturnal journey through six sections of the Duat. Characterized by scenes of punishment for Ra and Osiris\'s enemies, this text is attested in its most complete versions in the tomb of Ramses VI (KV9) and the Osireion of Seti I at Abydos.\n\nContemporary Egyptology maintains that the Book of Caverns actually contains all twelve caverns, organized with multiple caverns per section ([Power, 2015](https://doi.org/10.17638/03032971)). For this astrological treatment, however, we follow Angelini\'s interpretation that assimilates each of the six sections to an astrological house.\n\n### Caverns 8-12: The Book of the Twelve Caves\nAlso known as **Spell of the Twelve Caves**, this text was long considered part of the Book of the Dead. Alexandre Piankoff demonstrated it is an independent composition with a benevolent liturgical character: deities grant favors to the deceased without scenes of punishment.\n\nThe first seven caverns of the Book of the Twelve Caves are represented in an extremely synthetic and schematic manner, providing very little information about their content, while only the last five (from 8 to 12) are described in detail.\n\nAngelo Angelini interprets the eighth cavern of the Book of the Twelve Caves as the eighth astrological house—a symbolic, not philological connection.\n\n## The Meaning of "Cavern"\n\nIn Egyptian: **Kerreret** or **Kerret**\n\n![Hieroglyph of Kerreret](caverna.webp)\n\nAccording to Angelo Angelini, the hieroglyph combines:\n- **Q** (triangle): matter to be worked\n- **Seeds**: time\n- **Open rectangle**: space\n\nThe term thus indicates "a temporal space"—the essence of astrological domification, where celestial time (planetary transits) crystallizes into earthly experience.\n\n## Sources\n\n### Book of Caverns (caverns 1-6)\n- **Philological reconstruction**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l\'Institut français d\'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059)\n- **Iconographic interpretation**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Doctoral dissertation]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971)\n- **Iconographic source**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomb of Ramses VI\n\n### Book of the Twelve Caves (caverns 8-12)\n- **Philological reconstruction**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77)\n- **Iconographic interpretation**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian)\n- **Iconographic source**: [Papyrus EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum\n\n### Astrological Interpretation\n- Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi.\n\n**Note**: Colors in illustrations of caverns 1-6 are suggestive and serve a communicative function to evoke the underworld atmosphere, not philological, as the originals on tomb walls are heavily deteriorated. For caverns 8-12, original colors from Papyrus EA 10478 of the British Museum have been used.';

	/// en: '## Looking up Step outside on a clear night, away from city lights, and you see thousands of stars scattered across a dark dome overhead. Watch for an hour or two and something becomes obvious: the stars move. Not relative to each other, though. The entire pattern shifts as a single piece, like a bowl slowly rotating above you. Orion drifts westward. New stars appear on the eastern horizon. Others sink below the west. This apparent rotation is, of course, a consequence of Earth spinning on its axis. But for the purposes of observational astronomy and astrology, it is far more practical to work with what you actually see. And what you see is a sphere. ## The celestial sphere The celestial sphere is an imaginary sphere of arbitrarily large radius, centered on the observer. Every star, planet, and celestial body is projected onto its inner surface. The model is ancient, and it remains useful because angular positions and relationships between objects are the same whether you think of the sky as a sphere or as empty space extending billions of light-years in every direction. What matters is where things appear, not how far away they are. The sphere has several reference points defined by the observer's position on Earth. ## Reference points The **horizon** is the circle that separates the visible half of the celestial sphere (above us) from the invisible half (below us). Four cardinal directions mark the horizon: **North**, **East**, **South**, and **West**. The point directly overhead is the **zenith**; the opposite point, below your feet, is the **nadir**. The **meridian** is the imaginary arc that starts at the north horizon, rises to the zenith, and descends to the south horizon. It divides the sky into an eastern half and a western half. In the birth chart, these reference points define the four angles. The zodiacal degree rising in the East is the **Ascendant**; the one setting in the West is the **Descendant**. The zodiacal degree at the highest point of the meridian is the **Midheaven** (MC); the opposite point below the horizon is the **Imum Coeli** (IC). [CELESTIAL_SPHERE_DIAGRAM]'
	String get celestialSphereContent => '## Looking up\n\nStep outside on a clear night, away from city lights, and you see thousands of stars scattered across a dark dome overhead. Watch for an hour or two and something becomes obvious: the stars move. Not relative to each other, though. The entire pattern shifts as a single piece, like a bowl slowly rotating above you. Orion drifts westward. New stars appear on the eastern horizon. Others sink below the west.\n\nThis apparent rotation is, of course, a consequence of Earth spinning on its axis. But for the purposes of observational astronomy and astrology, it is far more practical to work with what you actually see. And what you see is a sphere.\n\n## The celestial sphere\n\nThe celestial sphere is an imaginary sphere of arbitrarily large radius, centered on the observer. Every star, planet, and celestial body is projected onto its inner surface. The model is ancient, and it remains useful because angular positions and relationships between objects are the same whether you think of the sky as a sphere or as empty space extending billions of light-years in every direction. What matters is where things appear, not how far away they are.\n\nThe sphere has several reference points defined by the observer\'s position on Earth.\n\n## Reference points\n\nThe **horizon** is the circle that separates the visible half of the celestial sphere (above us) from the invisible half (below us). Four cardinal directions mark the horizon: **North**, **East**, **South**, and **West**. The point directly overhead is the **zenith**; the opposite point, below your feet, is the **nadir**.\n\nThe **meridian** is the imaginary arc that starts at the north horizon, rises to the zenith, and descends to the south horizon. It divides the sky into an eastern half and a western half.\n\nIn the birth chart, these reference points define the four angles. The zodiacal degree rising in the East is the **Ascendant**; the one setting in the West is the **Descendant**. The zodiacal degree at the highest point of the meridian is the **Midheaven** (MC); the opposite point below the horizon is the **Imum Coeli** (IC).\n\n[CELESTIAL_SPHERE_DIAGRAM]';

	/// en: 'The celestial sphere'
	String get celestialSphereTitle => 'The celestial sphere';

	/// en: 'Mandatory condition: Attribution through citation "Source: AstroGods (astrogods.it) - CC BY 4.0 License"'
	String get codexAttributionRequired => 'Mandatory condition: Attribution through citation "Source: AstroGods (astrogods.it) - CC BY 4.0 License"';

	/// en: 'B) Codex - Educational content (CC BY 4.0 license)'
	String get codexCreativeCommons => 'B) Codex - Educational content (CC BY 4.0 license)';

	/// en: 'The contents of the Codex, including interpretive texts, images and educational materials, are released under the Creative Commons Attribution 4.0 International license. Users may:'
	String get codexCreativeCommonsText => 'The contents of the Codex, including interpretive texts, images and educational materials, are released under the Creative Commons Attribution 4.0 International license. Users may:';

	/// en: 'Reproduce, distribute and publicly communicate the work'
	String get codexRights1 => 'Reproduce, distribute and publicly communicate the work';

	/// en: 'Modify, transform the work and create derivative works'
	String get codexRights2 => 'Modify, transform the work and create derivative works';

	/// en: 'Use the work for commercial purposes'
	String get codexRights3 => 'Use the work for commercial purposes';

	/// en: 'Where Codex content incorporates third-party materials subject to more restrictive licenses, the terms of the more restrictive license shall prevail. Users must identify and comply with all applicable license requirements, including attribution to original sources.'
	String get codexThirdPartyLicenseHierarchy => 'Where Codex content incorporates third-party materials subject to more restrictive licenses, the terms of the more restrictive license shall prevail. Users must identify and comply with all applicable license requirements, including attribution to original sources.';

	/// en: 'Codex'
	String get codexTitle => 'Codex';

	/// en: 'Content coming soon'
	String get contentComingSoon => 'Content coming soon';

	/// en: 'Aquarius'
	String get diagramAquarius => 'Aquarius';

	/// en: 'Aries'
	String get diagramAries => 'Aries';

	/// en: 'Ascending sign: ${sign}'
	String diagramAscendingSign({required Object sign}) => 'Ascending sign: ${sign}';

	/// en: 'Autumn'
	String get diagramAutumn => 'Autumn';

	/// en: 'Autumnal eq.'
	String get diagramAutumnalEquinox => 'Autumnal eq.';

	/// en: 'Average rising'
	String get diagramAverageRising => 'Average rising';

	/// en: 'Cancer'
	String get diagramCancer => 'Cancer';

	/// en: 'Capricorn'
	String get diagramCapricorn => 'Capricorn';

	/// en: 'Celestial equator'
	String get diagramCelestialEquator => 'Celestial equator';

	/// en: 'Cel. equator'
	String get diagramCelestialEquatorShort => 'Cel. equator';

	/// en: 'Celestial pole'
	String get diagramCelestialPole => 'Celestial pole';

	/// en: 'Earth'
	String get diagramEarth => 'Earth';

	/// en: 'East'
	String get diagramEast => 'East';

	/// en: 'Ecliptic'
	String get diagramEcliptic => 'Ecliptic';

	/// en: 'Equator'
	String get diagramEquator => 'Equator';

	/// en: 'Fast rising'
	String get diagramFastRising => 'Fast rising';

	/// en: 'Gemini'
	String get diagramGemini => 'Gemini';

	/// en: 'Horizon'
	String get diagramHorizon => 'Horizon';

	/// en: 'Latitude: ${degrees}°'
	String diagramLatitude({required Object degrees}) => 'Latitude: ${degrees}°';

	/// en: 'Leo'
	String get diagramLeo => 'Leo';

	/// en: 'Libra'
	String get diagramLibra => 'Libra';

	/// en: 'Long ascension'
	String get diagramLongAscension => 'Long ascension';

	/// en: 'Meridian'
	String get diagramMeridian => 'Meridian';

	/// en: 'Nadir'
	String get diagramNadir => 'Nadir';

	/// en: 'North'
	String get diagramNorth => 'North';

	/// en: 'Pisces'
	String get diagramPisces => 'Pisces';

	/// en: '${symbol} ${sign}, ~${year}'
	String diagramPrecessionAge({required Object symbol, required Object sign, required Object year}) => '${symbol} ${sign}, ~${year}';

	/// en: 'Polar c.'
	String get diagramPolarCircleShort => 'Polar c.';

	/// en: 'Pole'
	String get diagramPole => 'Pole';

	/// en: 'Rome'
	String get diagramRome => 'Rome';

	/// en: 'Rome · 42° N'
	String get diagramRomeLatitude => 'Rome · 42° N';

	/// en: 'Sagittarius'
	String get diagramSagittarius => 'Sagittarius';

	/// en: 'Scorpio'
	String get diagramScorpio => 'Scorpio';

	/// en: 'Short ascension'
	String get diagramShortAscension => 'Short ascension';

	/// en: 'Slow rising'
	String get diagramSlowRising => 'Slow rising';

	/// en: 'Spring'
	String get diagramSpring => 'Spring';

	/// en: 'Summer'
	String get diagramSummer => 'Summer';

	/// en: 'Summer solst.'
	String get diagramSummerSolstice => 'Summer solst.';

	/// en: 'Taurus'
	String get diagramTaurus => 'Taurus';

	/// en: 'Vernal eq.'
	String get diagramVernalEquinox => 'Vernal eq.';

	/// en: 'Virgo'
	String get diagramVirgo => 'Virgo';

	/// en: 'West'
	String get diagramWest => 'West';

	/// en: 'Winter'
	String get diagramWinter => 'Winter';

	/// en: 'Winter solst.'
	String get diagramWinterSolstice => 'Winter solst.';

	/// en: 'BCE'
	String get diagramYearBCE => 'BCE';

	/// en: 'CE'
	String get diagramYearCE => 'CE';

	/// en: 'Zenith'
	String get diagramZenith => 'Zenith';

	/// en: 'The celestial sphere as seen from a mid-latitude observer. The slider rotates the sphere to show the apparent motion of the sky'
	String get diagramCaptionCelestialSphere => 'The celestial sphere as seen from a mid-latitude observer. The slider rotates the sphere to show the apparent motion of the sky';

	/// en: 'Celestial equator and ecliptic. The slider moves the Sun along the ecliptic over the course of a year'
	String get diagramCaptionEquatorEcliptic => 'Celestial equator and ecliptic. The slider moves the Sun along the ecliptic over the course of a year';

	/// en: 'The celestial sphere at different latitudes. The slider changes the observer's latitude and shows how the celestial pole altitude and the tilt of stellar circles change relative to the horizon'
	String get diagramCaptionLatitudeSky => 'The celestial sphere at different latitudes. The slider changes the observer\'s latitude and shows how the celestial pole altitude and the tilt of stellar circles change relative to the horizon';

	/// en: 'Long ascension vs short ascension. The number of zodiacal degrees rising in the same time interval changes depending on the angle between ecliptic and horizon'
	String get diagramCaptionEclipticRising => 'Long ascension vs short ascension. The number of zodiacal degrees rising in the same time interval changes depending on the angle between ecliptic and horizon';

	/// en: 'The ecliptic at the eastern horizon. The hour slider shows how the angle of incidence changes during diurnal rotation'
	String get diagramCaptionEclipticHorizon => 'The ecliptic at the eastern horizon. The hour slider shows how the angle of incidence changes during diurnal rotation';

	/// en: 'Celestial sphere with ecliptic and horizon. The latitude slider changes the tilt of the sphere; the hour slider shows diurnal rotation'
	String get diagramCaptionSemidiurnalArc => 'Celestial sphere with ecliptic and horizon. The latitude slider changes the tilt of the sphere; the hour slider shows diurnal rotation';

	/// en: 'Placido houses seen from above. The slider changes latitude to show how distortion increases away from the equator'
	String get diagramCaptionPlacido => 'Placido houses seen from above. The slider changes latitude to show how distortion increases away from the equator';

	/// en: 'Earth's axis traces a cone in space over approximately 25,772 years. The slider rotates the axis to show the wobble'
	String get diagramCaptionPrecession => 'Earth\'s axis traces a cone in space over approximately 25,772 years. The slider rotates the axis to show the wobble';

	/// en: 'Whole sign houses. Each zodiacal sign constitutes a complete house. The slider moves the Ascendant to show how the house distribution changes'
	String get diagramCaptionWholeSign => 'Whole sign houses. Each zodiacal sign constitutes a complete house. The slider moves the Ascendant to show how the house distribution changes';

	/// en: '## Introduction Why does AstroGods use Vehlow domification rather than Placidus? The question is fair. The vast majority of astrological software uses the system of Placido de Titis, a 17th-century Olivetan monk whose method became, through historical inertia rather than philosophical merit, the modern standard. But looking back at astrology's origins reveals that equal houses are the oldest, most widespread system, and the one most coherent with the cosmological vision on which astrology rests. The following sections trace the reasons for this choice, starting from a deeper question: what, exactly, are the houses? ## What the houses are: a necessary premise Before choosing a house system, it helps to understand what houses actually are. Modern astrology often treats them as simple geometric divisions of celestial space, sectors calculated with trigonometric formulas. The ancient conception is radically different. The houses are the twelve portions of the human etheric aura: that part of the microcosmic subtle body that allows the macrocosmic celestial matrix (the signs) to crystallize into the microcosmic earthly matrix (the physical and etheric body). The Egyptian word for the houses is *Kereret* (or *Kerret*), typically translated as "cavern" in the [Book of Caverns](/codex/domification/book-of-caves). But this translation is reductive. As Angelini observes through hieroglyphic etymology, *Kereret* contains both a concept of space and a concept of time: it is a *space-time*, an inseparable unit of place and duration [(Angelini, 1992)](https://www.kemiassociazione.it/product/?manuale-di-astrologia-egizia){{la caverna è uno spazio temporale, un luogo che è collegato al tempo. Con questa definizione gli Egizi hanno magistralmente indicato cosa sia, in sostanza, la domificazione: uno spazio che è in funzione del tempo, oppure un tempo che non si può dissociare dallo spazio}}. This conception immediately exposes the limitation of modern house systems: Campanus treats the houses as a purely spatial phenomenon, Placidus treats them as temporal. Neither captures the nature of *Kereret* as an indivisible space-time unit. ## The premise determines the conclusion In a 1991 astrology course, Angelo Angelini formulated a principle that illuminates the entire question of domification: a calculation always resolves the premise set at its foundation, but if that premise is wrong, the result will inevitably be wrong, regardless of mathematical rigor [(Angelini, 1991)](https://www.kemiassociazione.it/astrologia-iv---angelini.html){{La premessa di un calcolo è fondamentale. Il calcolo ti risolve la premessa che tu hai posto a monte, ma se questa premessa è sbagliata, ti porta ad una conclusione sbagliata.}}. Placidus domification starts from an astronomical-mathematical premise: it divides the [semi-diurnal arc](/codex/domification/understanding-placido/semidiurnal-arcs) of each zodiacal degree into equal time intervals and derives house cusps from the degrees corresponding to each division. The calculation is trigonometrically impeccable, but converting from time back to zodiacal degrees produces houses of unequal size, because the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) meets the horizon at different angles during celestial rotation. Distortion increases with the observer's [latitude](/codex/domification/understanding-placido/latitude-sky): at the equator the houses remain nearly regular; at high latitudes some expand enormously while others shrink to slivers. For a detailed treatment with interactive diagrams, see [Understanding Placido domification](/codex/domification/understanding-placido). [PLACIDO_DIAGRAM] The calculation is correct. But is the premise? Vehlow domification starts from an entirely different foundation: metaphysical and analogical. The houses represent the twelve archetypal fields of experience, the twelve sections of the human aura. Their structure should reflect cosmic order, not the astronomical contingency of a given place and moment. However mathematically impeccable a calculation may be, what matters is the conception of the world on which that calculation was built. ## A brief history of domification Equal houses are not a recent innovation. They are the dominant system in astrology for most of its documented history. The prevailing method was Whole Sign Houses, where each zodiacal sign corresponds to a complete house. This is attested in the sources of Hellenistic astrology (3rd c. BCE to 1st c. CE), through the imperial Roman period (Vettius Valens, 2nd c. CE; Firmicus Maternus, 4th c. CE), and the early medieval Arabic tradition up through the 9th–10th centuries [(Hand, 2007)](https://www.cultureandcosmos.org/pdfs/11/11_Hand_Signs_as_Houses_Vol11.pdf){{The practice of using signs as places did not die out at the end of the Greek era. We also find it in early Arabic era authors such as Masha'allah (fl. 762-815)}}. In Indian Vedic astrology, the same principle (*Rashi Chakra*) has remained in continuous use to this day. [WHOLE_SIGN_HOUSES_DIAGRAM] Unlike Whole Sign Houses, where each sign forms a house of exactly 30°, quadrant systems take the [four angles](/codex/astronomy-fundamentals/celestial-sphere) as their reference: Ascendant, Descendant, Midheaven, and IC. These four points divide the ecliptic into four sectors, which are then subdivided to produce the intermediate houses. Since the four sectors are never exactly equal, the resulting houses vary in size. The first quadrant system to spread widely was that of Alcabitius (al-Qabisi, 10th c.), which became the standard method in medieval Arabic and Latin astrology. Campanus followed in the 13th century, then Regiomontanus in the 15th, and finally Placidus. Placidus developed his system within the context of the 17th-century scientific revolution. The mechanistic paradigm of Galileo, Newton, and Descartes was redefining the criteria for legitimate knowledge: what counted was what could be measured, calculated, reproduced. Astrology lost its status as an analogical science and was pushed to the margins. In that climate it was natural for new house systems to be grounded solely in astronomical calculation, abandoning the metaphysical premises that had sustained equal houses for millennia. In the 20th century, the German astrologer Johannes Vehlow revived the equal house system and refined it by placing the Ascendant at the center of the first house, extending 15 degrees before and 15 degrees after. He called his approach "antike Manier" (ancient method) because he found it in the classical sources [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Die Bezeichnung "antike Manier" habe ich deshalb gewählt, weil die Einteilung der Häuser mit den Kardinalpunkten in den Mitten einer uralten Methode entspricht unter Zugrundelegung der antiken Urtypen, dem Thema mundi}}. The invention of unequal houses, Vehlow wrote, generated a "Rattenkönig" (a tangle of rats' tails) of ever-multiplying calculation methods. The ancient system was not abandoned because it failed, but because rationalism reformed the horoscope until it lost its symbolic character, reducing it to a dry exercise in computation. ## Why equal houses ### Convergences across traditions The equal house system is not an isolated invention. Several traditions converge on the same proportional twelve-fold structure. #### Vedic astrology (Jyotish) Horoscopic astrology with twelve houses entered India through contact with the Hellenistic tradition, documented at least as early as the *Yavanajataka*, a Sanskrit versification dated to 269/270 CE of a Greek treatise [(Pingree, 1978)](https://archive.org/details/PingreeYJ){{From the concluding three verses of the Yavanajataka we know the author's name and that the date of his composition was A.D. 269/270. We are further informed that it is a versified version of a prose translation, made by one Yavanesvara, "the lord of the Greeks," in the year A.D. 149/150}}. The title is telling: *Yavanajataka* literally means "the horoscopy of the Greeks," since *Yavana* was the Sanskrit term for Greeks, derived from the ancient Greek *Ἴωνες* (Ionians). The twelve-house system of Jyotish is not an independent invention. The relevant question is not whether Indians arrived at Whole Sign Houses on their own, but why, once they received the Hellenistic system, India preserved it while the West progressively replaced it with latitude-dependent methods. In Jyotish the *Rashi Chakra* (the wheel of signs) serves directly as the map of *bhāva* (houses): each *rashi* coincides with a field of experience. The answer lies in a deep philosophical compatibility. The Vedic tradition already had the concept of *Ṛta*: the primordial cosmic order, from the Indo-European root *\*h₂ar-*. The same root gives the Greek *ἁρμονία* (harmony) and the Latin *ars* (art, skill): three words in three languages naming the same thing, the proportionate joining of parts. A system of twelve equal sectors, none distorted by latitude, resonated naturally with a worldview where cosmic order is symmetrical and universal by definition. #### The Chinese Twelve Earthly Branches In Chinese cosmology, the Twelve Earthly Branches (*Dizhi*) articulate time and space on three simultaneous levels: the twelve double-hours of two hours each that compose the day, the twelve lunar months that compose the year, and twelve compass directions at equal 30° intervals. At every level the division is equidistant: twelve principles equal in dignity, none inflated or compressed by geographical position. The double-hours are the level most directly comparable to astrological houses. Houses in Western astrology divide the diurnal cycle into twelve experiential sectors. The Earthly Branches divide the same twenty-four hours into twelve identical two-hour periods, regardless of latitude. No Chinese doctrine holds that the hour of the Dragon should last longer than the hour of the Rabbit because a nativity is cast at Oslo rather than Mumbai. This structure finds its most developed astrological expression in *Zi Wei Dou Shu* (紫微斗數), or Purple Star Astrology. In this system the natal chart is organized into twelve equal palaces, one for each Earthly Branch: Life, Siblings, Spouse, Children, Wealth, Health, Travel, Friends, Career, Property, Mind, Parents. The palaces are experiential sectors functionally equivalent to Western houses, and their equality is structural: it does not depend on where the observer stands on Earth. #### Kabbalah and the Sefer Yetzirah The *Sefer Yetzirah* (Book of Formation, 3rd–6th c. CE) assigns the twenty-two letters of the Hebrew alphabet to the geometry of a cube: three to the three dimensions of space (height, width, depth), seven to the six cardinal directions (up, down, north, south, east, west) and the central point, twelve to the edges where two adjacent faces meet. Kabbalistic commentary has named this model the Cube of Space. §47 of the text, the paragraph listing the twelve diagonal directions, calls these positions *גבולי אלכסון*, "diagonal borders," and associates them with the twelve zodiacal constellations, the twelve months, and twelve principal organs of the body [(Hayman, 2004)](https://doi.org/10.1628/978-3-16-158795-5){{Twelve simple letters: He, Waw, Zayin, Ḥet, Tet, Yod, Lamed, Nun, Samek, Ayin, Sade, Qof. He carved them, he combined them, he hewed them, he weighed them and exchanged them, and formed with them the constellations, the months, and the principal (bodily) organs}}. All twelve edges of a cube are geometrically identical: the solid's symmetry permits no hierarchy among them. #### Pythagoreanism and the regular dodecagon In the Pythagorean tradition, numbers are formal principles through which the order of the cosmos becomes intelligible [(Aristotle, *Metaphysics*, c. 350 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0052%3Abook%3D1%3Asection%3D985b){{all other things have their whole nature modelled upon numbers, and that numbers are the ultimate things in the whole physical universe}}. At the centre of this tradition stands the Tetractys, the triangular figure generated by the sum of the first four integers (1 + 2 + 3 + 4 = 10), which the Pythagoreans revered as the foundation of cosmic harmony. On a vibrating string, halving the length produces the note an octave higher; shortening it to two-thirds produces the fifth; shortening it to three-quarters produces the fourth. The ratios 2:1, 3:2 and 4:3 use only the numbers 1, 2, 3 and 4 of the Tetractys [(Theon of Smyrna, *Expositio rerum mathematicarum*, c. 115–140 CE)](https://archive.org/details/theonissmyrnaei00theogoog){{τοὺς δὲ συμφωνοῦντας φθόγγους ἐν λόγοις τοῖς πρὸς ἀλλήλους πρῶτος ἀνευρηκέναι δοκεῖ Πυθαγόρας, τοὺς μὲν διὰ τεσσάρων ἐν ἐπιτρίτῳ, τοὺς δὲ διὰ πέντε ἐν ἡμιολίῳ, τοὺς δὲ διὰ πασῶν ἐν διπλασίῳ}}. The least common multiple of 1, 2, 3 and 4 is 12: the smallest integer divisible by each of them. A circle divided into twelve sectors of 30 degrees translates this structure into the plane. Plato, in the *Timaeus*, closes the system of regular solids by assigning the dodecahedron, the solid with twelve pentagonal faces, to the structure of the whole cosmos: 'the god made use of it for the whole' [(Plato, *Timaeus*, c. 360 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0180%3Atext%3DTim.%3Asection%3D55c){{And seeing that there still remained one other compound figure, the fifth, God used it up for the Universe in his decoration thereof}}; the reason is that the dodecahedron is the Platonic solid that most closely approximates a sphere, and the Platonic cosmos is spherical [(Zeyl & Sattler, 2022)](https://plato.stanford.edu/entries/plato-timaeus/){{The remaining regular solid, the dodecahedron, is "used for the universe as a whole," since it approaches most nearly the shape of a sphere}}. The regular dodecagon is the planar projection of this cosmological structure: twelve equal sectors, none wider or narrower than the others. ### The metaphysical foundation: the aura and symmetry These convergences are explained by the following metaphysical premise: houses are not sectors of celestial space defined by trigonometric formulas, but the twelve sections of the human etheric aura, what the [Book of Caverns](/codex/domification/book-of-caves/cavern/1) depicts as an oval, a magnetic envelope surrounding the human figure. If houses are the sections of the aura, the question of their size has a necessary answer: they must be equal. Their size cannot depend on the observer's latitude because the aura is an intrinsic property of the being, not of the astronomical horizon. A first house of 40 degrees at Oslo and 28 at Rome would mean that the section of the aura linked to identity changes size with latitude. Within the same chart, a first house wider than the second would mean that the aura devotes more space to identity than to resources. At the poles some houses vanish, and the person would lack the corresponding fields of experience. The same structure appears at cosmic scale. The zodiac is the Sun's aura: not the Sun's apparent path in the sky, but its energy field, divided into twelve equal signs of 30 degrees. No one would dream of dividing the zodiac into unequal parts on the grounds that the constellations sharing their names have different sizes. From a strictly astronomical standpoint, the constellations crossed by the ecliptic are not even twelve: Ophiuchus lies between Scorpius and Sagittarius, and the Sun transits it longer than it transits Scorpius itself. Yet no astrological system includes it among the signs, because the zodiac is not an astronomical catalogue of star clusters: it is a metaphysical and symbolic structure. ## Why the Ascendant is at the fifteenth degree ### The Thema Mundi In the fourth century, Firmicus Maternus described the *Thema Mundi*, the mythic birth chart of creation, attributing its doctrine to the Egyptian tradition: the secret had passed from Aesculapius and Anubis to Petosiris and Nechepso through the intermediary of Mercury. In this chart each planet sits at the fifteenth degree of its own domicile: the Sun at 15° Leo, the Moon at 15° Cancer, Saturn at 15° Capricorn, Jupiter at 15° Sagittarius, Mars at 15° Scorpio, Venus at 15° Libra, Mercury at 15° Virgo. The Ascendant is placed at the fifteenth degree of Cancer [(Firmicus Maternus, *Matheseos Libri VIII*, c. 334 CE)](https://www.astrologiahumana.com/firmicusmaternustheoryandpractice.pdf){{the Sun in the 15th degree of Leo, the Moon in the 15th degree of Cancer, Saturn in the 15th degree of Capricorn, Jupiter in the 15th degree of Sagittarius, Mars in the 15th degree of Scorpio, Venus in the 15th degree of Libra, Mercury in the 15th degree of Virgo, and the ascendant in the 15th degree of Cancer}}. The fifteenth degree is the exact center of the sign. Firmicus makes clear that the *Thema Mundi* is not the account of a historical event: it is a normative model, constructed by ancient sages for astrologers to adopt in the construction of individual charts. The question is: what, concretely, does a model in which every element is centered in its sign teach? It cannot teach that planets should be placed at the fifteenth degree: planetary positions are astronomical data determined by the moment of birth, not methodological choices. What the model transmits is a structural principle: the center of the sign is the place of maximum potency. Each planet in the *Thema Mundi* sits in the sign it rules, its strongest essential dignity; placing it at the fifteenth degree brings it to the peak of its strength. The Ascendant is the one element for which this principle can be applied operationally. Its zodiacal position is calculated like that of the planets, but the way the houses are organized around it is a methodological choice. The *Thema Mundi* teaches that the organizing point of the chart belongs at the center of the house, not at its edge. Vehlow built his system on this evidence, recognizing in it the original method of ancient Astrology [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Der Aszendent, der die Stunde — hora oder Horoscopus bedeutet, wurde in die Mitte des Zeichens Krebs verlegt. Von Häuserspitzen ist hier nirgends die Rede!}}. The Egyptian origin of the doctrine is why the Vehlow system is also known as Egyptian domification. ### The center as the point of maximum potency The Jyotish tradition formalized the same principle with a precise name: *bhava madhya*, literally "middle of the house." The degree of the *lagna* (Ascendant) does not mark the edge of the first house but occupies its center: the house extends 15 degrees before and 15 degrees after the ascending degree. The boundaries between one house and the next are called *bhava sandhi*, the house junctions. The distinction between madhya and sandhi has a foundation that is not merely topological but functional. The *Phaladeepika* of Mantreswara, one of the classic texts of Jyotish, establishes an unambiguous principle: even a planet in exaltation or in a friendly sign loses all its efficacy if situated at the *bhava sandhi*; conversely, planets occupying the exact degree of the *bhava madhya* produce the full effects of that house, while those at intermediate positions yield partial effects [(Mantreswara, *Phaladeepika*, 13th c. CE)](https://www.panchanga.lv/wp-content/uploads/2020/06/Phaladipika_Shri-Mantreswara.pdf){{Even if a planet be posited in his sign of exaltation or a friendly sign, he proves in affliction if he is situated in Bhava-Sandhi. The planets occupying the exact degrees (Bhava-Madhya) produce the full effects of that house. The planets situated in Bhava-Sandhi produce no effects}}. This gradient of strength transforms the position of the Ascendant from a geometric choice into a functional one. If the center of the house is its point of maximum efficacy, the Ascendant, the most decisive point in the entire chart, must coincide with the *bhava madhya* of the first house. Placing it at the edge would mean situating the organizing principle of the chart at its point of least potency: a structural contradiction. ## Why Placidus fails ### Impossibility above the 60th parallel Placidus domification breaks down above approximately 66 degrees latitude. Fomalhaut documented this already in 1897 in his *Manuel d'astrologie sphérique et judiciaire* [(Nicoullaud, 1897)](https://archive.org/details/BSG_DELTA61179FA){{Or il est inadmissible d'adopter un système qui ne s'applique pas à tous les lieux du Globe}}: "It is inadmissible to adopt a system that does not apply to all places on the Globe." This limitation alone should call into question any system claiming to describe a universal order. Inhabitants of Alaska, northern Scandinavia, and Arctic Russia would be excluded from the relationship between cosmos and individual by a defect in the calculation method. ### Distortion of planetary aspects In Placidus, the disproportion in house size produces aberrations in aspects between houses. Cases arise where the first house falls in trine with the fourth, or the tenth in sextile with the seventh: houses that should be in square, as they mark the axes of the chart, end up in harmonic relationships. This contradicts the entire structural logic of the horoscope. ### Intercepted signs: an artifact of calculation In quadrant house systems like Placidus, houses can exceed 30° in width. When a house is large enough to contain an entire zodiacal sign without that sign appearing on any house cusp, the sign is said to be *intercepted*: it is swallowed by the house, with no cusp of its own. The phenomenon always occurs in opposite pairs. Some astrologers interpret intercepted signs as hidden or blocked energies that are more difficult to express. The theory is relatively recent. There are no significant references to interceptions in the classical authors (Vettius Valens, Ptolemy, Manilius) or the medieval ones (Al-Biruni, Masha'allah, Guido Bonatti), who predominantly used whole sign houses, in which interceptions are structurally impossible. The first book-length treatment appears in the work of Joanne Wickenburg, who published *Intercepted Signs: Environment vs. Destiny* in 1978 [(Wickenburg, 1978)](https://www.goodreads.com/book/show/18669388-intercepted-signs). Interceptions are artifacts of the calculation method, not real cosmic phenomena. The most telling case is that of the equator: at zero latitude, Placidus houses all measure approximately 30° and interceptions effectively do not occur. Someone born in Quito, Nairobi, or Jakarta has no intercepted signs in their natal chart. As latitude increases, houses begin to distort; above 40° interceptions become systematic; at polar latitudes some houses stretch beyond 60°. The theory implies that entire equatorial populations lack the "hidden energies" it attributes to those born at mid-to-high latitudes, while two twins born at the same moment in Quito and Stockholm would have structurally different charts under the same sky, with the same planets in the same positions. Does it make sense to attribute deep psychological dynamics to an artifact that depends solely on birth latitude?'
	String get domificationArticleContent => '## Introduction\n\nWhy does AstroGods use Vehlow domification rather than Placidus? The question is fair. The vast majority of astrological software uses the system of Placido de Titis, a 17th-century Olivetan monk whose method became, through historical inertia rather than philosophical merit, the modern standard. But looking back at astrology\'s origins reveals that equal houses are the oldest, most widespread system, and the one most coherent with the cosmological vision on which astrology rests. The following sections trace the reasons for this choice, starting from a deeper question: what, exactly, are the houses?\n\n## What the houses are: a necessary premise\n\nBefore choosing a house system, it helps to understand what houses actually are.\n\nModern astrology often treats them as simple geometric divisions of celestial space, sectors calculated with trigonometric formulas. The ancient conception is radically different. The houses are the twelve portions of the human etheric aura: that part of the microcosmic subtle body that allows the macrocosmic celestial matrix (the signs) to crystallize into the microcosmic earthly matrix (the physical and etheric body).\n\nThe Egyptian word for the houses is *Kereret* (or *Kerret*), typically translated as "cavern" in the [Book of Caverns](/codex/domification/book-of-caves). But this translation is reductive. As Angelini observes through hieroglyphic etymology, *Kereret* contains both a concept of space and a concept of time: it is a *space-time*, an inseparable unit of place and duration [(Angelini, 1992)](https://www.kemiassociazione.it/product/?manuale-di-astrologia-egizia){{la caverna è uno spazio temporale, un luogo che è collegato al tempo. Con questa definizione gli Egizi hanno magistralmente indicato cosa sia, in sostanza, la domificazione: uno spazio che è in funzione del tempo, oppure un tempo che non si può dissociare dallo spazio}}.\n\nThis conception immediately exposes the limitation of modern house systems: Campanus treats the houses as a purely spatial phenomenon, Placidus treats them as temporal. Neither captures the nature of *Kereret* as an indivisible space-time unit.\n\n## The premise determines the conclusion\n\nIn a 1991 astrology course, Angelo Angelini formulated a principle that illuminates the entire question of domification: a calculation always resolves the premise set at its foundation, but if that premise is wrong, the result will inevitably be wrong, regardless of mathematical rigor [(Angelini, 1991)](https://www.kemiassociazione.it/astrologia-iv---angelini.html){{La premessa di un calcolo è fondamentale. Il calcolo ti risolve la premessa che tu hai posto a monte, ma se questa premessa è sbagliata, ti porta ad una conclusione sbagliata.}}.\n\nPlacidus domification starts from an astronomical-mathematical premise: it divides the [semi-diurnal arc](/codex/domification/understanding-placido/semidiurnal-arcs) of each zodiacal degree into equal time intervals and derives house cusps from the degrees corresponding to each division. The calculation is trigonometrically impeccable, but converting from time back to zodiacal degrees produces houses of unequal size, because the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) meets the horizon at different angles during celestial rotation. Distortion increases with the observer\'s [latitude](/codex/domification/understanding-placido/latitude-sky): at the equator the houses remain nearly regular; at high latitudes some expand enormously while others shrink to slivers. For a detailed treatment with interactive diagrams, see [Understanding Placido domification](/codex/domification/understanding-placido).\n\n[PLACIDO_DIAGRAM]\n\nThe calculation is correct. But is the premise? Vehlow domification starts from an entirely different foundation: metaphysical and analogical. The houses represent the twelve archetypal fields of experience, the twelve sections of the human aura. Their structure should reflect cosmic order, not the astronomical contingency of a given place and moment. However mathematically impeccable a calculation may be, what matters is the conception of the world on which that calculation was built.\n\n## A brief history of domification\n\nEqual houses are not a recent innovation. They are the dominant system in astrology for most of its documented history.\n\nThe prevailing method was Whole Sign Houses, where each zodiacal sign corresponds to a complete house. This is attested in the sources of Hellenistic astrology (3rd c. BCE to 1st c. CE), through the imperial Roman period (Vettius Valens, 2nd c. CE; Firmicus Maternus, 4th c. CE), and the early medieval Arabic tradition up through the 9th–10th centuries [(Hand, 2007)](https://www.cultureandcosmos.org/pdfs/11/11_Hand_Signs_as_Houses_Vol11.pdf){{The practice of using signs as places did not die out at the end of the Greek era. We also find it in early Arabic era authors such as Masha\'allah (fl. 762-815)}}. In Indian Vedic astrology, the same principle (*Rashi Chakra*) has remained in continuous use to this day.\n\n[WHOLE_SIGN_HOUSES_DIAGRAM]\n\nUnlike Whole Sign Houses, where each sign forms a house of exactly 30°, quadrant systems take the [four angles](/codex/astronomy-fundamentals/celestial-sphere) as their reference: Ascendant, Descendant, Midheaven, and IC. These four points divide the ecliptic into four sectors, which are then subdivided to produce the intermediate houses. Since the four sectors are never exactly equal, the resulting houses vary in size.\n\nThe first quadrant system to spread widely was that of Alcabitius (al-Qabisi, 10th c.), which became the standard method in medieval Arabic and Latin astrology. Campanus followed in the 13th century, then Regiomontanus in the 15th, and finally Placidus.\n\nPlacidus developed his system within the context of the 17th-century scientific revolution. The mechanistic paradigm of Galileo, Newton, and Descartes was redefining the criteria for legitimate knowledge: what counted was what could be measured, calculated, reproduced. Astrology lost its status as an analogical science and was pushed to the margins. In that climate it was natural for new house systems to be grounded solely in astronomical calculation, abandoning the metaphysical premises that had sustained equal houses for millennia.\n\nIn the 20th century, the German astrologer Johannes Vehlow revived the equal house system and refined it by placing the Ascendant at the center of the first house, extending 15 degrees before and 15 degrees after. He called his approach "antike Manier" (ancient method) because he found it in the classical sources [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Die Bezeichnung "antike Manier" habe ich deshalb gewählt, weil die Einteilung der Häuser mit den Kardinalpunkten in den Mitten einer uralten Methode entspricht unter Zugrundelegung der antiken Urtypen, dem Thema mundi}}.\n\nThe invention of unequal houses, Vehlow wrote, generated a "Rattenkönig" (a tangle of rats\' tails) of ever-multiplying calculation methods. The ancient system was not abandoned because it failed, but because rationalism reformed the horoscope until it lost its symbolic character, reducing it to a dry exercise in computation.\n\n## Why equal houses\n\n### Convergences across traditions\n\nThe equal house system is not an isolated invention. Several traditions converge on the same proportional twelve-fold structure.\n\n#### Vedic astrology (Jyotish)\n\nHoroscopic astrology with twelve houses entered India through contact with the Hellenistic tradition, documented at least as early as the *Yavanajataka*, a Sanskrit versification dated to 269/270 CE of a Greek treatise [(Pingree, 1978)](https://archive.org/details/PingreeYJ){{From the concluding three verses of the Yavanajataka we know the author\'s name and that the date of his composition was A.D. 269/270. We are further informed that it is a versified version of a prose translation, made by one Yavanesvara, "the lord of the Greeks," in the year A.D. 149/150}}. The title is telling: *Yavanajataka* literally means "the horoscopy of the Greeks," since *Yavana* was the Sanskrit term for Greeks, derived from the ancient Greek *Ἴωνες* (Ionians).\n\nThe twelve-house system of Jyotish is not an independent invention. The relevant question is not whether Indians arrived at Whole Sign Houses on their own, but why, once they received the Hellenistic system, India preserved it while the West progressively replaced it with latitude-dependent methods. In Jyotish the *Rashi Chakra* (the wheel of signs) serves directly as the map of *bhāva* (houses): each *rashi* coincides with a field of experience.\n\nThe answer lies in a deep philosophical compatibility. The Vedic tradition already had the concept of *Ṛta*: the primordial cosmic order, from the Indo-European root *\*h₂ar-*. The same root gives the Greek *ἁρμονία* (harmony) and the Latin *ars* (art, skill): three words in three languages naming the same thing, the proportionate joining of parts. A system of twelve equal sectors, none distorted by latitude, resonated naturally with a worldview where cosmic order is symmetrical and universal by definition.\n\n#### The Chinese Twelve Earthly Branches\n\nIn Chinese cosmology, the Twelve Earthly Branches (*Dizhi*) articulate time and space on three simultaneous levels: the twelve double-hours of two hours each that compose the day, the twelve lunar months that compose the year, and twelve compass directions at equal 30° intervals. At every level the division is equidistant: twelve principles equal in dignity, none inflated or compressed by geographical position.\n\nThe double-hours are the level most directly comparable to astrological houses. Houses in Western astrology divide the diurnal cycle into twelve experiential sectors. The Earthly Branches divide the same twenty-four hours into twelve identical two-hour periods, regardless of latitude. No Chinese doctrine holds that the hour of the Dragon should last longer than the hour of the Rabbit because a nativity is cast at Oslo rather than Mumbai.\n\nThis structure finds its most developed astrological expression in *Zi Wei Dou Shu* (紫微斗數), or Purple Star Astrology. In this system the natal chart is organized into twelve equal palaces, one for each Earthly Branch: Life, Siblings, Spouse, Children, Wealth, Health, Travel, Friends, Career, Property, Mind, Parents. The palaces are experiential sectors functionally equivalent to Western houses, and their equality is structural: it does not depend on where the observer stands on Earth.\n\n#### Kabbalah and the Sefer Yetzirah\n\nThe *Sefer Yetzirah* (Book of Formation, 3rd–6th c. CE) assigns the twenty-two letters of the Hebrew alphabet to the geometry of a cube: three to the three dimensions of space (height, width, depth), seven to the six cardinal directions (up, down, north, south, east, west) and the central point, twelve to the edges where two adjacent faces meet. Kabbalistic commentary has named this model the Cube of Space. §47 of the text, the paragraph listing the twelve diagonal directions, calls these positions *גבולי אלכסון*, "diagonal borders," and associates them with the twelve zodiacal constellations, the twelve months, and twelve principal organs of the body [(Hayman, 2004)](https://doi.org/10.1628/978-3-16-158795-5){{Twelve simple letters: He, Waw, Zayin, Ḥet, Tet, Yod, Lamed, Nun, Samek, Ayin, Sade, Qof. He carved them, he combined them, he hewed them, he weighed them and exchanged them, and formed with them the constellations, the months, and the principal (bodily) organs}}. All twelve edges of a cube are geometrically identical: the solid\'s symmetry permits no hierarchy among them.\n\n#### Pythagoreanism and the regular dodecagon\n\nIn the Pythagorean tradition, numbers are formal principles through which the order of the cosmos becomes intelligible [(Aristotle, *Metaphysics*, c. 350 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0052%3Abook%3D1%3Asection%3D985b){{all other things have their whole nature modelled upon numbers, and that numbers are the ultimate things in the whole physical universe}}. At the centre of this tradition stands the Tetractys, the triangular figure generated by the sum of the first four integers (1 + 2 + 3 + 4 = 10), which the Pythagoreans revered as the foundation of cosmic harmony.\n\nOn a vibrating string, halving the length produces the note an octave higher; shortening it to two-thirds produces the fifth; shortening it to three-quarters produces the fourth. The ratios 2:1, 3:2 and 4:3 use only the numbers 1, 2, 3 and 4 of the Tetractys [(Theon of Smyrna, *Expositio rerum mathematicarum*, c. 115–140 CE)](https://archive.org/details/theonissmyrnaei00theogoog){{τοὺς δὲ συμφωνοῦντας φθόγγους ἐν λόγοις τοῖς πρὸς ἀλλήλους πρῶτος ἀνευρηκέναι δοκεῖ Πυθαγόρας, τοὺς μὲν διὰ τεσσάρων ἐν ἐπιτρίτῳ, τοὺς δὲ διὰ πέντε ἐν ἡμιολίῳ, τοὺς δὲ διὰ πασῶν ἐν διπλασίῳ}}. The least common multiple of 1, 2, 3 and 4 is 12: the smallest integer divisible by each of them. A circle divided into twelve sectors of 30 degrees translates this structure into the plane.\n\nPlato, in the *Timaeus*, closes the system of regular solids by assigning the dodecahedron, the solid with twelve pentagonal faces, to the structure of the whole cosmos: \'the god made use of it for the whole\' [(Plato, *Timaeus*, c. 360 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0180%3Atext%3DTim.%3Asection%3D55c){{And seeing that there still remained one other compound figure, the fifth, God used it up for the Universe in his decoration thereof}}; the reason is that the dodecahedron is the Platonic solid that most closely approximates a sphere, and the Platonic cosmos is spherical [(Zeyl & Sattler, 2022)](https://plato.stanford.edu/entries/plato-timaeus/){{The remaining regular solid, the dodecahedron, is "used for the universe as a whole," since it approaches most nearly the shape of a sphere}}. The regular dodecagon is the planar projection of this cosmological structure: twelve equal sectors, none wider or narrower than the others.\n\n### The metaphysical foundation: the aura and symmetry\n\nThese convergences are explained by the following metaphysical premise: houses are not sectors of celestial space defined by trigonometric formulas, but the twelve sections of the human etheric aura, what the [Book of Caverns](/codex/domification/book-of-caves/cavern/1) depicts as an oval, a magnetic envelope surrounding the human figure.\n\nIf houses are the sections of the aura, the question of their size has a necessary answer: they must be equal. Their size cannot depend on the observer\'s latitude because the aura is an intrinsic property of the being, not of the astronomical horizon. A first house of 40 degrees at Oslo and 28 at Rome would mean that the section of the aura linked to identity changes size with latitude. Within the same chart, a first house wider than the second would mean that the aura devotes more space to identity than to resources. At the poles some houses vanish, and the person would lack the corresponding fields of experience.\n\nThe same structure appears at cosmic scale. The zodiac is the Sun\'s aura: not the Sun\'s apparent path in the sky, but its energy field, divided into twelve equal signs of 30 degrees. No one would dream of dividing the zodiac into unequal parts on the grounds that the constellations sharing their names have different sizes. From a strictly astronomical standpoint, the constellations crossed by the ecliptic are not even twelve: Ophiuchus lies between Scorpius and Sagittarius, and the Sun transits it longer than it transits Scorpius itself. Yet no astrological system includes it among the signs, because the zodiac is not an astronomical catalogue of star clusters: it is a metaphysical and symbolic structure.\n\n## Why the Ascendant is at the fifteenth degree\n\n### The Thema Mundi\n\nIn the fourth century, Firmicus Maternus described the *Thema Mundi*, the mythic birth chart of creation, attributing its doctrine to the Egyptian tradition: the secret had passed from Aesculapius and Anubis to Petosiris and Nechepso through the intermediary of Mercury. In this chart each planet sits at the fifteenth degree of its own domicile: the Sun at 15° Leo, the Moon at 15° Cancer, Saturn at 15° Capricorn, Jupiter at 15° Sagittarius, Mars at 15° Scorpio, Venus at 15° Libra, Mercury at 15° Virgo. The Ascendant is placed at the fifteenth degree of Cancer [(Firmicus Maternus, *Matheseos Libri VIII*, c. 334 CE)](https://www.astrologiahumana.com/firmicusmaternustheoryandpractice.pdf){{the Sun in the 15th degree of Leo, the Moon in the 15th degree of Cancer, Saturn in the 15th degree of Capricorn, Jupiter in the 15th degree of Sagittarius, Mars in the 15th degree of Scorpio, Venus in the 15th degree of Libra, Mercury in the 15th degree of Virgo, and the ascendant in the 15th degree of Cancer}}. The fifteenth degree is the exact center of the sign.\n\nFirmicus makes clear that the *Thema Mundi* is not the account of a historical event: it is a normative model, constructed by ancient sages for astrologers to adopt in the construction of individual charts. The question is: what, concretely, does a model in which every element is centered in its sign teach?\n\nIt cannot teach that planets should be placed at the fifteenth degree: planetary positions are astronomical data determined by the moment of birth, not methodological choices. What the model transmits is a structural principle: the center of the sign is the place of maximum potency. Each planet in the *Thema Mundi* sits in the sign it rules, its strongest essential dignity; placing it at the fifteenth degree brings it to the peak of its strength.\n\nThe Ascendant is the one element for which this principle can be applied operationally. Its zodiacal position is calculated like that of the planets, but the way the houses are organized around it is a methodological choice. The *Thema Mundi* teaches that the organizing point of the chart belongs at the center of the house, not at its edge. Vehlow built his system on this evidence, recognizing in it the original method of ancient Astrology [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Der Aszendent, der die Stunde — hora oder Horoscopus bedeutet, wurde in die Mitte des Zeichens Krebs verlegt. Von Häuserspitzen ist hier nirgends die Rede!}}. The Egyptian origin of the doctrine is why the Vehlow system is also known as Egyptian domification.\n\n### The center as the point of maximum potency\n\nThe Jyotish tradition formalized the same principle with a precise name: *bhava madhya*, literally "middle of the house." The degree of the *lagna* (Ascendant) does not mark the edge of the first house but occupies its center: the house extends 15 degrees before and 15 degrees after the ascending degree. The boundaries between one house and the next are called *bhava sandhi*, the house junctions.\n\nThe distinction between madhya and sandhi has a foundation that is not merely topological but functional. The *Phaladeepika* of Mantreswara, one of the classic texts of Jyotish, establishes an unambiguous principle: even a planet in exaltation or in a friendly sign loses all its efficacy if situated at the *bhava sandhi*; conversely, planets occupying the exact degree of the *bhava madhya* produce the full effects of that house, while those at intermediate positions yield partial effects [(Mantreswara, *Phaladeepika*, 13th c. CE)](https://www.panchanga.lv/wp-content/uploads/2020/06/Phaladipika_Shri-Mantreswara.pdf){{Even if a planet be posited in his sign of exaltation or a friendly sign, he proves in affliction if he is situated in Bhava-Sandhi. The planets occupying the exact degrees (Bhava-Madhya) produce the full effects of that house. The planets situated in Bhava-Sandhi produce no effects}}.\n\nThis gradient of strength transforms the position of the Ascendant from a geometric choice into a functional one. If the center of the house is its point of maximum efficacy, the Ascendant, the most decisive point in the entire chart, must coincide with the *bhava madhya* of the first house. Placing it at the edge would mean situating the organizing principle of the chart at its point of least potency: a structural contradiction.\n\n## Why Placidus fails\n\n### Impossibility above the 60th parallel\n\nPlacidus domification breaks down above approximately 66 degrees latitude. Fomalhaut documented this already in 1897 in his *Manuel d\'astrologie sphérique et judiciaire* [(Nicoullaud, 1897)](https://archive.org/details/BSG_DELTA61179FA){{Or il est inadmissible d\'adopter un système qui ne s\'applique pas à tous les lieux du Globe}}: "It is inadmissible to adopt a system that does not apply to all places on the Globe." This limitation alone should call into question any system claiming to describe a universal order. Inhabitants of Alaska, northern Scandinavia, and Arctic Russia would be excluded from the relationship between cosmos and individual by a defect in the calculation method.\n\n### Distortion of planetary aspects\n\nIn Placidus, the disproportion in house size produces aberrations in aspects between houses. Cases arise where the first house falls in trine with the fourth, or the tenth in sextile with the seventh: houses that should be in square, as they mark the axes of the chart, end up in harmonic relationships. This contradicts the entire structural logic of the horoscope.\n\n### Intercepted signs: an artifact of calculation\n\nIn quadrant house systems like Placidus, houses can exceed 30° in width. When a house is large enough to contain an entire zodiacal sign without that sign appearing on any house cusp, the sign is said to be *intercepted*: it is swallowed by the house, with no cusp of its own. The phenomenon always occurs in opposite pairs. Some astrologers interpret intercepted signs as hidden or blocked energies that are more difficult to express.\n\nThe theory is relatively recent. There are no significant references to interceptions in the classical authors (Vettius Valens, Ptolemy, Manilius) or the medieval ones (Al-Biruni, Masha\'allah, Guido Bonatti), who predominantly used whole sign houses, in which interceptions are structurally impossible. The first book-length treatment appears in the work of Joanne Wickenburg, who published *Intercepted Signs: Environment vs. Destiny* in 1978 [(Wickenburg, 1978)](https://www.goodreads.com/book/show/18669388-intercepted-signs).\n\nInterceptions are artifacts of the calculation method, not real cosmic phenomena. The most telling case is that of the equator: at zero latitude, Placidus houses all measure approximately 30° and interceptions effectively do not occur. Someone born in Quito, Nairobi, or Jakarta has no intercepted signs in their natal chart. As latitude increases, houses begin to distort; above 40° interceptions become systematic; at polar latitudes some houses stretch beyond 60°. The theory implies that entire equatorial populations lack the "hidden energies" it attributes to those born at mid-to-high latitudes, while two twins born at the same moment in Quito and Stockholm would have structurally different charts under the same sky, with the same planets in the same positions. Does it make sense to attribute deep psychological dynamics to an artifact that depends solely on birth latitude?';

	/// en: 'Why we use Vehlow domification'
	String get domificationArticleTitle => 'Why we use Vehlow domification';

	/// en: 'Domification'
	String get domificationSectionTitle => 'Domification';

	/// en: '## Two circles, two rhythms The celestial sphere described in the [previous article](/codex/astronomy-fundamentals/celestial-sphere) needs a coordinate system. Two great circles provide it, and both are projections of real physical phenomena onto the sphere. The first is the **celestial equator**: Earth's equator projected outward onto the celestial sphere. It is perpendicular to Earth's rotation axis. The second is the **ecliptic**: the apparent path the Sun traces through the stars over the course of a year. It is Earth that orbits the Sun, but from our perspective the Sun appears to move against the background of stars, completing one full circuit in about 365.25 days, roughly 1 degree per day. The ecliptic is the single most important circle in astrology: the zodiac is defined along it, planetary positions are measured along it, the houses are divisions of it. ## Obliquity: the tilt The ecliptic is not aligned with the celestial equator. It is tilted at an angle of approximately **23.44 degrees**. This tilt, called the **obliquity of the ecliptic**, exists because Earth's rotation axis is not perpendicular to its orbital plane. Earth spins on an axis tilted about 23.44 degrees from the vertical of its orbit. If Earth's axis were perfectly vertical relative to its orbit, the ecliptic and the equator would coincide. There would be no seasons, the day would always last 12 hours everywhere, and Astrology would lose much of its structure. [EQUATOR_ECLIPTIC_DIAGRAM] The slider moves the Sun along the ecliptic over the course of a year. At the equinoxes, the Sun sits on the celestial equator: day and night have equal length. At the solstices, the Sun reaches its maximum distance from the equator, producing the longest and shortest days of the year. ## Where the circles cross: the equinoxes The celestial equator and the ecliptic intersect at exactly two points. These are the **equinoxes**. The **vernal equinox** (around March 20) is where the Sun crosses the equator moving northward. This point is designated 0 degrees Aries in the tropical zodiac, and it serves as the origin of both the ecliptic coordinate system and the zodiacal signs. The **autumnal equinox** (around September 22) is the opposite crossing, where the Sun moves southward across the equator. This corresponds to 0 degrees Libra. At both equinoxes, the Sun sits exactly on the celestial equator, so day and night are approximately equal in length everywhere on Earth. ## The solstices Halfway between the equinoxes, the Sun reaches its maximum distance from the equator. These points are the **solstices**. The **summer solstice** (around June 21) occurs when the Sun reaches its highest point above the celestial equator, 23.44 degrees to the north. This corresponds to 0 degrees Cancer. The **winter solstice** (around December 21) is when the Sun reaches its lowest point, 23.44 degrees south of the celestial equator, corresponding to 0 degrees Capricorn. ## The cause of seasons The obliquity is the reason seasons exist. When the Sun is on the northern part of the ecliptic (spring and summer in the northern hemisphere), it rises higher in the sky, stays above the horizon longer, and delivers more energy per square meter of ground. When the Sun is on the southern part, the opposite occurs. Seasons are not caused by changes in Earth's distance from the Sun. Earth is actually closest to the Sun in January (perihelion) and farthest in July (aphelion). The effect of distance is negligible compared to the effect of axial tilt. ## The zodiac The zodiac is a band extending roughly 8-9 degrees on each side of the ecliptic. All major planets stay within this band because the solar system is roughly flat: planetary orbits are all close to the same plane. The 12 zodiacal signs divide the ecliptic into 12 equal segments of 30 degrees each, starting from the vernal equinox. These are the tropical signs used in Western astrology. They are defined by the equinoxes and solstices, not by the constellations of the same name (which have drifted due to the [precession of the equinoxes](/codex/astronomy-fundamentals/precession)).'
	String get equatorEclipticContent => '## Two circles, two rhythms\n\nThe celestial sphere described in the [previous article](/codex/astronomy-fundamentals/celestial-sphere) needs a coordinate system. Two great circles provide it, and both are projections of real physical phenomena onto the sphere.\n\nThe first is the **celestial equator**: Earth\'s equator projected outward onto the celestial sphere. It is perpendicular to Earth\'s rotation axis.\n\nThe second is the **ecliptic**: the apparent path the Sun traces through the stars over the course of a year. It is Earth that orbits the Sun, but from our perspective the Sun appears to move against the background of stars, completing one full circuit in about 365.25 days, roughly 1 degree per day. The ecliptic is the single most important circle in astrology: the zodiac is defined along it, planetary positions are measured along it, the houses are divisions of it.\n\n## Obliquity: the tilt\n\nThe ecliptic is not aligned with the celestial equator. It is tilted at an angle of approximately **23.44 degrees**. This tilt, called the **obliquity of the ecliptic**, exists because Earth\'s rotation axis is not perpendicular to its orbital plane. Earth spins on an axis tilted about 23.44 degrees from the vertical of its orbit.\n\nIf Earth\'s axis were perfectly vertical relative to its orbit, the ecliptic and the equator would coincide. There would be no seasons, the day would always last 12 hours everywhere, and Astrology would lose much of its structure.\n\n[EQUATOR_ECLIPTIC_DIAGRAM]\n\nThe slider moves the Sun along the ecliptic over the course of a year.\n\nAt the equinoxes, the Sun sits on the celestial equator: day and night have equal length. At the solstices, the Sun reaches its maximum distance from the equator, producing the longest and shortest days of the year.\n\n## Where the circles cross: the equinoxes\n\nThe celestial equator and the ecliptic intersect at exactly two points. These are the **equinoxes**.\n\nThe **vernal equinox** (around March 20) is where the Sun crosses the equator moving northward. This point is designated 0 degrees Aries in the tropical zodiac, and it serves as the origin of both the ecliptic coordinate system and the zodiacal signs.\n\nThe **autumnal equinox** (around September 22) is the opposite crossing, where the Sun moves southward across the equator. This corresponds to 0 degrees Libra.\n\nAt both equinoxes, the Sun sits exactly on the celestial equator, so day and night are approximately equal in length everywhere on Earth.\n\n## The solstices\n\nHalfway between the equinoxes, the Sun reaches its maximum distance from the equator. These points are the **solstices**.\n\nThe **summer solstice** (around June 21) occurs when the Sun reaches its highest point above the celestial equator, 23.44 degrees to the north. This corresponds to 0 degrees Cancer. The **winter solstice** (around December 21) is when the Sun reaches its lowest point, 23.44 degrees south of the celestial equator, corresponding to 0 degrees Capricorn.\n\n## The cause of seasons\n\nThe obliquity is the reason seasons exist. When the Sun is on the northern part of the ecliptic (spring and summer in the northern hemisphere), it rises higher in the sky, stays above the horizon longer, and delivers more energy per square meter of ground. When the Sun is on the southern part, the opposite occurs.\n\nSeasons are not caused by changes in Earth\'s distance from the Sun. Earth is actually closest to the Sun in January (perihelion) and farthest in July (aphelion). The effect of distance is negligible compared to the effect of axial tilt.\n\n## The zodiac\n\nThe zodiac is a band extending roughly 8-9 degrees on each side of the ecliptic. All major planets stay within this band because the solar system is roughly flat: planetary orbits are all close to the same plane.\n\nThe 12 zodiacal signs divide the ecliptic into 12 equal segments of 30 degrees each, starting from the vernal equinox. These are the tropical signs used in Western astrology. They are defined by the equinoxes and solstices, not by the constellations of the same name (which have drifted due to the [precession of the equinoxes](/codex/astronomy-fundamentals/precession)).';

	/// en: 'Celestial equator and ecliptic'
	String get equatorEclipticTitle => 'Celestial equator and ecliptic';

	/// en: 'Learn More'
	String get exploreMore => 'Learn More';

	/// en: 'This article assumes familiarity with the celestial sphere, celestial equator, and ecliptic. If you are not familiar with these concepts, see the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic). ## The tilted sphere **Latitude** is the angle measuring how far north or south a point on Earth's surface is from the equator: 0 degrees at the equator, 90 degrees at the poles. Stand at the north pole and look up. The north celestial pole, the point around which all stars appear to rotate, sits directly at your zenith. Every star traces a full circle around the pole once in about 24 hours. This circular motion is the same east-to-west drift described in the article on the [celestial sphere](/codex/astronomy-fundamentals/celestial-sphere): the portion of each circle above the horizon is the visible arc from rising to setting; the portion below is the time the star is invisible. Stars do not rise or set. They circle horizontally, eternally above or eternally below the horizon. Stars that never drop below the horizon are called **circumpolar**. At the north pole, every star in the northern celestial hemisphere is circumpolar; every star in the southern hemisphere is permanently invisible. Now travel to the equator. The north celestial pole has dropped all the way to the northern horizon. Stars rise vertically from the east, arc overhead, and set vertically in the west. Every star in the sky is visible for exactly 12 hours out of every 24. Between these two extremes, the sky behaves differently at every latitude. ## The pole and the latitude There is a direct, exact relationship between your geographic latitude and the altitude of the celestial pole above your horizon: **The altitude of the celestial pole equals your latitude.** At Rome (latitude 42 degrees N), the north celestial pole stands 42 degrees above the northern horizon. At London (51.5 degrees N), it stands 51.5 degrees up. At the equator (0 degrees), it sits on the horizon. At the north pole (90 degrees N), it is at the zenith. [LATITUDE_SKY_DIAGRAM] ## The sky at intermediate latitudes At intermediate latitudes like Rome (42 degrees N), the north celestial pole stands 42 degrees above the north cardinal point on the horizon. Stars trace circles around the celestial pole, and the closer a star is to the celestial pole, the tighter its circle. When the circle is tight enough to remain entirely above the horizon, the star is circumpolar. In the interactive diagram, circumpolar stars correspond to the circles that do not cross the horizon line. All other stars rise and set, but they remain above the horizon for different amounts of time. Stars further north of the celestial equator stay visible longer; those further south, for less time. The reason is simple: every star traces a circle around the celestial pole, and the closer a star is to the pole, the more of its circle stays above the horizon.'
	String get latitudeSkyContent => 'This article assumes familiarity with the celestial sphere, celestial equator, and ecliptic. If you are not familiar with these concepts, see the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic).\n\n## The tilted sphere\n\n**Latitude** is the angle measuring how far north or south a point on Earth\'s surface is from the equator: 0 degrees at the equator, 90 degrees at the poles.\n\nStand at the north pole and look up. The north celestial pole, the point around which all stars appear to rotate, sits directly at your zenith. Every star traces a full circle around the pole once in about 24 hours. This circular motion is the same east-to-west drift described in the article on the [celestial sphere](/codex/astronomy-fundamentals/celestial-sphere): the portion of each circle above the horizon is the visible arc from rising to setting; the portion below is the time the star is invisible. Stars do not rise or set. They circle horizontally, eternally above or eternally below the horizon.\n\nStars that never drop below the horizon are called **circumpolar**. At the north pole, every star in the northern celestial hemisphere is circumpolar; every star in the southern hemisphere is permanently invisible.\n\nNow travel to the equator. The north celestial pole has dropped all the way to the northern horizon. Stars rise vertically from the east, arc overhead, and set vertically in the west. Every star in the sky is visible for exactly 12 hours out of every 24.\n\nBetween these two extremes, the sky behaves differently at every latitude.\n\n## The pole and the latitude\n\nThere is a direct, exact relationship between your geographic latitude and the altitude of the celestial pole above your horizon:\n\n**The altitude of the celestial pole equals your latitude.**\n\nAt Rome (latitude 42 degrees N), the north celestial pole stands 42 degrees above the northern horizon. At London (51.5 degrees N), it stands 51.5 degrees up. At the equator (0 degrees), it sits on the horizon. At the north pole (90 degrees N), it is at the zenith.\n\n[LATITUDE_SKY_DIAGRAM]\n\n## The sky at intermediate latitudes\n\nAt intermediate latitudes like Rome (42 degrees N), the north celestial pole stands 42 degrees above the north cardinal point on the horizon. Stars trace circles around the celestial pole, and the closer a star is to the celestial pole, the tighter its circle. When the circle is tight enough to remain entirely above the horizon, the star is circumpolar. In the interactive diagram, circumpolar stars correspond to the circles that do not cross the horizon line.\n\nAll other stars rise and set, but they remain above the horizon for different amounts of time. Stars further north of the celestial equator stay visible longer; those further south, for less time. The reason is simple: every star traces a circle around the celestial pole, and the closer a star is to the pole, the more of its circle stays above the horizon.';

	/// en: 'How latitude changes the sky'
	String get latitudeSkyTitle => 'How latitude changes the sky';

	/// en: 'Methodological note'
	String get methodologicalNote => 'Methodological note';

	/// en: 'Next: ${title}'
	String nextSection({required Object title}) => 'Next: ${title}';

	/// en: 'If you are not familiar with the celestial sphere, celestial equator, and ecliptic, we recommend reading the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section first: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic). ## Houses: dividing the sky into twelve In astrology, the birth chart is divided into twelve houses. Each house governs a domain of experience: identity, resources, communication, home, creativity, and so on. The zodiacal signs and the houses share the number twelve, but they are distinct structures. The signs divide the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) into twelve equal segments of 30 degrees. The houses divide it according to the observer's position on Earth at a specific moment. The question that separates one house system from another is: how should that division be made? ## The Placidus method Placido de Titis, a 17th-century Italian monk, proposed a method based on time. His reasoning starts from a simple observation: every point of the ecliptic rises at the eastern horizon, climbs to its highest point at the meridian (the Midheaven), then descends and sets at the western horizon. The time it takes to travel from rising to culmination is the semi-diurnal arc. Placidus divides this semi-diurnal arc into three equal time intervals. The ecliptic degrees that mark the one-third and two-thirds boundaries become the house cusps. The same procedure is applied to the descending half (from culmination to setting), producing six houses above the horizon and six below. The idea is intuitive: each house represents an equal phase of a degree's journey across the visible sky. ## Why it produces unequal houses The problem is that different parts of the ecliptic travel at different speeds. Some zodiacal degrees spend many hours above the horizon; others spend far fewer. This asymmetry is caused by two factors: the tilt of the ecliptic relative to the celestial equator, and the observer's geographic latitude. When Placidus divides the semi-diurnal arc into equal time segments and then maps those segments back onto the ecliptic, the resulting houses span different numbers of degrees. A house containing degrees of long ascension (slow risers) will be wide; a house containing degrees of short ascension (fast risers) will be narrow. At moderate latitudes like Rome, the difference is noticeable. At high latitudes, it becomes extreme. If these concepts are not immediately clear, that is perfectly normal: they are difficult to visualize without graphical support. The articles that follow are designed for exactly this purpose, with interactive diagrams that help build an intuition for the problem. ## What comes next The articles in this section build the astronomical understanding needed to see exactly how and why this happens: 1. [How latitude changes the sky](/codex/domification/understanding-placido/latitude-sky) shows how the observer's position on Earth determines the orientation of the entire celestial sphere 2. [Semi-diurnal arcs and the ecliptic at the horizon](/codex/domification/understanding-placido/semidiurnal-arcs) explains the mechanism that produces unequal rising times'
	String get placidoIntroContent => 'If you are not familiar with the celestial sphere, celestial equator, and ecliptic, we recommend reading the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section first: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic).\n\n## Houses: dividing the sky into twelve\n\nIn astrology, the birth chart is divided into twelve houses. Each house governs a domain of experience: identity, resources, communication, home, creativity, and so on. The zodiacal signs and the houses share the number twelve, but they are distinct structures. The signs divide the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) into twelve equal segments of 30 degrees. The houses divide it according to the observer\'s position on Earth at a specific moment.\n\nThe question that separates one house system from another is: how should that division be made?\n\n## The Placidus method\n\nPlacido de Titis, a 17th-century Italian monk, proposed a method based on time. His reasoning starts from a simple observation: every point of the ecliptic rises at the eastern horizon, climbs to its highest point at the meridian (the Midheaven), then descends and sets at the western horizon. The time it takes to travel from rising to culmination is the semi-diurnal arc.\n\nPlacidus divides this semi-diurnal arc into three equal time intervals. The ecliptic degrees that mark the one-third and two-thirds boundaries become the house cusps. The same procedure is applied to the descending half (from culmination to setting), producing six houses above the horizon and six below.\n\nThe idea is intuitive: each house represents an equal phase of a degree\'s journey across the visible sky.\n\n## Why it produces unequal houses\n\nThe problem is that different parts of the ecliptic travel at different speeds. Some zodiacal degrees spend many hours above the horizon; others spend far fewer. This asymmetry is caused by two factors: the tilt of the ecliptic relative to the celestial equator, and the observer\'s geographic latitude.\n\nWhen Placidus divides the semi-diurnal arc into equal time segments and then maps those segments back onto the ecliptic, the resulting houses span different numbers of degrees. A house containing degrees of long ascension (slow risers) will be wide; a house containing degrees of short ascension (fast risers) will be narrow. At moderate latitudes like Rome, the difference is noticeable. At high latitudes, it becomes extreme.\n\nIf these concepts are not immediately clear, that is perfectly normal: they are difficult to visualize without graphical support. The articles that follow are designed for exactly this purpose, with interactive diagrams that help build an intuition for the problem.\n\n## What comes next\n\nThe articles in this section build the astronomical understanding needed to see exactly how and why this happens:\n\n1. [How latitude changes the sky](/codex/domification/understanding-placido/latitude-sky) shows how the observer\'s position on Earth determines the orientation of the entire celestial sphere\n2. [Semi-diurnal arcs and the ecliptic at the horizon](/codex/domification/understanding-placido/semidiurnal-arcs) explains the mechanism that produces unequal rising times';

	/// en: 'What is Placido domification'
	String get placidoIntroTitle => 'What is Placido domification';

	/// en: '## What is precession? The precession of the equinoxes is a slow astronomical movement caused by the Earth behaving like a gigantic gyroscope. The Earth is not a perfect sphere: it is slightly flattened at the poles. The combined gravitational pull of the Sun and Moon on the equatorial bulge causes our planet's axis to trace a circle in space over approximately 25,772 years, in a motion similar to that of a spinning top. This motion has an important consequence: the celestial north pole changes position from one epoch to the next and the background stars slowly drift relative to the zodiacal signs. Precession produces a measurable difference between two types of year: the **tropical year** (the time between two successive vernal equinoxes, 365 days 5 hours 48 minutes 45 seconds) and the **sidereal year** (the time for the Sun to return to the same position relative to the fixed stars, 365 days 6 hours 9 minutes 10 seconds). The difference of approximately 20 minutes accumulates over the centuries, revealing the shift of the vernal point. [PRECESSION_DIAGRAM] ## The discovery of precession The first scientific measurement of this discrepancy is owed to Hipparchus of Nicaea (c. 190-120 BCE), who compared his observations with those of his Greek predecessors Timocharis and Aristyllus and detected a 2° shift of the star Spica relative to the autumnal equinox. The thesis that Babylonian astronomers had already formalised the discovery has been refuted [(Neugebauer, 1950)](https://www.jstor.org/stable/595428){{there is no basis visible anywhere in the cuneiform texts of the Seleucid period to support the assumption of a conscious recognition of precession}}. The phenomenon was however observed before Hipparchus: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations. A systematic review of archaeoastronomical evidence has concluded that although definitive proof is still lacking the quantity of hints is remarkable [(Magli, 2004)](https://arxiv.org/pdf/physics/0407108){{Although definitive evidence of the discovery is still lacking, the quantity of hints (for instance, coming from ancient Egypt) is impressive and stimulating}}. ## The astrological ages As the Earth's axis shifts, the relationship between the equator and the ecliptic changes, and the equinoxes and solstices move by approximately one degree every 71.6 years. The Gamma point (0° Aries), from which ecliptic longitudes are measured in both Astrology and Astronomy, slowly moves backward through the zodiacal constellations: - **Age of Aries** (c. 2160-60 BCE): marked by the rise of great military civilizations and the individual hero. From the Egyptian New Kingdom to Persia, from the Greek city-states to the Roman Republic, empires expand through conquest. Aries is a fire sign ruled by Mars: the era's dominant themes are assertion of individual will, military valor, the quest for glory, and the founding of new orders through force and law - **Age of Pisces** (from c. 60 BCE): marked by the birth and spread of Christianity, whose earliest symbol is the fish. The Greek word ἰχθύς (ichthýs, "fish") forms the acronym for "Jesus Christ, Son of God, Saviour"; the first Christians used it as a sign of recognition during the persecutions. The era's dominant themes reflect the qualities of the sign: compassion, sacrifice, faith, devotion, seeking salvation through an external spiritual authority - **Age of Aquarius**: the next great cycle, whose beginning has been variously estimated between the twenty-second and twenty-seventh century. Aquarius is an air sign: astrological tradition associates it with scientific and technological progress, the pursuit of universal brotherhood and individual freedom, the replacement of blind faith by inner knowledge, and collective consciousness taking the place of obedience to authority The dates above are approximate, and the formal concept of precessional ages is more recent than commonly assumed. The first systematic theory linking historical periods to the precession of the equinoxes was formulated not in antiquity but during the French Enlightenment, by Charles-François Dupuis and Constantin-François Volney [(Campion, 2011)](https://constable.blog/wp-content/uploads/15-1_Campion_Age_Aquarius-1.pdf){{there are no extant classical or medieval astrological texts that attribute any astrological or historical significance to precession. Instead the increasing separation between the tropical and sidereal zodiacs was used to discredit astrology}}. There is not a single known example of this use of precession by astrologers before the late nineteenth century. Between the Middle Ages and the Renaissance, astrologers such as Guido Bonatti and Tommaso Campanella regarded the divergence between tropical and sidereal zodiacs as a problem for astrology, not as a forecasting tool. The observation, however, predates the formalization by millennia: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations. The astrological zodiac divides the ecliptic into twelve equal arcs of 30 degrees measured from the vernal point; the constellations that share these names span very different sizes and their boundaries, conventionally fixed by the International Astronomical Union in 1930, do not coincide with these divisions. There is no single criterion for establishing the exact moment when one age ends and the next begins, and published estimates span over two thousand years. Johannes Vehlow placed the transition in 1793, coinciding with the French Revolution [(Vehlow, 1934)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_VIII.pdf){{So hat sich mit Hilfe der statischen, weltpolitischen Achsen endlich eindeutig feststellen lassen, wo sich gegenwärtig der Frühlingspunkt, am Sternbilderzodiakus gemessen, befindet. Die beiden anfangs erwähnten französischen Autoren hatten mit ihren Feststellungen also recht, und mit ihnen nehmen wir an, daß das Wassermannzeitalter bereits im Jahre 1793, zur Zeit der französischen Revolution begonnen hat!}}; the latest estimate, 2597, is owed to Jean Meeus and rests on the IAU constellation boundaries fixed in 1930 [(Meeus, 1997)](https://openlibrary.org/isbn/9780943396514){{Not until A.D. 2597 will the March equinox cross the boundary into Aquarius.}}. As [argued in the discussion on domification](/codex/domification/why-vehlow), the premise of a calculation is more important than the calculation itself: determining the start of an astrological age on the basis of IAU constellation boundaries amounts to superimposing a modern astronomical criterion on a millennial symbolic system, much as Placidus domification juxtaposes [semi-diurnal arcs](/codex/domification/understanding-placido/semidiurnal-arcs) onto an order that is not astronomical but metaphysical. Equal 30-degree divisions, more consistent with the structure of the astrological zodiac, place the transition around the twenty-second century. The vernal point currently lies within the constellation of Pisces by every calculation method. The mundane astrology of Great Conjunctions offers another interpretation of the Aquarian themes attributed to contemporary society, without requiring a change of precessional age. Jupiter and Saturn conjoin approximately every twenty years. Their conjunctions form sequences occurring predominantly in signs of the same element, with some interruptions. The conjunctions of 1980–1981 took place in Libra, an Air sign, while the conjunction of 2000 returned to an Earth sign. The conjunction of 21 December 2020 in Aquarius marks the beginning of a series predominantly in Air signs [(Nolle, n.d.)](https://www.astropro.com/features/tables/geo/ju-sa/ju000sa.html){{It begins with the December 21, 2020 alignment and concludes with the 2199 conjunction}}. In an astrological interpretation, this transition can be associated with themes of communication and collective networks, without implying the beginning of the Age of Aquarius. ## From Bull to Ram in pharaonic Egypt Among the hints that Magli calls "impressive and stimulating," the Egyptian case deserves close examination. In pharaonic Egypt the transition from one animal cult to another can be traced across iconographic, architectural, and textual sources over more than two thousand years. ### The three sacred bulls Ancient Egypt venerated three sacred bulls, each at a major religious center. At Memphis resided the **Apis**, the living manifestation (in Egyptian, the *Ba*) of the creator god Ptah. The cult dates to the First Dynasty, around 3100 BCE [(Simpson, 1957)](https://www.jstor.org/stable/43581573){{Facing the name of the Horus 'Aha is the text: sp tpy pḥrr Ḥp, "the first occasion of the running of the Apis". The text thus provides us with an earlier mention of the running of the Apis than that given for the reign of Dn by the sealing from Saḳḳarah and the text of the Palermo Stone}}. Upon death the bull was mummified and buried in the Serapeum of Saqqara, the necropolis of Memphis discovered by Auguste Mariette in 1851. ![The Apis bull, with its characteristic black-and-white markings and the solar disc between its horns](codex/apis.webp) At Heliopolis, the **Mnevis**, herald of the sun god Re-Atum. The "bull of Heliopolis" appears in the Pyramid Texts of the Fifth Dynasty (c. 2350 BCE), squarely in the Age of Taurus [(Allen, 2005)](https://archive.org/details/the-ancient-egyptian-pyramid-texts_202103){{Unis has come against you: it is Unis, wild bull of the savannah, a bigfaced bull who comes from Heliopolis — Pyramid of Unis, Recitation 212}}. At Hermonthis, the **Buchis**, incarnation of the war god Montu [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Montu could also be represented in the form of his sacred bull, the Buchis, or occasionally in the later dynasties as a bull-headed man}} and living Ba of the sun god Re. The Bucheum, its burial necropolis discovered by Robert Mond and Oliver Myers, preserves stelae that acclaim the bull with this title [(Mond & Myers, 1934)](https://archive.org/details/EXCMEM41_2){{there appeared Buchis, the living Ba of Re, manifestation of Re. He was born in Hermonthis}}. Not by chance, in the Egyptian language the word *Ka* means both "bull" and "life force", the spiritual principle that accompanies every person from birth to death: for the ancient Egyptians the bull embodied the life force itself [(Gordon & Schwabe, 2004)](https://doi.org/10.1163/9789047404163){{ka was also the name for 'bull', an equation surely not meaningless to the Egyptians}}. ![Left: Ka statue of pharaoh Hor I (ca. 1760 BCE, Egyptian Museum, Cairo). Right: temple relief. The hieroglyph on the head depicts two raised arms, meaning both "bull" and "life force"](codex/ka.webp) ### From Montu to Amun Between the Old Kingdom and the Middle Kingdom, the capital of Egypt was Thebes, whose chief deity was none other than Montu. The last three rulers of the Eleventh Dynasty bore the name Mentuhotep ("Montu is satisfied"); the Twelfth Dynasty that followed produced four Amenemhats ("Amun is at the forefront") and not a single Mentuhotep. Within a century and a half Amun gradually displaced Montu and rose to the position of supreme god of the entire Egyptian pantheon [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Within a century and a half Amun gradually displaced the old god of that region, Montu, and the ascendancy of the Theban kings in Middle and New Kingdom times eventually propelled him (as the combined Amun-Re) to the position of supreme god of the Egyptian pantheon}}. Amun is a ram-headed god. Amenemhat I moved the capital to Itjtawy, but Thebes remained the religious center of Egypt: the great temple complex of Karnak, originally dedicated to Montu, became the sanctuary of Amun-Re. Its processional avenues are lined with ram-headed sphinxes. ![Criosphinxes along the processional avenue of the Karnak temple. Each ram-headed sphinx protects a small figure of the pharaoh between its front paws](codex/karnak.webp) The chronology of this transition is noteworthy [(Angelini, 1988)](https://www.kemiassociazione.it){{Verso il 2200 il punto Gamma passa da Toro ad Ariete, cade la XII Dinastia ed in Egitto vi è l'avvento di AMON, la Testa di Ariete}}. The Age of Taurus ends around 2160 BCE; the fall of the Old Kingdom is dated to approximately 2181 BCE. In the Age of Aries that follows, Amun rises to become king of the gods. For over twenty centuries Egyptian theology venerated the bull as supreme symbol in the Age of Taurus and the ram in the Age of Aries.'
	String get precessionContent => '## What is precession?\n\nThe precession of the equinoxes is a slow astronomical movement caused by the Earth behaving like a gigantic gyroscope. The Earth is not a perfect sphere: it is slightly flattened at the poles. The combined gravitational pull of the Sun and Moon on the equatorial bulge causes our planet\'s axis to trace a circle in space over approximately 25,772 years, in a motion similar to that of a spinning top.\n\nThis motion has an important consequence: the celestial north pole changes position from one epoch to the next and the background stars slowly drift relative to the zodiacal signs. Precession produces a measurable difference between two types of year: the **tropical year** (the time between two successive vernal equinoxes, 365 days 5 hours 48 minutes 45 seconds) and the **sidereal year** (the time for the Sun to return to the same position relative to the fixed stars, 365 days 6 hours 9 minutes 10 seconds). The difference of approximately 20 minutes accumulates over the centuries, revealing the shift of the vernal point.\n\n[PRECESSION_DIAGRAM]\n\n## The discovery of precession\n\nThe first scientific measurement of this discrepancy is owed to Hipparchus of Nicaea (c. 190-120 BCE), who compared his observations with those of his Greek predecessors Timocharis and Aristyllus and detected a 2° shift of the star Spica relative to the autumnal equinox. The thesis that Babylonian astronomers had already formalised the discovery has been refuted [(Neugebauer, 1950)](https://www.jstor.org/stable/595428){{there is no basis visible anywhere in the cuneiform texts of the Seleucid period to support the assumption of a conscious recognition of precession}}. The phenomenon was however observed before Hipparchus: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations. A systematic review of archaeoastronomical evidence has concluded that although definitive proof is still lacking the quantity of hints is remarkable [(Magli, 2004)](https://arxiv.org/pdf/physics/0407108){{Although definitive evidence of the discovery is still lacking, the quantity of hints (for instance, coming from ancient Egypt) is impressive and stimulating}}.\n\n## The astrological ages\n\nAs the Earth\'s axis shifts, the relationship between the equator and the ecliptic changes, and the equinoxes and solstices move by approximately one degree every 71.6 years. The Gamma point (0° Aries), from which ecliptic longitudes are measured in both Astrology and Astronomy, slowly moves backward through the zodiacal constellations:\n\n- **Age of Aries** (c. 2160-60 BCE): marked by the rise of great military civilizations and the individual hero. From the Egyptian New Kingdom to Persia, from the Greek city-states to the Roman Republic, empires expand through conquest. Aries is a fire sign ruled by Mars: the era\'s dominant themes are assertion of individual will, military valor, the quest for glory, and the founding of new orders through force and law\n- **Age of Pisces** (from c. 60 BCE): marked by the birth and spread of Christianity, whose earliest symbol is the fish. The Greek word ἰχθύς (ichthýs, "fish") forms the acronym for "Jesus Christ, Son of God, Saviour"; the first Christians used it as a sign of recognition during the persecutions. The era\'s dominant themes reflect the qualities of the sign: compassion, sacrifice, faith, devotion, seeking salvation through an external spiritual authority\n- **Age of Aquarius**: the next great cycle, whose beginning has been variously estimated between the twenty-second and twenty-seventh century. Aquarius is an air sign: astrological tradition associates it with scientific and technological progress, the pursuit of universal brotherhood and individual freedom, the replacement of blind faith by inner knowledge, and collective consciousness taking the place of obedience to authority\n\nThe dates above are approximate, and the formal concept of precessional ages is more recent than commonly assumed. The first systematic theory linking historical periods to the precession of the equinoxes was formulated not in antiquity but during the French Enlightenment, by Charles-François Dupuis and Constantin-François Volney [(Campion, 2011)](https://constable.blog/wp-content/uploads/15-1_Campion_Age_Aquarius-1.pdf){{there are no extant classical or medieval astrological texts that attribute any astrological or historical significance to precession. Instead the increasing separation between the tropical and sidereal zodiacs was used to discredit astrology}}. There is not a single known example of this use of precession by astrologers before the late nineteenth century. Between the Middle Ages and the Renaissance, astrologers such as Guido Bonatti and Tommaso Campanella regarded the divergence between tropical and sidereal zodiacs as a problem for astrology, not as a forecasting tool. The observation, however, predates the formalization by millennia: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations.\n\nThe astrological zodiac divides the ecliptic into twelve equal arcs of 30 degrees measured from the vernal point; the constellations that share these names span very different sizes and their boundaries, conventionally fixed by the International Astronomical Union in 1930, do not coincide with these divisions. There is no single criterion for establishing the exact moment when one age ends and the next begins, and published estimates span over two thousand years. Johannes Vehlow placed the transition in 1793, coinciding with the French Revolution [(Vehlow, 1934)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_VIII.pdf){{So hat sich mit Hilfe der statischen, weltpolitischen Achsen endlich eindeutig feststellen lassen, wo sich gegenwärtig der Frühlingspunkt, am Sternbilderzodiakus gemessen, befindet. Die beiden anfangs erwähnten französischen Autoren hatten mit ihren Feststellungen also recht, und mit ihnen nehmen wir an, daß das Wassermannzeitalter bereits im Jahre 1793, zur Zeit der französischen Revolution begonnen hat!}}; the latest estimate, 2597, is owed to Jean Meeus and rests on the IAU constellation boundaries fixed in 1930 [(Meeus, 1997)](https://openlibrary.org/isbn/9780943396514){{Not until A.D. 2597 will the March equinox cross the boundary into Aquarius.}}. As [argued in the discussion on domification](/codex/domification/why-vehlow), the premise of a calculation is more important than the calculation itself: determining the start of an astrological age on the basis of IAU constellation boundaries amounts to superimposing a modern astronomical criterion on a millennial symbolic system, much as Placidus domification juxtaposes [semi-diurnal arcs](/codex/domification/understanding-placido/semidiurnal-arcs) onto an order that is not astronomical but metaphysical. Equal 30-degree divisions, more consistent with the structure of the astrological zodiac, place the transition around the twenty-second century. The vernal point currently lies within the constellation of Pisces by every calculation method.\n\nThe mundane astrology of Great Conjunctions offers another interpretation of the Aquarian themes attributed to contemporary society, without requiring a change of precessional age.\n\nJupiter and Saturn conjoin approximately every twenty years. Their conjunctions form sequences occurring predominantly in signs of the same element, with some interruptions. The conjunctions of 1980–1981 took place in Libra, an Air sign, while the conjunction of 2000 returned to an Earth sign. The conjunction of 21 December 2020 in Aquarius marks the beginning of a series predominantly in Air signs [(Nolle, n.d.)](https://www.astropro.com/features/tables/geo/ju-sa/ju000sa.html){{It begins with the December 21, 2020 alignment and concludes with the 2199 conjunction}}. In an astrological interpretation, this transition can be associated with themes of communication and collective networks, without implying the beginning of the Age of Aquarius.\n\n## From Bull to Ram in pharaonic Egypt\n\nAmong the hints that Magli calls "impressive and stimulating," the Egyptian case deserves close examination. In pharaonic Egypt the transition from one animal cult to another can be traced across iconographic, architectural, and textual sources over more than two thousand years.\n\n### The three sacred bulls\n\nAncient Egypt venerated three sacred bulls, each at a major religious center.\n\nAt Memphis resided the **Apis**, the living manifestation (in Egyptian, the *Ba*) of the creator god Ptah. The cult dates to the First Dynasty, around 3100 BCE [(Simpson, 1957)](https://www.jstor.org/stable/43581573){{Facing the name of the Horus \'Aha is the text: sp tpy pḥrr Ḥp, "the first occasion of the running of the Apis". The text thus provides us with an earlier mention of the running of the Apis than that given for the reign of Dn by the sealing from Saḳḳarah and the text of the Palermo Stone}}. Upon death the bull was mummified and buried in the Serapeum of Saqqara, the necropolis of Memphis discovered by Auguste Mariette in 1851.\n\n![The Apis bull, with its characteristic black-and-white markings and the solar disc between its horns](codex/apis.webp)\n\nAt Heliopolis, the **Mnevis**, herald of the sun god Re-Atum. The "bull of Heliopolis" appears in the Pyramid Texts of the Fifth Dynasty (c. 2350 BCE), squarely in the Age of Taurus [(Allen, 2005)](https://archive.org/details/the-ancient-egyptian-pyramid-texts_202103){{Unis has come against you: it is Unis, wild bull of the savannah, a bigfaced bull who comes from Heliopolis — Pyramid of Unis, Recitation 212}}.\n\nAt Hermonthis, the **Buchis**, incarnation of the war god Montu [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Montu could also be represented in the form of his sacred bull, the Buchis, or occasionally in the later dynasties as a bull-headed man}} and living Ba of the sun god Re. The Bucheum, its burial necropolis discovered by Robert Mond and Oliver Myers, preserves stelae that acclaim the bull with this title [(Mond & Myers, 1934)](https://archive.org/details/EXCMEM41_2){{there appeared Buchis, the living Ba of Re, manifestation of Re. He was born in Hermonthis}}.\n\nNot by chance, in the Egyptian language the word *Ka* means both "bull" and "life force", the spiritual principle that accompanies every person from birth to death: for the ancient Egyptians the bull embodied the life force itself [(Gordon & Schwabe, 2004)](https://doi.org/10.1163/9789047404163){{ka was also the name for \'bull\', an equation surely not meaningless to the Egyptians}}.\n\n![Left: Ka statue of pharaoh Hor I (ca. 1760 BCE, Egyptian Museum, Cairo). Right: temple relief. The hieroglyph on the head depicts two raised arms, meaning both "bull" and "life force"](codex/ka.webp)\n\n### From Montu to Amun\n\nBetween the Old Kingdom and the Middle Kingdom, the capital of Egypt was Thebes, whose chief deity was none other than Montu. The last three rulers of the Eleventh Dynasty bore the name Mentuhotep ("Montu is satisfied"); the Twelfth Dynasty that followed produced four Amenemhats ("Amun is at the forefront") and not a single Mentuhotep. Within a century and a half Amun gradually displaced Montu and rose to the position of supreme god of the entire Egyptian pantheon [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Within a century and a half Amun gradually displaced the old god of that region, Montu, and the ascendancy of the Theban kings in Middle and New Kingdom times eventually propelled him (as the combined Amun-Re) to the position of supreme god of the Egyptian pantheon}}. Amun is a ram-headed god. Amenemhat I moved the capital to Itjtawy, but Thebes remained the religious center of Egypt: the great temple complex of Karnak, originally dedicated to Montu, became the sanctuary of Amun-Re. Its processional avenues are lined with ram-headed sphinxes.\n\n![Criosphinxes along the processional avenue of the Karnak temple. Each ram-headed sphinx protects a small figure of the pharaoh between its front paws](codex/karnak.webp)\n\nThe chronology of this transition is noteworthy [(Angelini, 1988)](https://www.kemiassociazione.it){{Verso il 2200 il punto Gamma passa da Toro ad Ariete, cade la XII Dinastia ed in Egitto vi è l\'avvento di AMON, la Testa di Ariete}}. The Age of Taurus ends around 2160 BCE; the fall of the Old Kingdom is dated to approximately 2181 BCE. In the Age of Aries that follows, Amun rises to become king of the gods. For over twenty centuries Egyptian theology venerated the bull as supreme symbol in the Age of Taurus and the ram in the Age of Aries.';

	/// en: 'Precession of the Equinoxes'
	String get precessionTitle => 'Precession of the Equinoxes';

	/// en: 'Read the methodological note'
	String get readMethodologicalNote => 'Read the methodological note';

	/// en: 'Three factors govern the way ecliptic degrees rise at the horizon: [Earth's rotation](/codex/astronomy-fundamentals/celestial-sphere), the tilt of the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) relative to the equator, and the observer's [latitude](/codex/domification/understanding-placido/latitude-sky). This article shows how their combination produces the phenomenon at the heart of Placidus domification: the fact that different ecliptic degrees take different amounts of time to rise. ## The arc of a star's day Every celestial body that rises and sets traces an arc across the sky. The full arc from rising to setting is the **diurnal arc**. Half of it, from rising to culmination or from culmination to setting, is the **semi-diurnal arc**. For a star sitting exactly on the celestial equator, the math is simple. The equator is a great circle perpendicular to the axis of rotation, so it is always cut in half by the horizon. An equatorial star spends exactly 12 hours above the horizon and 12 hours below. Its semi-diurnal arc is exactly 6 hours, or 90 degrees of rotation. But most celestial bodies are not on the equator. ## Declination and time above the horizon A star with positive declination, north of the equator, in the northern hemisphere spends more than 12 hours above the horizon. Its diurnal arc is longer than 180 degrees and its semi-diurnal arc is longer than 90 degrees. A star with negative declination spends less than 12 hours up. Its semi-diurnal arc is shorter than 90 degrees. The reason is geometric: every star traces a circle around the celestial pole. When the pole is high above the horizon, stars orbiting close to it describe circles that remain almost entirely above the horizon line, so they stay visible longer. Stars far from the pole trace circles that pass mostly below the horizon. The effect grows with latitude, because at higher latitudes the celestial pole is higher and the disparity between the circles increases. [LATITUDE_SKY_DIAGRAM] The formula connecting declination (d), observer's latitude (L), and the semi-diurnal arc (H) is: **cos(H) = -tan(L) x tan(d)** At Rome (L = 42 degrees), a star with declination +23.44 degrees, the maximum solar declination at the summer solstice, has a semi-diurnal arc of about 113 degrees, corresponding to roughly 7 hours and 32 minutes. The same calculation for declination -23.44 degrees gives about 67 degrees, or roughly 4 hours and 28 minutes. That is a difference of just over three hours. The summer solstice point spends about 15 hours and 4 minutes above the horizon; the winter solstice point spends about 8 hours and 56 minutes. ## The ecliptic at the horizon Each degree of the ecliptic has a different declination, from +23.44° at 0° Cancer to -23.44° at 0° Capricorn, so each has its own semi-diurnal arc. But Placidus house division rests on a closely related phenomenon: the speed at which ecliptic degrees cross the horizon at the moment of rising. The celestial sphere rotates at a constant speed: one full turn per sidereal day. But the Ascendant, the zodiacal degree rising in the east, does not advance through the zodiac at a constant speed. Sometimes it crosses many degrees in an hour and sometimes few. The reason: because the ecliptic is a circle tilted 23.44° from the equator, as the sky rotates its different segments arrive at the eastern horizon at different angles. [ECLIPTIC_RISING_COMPARISON_DIAGRAM] [ECLIPTIC_HORIZON_DIAGRAM] When the ecliptic cuts the horizon nearly perpendicularly, zodiacal degrees are stacked on top of one another. The rotation carries them downward, not along the horizon: each must cross the horizon line individually. Few degrees rise in a given interval of time. These are called **signs of long ascension**. When the ecliptic runs nearly parallel to the horizon, many degrees lie near the horizon line simultaneously. The rotation sweeps them past the edge almost together: many degrees rise in the same time. These are **signs of short ascension**. [SEMIDIURNAL_ARC_DIAGRAM] The latitude slider changes the overall tilt of the celestial sphere relative to the horizon. The hour slider shows the sky's daily rotation: the way the horizon successively meets different parts of the ecliptic. At the equator the effect almost disappears, because every stretch of the ecliptic meets the horizon at a similar angle. At Rome the difference is already clear and at higher latitudes it becomes stronger. ## How Placidus derives the houses At this point the decisive step becomes visible. The Ascendant is the degree rising now in the east. The Midheaven is the degree culminating at the meridian. Between those two points there is a whole stretch of the ecliptic in motion, but Placidus does not divide it into three equal arcs of 30 degrees. It divides it into **three equal times**. In practice, it takes the journey a degree makes from rising to culmination and looks for two intermediate temporal thresholds: the point reached after one third of the time and the point reached after two thirds. The ecliptic degrees corresponding to those two temporal thresholds become the intermediate house cusps of that quadrant. The same criterion is applied to the other quadrants of the chart. The result is not a sequence of cusps spaced regularly every 30 degrees, because ecliptic degrees do not all rise at the same speed. Where rising is slow, translating time into zodiacal longitude gives one outcome; where rising is fast, it gives another. That is why Placidus produces unequal houses: the principle of division remains the same, time, but the zodiacal degrees on which that time falls change continuously with latitude, obliquity, and daily rotation. The following diagram shows the concrete result: the twelve Placidus houses seen from above, with a slider to vary the latitude. At the equator all houses are equal, because every stretch of the ecliptic rises at the same speed. As latitude increases, the disparity between houses grows until it becomes extreme near the poles. [PLACIDO_DIAGRAM]'
	String get semidiurnalArcsContent => 'Three factors govern the way ecliptic degrees rise at the horizon: [Earth\'s rotation](/codex/astronomy-fundamentals/celestial-sphere), the tilt of the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) relative to the equator, and the observer\'s [latitude](/codex/domification/understanding-placido/latitude-sky). This article shows how their combination produces the phenomenon at the heart of Placidus domification: the fact that different ecliptic degrees take different amounts of time to rise.\n\n## The arc of a star\'s day\n\nEvery celestial body that rises and sets traces an arc across the sky. The full arc from rising to setting is the **diurnal arc**. Half of it, from rising to culmination or from culmination to setting, is the **semi-diurnal arc**.\n\nFor a star sitting exactly on the celestial equator, the math is simple. The equator is a great circle perpendicular to the axis of rotation, so it is always cut in half by the horizon. An equatorial star spends exactly 12 hours above the horizon and 12 hours below. Its semi-diurnal arc is exactly 6 hours, or 90 degrees of rotation.\n\nBut most celestial bodies are not on the equator.\n\n## Declination and time above the horizon\n\nA star with positive declination, north of the equator, in the northern hemisphere spends more than 12 hours above the horizon. Its diurnal arc is longer than 180 degrees and its semi-diurnal arc is longer than 90 degrees.\n\nA star with negative declination spends less than 12 hours up. Its semi-diurnal arc is shorter than 90 degrees.\n\nThe reason is geometric: every star traces a circle around the celestial pole. When the pole is high above the horizon, stars orbiting close to it describe circles that remain almost entirely above the horizon line, so they stay visible longer. Stars far from the pole trace circles that pass mostly below the horizon. The effect grows with latitude, because at higher latitudes the celestial pole is higher and the disparity between the circles increases.\n\n[LATITUDE_SKY_DIAGRAM]\n\nThe formula connecting declination (d), observer\'s latitude (L), and the semi-diurnal arc (H) is:\n\n**cos(H) = -tan(L) x tan(d)**\n\nAt Rome (L = 42 degrees), a star with declination +23.44 degrees, the maximum solar declination at the summer solstice, has a semi-diurnal arc of about 113 degrees, corresponding to roughly 7 hours and 32 minutes. The same calculation for declination -23.44 degrees gives about 67 degrees, or roughly 4 hours and 28 minutes.\n\nThat is a difference of just over three hours. The summer solstice point spends about 15 hours and 4 minutes above the horizon; the winter solstice point spends about 8 hours and 56 minutes.\n\n## The ecliptic at the horizon\n\nEach degree of the ecliptic has a different declination, from +23.44° at 0° Cancer to -23.44° at 0° Capricorn, so each has its own semi-diurnal arc. But Placidus house division rests on a closely related phenomenon: the speed at which ecliptic degrees cross the horizon at the moment of rising.\n\nThe celestial sphere rotates at a constant speed: one full turn per sidereal day. But the Ascendant, the zodiacal degree rising in the east, does not advance through the zodiac at a constant speed. Sometimes it crosses many degrees in an hour and sometimes few. The reason: because the ecliptic is a circle tilted 23.44° from the equator, as the sky rotates its different segments arrive at the eastern horizon at different angles.\n\n[ECLIPTIC_RISING_COMPARISON_DIAGRAM]\n\n[ECLIPTIC_HORIZON_DIAGRAM]\n\nWhen the ecliptic cuts the horizon nearly perpendicularly, zodiacal degrees are stacked on top of one another. The rotation carries them downward, not along the horizon: each must cross the horizon line individually. Few degrees rise in a given interval of time. These are called **signs of long ascension**.\n\nWhen the ecliptic runs nearly parallel to the horizon, many degrees lie near the horizon line simultaneously. The rotation sweeps them past the edge almost together: many degrees rise in the same time. These are **signs of short ascension**.\n\n[SEMIDIURNAL_ARC_DIAGRAM]\n\nThe latitude slider changes the overall tilt of the celestial sphere relative to the horizon. The hour slider shows the sky\'s daily rotation: the way the horizon successively meets different parts of the ecliptic. At the equator the effect almost disappears, because every stretch of the ecliptic meets the horizon at a similar angle. At Rome the difference is already clear and at higher latitudes it becomes stronger.\n\n## How Placidus derives the houses\n\nAt this point the decisive step becomes visible. The Ascendant is the degree rising now in the east. The Midheaven is the degree culminating at the meridian. Between those two points there is a whole stretch of the ecliptic in motion, but Placidus does not divide it into three equal arcs of 30 degrees.\n\nIt divides it into **three equal times**.\n\nIn practice, it takes the journey a degree makes from rising to culmination and looks for two intermediate temporal thresholds: the point reached after one third of the time and the point reached after two thirds. The ecliptic degrees corresponding to those two temporal thresholds become the intermediate house cusps of that quadrant.\n\nThe same criterion is applied to the other quadrants of the chart. The result is not a sequence of cusps spaced regularly every 30 degrees, because ecliptic degrees do not all rise at the same speed. Where rising is slow, translating time into zodiacal longitude gives one outcome; where rising is fast, it gives another.\n\nThat is why Placidus produces unequal houses: the principle of division remains the same, time, but the zodiacal degrees on which that time falls change continuously with latitude, obliquity, and daily rotation.\n\nThe following diagram shows the concrete result: the twelve Placidus houses seen from above, with a slider to vary the latitude. At the equator all houses are equal, because every stretch of the ecliptic rises at the same speed. As latitude increases, the disparity between houses grows until it becomes extreme near the poles.\n\n[PLACIDO_DIAGRAM]';

	/// en: 'Semi-diurnal arcs and the ecliptic at the horizon'
	String get semidiurnalArcsTitle => 'Semi-diurnal arcs and the ecliptic at the horizon';

	/// en: 'Understanding Placido domification'
	String get understandingPlacidoTitle => 'Understanding Placido domification';
}

// Path: legal
class Translations$legal$en {
	Translations$legal$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Users are free to close their account and cease using the Service at any time by following this procedure:'
	String get accountClosureProcedure => 'Users are free to close their account and cease using the Service at any time by following this procedure:';

	/// en: 'Account Closure'
	String get accountClosureTitle => 'Account Closure';

	/// en: 'Account Requirements'
	String get accountRequirements => 'Account Requirements';

	/// en: 'By creating an account, the User accepts to be fully responsible for all activities carried out with their access credentials. Users are required to inform the Owner immediately and unambiguously through the [contact details indicated in this document](mailto:contact@astrogods.it) if they believe that their personal information, such as the User account, access credentials or personal data, have been violated, unlawfully disclosed or stolen.'
	String get accountResponsibility => 'By creating an account, the User accepts to be fully responsible for all activities carried out with their access credentials. Users are required to inform the Owner immediately and unambiguously through the [contact details indicated in this document](mailto:contact@astrogods.it) if they believe that their personal information, such as the User account, access credentials or personal data, have been violated, unlawfully disclosed or stolen.';

	/// en: 'Unless expressly permitted, a User's account may not be shared with other people.'
	String get accountSharingProhibited => 'Unless expressly permitted, a User\'s account may not be shared with other people.';

	/// en: 'Account Suspension and Cancellation'
	String get accountSuspension => 'Account Suspension and Cancellation';

	/// en: 'The Owner reserves the right to suspend or cancel a User's account at any time at its sole discretion and without notice if deemed inappropriate, offensive, or contrary to these Terms.'
	String get accountSuspensionText => 'The Owner reserves the right to suspend or cancel a User\'s account at any time at its sole discretion and without notice if deemed inappropriate, offensive, or contrary to these Terms.';

	/// en: 'acts that may considerably harm the Owner's legitimate interests;'
	String get actsHarmingOwnerInterests => 'acts that may considerably harm the Owner\'s legitimate interests;';

	/// en: 'Additional conditions of use or access applicable in particular situations are expressly indicated in this document.'
	String get additionalConditions => 'Additional conditions of use or access applicable in particular situations are expressly indicated in this document.';

	/// en: 'The Owner undertakes to inform Users with at least 30 days' notice, where possible.'
	String get advanceNotice => 'The Owner undertakes to inform Users with at least 30 days\' notice, where possible.';

	/// en: 'If required by law, the Owner will notify Users in advance of the effective date of the modified Terms.'
	String get advanceNotificationRequirement => 'If required by law, the Owner will notify Users in advance of the effective date of the modified Terms.';

	/// en: 'Any legally binding relationship or contract between the Owner and the User governed by the Terms.'
	String get agreementDefinition => 'Any legally binding relationship or contract between the Owner and the User governed by the Terms.';

	/// en: 'Agreement'
	String get agreementDefinitionTitle => 'Agreement';

	/// en: 'Amicable dispute composition'
	String get amicableDisputeComposition => 'Amicable dispute composition';

	/// en: 'Users may report any disputes to the Owner, who will seek to resolve them amicably.'
	String get amicableDisputeResolution => 'Users may report any disputes to the Owner, who will seek to resolve them amicably.';

	/// en: 'The Anthropic API gives access to Claude, the language model by Anthropic PBC that AstroGods uses to write the text of the readings.'
	String get anthropicApiDescription => 'The Anthropic API gives access to Claude, the language model by Anthropic PBC that AstroGods uses to write the text of the readings.';

	/// en: 'Anthropic API'
	String get anthropicApiName => 'Anthropic API';

	/// en: 'The App Store is Apple's service for buying apps and subscriptions. For subscriptions bought on iPhone, iPad and Mac, Apple handles the payment and shares with AstroGods only the details of the purchased subscription, such as the product, the dates and the transaction identifier.'
	String get appStoreDescription => 'The App Store is Apple\'s service for buying apps and subscriptions. For subscriptions bought on iPhone, iPad and Mac, Apple handles the payment and shares with AstroGods only the details of the purchased subscription, such as the product, the dates and the transaction identifier.';

	/// en: 'AstroGods or certain Products sold on AstroGods must be purchased through a third-party app store. To make such purchases, Users are asked to follow the instructions in the relevant app store (for example "Apple App Store" or "Google Play"). This information may vary depending on the specific device used.'
	String get appStorePurchases => 'AstroGods or certain Products sold on AstroGods must be purchased through a third-party app store. To make such purchases, Users are asked to follow the instructions in the relevant app store (for example "Apple App Store" or "Google Play"). This information may vary depending on the specific device used.';

	/// en: 'Therefore, Users who make purchases through such third-party online stores are asked to carefully read and accept the related terms and conditions of sale.'
	String get appStoreTermsAcceptance => 'Therefore, Users who make purchases through such third-party online stores are asked to carefully read and accept the related terms and conditions of sale.';

	/// en: 'Unless otherwise specified, purchases made through third-party online stores are also subject to the terms and conditions of such third parties, such as the [App Store terms](https://www.apple.com/legal/internet-services/itunes/) and the [Google Play terms](https://play.google.com/about/play-terms/). Such terms and conditions prevail in any case of inconsistency or conflict with respect to these Terms.'
	String get appStoreTermsPrecedence => 'Unless otherwise specified, purchases made through third-party online stores are also subject to the terms and conditions of such third parties, such as the [App Store terms](https://www.apple.com/legal/internet-services/itunes/) and the [Google Play terms](https://play.google.com/about/play-terms/). Such terms and conditions prevail in any case of inconsistency or conflict with respect to these Terms.';

	/// en: 'subscriptions automatically renew for the same duration unless the User communicates cancellation at least 24 hours before the expiration of the current subscription period;'
	String get appleAccountAutoRenewal => 'subscriptions automatically renew for the same duration unless the User communicates cancellation at least 24 hours before the expiration of the current subscription period;';

	/// en: 'subscriptions can be managed or canceled directly through the User's [Apple App Store account settings](https://apps.apple.com/account/subscriptions).'
	String get appleAccountManagement => 'subscriptions can be managed or canceled directly through the User\'s [Apple App Store account settings](https://apps.apple.com/account/subscriptions).';

	/// en: 'any payment due will be charged to the Apple account;'
	String get appleAccountPayment => 'any payment due will be charged to the Apple account;';

	/// en: 'refunds for purchases made through the App Store are handled by Apple and must be requested from Apple through [its procedure](https://reportaproblem.apple.com).'
	String get appleAccountRefunds => 'refunds for purchases made through the App Store are handled by Apple and must be requested from Apple through [its procedure](https://reportaproblem.apple.com).';

	/// en: 'all fees or payments due for renewal will be charged within 24 hours before the expiration of the current period;'
	String get appleAccountRenewalCharges => 'all fees or payments due for renewal will be charged within 24 hours before the expiration of the current period;';

	/// en: 'Users can subscribe to a Product using the Apple Account associated with their Apple App Store account through the related procedure on AstroGods. In doing so, Users acknowledge and accept that:'
	String get appleAccountSubscriptions => 'Users can subscribe to a Product using the Apple Account associated with their Apple App Store account through the related procedure on AstroGods. In doing so, Users acknowledge and accept that:';

	/// en: 'Subscriptions managed through Apple Account'
	String get appleAccountSubscriptionsTitle => 'Subscriptions managed through Apple Account';

	/// en: 'The above prevails over any conflicting or divergent provision of the Terms.'
	String get appleTermsPrecedence => 'The above prevails over any conflicting or divergent provision of the Terms.';

	/// en: 'Notwithstanding that the contractual relationship for the purchase of such Products is concluded exclusively between Owner and Users, Users acknowledge and accept that, should the provision of AstroGods have occurred through the Apple App Store or Google Play Store, the respective platform provider may exercise rights arising from these Terms as a third party beneficiary.'
	String get appleThirdPartyBeneficiary => 'Notwithstanding that the contractual relationship for the purchase of such Products is concluded exclusively between Owner and Users, Users acknowledge and accept that, should the provision of AstroGods have occurred through the Apple App Store or Google Play Store, the respective platform provider may exercise rights arising from these Terms as a third party beneficiary.';

	/// en: 'Applicable Law'
	String get applicableLaw => 'Applicable Law';

	/// en: 'The provisions relating to the modification of these Terms apply.'
	String get assignmentTermsApplication => 'The provisions relating to the modification of these Terms apply.';

	/// en: 'The structure that enables the provision of the Service.'
	String get astroGodsDefinition => 'The structure that enables the provision of the Service.';

	/// en: 'AstroGods (or this Application)'
	String get astroGodsDefinitionTitle => 'AstroGods (or this Application)';

	/// en: '"AstroGods" refers to'
	String get astroGodsRefersTo => '"AstroGods" refers to';

	/// en: 'AstroGods is a service of:'
	String get astroGodsServiceOf => 'AstroGods is a service of:';

	/// en: 'C) Astrological interpretations'
	String get astrologicalInterpretations => 'C) Astrological interpretations';

	/// en: 'The astrological interpretations generated by the service may be freely reused by users for any purpose, provided they are accompanied by the statement: "Interpretation generated by AstroGods (astrogods.it)"'
	String get astrologicalInterpretationsText => 'The astrological interpretations generated by the service may be freely reused by users for any purpose, provided they are accompanied by the statement: "Interpretation generated by AstroGods (astrogods.it)"';

	/// en: 'AstroGods uses astrology as a system of symbolic knowledge and personal research tool. The User understands that:'
	String get astrologicalServiceDescription => 'AstroGods uses astrology as a system of symbolic knowledge and personal research tool. The User understands that:';

	/// en: 'Nature of the astrological service'
	String get astrologicalServiceNature => 'Nature of the astrological service';

	/// en: 'Nature of the astrological service'
	String get astrologicalServiceNatureSection => 'Nature of the astrological service';

	/// en: 'Astrology is an ancient system of interpretation based on symbolic correlations, not on demonstrable scientific causality'
	String get astrologicalServicePoint1 => 'Astrology is an ancient system of interpretation based on symbolic correlations, not on demonstrable scientific causality';

	/// en: 'The service offers tools for self-exploration and self-understanding through astrological language'
	String get astrologicalServicePoint2 => 'The service offers tools for self-exploration and self-understanding through astrological language';

	/// en: 'The interpretations provided are aimed at inner research and the development of personal awareness'
	String get astrologicalServicePoint3 => 'The interpretations provided are aimed at inner research and the development of personal awareness';

	/// en: 'No professional advice of a medical, psychological, legal or financial nature is provided'
	String get astrologicalServicePoint4 => 'No professional advice of a medical, psychological, legal or financial nature is provided';

	/// en: 'Astrological analyses are tools for reflection and do not predict events with absolute certainty'
	String get astrologicalServicePoint5 => 'Astrological analyses are tools for reflection and do not predict events with absolute certainty';

	/// en: 'The User is responsible for the use they make of the information received in their personal growth journey'
	String get astrologicalServicePoint6 => 'The User is responsible for the use they make of the information received in their personal growth journey';

	/// en: 'By registering or authenticating, Users allow AstroGods to identify them and give them access to dedicated services. Depending on what is indicated below, third-party services could provide simplified registration and authentication.'
	String get authenticationDescription => 'By registering or authenticating, Users allow AstroGods to identify them and give them access to dedicated services.\nDepending on what is indicated below, third-party services could provide simplified registration and authentication.';

	/// en: 'Registration and authentication'
	String get authenticationTitle => 'Registration and authentication';

	/// en: 'Automatic Renewal'
	String get automaticRenewal => 'Automatic Renewal';

	/// en: 'Subscriptions renew automatically when they expire and are charged to the payment method used for the purchase: the method chosen at checkout for purchases through Stripe, or the Apple Account for purchases through the App Store.'
	String get automaticRenewalPolicy => 'Subscriptions renew automatically when they expire and are charged to the payment method used for the purchase: the method chosen at checkout for purchases through Stripe, or the Apple Account for purchases through the App Store.';

	/// en: 'Backend API'
	String get backendApi => 'Backend API';

	/// en: 'To write readings, AstroGods replaces the names of the people in the charts with a placeholder. The services below receive only the planetary positions calculated from the birth data, the language of the reading and the grammatical gender to use in the text, if the User gave one. Giving a gender is optional; without it, the reading uses neutral wording, with no gendered agreement. They receive no names, birth dates or birth places, and no data that identifies the User or the people in the charts. AstroGods puts the real names back into the text on its own servers.'
	String get backendApiDescription => 'To write readings, AstroGods replaces the names of the people in the charts with a placeholder. The services below receive only the planetary positions calculated from the birth data, the language of the reading and the grammatical gender to use in the text, if the User gave one. Giving a gender is optional; without it, the reading uses neutral wording, with no gendered agreement. They receive no names, birth dates or birth places, and no data that identifies the User or the people in the charts. AstroGods puts the real names back into the text on its own servers.';

	/// en: 'Backend API'
	String get backendApiTitle => 'Backend API';

	/// en: 'Billing address'
	String get billingAddress => 'Billing address';

	/// en: 'in a binding manner. Capitalized terms are defined in the relevant section of this document.'
	String get bindingManner => 'in a binding manner. Capitalized terms are defined in the relevant section of this document.';

	/// en: 'Account opening via bots or other automated means is not permitted.'
	String get botRegistrationProhibited => 'Account opening via bots or other automated means is not permitted.';

	/// en: 'Most web browsers allow you to control cookies through their settings preferences. You can set your browser to refuse cookies or delete certain cookies. Generally, you can also manage similar technologies in the same way.'
	String get browserSettingsContent => 'Most web browsers allow you to control cookies through their settings preferences. You can set your browser to refuse cookies or delete certain cookies. Generally, you can also manage similar technologies in the same way.';

	/// en: 'Browser settings'
	String get browserSettingsTitle => 'Browser settings';

	/// en: 'Cancellation'
	String get cancellation => 'Cancellation';

	/// en: 'If the cancellation notice reaches the Owner before the subscription renewal date, the termination will take effect at the end of the current period.'
	String get cancellationEffectiveTiming => 'If the cancellation notice reaches the Owner before the subscription renewal date, the termination will take effect at the end of the current period.';

	/// en: 'Common Provisions'
	String get commonProvisions => 'Common Provisions';

	/// en: 'Common Provisions'
	String get commonProvisionsSection => 'Common Provisions';

	/// en: 'Data communicated during service use'
	String get communicatedDataDuringService => 'Data communicated during service use';

	/// en: 'All communications relating to the use of AstroGods must be sent to the [contact details indicated in this document](mailto:contact@astrogods.it).'
	String get communicationRequirement => 'All communications relating to the use of AstroGods must be sent to the [contact details indicated in this document](mailto:contact@astrogods.it).';

	/// en: 'Competent Jurisdiction'
	String get competentJurisdiction => 'Competent Jurisdiction';

	/// en: 'Users may address a complaint to the [Owner's email address](mailto:contact@astrogods.it) indicated in this document, including a brief description and, if applicable, details of the affected order, purchase, or account.'
	String get complaintProcedure => 'Users may address a complaint to the [Owner\'s email address](mailto:contact@astrogods.it) indicated in this document, including a brief description and, if applicable, details of the affected order, purchase, or account.';

	/// en: 'Our cookie policy complies with EU data protection standards. We do not use tracking tools for statistics or advertising and do not share your data with advertisers. To learn how we process your personal data, consult the [Privacy Policy](/privacy-policy).'
	String get complianceContent => 'Our cookie policy complies with EU data protection standards. We do not use tracking tools for statistics or advertising and do not share your data with advertisers. To learn how we process your personal data, consult the [Privacy Policy](/privacy-policy).';

	/// en: 'Compliance'
	String get complianceSection => 'Compliance';

	/// en: 'If you choose to block or delete cookies, some features of our website may not work properly.'
	String get consequencesOfBlockingContent => 'If you choose to block or delete cookies, some features of our website may not work properly.';

	/// en: 'Consequences of blocking cookies'
	String get consequencesOfBlockingTitle => 'Consequences of blocking cookies';

	/// en: 'Any User considered as such under applicable law.'
	String get consumerDefinition => 'Any User considered as such under applicable law.';

	/// en: 'Consumer'
	String get consumerDefinitionTitle => 'Consumer';

	/// en: 'User acts as a Consumer'
	String get consumerRequirement => 'User acts as a Consumer';

	/// en: 'If you have any questions about our use of cookies, please contact us:'
	String get contactForCookiesContent => 'If you have any questions about our use of cookies, please contact us:';

	/// en: 'Contact us about cookies'
	String get contactForCookiesTitle => 'Contact us about cookies';

	/// en: 'Contact us'
	String get contactUs => 'Contact us';

	/// en: 'Contact Us'
	String get contactUsSection => 'Contact Us';

	/// en: 'Contacts'
	String get contacts => 'Contacts';

	/// en: 'Contract Assignment'
	String get contractAssignment => 'Contract Assignment';

	/// en: 'Order submission by the user determines the conclusion of the contract and gives rise to the User's obligation to pay the price, taxes and any additional charges and expenses, as specified in the order page.'
	String get contractConclusion => 'Order submission by the user determines the conclusion of the contract and gives rise to the User\'s obligation to pay the price, taxes and any additional charges and expenses, as specified in the order page.';

	/// en: 'Contract Duration'
	String get contractDuration => 'Contract Duration';

	/// en: 'Contract Duration'
	String get contractDurationSection => 'Contract Duration';

	/// en: 'The Owner reserves the right to transfer, assign, dispose of, novate, or subcontract any or all rights and obligations under these Terms, having regard for the legitimate interests of Users.'
	String get contractTransferRight => 'The Owner reserves the right to transfer, assign, dispose of, novate, or subcontract any or all rights and obligations under these Terms, having regard for the legitimate interests of Users.';

	/// en: 'The Owner grants Users the contractual right to withdraw from the purchase contract according to the terms and conditions set out in the [relevant section of AstroGods](/subscription-plans) within 30 days of the conclusion of the contract. For purchases made through the App Store, [Apple's refund procedure](https://reportaproblem.apple.com) applies.'
	String get contractualWithdrawalRight => 'The Owner grants Users the contractual right to withdraw from the purchase contract according to the terms and conditions set out in the [relevant section of AstroGods](/subscription-plans) within 30 days of the conclusion of the contract. For purchases made through the App Store, [Apple\'s refund procedure](https://reportaproblem.apple.com) applies.';

	/// en: 'Contractual withdrawal right'
	String get contractualWithdrawalRightTitle => 'Contractual withdrawal right';

	/// en: 'Cookie Policy'
	String get cookiePolicy => 'Cookie Policy';

	/// en: 'AstroGods only uses the cookies and browser storage needed for it to work and no tracking tools for statistics or advertising. To learn more, consult the [Cookie Policy](/cookie-policy).'
	String get cookiePolicyContent => 'AstroGods only uses the cookies and browser storage needed for it to work and no tracking tools for statistics or advertising. To learn more, consult the [Cookie Policy](/cookie-policy).';

	/// en: 'Last modified: October 19, 2026'
	String get cookiePolicyLastModified => 'Last modified: October 19, 2026';

	/// en: 'Cookie Policy'
	String get cookiePolicyPageTitle => 'Cookie Policy';

	/// en: 'Cookie Policy'
	String get cookiePolicySection => 'Cookie Policy';

	/// en: 'Cookie Policy'
	String get cookiePolicyTitle => 'Cookie Policy';

	/// en: 'This page explains which cookies and browser data AstroGods uses and why.'
	String get cookiePolicyWelcomeText => 'This page explains which cookies and browser data AstroGods uses and why.';

	/// en: 'To find out which cookies and browser data AstroGods needs to work, please refer to our complete Cookie Policy.'
	String get cookiesAndTrackingReferenceContent => 'To find out which cookies and browser data AstroGods needs to work, please refer to our complete Cookie Policy.';

	/// en: 'Cookies'
	String get cookiesAndTrackingSection => 'Cookies';

	/// en: 'Cookies'
	String get cookiesAndTrackingTitle => 'Cookies';

	/// en: 'contact@astrogods.it'
	String get dataControllerEmail => 'contact@astrogods.it';

	/// en: 'Data Controller email address: '
	String get dataControllerEmailLabel => 'Data Controller email address: ';

	/// en: 'Arcangelo Massari - Bologna (Italy)'
	String get dataControllerName => 'Arcangelo Massari - Bologna (Italy)';

	/// en: 'Data Controller'
	String get dataControllerSection => 'Data Controller';

	/// en: 'Complete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or through specific information texts displayed before the collection of the Data. Personal Data may be freely provided by the User or, in the case of Usage Data, collected automatically during the use of AstroGods. Unless otherwise specified, all Data requested by AstroGods is mandatory. If the User refuses to provide it, it might be impossible for AstroGods to provide the Service. In cases where AstroGods indicates some Data as optional, Users are free to refrain from providing such Data without any consequence on the availability or operation of the Service. Users who have doubts about which Data is mandatory are encouraged to contact the Owner. AstroGods uses Cookies only to provide the Service requested by the User, as described in the [Cookie Policy](/cookie-policy). The User takes responsibility for the Personal Data of third parties obtained, published or shared through AstroGods.'
	String get dataTypesDetailedContent => 'Complete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or through specific information texts displayed before the collection of the Data.\n\nPersonal Data may be freely provided by the User or, in the case of Usage Data, collected automatically during the use of AstroGods.\n\nUnless otherwise specified, all Data requested by AstroGods is mandatory. If the User refuses to provide it, it might be impossible for AstroGods to provide the Service. In cases where AstroGods indicates some Data as optional, Users are free to refrain from providing such Data without any consequence on the availability or operation of the Service.\n\nUsers who have doubts about which Data is mandatory are encouraged to contact the Owner.\n\nAstroGods uses Cookies only to provide the Service requested by the User, as described in the [Cookie Policy](/cookie-policy).\n\nThe User takes responsibility for the Personal Data of third parties obtained, published or shared through AstroGods.';

	/// en: 'Among the Personal Data collected by AstroGods, independently or through third parties, there are:'
	String get dataTypesIntro => 'Among the Personal Data collected by AstroGods, independently or through third parties, there are:';

	/// en: 'Types of Data collected'
	String get dataTypesSection => 'Types of Data collected';

	/// en: 'Data we collect automatically'
	String get dataWeCollectAutomatically => 'Data we collect automatically';

	/// en: 'We automatically collect your data, for example when you visit AstroGods.'
	String get dataWeCollectAutomaticallyDesc => 'We automatically collect your data, for example when you visit AstroGods.';

	/// en: 'Data you provide us'
	String get dataYouProvide => 'Data you provide us';

	/// en: 'We collect data you provide us, for example when you create an account on AstroGods.'
	String get dataYouProvideDesc => 'We collect data you provide us, for example when you create an account on AstroGods.';

	/// en: 'Definitions and Legal References'
	String get definitions => 'Definitions and Legal References';

	/// en: '### Personal Data (or Data) Any information that directly, indirectly, or in connection with other information allows for the identification or identifiability of a natural person. ### Usage Data Information collected automatically through AstroGods (or third-party services employed in AstroGods), which can include: the IP addresses or domain names of the computers utilized by the Users who use AstroGods, the URI addresses (Uniform Resource Identifier), the time of the request, the method utilized to submit the request to the server, the size of the file received in response, the numerical code indicating the status of the server's answer (successful outcome, error, etc.), the country of origin, the features of the browser and the operating system utilized by the User, the various time details per visit (e.g., the time spent on each page within the Application) and the details about the path followed within the Application with special reference to the sequence of pages visited, and other parameters about the device operating system and/or the User's IT environment. ### User The individual using AstroGods who, unless otherwise specified, coincides with the Data Subject. ### Data Subject The natural person to whom the Personal Data refers. ### Data Processor (or Processor) The natural or legal person, public authority, agency or other body which processes Personal Data on behalf of the Controller, as described in this privacy policy. ### Data Controller (or Owner) The natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of Personal Data, including the security measures concerning the operation and use of AstroGods. The Data Controller, unless otherwise specified, is the Owner of AstroGods. ### AstroGods (or this Application) The means by which the Personal Data of the User is collected and processed. ### Service The service provided by AstroGods as described in the relative [terms](/terms-and-conditions) and on this site/application. ### European Union (or EU) Unless otherwise specified, all references made within this document to the European Union include all current member states to the European Union and the European Economic Area. ### Cookie Cookies are small sets of data stored in the User's browser. ### Legal information This privacy policy relates solely to AstroGods, if not stated otherwise within this document.'
	String get definitionsContent => '### Personal Data (or Data)\n\nAny information that directly, indirectly, or in connection with other information allows for the identification or identifiability of a natural person.\n\n### Usage Data\n\nInformation collected automatically through AstroGods (or third-party services employed in AstroGods), which can include: the IP addresses or domain names of the computers utilized by the Users who use AstroGods, the URI addresses (Uniform Resource Identifier), the time of the request, the method utilized to submit the request to the server, the size of the file received in response, the numerical code indicating the status of the server\'s answer (successful outcome, error, etc.), the country of origin, the features of the browser and the operating system utilized by the User, the various time details per visit (e.g., the time spent on each page within the Application) and the details about the path followed within the Application with special reference to the sequence of pages visited, and other parameters about the device operating system and/or the User\'s IT environment.\n\n### User\n\nThe individual using AstroGods who, unless otherwise specified, coincides with the Data Subject.\n\n### Data Subject\n\nThe natural person to whom the Personal Data refers.\n\n### Data Processor (or Processor)\n\nThe natural or legal person, public authority, agency or other body which processes Personal Data on behalf of the Controller, as described in this privacy policy.\n\n### Data Controller (or Owner)\n\nThe natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of Personal Data, including the security measures concerning the operation and use of AstroGods. The Data Controller, unless otherwise specified, is the Owner of AstroGods.\n\n### AstroGods (or this Application)\n\nThe means by which the Personal Data of the User is collected and processed.\n\n### Service\n\nThe service provided by AstroGods as described in the relative [terms](/terms-and-conditions) and on this site/application.\n\n### European Union (or EU)\n\nUnless otherwise specified, all references made within this document to the European Union include all current member states to the European Union and the European Economic Area.\n\n### Cookie\n\nCookies are small sets of data stored in the User\'s browser.\n\n### Legal information\n\nThis privacy policy relates solely to AstroGods, if not stated otherwise within this document.';

	/// en: 'Definitions and Legal References'
	String get definitionsSection => 'Definitions and Legal References';

	/// en: 'Delivery'
	String get delivery => 'Delivery';

	/// en: 'However, the additional cost arising from the choice of a particular delivery method other than the cheapest standard delivery offered by the Owner will remain the User's responsibility.'
	String get deliveryCostException => 'However, the additional cost arising from the choice of a particular delivery method other than the cheapest standard delivery offered by the Owner will remain the User\'s responsibility.';

	/// en: 'Delivery of Digital Content'
	String get deliveryOfDigitalContent => 'Delivery of Digital Content';

	/// en: 'Delivery'
	String get deliverySection => 'Delivery';

	/// en: 'Device identifiers'
	String get deviceIdentifiers => 'Device identifiers';

	/// en: 'Device information'
	String get deviceInformation => 'Device information';

	/// en: 'Users acknowledge and accept that, to download and/or use the Product, the chosen device(s) and their respective software (including operating systems) must be legal, commonly used, updated and in line with current market standards.'
	String get deviceRequirements => 'Users acknowledge and accept that, to download and/or use the Product, the chosen device(s) and their respective software (including operating systems) must be legal, commonly used, updated and in line with current market standards.';

	/// en: 'Differentiated licensing for content'
	String get differentiatedLicensing => 'Differentiated licensing for content';

	/// en: 'Differentiated licensing'
	String get differentiatedLicensingSection => 'Differentiated licensing';

	/// en: 'The contents of AstroGods are subject to three distinct licensing regimes:'
	String get differentiatedLicensingText => 'The contents of AstroGods are subject to three distinct licensing regimes:';

	/// en: 'Unless otherwise specified, astrological content purchased on AstroGods consists of textual interpretations and analyses (including birth chart analyses, predictions, and compatibility reports) delivered digitally through the online application interface. AstroGods functions primarily as an online service accessible through web browsers and mobile applications.'
	String get digitalContentDeliveryDetails => 'Unless otherwise specified, astrological content purchased on AstroGods consists of textual interpretations and analyses (including birth chart analyses, predictions, and compatibility reports) delivered digitally through the online application interface. AstroGods functions primarily as an online service accessible through web browsers and mobile applications.';

	/// en: 'In the case of contracts for the purchase of digital content not provided on a material medium, the withdrawal deadline expires 14 days after the day of conclusion of the contract, unless the User has waived the right of withdrawal.'
	String get digitalContentWithdrawalDeadline => 'In the case of contracts for the purchase of digital content not provided on a material medium, the withdrawal deadline expires 14 days after the day of conclusion of the contract, unless the User has waived the right of withdrawal.';

	/// en: 'Direct registration'
	String get directRegistration => 'Direct registration';

	/// en: 'The User registers by filling out the registration form and directly providing their Personal Data to AstroGods.'
	String get directRegistrationDescription => 'The User registers by filling out the registration form and directly providing their Personal Data to AstroGods.';

	/// en: 'Dispute Resolution'
	String get disputeResolution => 'Dispute Resolution';

	/// en: 'Dispute Resolution'
	String get disputeResolutionSection => 'Dispute Resolution';

	/// en: 'In such cases, do not hesitate to contact us.'
	String get doNotHesitateContact => 'In such cases, do not hesitate to contact us.';

	/// en: 'Users acknowledge and accept that the possibility of downloading the purchased Product may be limited in time and space.'
	String get downloadLimitations => 'Users acknowledge and accept that the possibility of downloading the purchased Product may be limited in time and space.';

	/// en: 'Effects of withdrawal'
	String get effectsOfWithdrawal => 'Effects of withdrawal';

	/// en: 'AstroGods sends service emails, such as password recovery and email change confirmation, and, if the User subscribes, newsletters with the daily and monthly horoscope. The emails are sent from an AstroGods mail server hosted by IONOS SE.'
	String get emailSendingDescription => 'AstroGods sends service emails, such as password recovery and email change confirmation, and, if the User subscribes, newsletters with the daily and monthly horoscope. The emails are sent from an AstroGods mail server hosted by IONOS SE.';

	/// en: 'Email delivery'
	String get emailSendingTitle => 'Email delivery';

	/// en: '### Legal basis for processing The Owner may process User Personal Data if one of the following conditions exists: - Users have given their consent for one or more specific purposes; - processing is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof; - processing is necessary for compliance with a legal obligation to which the Owner is subject; - processing is necessary for the performance of a task carried out in the public interest or in the exercise of official authority vested in the Owner; - processing is necessary for the legitimate interests pursued by the Owner or by a third party. In any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract. ### Further information about retention time Unless specified otherwise in this document, Personal Data shall be processed and stored for as long as required by the purpose they have been collected for and may be stored for longer due to applicable legal obligation or based on the Users' consent. Therefore: - Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed. - Personal Data collected for the purposes of the Owner's legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner. The Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority. Once the retention period expires, Personal Data shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period. ### The rights of Users based on the General Data Protection Regulation (GDPR) Users may exercise certain rights regarding their Data processed by the Owner. In particular, Users have the right to do the following, to the extent permitted by law: - **Withdraw their consent at any time.** Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data. - **Object to processing of their Data.** Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent. - **Access their Data.** Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing. - **Verify and seek rectification.** Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected. - **Restrict the processing of their Data.** Users have the right to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it. - **Have their Personal Data deleted or otherwise removed.** Users have the right to obtain the erasure of their Data from the Owner or to delete their account from the [Settings](/settings?section=deleteAccount). - **Receive their Data and have it transferred to another controller.** Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance. - **Lodge a complaint.** Users have the right to bring a claim before their competent data protection authority. Users are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data. ### Details about the right to object to processing Where Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection. Users must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document. ### How to exercise these rights Any requests to exercise User rights can be directed to the Owner through the [contact details provided in this document](mailto:contact@astrogods.it). Such requests are free of charge and will be answered by the Owner as early as possible and always within one month, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by the Owner to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users' request, the Owner will inform Users about those recipients.'
	String get euExtendedContent => '### Legal basis for processing\n\nThe Owner may process User Personal Data if one of the following conditions exists:\n\n- Users have given their consent for one or more specific purposes;\n- processing is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n- processing is necessary for compliance with a legal obligation to which the Owner is subject;\n- processing is necessary for the performance of a task carried out in the public interest or in the exercise of official authority vested in the Owner;\n- processing is necessary for the legitimate interests pursued by the Owner or by a third party.\n\nIn any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n### Further information about retention time\n\nUnless specified otherwise in this document, Personal Data shall be processed and stored for as long as required by the purpose they have been collected for and may be stored for longer due to applicable legal obligation or based on the Users\' consent.\n\nTherefore:\n\n- Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n- Personal Data collected for the purposes of the Owner\'s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\n\nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n\nOnce the retention period expires, Personal Data shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period.\n\n### The rights of Users based on the General Data Protection Regulation (GDPR)\n\nUsers may exercise certain rights regarding their Data processed by the Owner.\n\nIn particular, Users have the right to do the following, to the extent permitted by law:\n\n- **Withdraw their consent at any time.** Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.\n- **Object to processing of their Data.** Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent.\n- **Access their Data.** Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.\n- **Verify and seek rectification.** Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.\n- **Restrict the processing of their Data.** Users have the right to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.\n- **Have their Personal Data deleted or otherwise removed.** Users have the right to obtain the erasure of their Data from the Owner or to delete their account from the [Settings](/settings?section=deleteAccount).\n- **Receive their Data and have it transferred to another controller.** Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance.\n- **Lodge a complaint.** Users have the right to bring a claim before their competent data protection authority.\n\nUsers are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n\n### Details about the right to object to processing\n\nWhere Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection.\n\nUsers must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document.\n\n### How to exercise these rights\n\nAny requests to exercise User rights can be directed to the Owner through the [contact details provided in this document](mailto:contact@astrogods.it). Such requests are free of charge and will be answered by the Owner as early as possible and always within one month, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by the Owner to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users\' request, the Owner will inform Users about those recipients.';

	/// en: 'This section applies to all users of the European Union, in accordance with the General Data Protection Regulation (the "GDPR") and, for such Users, supersedes any other information that may be divergent or conflicting contained in the privacy policy. Additional details relating to the categories of Data processed, the purposes of processing, the categories of recipients of personal data, if any, and additional information on personal data are available in the section "Details on Personal Data processing" within this document.'
	String get euInfoContent => 'This section applies to all users of the European Union, in accordance with the General Data Protection Regulation (the "GDPR") and, for such Users, supersedes any other information that may be divergent or conflicting contained in the privacy policy.\n\nAdditional details relating to the categories of Data processed, the purposes of processing, the categories of recipients of personal data, if any, and additional information on personal data are available in the section "Details on Personal Data processing" within this document.';

	/// en: 'Additional information for EU Users'
	String get euInfoSection => 'Additional information for EU Users';

	/// en: 'Additional information for European Union users'
	String get euInfoTitle => 'Additional information for European Union users';

	/// en: 'The above does not apply to Users acting as European Consumers or Consumers located in the United Kingdom, Switzerland, Norway, or Iceland.'
	String get europeanConsumerException => 'The above does not apply to Users acting as European Consumers or Consumers located in the United Kingdom, Switzerland, Norway, or Iceland.';

	/// en: 'Exception for Consumers in Europe'
	String get europeanConsumerExceptionTitle => 'Exception for Consumers in Europe';

	/// en: 'Where none of the exceptions listed below apply, Users acting as European Consumers have the legal right to withdraw from contracts concluded online (distance contracts) within the time period specified below for any reason and without justification.'
	String get europeanConsumersWithdrawal => 'Where none of the exceptions listed below apply, Users acting as European Consumers have the legal right to withdraw from contracts concluded online (distance contracts) within the time period specified below for any reason and without justification.';

	/// en: 'Applies when the User, regardless of nationality, is located in the European Union.'
	String get europeanDefinition => 'Applies when the User, regardless of nationality, is located in the European Union.';

	/// en: 'European (or Europe)'
	String get europeanDefinitionTitle => 'European (or Europe)';

	/// en: 'Should a provision of these Terms be or become null, invalid, or ineffective, the parties will endeavor to identify amicably a valid and effective provision to replace the null, invalid, or ineffective one. In case of failure to reach agreement as described above, if permitted or provided by applicable law, the null, invalid, or ineffective provision will be replaced by the applicable legal provisions.'
	String get europeanSeverability => 'Should a provision of these Terms be or become null, invalid, or ineffective, the parties will endeavor to identify amicably a valid and effective provision to replace the null, invalid, or ineffective one. In case of failure to reach agreement as described above, if permitted or provided by applicable law, the null, invalid, or ineffective provision will be replaced by the applicable legal provisions.';

	/// en: 'European Union'
	String get europeanUnion => 'European Union';

	/// en: 'European Users'
	String get europeanUsersTitle => 'European Users';

	/// en: 'Exclusive jurisdiction to hear any dispute arising from or in connection with the Terms belongs to the court of the place where the Owner is established, as indicated in the relevant section of this document.'
	String get exclusiveJurisdiction => 'Exclusive jurisdiction to hear any dispute arising from or in connection with the Terms belongs to the court of the place where the Owner is established, as indicated in the relevant section of this document.';

	/// en: 'Exercise of the right of withdrawal'
	String get exerciseOfWithdrawalRight => 'Exercise of the right of withdrawal';

	/// en: 'Access to External Resources'
	String get externalResources => 'Access to External Resources';

	/// en: 'Through AstroGods, Users may have access to resources provided by third parties. Users acknowledge and accept that the Owner has no control over such resources.'
	String get externalResourcesDisclaimer => 'Through AstroGods, Users may have access to resources provided by third parties. Users acknowledge and accept that the Owner has no control over such resources.';

	/// en: 'Once the subscription duration has ended, the Product will no longer be accessible.'
	String get fixedTermSubscriptionEnd => 'Once the subscription duration has ended, the Product will no longer be accessible.';

	/// en: 'Paid fixed-term subscriptions start from the day the Owner receives payment and remain active for the duration of the subscription chosen by the User.'
	String get fixedTermSubscriptionText => 'Paid fixed-term subscriptions start from the day the Owner receives payment and remain active for the duration of the subscription chosen by the User.';

	/// en: 'Fixed-term Subscriptions'
	String get fixedTermSubscriptions => 'Fixed-term Subscriptions';

	/// en: 'damages or losses arising from interruptions or malfunctions of AstroGods due to force majeure or unforeseen and unforeseeable events and, in any case, independent of the will and beyond the control of the Owner, such as, by way of example only, failures or interruptions of telephone or electrical lines, Internet connection and/or other means of transmission, inaccessibility of websites, strikes, natural disasters, viruses and computer attacks, interruptions in the supply of third-party products, services or applications;'
	String get forceMAjeureExclusion => 'damages or losses arising from interruptions or malfunctions of AstroGods due to force majeure or unforeseen and unforeseeable events and, in any case, independent of the will and beyond the control of the Owner, such as, by way of example only, failures or interruptions of telephone or electrical lines, Internet connection and/or other means of transmission, inaccessibility of websites, strikes, natural disasters, viruses and computer attacks, interruptions in the supply of third-party products, services or applications;';

	/// en: 'Additionally, the Service may not be available for reasons beyond the reasonable control of the Owner, such as force majeure (e.g., infrastructure malfunctions, blackouts, etc.).'
	String get forceMAjeureUnavailability => 'Additionally, the Service may not be available for reasons beyond the reasonable control of the Owner, such as force majeure (e.g., infrastructure malfunctions, blackouts, etc.).';

	/// en: 'Gender (optional)'
	String get genderOptional => 'Gender (optional)';

	/// en: 'Unless otherwise specified and subject to applicable legal provisions, any claim for damages against the Owner (or any natural or legal person acting on its behalf) is excluded.'
	String get generalLiabilityExclusion => 'Unless otherwise specified and subject to applicable legal provisions, any claim for damages against the Owner (or any natural or legal person acting on its behalf) is excluded.';

	/// en: 'Should any provision of these Terms be or become null or ineffective under applicable law, the nullity or ineffectiveness of such provision does not cause the ineffectiveness of the remaining provisions, which therefore remain valid and effective.'
	String get generalSeverability => 'Should any provision of these Terms be or become null or ineffective under applicable law, the nullity or ineffectiveness of such provision does not cause the ineffectiveness of the remaining provisions, which therefore remain valid and effective.';

	/// en: 'Germany'
	String get germany => 'Germany';

	/// en: 'Google Maps Platform is a maps and place search service provided by Google Ireland Limited.'
	String get googleMapsDescription => 'Google Maps Platform is a maps and place search service provided by Google Ireland Limited.';

	/// en: 'Google OAuth is an authentication service provided by Google Inc.'
	String get googleOAuthDescription => 'Google OAuth is an authentication service provided by Google Inc.';

	/// en: 'The Terms are governed by the law of the place where the Owner is established, as indicated in the relevant section of this document, regardless of conflict of law rules.'
	String get governingLaw => 'The Terms are governed by the law of the place where the Owner is established, as indicated in the relevant section of this document, regardless of conflict of law rules.';

	/// en: 'Hetzner is a hosting service provided by Hetzner Online GmbH.'
	String get hetznerDescription => 'Hetzner is a hosting service provided by Hetzner Online GmbH.';

	/// en: 'Hosting and backend infrastructure'
	String get hostingAndBackend => 'Hosting and backend infrastructure';

	/// en: 'This type of service has the function of hosting Data and files that allow AstroGods to function, enable its distribution and provide ready-to-use infrastructure to deliver specific AstroGods functionalities. Some services among those listed below, if present, may work on geographically distributed servers, making it difficult to determine the actual location where Personal Data is stored.'
	String get hostingBackendDescription => 'This type of service has the function of hosting Data and files that allow AstroGods to function, enable its distribution and provide ready-to-use infrastructure to deliver specific AstroGods functionalities.\n\nSome services among those listed below, if present, may work on geographically distributed servers, making it difficult to determine the actual location where Personal Data is stored.';

	/// en: 'Hosting and backend infrastructure'
	String get hostingBackendTitle => 'Hosting and backend infrastructure';

	/// en: 'How we use them'
	String get howWeUseThem => 'How we use them';

	/// en: 'In case of problems'
	String get inCaseOfProblems => 'In case of problems';

	/// en: 'Indemnification'
	String get indemnification => 'Indemnification';

	/// en: 'The User agrees to indemnify and hold harmless the Owner and its subordinates, affiliates, officers, agents, co-trademark holders, partners and employees to the extent permitted by law from any claim or demand - including, without limitation, legal fees and costs - advanced by third parties due to or in connection with behaviors in violation of these Terms, third party rights or law, implemented in connection with the use of the Service and attributable to the User, its affiliates, officers, agents, co-trademark holders, partners and employees, on the basis of fault.'
	String get indemnificationText => 'The User agrees to indemnify and hold harmless the Owner and its subordinates, affiliates, officers, agents, co-trademark holders, partners and employees to the extent permitted by law from any claim or demand - including, without limitation, legal fees and costs - advanced by third parties due to or in connection with behaviors in violation of these Terms, third party rights or law, implemented in connection with the use of the Service and attributable to the User, its affiliates, officers, agents, co-trademark holders, partners and employees, on the basis of fault.';

	/// en: 'any lost profits or other losses, including indirect ones, that the User may have suffered (such as, by way of example only, commercial losses, loss of revenue, profits or anticipated savings, loss of contractual or commercial relationships, loss of goodwill or damage to reputation, etc.);'
	String get indirectLossExclusion => 'any lost profits or other losses, including indirect ones, that the User may have suffered (such as, by way of example only, commercial losses, loss of revenue, profits or anticipated savings, loss of contractual or commercial relationships, loss of goodwill or damage to reputation, etc.);';

	/// en: 'injury to third party rights;'
	String get injuryToThirdPartyRights => 'injury to third party rights;';

	/// en: 'IONOS is a hosting service provided by IONOS SE.'
	String get ionosDescription => 'IONOS is a hosting service provided by IONOS SE.';

	/// en: 'IP address'
	String get ipAddress => 'IP address';

	/// en: 'Ireland'
	String get ireland => 'Ireland';

	/// en: 'Italy'
	String get italy => 'Italy';

	/// en: 'Without prejudice to the Users' right to bring legal action, in case of disputes concerning the use of AstroGods or the Service, Users are requested to contact the Owner at the [contact details indicated in this document](mailto:contact@astrogods.it).'
	String get judicialRightsPreservation => 'Without prejudice to the Users\' right to bring legal action, in case of disputes concerning the use of AstroGods or the Service, Users are requested to contact the Owner at the [contact details indicated in this document](mailto:contact@astrogods.it).';

	/// en: 'Last modified: October 20, 2026'
	String get lastModified => 'Last modified: October 20, 2026';

	/// en: 'Last modified: October 19, 2026'
	String get lastModifiedTerms => 'Last modified: October 19, 2026';

	/// en: 'any other Agreement or legal relationship with the Owner'
	String get legalRelationship => 'any other Agreement or legal relationship with the Owner';

	/// en: 'Liability and Indemnification'
	String get liabilityAndIndemnification => 'Liability and Indemnification';

	/// en: 'The foregoing does not limit the Owner's liability for death, personal injury or damage to physical or mental integrity, damages arising from breach of essential contractual obligations, such as obligations strictly necessary to achieve the purpose of the contract, and/or damages caused intentionally or through gross negligence, provided that the User's use of AstroGods has been appropriate and correct.'
	String get liabilityExceptions => 'The foregoing does not limit the Owner\'s liability for death, personal injury or damage to physical or mental integrity, damages arising from breach of essential contractual obligations, such as obligations strictly necessary to achieve the purpose of the contract, and/or damages caused intentionally or through gross negligence, provided that the User\'s use of AstroGods has been appropriate and correct.';

	/// en: 'Liability and Indemnification'
	String get liabilitySection => 'Liability and Indemnification';

	/// en: 'Unless the damages were caused intentionally or through gross negligence or affect life and/or personal, physical or mental integrity, the Owner is only liable to the extent of damage typical for the type of contract and foreseeable at the time of conclusion.'
	String get limitedLiabilityScope => 'Unless the damages were caused intentionally or through gross negligence or affect life and/or personal, physical or mental integrity, the Owner is only liable to the extent of damage typical for the type of contract and foreseeable at the time of conclusion.';

	/// en: 'You have control over the cookies we use. You can manage your preferences through your browser settings or by using the controls we provide. Please note that disabling certain cookies may affect the functionality of our website.'
	String get managingCookiesContent => 'You have control over the cookies we use. You can manage your preferences through your browser settings or by using the controls we provide. Please note that disabling certain cookies may affect the functionality of our website.';

	/// en: 'Managing cookies'
	String get managingCookiesSection => 'Managing cookies';

	/// en: 'applications for mobile devices (iOS and Android), tablets, desktop (Linux, Windows, macOS) or similar platforms;'
	String get mobileApplicationsDescription => 'applications for mobile devices (iOS and Android), tablets, desktop (Linux, Windows, macOS) or similar platforms;';

	/// en: 'The changes will take effect in relation to the User only from the moment communicated to the User.'
	String get modificationsEffectiveDate => 'The changes will take effect in relation to the User only from the moment communicated to the User.';

	/// en: 'If the law of the User's country provides a higher level of consumer protection, that higher level of protection prevails.'
	String get nationalLawPrevails => 'If the law of the User\'s country provides a higher level of consumer protection, that higher level of protection prevails.';

	/// en: 'National Law Prevalence'
	String get nationalLawPrevalence => 'National Law Prevalence';

	/// en: 'These cookies are essential for the website to function properly. They enable core functionality such as security, network management, and accessibility.'
	String get necessaryCookiesDescription => 'These cookies are essential for the website to function properly. They enable core functionality such as security, network management, and accessibility.';

	/// en: 'Necessary cookies'
	String get necessaryCookiesTitle => 'Necessary cookies';

	/// en: 'Account suspension or cancellation does not entitle the User to any compensation, refund or indemnification.'
	String get noCompensationForSuspension => 'Account suspension or cancellation does not entitle the User to any compensation, refund or indemnification.';

	/// en: 'The Owner's failure to exercise legal rights or claims arising from these Terms does not constitute a waiver thereof. No waiver may be considered final in relation to a specific right or any other right.'
	String get noImplicitWaiver => 'The Owner\'s failure to exercise legal rights or claims arising from these Terms does not constitute a waiver thereof. No waiver may be considered final in relation to a specific right or any other right.';

	/// en: 'In particular, within the limits set out above, the Owner assumes no responsibility regarding:'
	String get noResponsibilityIntro => 'In particular, within the limits set out above, the Owner assumes no responsibility regarding:';

	/// en: 'No Waiver Implied'
	String get noWaiverImplied => 'No Waiver Implied';

	/// en: 'any losses that are not a direct consequence of a breach of the Terms by the Owner;'
	String get nonDirectLossExclusion => 'any losses that are not a direct consequence of a breach of the Terms by the Owner;';

	/// en: 'Users who do not meet these requirements do not have the rights described in this section. The Consumer will be liable to the Seller only for any diminished value of the goods resulting from handling of the goods other than what is necessary to establish the nature, characteristics and functioning of the goods.'
	String get nonEuropeanUsersNoRights => 'Users who do not meet these requirements do not have the rights described in this section. The Consumer will be liable to the Seller only for any diminished value of the goods resulting from handling of the goods other than what is necessary to establish the nature, characteristics and functioning of the goods.';

	/// en: 'User is not listed on any US government list of prohibited contractors'
	String get notOnProhibitedList => 'User is not listed on any US government list of prohibited contractors';

	/// en: 'User is not located in a country subject to a US government embargo or listed as a terrorist-sponsoring country'
	String get notUnderEmbargo => 'User is not located in a country subject to a US government embargo or listed as a terrorist-sponsoring country';

	/// en: 'offenses to the Owner or a third party.'
	String get offensesToOwnerOrThird => 'offenses to the Owner or a third party.';

	/// en: 'Unless otherwise specified, each User may create only one account.'
	String get oneAccountPerUser => 'Unless otherwise specified, each User may create only one account.';

	/// en: 'OpenRouter is a service by OpenRouter, Inc. that forwards the requests of AstroGods to the Anthropic API.'
	String get openRouterDescription => 'OpenRouter is a service by OpenRouter, Inc. that forwards the requests of AstroGods to the Anthropic API.';

	/// en: 'Once the order is submitted, Users will receive an order receipt confirmation.'
	String get orderConfirmation => 'Once the order is submitted, Users will receive an order receipt confirmation.';

	/// en: 'Once the order is submitted, Users will receive an order receipt confirmation.'
	String get orderConfirmationEmail => 'Once the order is submitted, Users will receive an order receipt confirmation.';

	/// en: 'Order Submission'
	String get orderSubmission => 'Order Submission';

	/// en: 'Order submission entails the following:'
	String get orderSubmissionConsequences => 'Order submission entails the following:';

	/// en: 'To submit the order, Users are required to accept these Terms and use the respective button or mechanism on AstroGods, thereby committing to pay the agreed price.'
	String get orderSubmissionRequirement => 'To submit the order, Users are required to accept these Terms and use the respective button or mechanism on AstroGods, thereby committing to pay the agreed price.';

	/// en: 'Indicates the natural or legal person who provides AstroGods and/or offers the Service to Users.'
	String get ownerDefinition => 'Indicates the natural or legal person who provides AstroGods and/or offers the Service to Users.';

	/// en: 'Owner (or We)'
	String get ownerDefinitionTitle => 'Owner (or We)';

	/// en: 'Owner's email address:'
	String get ownerEmail => 'Owner\'s email address:';

	/// en: 'Arcangelo Massari - Bologna (Italy)'
	String get ownerName => 'Arcangelo Massari - Bologna (Italy)';

	/// en: 'Therefore, the Owner reserves the right to adopt any suitable measure to protect their legitimate interests, and in particular to deny the User access to AstroGods or the Service, terminate contracts, report any objectionable activity carried out through AstroGods or the Service to competent authorities - e.g. judicial or administrative authority - whenever the User implements or there is suspicion that they implement:'
	String get ownerProtectiveRights => 'Therefore, the Owner reserves the right to adopt any suitable measure to protect their legitimate interests, and in particular to deny the User access to AstroGods or the Service, terminate contracts, report any objectionable activity carried out through AstroGods or the Service to competent authorities - e.g. judicial or administrative authority - whenever the User implements or there is suspicion that they implement:';

	/// en: 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire ownership of the ordered Products.'
	String get ownershipReservation => 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire ownership of the ordered Products.';

	/// en: 'Ownership reservation'
	String get ownershipReservationTitle => 'Ownership reservation';

	/// en: 'Paid Products'
	String get paidProducts => 'Paid Products';

	/// en: 'However, the closure of the User account will be suspended until the expiry of any paid subscription services purchased by the User.'
	String get paidSubscriptionSuspension => 'However, the closure of the User account will be suspended until the expiry of any paid subscription services purchased by the User.';

	/// en: 'It is the Users' responsibility to keep their access credentials secure and confidential. To this end, Users must choose a password that corresponds to the highest level of security available on AstroGods.'
	String get passwordSecurity => 'It is the Users\' responsibility to keep their access credentials secure and confidential. To this end, Users must choose a password that corresponds to the highest level of security available on AstroGods.';

	/// en: 'Payment Failed'
	String get paymentFailed => 'Payment Failed';

	/// en: 'Your subscription payment could not be processed. Please update your payment method to continue using our services.'
	String get paymentFailedDescription => 'Your subscription payment could not be processed. Please update your payment method to continue using our services.';

	/// en: 'In the event that payment made with one of the available methods fails or is rejected by the payment service provider, the Owner is not obligated to execute the order. In the event that payment is not successful, the Owner reserves the right to request the User to reimburse any related expenses or damages.'
	String get paymentFailureConsequences => 'In the event that payment made with one of the available methods fails or is rejected by the payment service provider, the Owner is not obligated to execute the order. In the event that payment is not successful, the Owner reserves the right to request the User to reimburse any related expenses or damages.';

	/// en: 'Payment information'
	String get paymentInformation => 'Payment information';

	/// en: 'Payment management'
	String get paymentManagement => 'Payment management';

	/// en: 'Unless otherwise specified, AstroGods processes all payments with credit card, bank transfer or other means through external payment service providers. In general, and unless otherwise indicated, Users are requested to provide payment details and personal information directly to such payment service providers. AstroGods is not involved in the collection and processing of such information: it will instead only receive a notification from the relevant payment service provider about the payment made.'
	String get paymentManagementDescription => 'Unless otherwise specified, AstroGods processes all payments with credit card, bank transfer or other means through external payment service providers. In general, and unless otherwise indicated, Users are requested to provide payment details and personal information directly to such payment service providers.\nAstroGods is not involved in the collection and processing of such information: it will instead only receive a notification from the relevant payment service provider about the payment made.';

	/// en: 'Payment management'
	String get paymentManagementTitle => 'Payment management';

	/// en: 'Payment Methods'
	String get paymentMethods => 'Payment Methods';

	/// en: 'Stripe Technology Europe Ltd handles payments made through Stripe, while Apple handles those made through the App Store. AstroGods does not store or have access to your payment card details.'
	String get paymentMethodsConditions => 'Stripe Technology Europe Ltd handles payments made through Stripe, while Apple handles those made through the App Store. AstroGods does not store or have access to your payment card details.';

	/// en: 'On the website and in the Android, Windows and Linux apps, AstroGods processes payments through Stripe, a PCI DSS certified payment processor. Accepted payment methods include major credit and debit cards (Visa, Mastercard, American Express), digital wallets (Apple Pay, Google Pay), and other methods available through Stripe in your region. In the iPhone, iPad and Mac apps, subscriptions are purchased through Apple's App Store, as described in the section on subscriptions managed through Apple Account.'
	String get paymentMethodsInfo => 'On the website and in the Android, Windows and Linux apps, AstroGods processes payments through Stripe, a PCI DSS certified payment processor. Accepted payment methods include major credit and debit cards (Visa, Mastercard, American Express), digital wallets (Apple Pay, Google Pay), and other methods available through Stripe in your region. In the iPhone, iPad and Mac apps, subscriptions are purchased through Apple\'s App Store, as described in the section on subscriptions managed through Apple Account.';

	/// en: 'The suspension or cancellation of an account for causes attributable to the User does not exempt the User from payment of fees or prices that may be applicable.'
	String get paymentObligationRemains => 'The suspension or cancellation of an account for causes attributable to the User does not exempt the User from payment of fees or prices that may be applicable.';

	/// en: 'Payment processing error occurred'
	String get paymentProcessingError => 'Payment processing error occurred';

	/// en: 'All payments are handled independently by third-party services. Therefore, AstroGods does not collect payment-related data – such as credit card numbers – but receives a notification once the payment has been successful. For further information on the processing of personal data and related rights, the User can refer to the [AstroGods privacy policy](/privacy-policy).'
	String get paymentThirdPartyHandling => 'All payments are handled independently by third-party services. Therefore, AstroGods does not collect payment-related data – such as credit card numbers – but receives a notification once the payment has been successful. For further information on the processing of personal data and related rights, the User can refer to the [AstroGods privacy policy](/privacy-policy).';

	/// en: 'Permitted Use'
	String get permittedUse => 'Permitted Use';

	/// en: 'AstroGods and the Service may only be used for the purposes for which they are offered, according to these Terms and applicable law.'
	String get permittedUseText => 'AstroGods and the Service may only be used for the purposes for which they are offered, according to these Terms and applicable law.';

	/// en: 'Phone number'
	String get phoneNumber => 'Phone number';

	/// en: 'When the User searches for a birthplace, the AstroGods servers send the typed text to Google Maps Platform to suggest places and find their coordinates. Google receives the request from the AstroGods servers, so it does not receive the User's IP address or account data.'
	String get placeSearchDescription => 'When the User searches for a birthplace, the AstroGods servers send the typed text to Google Maps Platform to suggest places and find their coordinates. Google receives the request from the AstroGods servers, so it does not receive the User\'s IP address or account data.';

	/// en: 'Place search'
	String get placeSearchTitle => 'Place search';

	/// en: 'Planetary positions'
	String get planetaryPositions => 'Planetary positions';

	/// en: 'The previous version continues to govern the relationship until acceptance of the changes by the User. This version may be requested from the Owner.'
	String get previousVersionValidity => 'The previous version continues to govern the relationship until acceptance of the changes by the User. This version may be requested from the Owner.';

	/// en: 'Pricing'
	String get pricing => 'Pricing';

	/// en: 'Prices on AstroGods include all applicable fees, taxes and costs.'
	String get pricingPolicy => 'Prices on AstroGods include all applicable fees, taxes and costs.';

	/// en: 'During the purchase procedure and before order submission, Users are duly informed of all fees, taxes and costs (including any shipping charges) that will be charged to them.'
	String get pricingTransparency => 'During the purchase procedure and before order submission, Users are duly informed of all fees, taxes and costs (including any shipping charges) that will be charged to them.';

	/// en: 'Privacy Policy'
	String get privacyPolicy => 'Privacy Policy';

	/// en: 'Privacy Policy'
	String get privacyPolicyReference => 'Privacy Policy';

	/// en: 'For detailed information about how we collect, use, and protect your personal data, please refer to our complete Privacy Policy.'
	String get privacyPolicyReferenceContent => 'For detailed information about how we collect, use, and protect your personal data, please refer to our complete Privacy Policy.';

	/// en: 'Privacy policy'
	String get privacyPolicySection => 'Privacy policy';

	/// en: 'AstroGods Privacy Policy'
	String get privacyPolicyTitle => 'AstroGods Privacy Policy';

	/// en: 'Welcome to AstroGods privacy policy. This policy will help you understand what data we collect, why we collect it, and what your rights are regarding it.'
	String get privacyPolicyWelcomeText => 'Welcome to AstroGods privacy policy. This policy will help you understand what data we collect, why we collect it, and what your rights are regarding it.';

	/// en: 'Although we strive to create a positive user experience, we know that problems can occasionally occur between us and our users.'
	String get problemsDescription => 'Although we strive to create a positive user experience, we know that problems can occasionally occur between us and our users.';

	/// en: 'Processing details'
	String get processingDetailsSection => 'Processing details';

	/// en: '### Processing methods The Owner processes the Personal Data of Users by adopting appropriate security measures aimed at preventing unauthorized access, disclosure, modification or destruction of Personal Data. Processing is carried out using computer and/or telematic tools, with organizational methods and logics strictly related to the indicated purposes. In addition to the Owner, in some cases, other subjects involved in the organization of AstroGods (administrative, commercial, marketing, legal personnel, system administrators) or external subjects (such as third-party technical service providers, postal couriers, hosting providers, IT companies, communication agencies) may have access to the Data, also appointed, if necessary, as Data Processors by the Owner. The updated list of Processors can always be requested from the Data Controller. ### Location Data is processed at the Owner's operating offices and in any other place where the parties involved in the processing are located. For further information, contact the Owner. The User's Personal Data may be transferred to a country other than the one where the User is located. To obtain further information on the place of processing, the User can refer to the section relating to details on Personal Data processing. ### Retention time Unless otherwise specified in this document, Personal Data is processed and stored for the time required by the purposes for which it was collected and may be stored for a longer period due to any legal obligations or based on the consent of Users.'
	String get processingMethodsContent => '### Processing methods\n\nThe Owner processes the Personal Data of Users by adopting appropriate security measures aimed at preventing unauthorized access, disclosure, modification or destruction of Personal Data.\n\nProcessing is carried out using computer and/or telematic tools, with organizational methods and logics strictly related to the indicated purposes. In addition to the Owner, in some cases, other subjects involved in the organization of AstroGods (administrative, commercial, marketing, legal personnel, system administrators) or external subjects (such as third-party technical service providers, postal couriers, hosting providers, IT companies, communication agencies) may have access to the Data, also appointed, if necessary, as Data Processors by the Owner. The updated list of Processors can always be requested from the Data Controller.\n\n### Location\n\nData is processed at the Owner\'s operating offices and in any other place where the parties involved in the processing are located.\n\nFor further information, contact the Owner.\n\nThe User\'s Personal Data may be transferred to a country other than the one where the User is located. To obtain further information on the place of processing, the User can refer to the section relating to details on Personal Data processing.\n\n### Retention time\n\nUnless otherwise specified in this document, Personal Data is processed and stored for the time required by the purposes for which it was collected and may be stored for a longer period due to any legal obligations or based on the consent of Users.';

	/// en: 'Methods and place of processing'
	String get processingMethodsSection => 'Methods and place of processing';

	/// en: 'Methods and place of processing of collected Data'
	String get processingMethodsTitle => 'Methods and place of processing of collected Data';

	/// en: 'The characteristics of the selected Product will be specified during the purchase procedure.'
	String get productCharacteristicsSpecified => 'The characteristics of the selected Product will be specified during the purchase procedure.';

	/// en: 'A good or service available through AstroGods, including specifically: astrological interpretations, birth chart analyses, astrological predictions and forecasts, compatibility reports, astrological educational content, and any other astrological service or digital content defined separately in this document.'
	String get productDefinition => 'A good or service available through AstroGods, including specifically: astrological interpretations, birth chart analyses, astrological predictions and forecasts, compatibility reports, astrological educational content, and any other astrological service or digital content defined separately in this document.';

	/// en: 'Product'
	String get productDefinitionTitle => 'Product';

	/// en: 'Product Description'
	String get productDescription => 'Product Description';

	/// en: 'Prices, descriptions and availability of astrological Products (including birth chart readings, compatibility analyses, daily and monthly predictions, and relationship insights) are specified in the respective sections of AstroGods and are subject to change without notice.'
	String get productDescriptionInfo => 'Prices, descriptions and availability of astrological Products (including birth chart readings, compatibility analyses, daily and monthly predictions, and relationship insights) are specified in the respective sections of AstroGods and are subject to change without notice.';

	/// en: 'Although Products on AstroGods are presented with the maximum technically possible accuracy, the representation on AstroGods through any means (including, as the case may be, graphic materials, images, colors, sounds) is to be understood as a mere reference and does not imply any guarantee regarding the characteristics of the Product purchased.'
	String get productRepresentationDisclaimer => 'Although Products on AstroGods are presented with the maximum technically possible accuracy, the representation on AstroGods through any means (including, as the case may be, graphic materials, images, colors, sounds) is to be understood as a mere reference and does not imply any guarantee regarding the characteristics of the Product purchased.';

	/// en: 'Promotions and Discounts'
	String get promotionsAndDiscounts => 'Promotions and Discounts';

	/// en: 'The Owner may offer discounts or special promotions for the purchase of Products. Such promotions or discounts are always subject to the requirements and terms and conditions provided in the relevant section of AstroGods.'
	String get promotionsDisclaimer => 'The Owner may offer discounts or special promotions for the purchase of Products. Such promotions or discounts are always subject to the requirements and terms and conditions provided in the relevant section of AstroGods.';

	/// en: 'Promotions and offers are always granted at the sole discretion of the Owner.'
	String get promotionsDiscretion => 'Promotions and offers are always granted at the sole discretion of the Owner.';

	/// en: 'Repeated or periodic promotions or discounts do not constitute any claim or right enforceable by Users in the future.'
	String get promotionsNoRights => 'Repeated or periodic promotions or discounts do not constitute any claim or right enforceable by Users in the future.';

	/// en: 'Depending on the case, discounts and promotions are valid for a certain period of time or until stocks run out. Unless otherwise specified, the time limitations of promotions and discounts refer to the time zone of the Owner's headquarters, as indicated in the contact details in this document.'
	String get promotionsTimeLimit => 'Depending on the case, discounts and promotions are valid for a certain period of time or until stocks run out. Unless otherwise specified, the time limitations of promotions and discounts refer to the time zone of the Owner\'s headquarters, as indicated in the contact details in this document.';

	/// en: 'A) Software licensing'
	String get proprietaryContentStandard => 'A) Software licensing';

	/// en: '. The backend, algorithms, trademarks, user database, and all server-side elements remain the exclusive property of the Owner with all rights reserved.'
	String get proprietaryContentStandardTextAfter => '. The backend, algorithms, trademarks, user database, and all server-side elements remain the exclusive property of the Owner with all rights reserved.';

	/// en: 'The application source code (frontend) is released under the GNU Affero General Public License v3.0 (AGPL-3.0) and is available at '
	String get proprietaryContentStandardTextBefore => 'The application source code (frontend) is released under the GNU Affero General Public License v3.0 (AGPL-3.0) and is available at ';

	/// en: 'Provided by: '
	String get providedByLabel => 'Provided by: ';

	/// en: 'Purchase history'
	String get purchaseHistory => 'Purchase history';

	/// en: 'All notifications related to the purchase procedure described above will be sent to the email address provided by the User for this purpose.'
	String get purchaseNotifications => 'All notifications related to the purchase procedure described above will be sent to the email address provided by the User for this purpose.';

	/// en: 'Purchase Procedure'
	String get purchaseProcedure => 'Purchase Procedure';

	/// en: 'Each step, from product selection to order submission, is part of the purchase procedure. The purchase procedure includes the following steps:'
	String get purchaseProcedureSteps => 'Each step, from product selection to order submission, is part of the purchase procedure. The purchase procedure includes the following steps:';

	/// en: 'To purchase Products, the User is required to register or log in to AstroGods.'
	String get purchaseRegistrationRequired => 'To purchase Products, the User is required to register or log in to AstroGods.';

	/// en: 'Purchase via App Store'
	String get purchaseViaAppStore => 'Purchase via App Store';

	/// en: 'To obtain detailed information on the purposes of processing and the Personal Data specifically relevant to each purpose, the User can refer to the section "Details on Personal Data processing".'
	String get purposesDetailedInfoText => 'To obtain detailed information on the purposes of processing and the Personal Data specifically relevant to each purpose, the User can refer to the section "Details on Personal Data processing".';

	/// en: 'User Data is collected to enable the Owner to provide the Service, comply with legal obligations, respond to requests or enforcement actions, protect their rights and interests (or those of Users or third parties), identify any fraudulent or malicious activities, as well as for the following purposes:'
	String get purposesIntroText => 'User Data is collected to enable the Owner to provide the Service, comply with legal obligations, respond to requests or enforcement actions, protect their rights and interests (or those of Users or third parties), identify any fraudulent or malicious activities, as well as for the following purposes:';

	/// en: 'Purposes of Processing'
	String get purposesSection => 'Purposes of Processing';

	/// en: 'The refund will be made without undue delay and in any case within 14 days from the day on which the Owner was informed of the User's decision to withdraw from the contract. Unless otherwise agreed with the User, the refund will be made using the same means of payment used for the initial transaction. The User will not incur any cost as a result of the withdrawal.'
	String get refundTimeline => 'The refund will be made without undue delay and in any case within 14 days from the day on which the Owner was informed of the User\'s decision to withdraw from the contract. Unless otherwise agreed with the User, the refund will be made using the same means of payment used for the initial transaction. The User will not incur any cost as a result of the withdrawal.';

	/// en: 'Registration'
	String get registration => 'Registration';

	/// en: 'Registration and authentication'
	String get registrationAndAuth => 'Registration and authentication';

	/// en: 'To use the Service, User can open an account by providing all required data and information completely and truthfully. It is not possible to use the Service without opening a User account.'
	String get registrationRequired => 'To use the Service, User can open an account by providing all required data and information completely and truthfully. It is not possible to use the Service without opening a User account.';

	/// en: 'The registration of a User account on AstroGods is subject to the conditions specified below. By registering an account, the User confirms that they meet these conditions.'
	String get registrationRequirementsText => 'The registration of a User account on AstroGods is subject to the conditions specified below. By registering an account, the User confirms that they meet these conditions.';

	/// en: 'Registration successful!'
	String get registrationSuccessful => 'Registration successful!';

	/// en: 'The renewal has the same duration as the original subscription period.'
	String get renewalDurationMatch => 'The renewal has the same duration as the original subscription period.';

	/// en: 'The Owner will process the request without undue delay and within 14 days of its receipt.'
	String get responseTimeline => 'The Owner will process the request without undue delay and within 14 days of its receipt.';

	/// en: 'Right of Withdrawal'
	String get rightOfWithdrawal => 'Right of Withdrawal';

	/// en: 'Sales terms and conditions'
	String get salesTerms => 'Sales terms and conditions';

	/// en: 'The rates, duration and conditions applicable to the sale of such Products are described below and in the respective sections of AstroGods.'
	String get salesTermsDetails => 'The rates, duration and conditions applicable to the sale of such Products are described below and in the respective sections of AstroGods.';

	/// en: 'Some of the Products offered on AstroGods as part of the service are paid.'
	String get salesTermsIntro => 'Some of the Products offered on AstroGods as part of the service are paid.';

	/// en: 'Sales terms and conditions'
	String get salesTermsSection => 'Sales terms and conditions';

	/// en: 'The service offered through AstroGods as described in the Terms and on AstroGods.'
	String get serviceDefinition => 'The service offered through AstroGods as described in the Terms and on AstroGods.';

	/// en: 'Service'
	String get serviceDefinitionTitle => 'Service';

	/// en: 'Service Interruption'
	String get serviceInterruption => 'Service Interruption';

	/// en: 'To ensure the best possible level of service, the Owner reserves the right to interrupt the Service for maintenance, system updates, or any other changes, giving appropriate notice to Users.'
	String get serviceMaintenanceRight => 'To ensure the best possible level of service, the Owner reserves the right to interrupt the Service for maintenance, system updates, or any other changes, giving appropriate notice to Users.';

	/// en: 'Service Resale'
	String get serviceResale => 'Service Resale';

	/// en: 'Within the limits of the law, the Owner reserves the right to suspend or completely terminate the Service. In case of termination of the Service, the Owner will endeavor to allow Users to extract their personal data and information and will respect Users' rights relating to continued use of the product and/or compensation, according to legal provisions.'
	String get serviceTerminationRights => 'Within the limits of the law, the Owner reserves the right to suspend or completely terminate the Service. In case of termination of the Service, the Owner will endeavor to allow Users to extract their personal data and information and will respect Users\' rights relating to continued use of the product and/or compensation, according to legal provisions.';

	/// en: 'Severability Clause'
	String get severabilityClause => 'Severability Clause';

	/// en: 'Notwithstanding the above, the nullity, invalidity, or ineffectiveness of a specific provision of these Terms does not result in nullity of the entire Agreement, unless the null, invalid, or ineffective provisions within the Agreement are essential or of such importance that the parties would not have concluded the contract if they had known the provision would be invalid, or in cases where the remaining provisions would impose an excessive and unacceptable burden on one of the parties.'
	String get severabilityLimitations => 'Notwithstanding the above, the nullity, invalidity, or ineffectiveness of a specific provision of these Terms does not result in nullity of the entire Agreement, unless the null, invalid, or ineffective provisions within the Agreement are essential or of such importance that the parties would not have concluded the contract if they had known the provision would be invalid, or in cases where the remaining provisions would impose an excessive and unacceptable burden on one of the parties.';

	/// en: 'Sign in with Apple is an authentication service provided by Apple. If the User chooses to hide their email, AstroGods receives a forwarding address created by Apple.'
	String get signInWithAppleDescription => 'Sign in with Apple is an authentication service provided by Apple. If the User chooses to hide their email, AstroGods receives a forwarding address created by Apple.';

	/// en: 'Within the Stripe checkout area, Users may also be asked to specify their billing and shipping address.'
	String get stripeBillingAddress => 'Within the Stripe checkout area, Users may also be asked to specify their billing and shipping address.';

	/// en: 'By clicking the checkout button, Users access the Stripe checkout area where they will be asked to provide their contact details and a payment method of their choice.'
	String get stripeCheckoutAccess => 'By clicking the checkout button, Users access the Stripe checkout area where they will be asked to provide their contact details and a payment method of their choice.';

	/// en: 'Users can access the Stripe Customer Portal to view billing history, download invoices, update payment methods, and manage subscription settings. This portal is provided directly by Stripe and ensures secure access to payment and billing information.'
	String get stripeCustomerPortal => 'Users can access the Stripe Customer Portal to view billing history, download invoices, update payment methods, and manage subscription settings. This portal is provided directly by Stripe and ensures secure access to payment and billing information.';

	/// en: 'Stripe is a payment service provided by Stripe Technology Europe Ltd.'
	String get stripeDescription => 'Stripe is a payment service provided by Stripe Technology Europe Ltd.';

	/// en: 'Within the Stripe checkout area, Users will have the possibility to choose express checkout. Express checkout allows Users to complete the purchase directly, using payment information and contact details stored by the most common online payment management services (such as "ApplePay", "Google Pay", "Microsoft Pay").'
	String get stripeExpressCheckout => 'Within the Stripe checkout area, Users will have the possibility to choose express checkout. Express checkout allows Users to complete the purchase directly, using payment information and contact details stored by the most common online payment management services (such as "ApplePay", "Google Pay", "Microsoft Pay").';

	/// en: 'Users who have not yet done so, can request Stripe to store their payment information for future purchases on AstroGods or on other sites that use Stripe as a payment gateway. For information on the processing of personal data and related rights, the User can consult the [privacy policy of Stripe](https://stripe.com/privacy) and that of [AstroGods](/privacy-policy).'
	String get stripePaymentStorage => 'Users who have not yet done so, can request Stripe to store their payment information for future purchases on AstroGods or on other sites that use Stripe as a payment gateway. For information on the processing of personal data and related rights, the User can consult the [privacy policy of Stripe](https://stripe.com/privacy) and that of [AstroGods](/privacy-policy).';

	/// en: 'For subscriptions purchased through Stripe, Stripe securely stores payment method information to process recurring payments automatically. Users can manage, update, or cancel their payment methods and subscriptions through the customer portal accessible from their account settings.'
	String get stripeRecurringPayments => 'For subscriptions purchased through Stripe, Stripe securely stores payment method information to process recurring payments automatically. Users can manage, update, or cancel their payment methods and subscriptions through the customer portal accessible from their account settings.';

	/// en: 'Through subscription, the User receives a Product continuously or periodically. Details regarding the type of subscription and termination are described below.'
	String get subscriptionContinuousProduct => 'Through subscription, the User receives a Product continuously or periodically. Details regarding the type of subscription and termination are described below.';

	/// en: 'Subscriptions can be canceled: (1) for purchases through Stripe, from the Stripe Customer Portal accessible from the [account settings](/settings?section=subscriptions); (2) for purchases through the App Store, from the [Apple Account settings](https://apps.apple.com/account/subscriptions); (3) by sending a clear cancellation notice to the Owner using the [contact details provided in this document](mailto:contact@astrogods.it).'
	String get subscriptionTermination => 'Subscriptions can be canceled: (1) for purchases through Stripe, from the Stripe Customer Portal accessible from the [account settings](/settings?section=subscriptions); (2) for purchases through the App Store, from the [Apple Account settings](https://apps.apple.com/account/subscriptions); (3) by sending a clear cancellation notice to the Owner using the [contact details provided in this document](mailto:contact@astrogods.it).';

	/// en: 'Subscriptions'
	String get subscriptions => 'Subscriptions';

	/// en: 'Subscriptions'
	String get subscriptionsTitle => 'Subscriptions';

	/// en: 'Summary'
	String get summary => 'Summary';

	/// en: 'Summary'
	String get summarySection => 'Summary';

	/// en: 'Please read this document carefully.'
	String get termsAcceptanceRequired => 'Please read this document carefully.';

	/// en: 'Terms and Conditions'
	String get termsAndConditions => 'Terms and Conditions';

	/// en: 'Terms and Conditions of AstroGods'
	String get termsAndConditionsTitle => 'Terms and Conditions of AstroGods';

	/// en: 'All conditions applicable to the use of AstroGods and/or the provision of the Service as described in this document as well as in any other document or agreement related to it, in the most updated version respectively.'
	String get termsDefinition => 'All conditions applicable to the use of AstroGods and/or the provision of the Service as described in this document as well as in any other document or agreement related to it, in the most updated version respectively.';

	/// en: 'Terms'
	String get termsDefinitionTitle => 'Terms';

	/// en: 'These Terms govern'
	String get termsGovernText => 'These Terms govern';

	/// en: 'Introduction'
	String get termsIntroduction => 'Introduction';

	/// en: 'Introduction'
	String get termsIntroductionSection => 'Introduction';

	/// en: 'Terms Modification'
	String get termsModification => 'Terms Modification';

	/// en: 'Continued use of the Service implies User acceptance of the updated Terms. If the User does not wish to accept the changes, they must cease using the Service and may withdraw from the Agreement.'
	String get termsModificationAcceptance => 'Continued use of the Service implies User acceptance of the updated Terms. If the User does not wish to accept the changes, they must cease using the Service and may withdraw from the Agreement.';

	/// en: 'The Owner reserves the right to modify the Terms at any time. In such case, the Owner will give appropriate notice of the changes to Users.'
	String get termsModificationRight => 'The Owner reserves the right to modify the Terms at any time. In such case, the Owner will give appropriate notice of the changes to Users.';

	/// en: 'Terms of Use'
	String get termsOfUse => 'Terms of Use';

	/// en: 'Unless otherwise specified, the terms of use of AstroGods set out in this section have general validity.'
	String get termsOfUseGeneralValidity => 'Unless otherwise specified, the terms of use of AstroGods set out in this section have general validity.';

	/// en: 'Terms of Use'
	String get termsOfUseSection => 'Terms of Use';

	/// en: 'Table of Contents'
	String get termsTableOfContents => 'Table of Contents';

	/// en: 'The conditions applicable to resources provided by third parties, including those applicable to any grants of rights on content, are determined by the same third parties and governed by their respective terms and conditions or, in their absence, by law.'
	String get thirdPartyResourcesDisclaimer => 'The conditions applicable to resources provided by third parties, including those applicable to any grants of rights on content, are determined by the same third parties and governed by their respective terms and conditions or, in their absence, by law.';

	/// en: 'this website, accessible via browser, including related subdomains and any other site through which the Owner offers the Service;'
	String get thisSiteDescription => 'this website, accessible via browser, including related subdomains and any other site through which the Owner offers the Service;';

	/// en: 'AstroGods does not use tracking tools for statistics or advertising. It only uses the cookies and browser storage needed for it to work, for example to keep you signed in.'
	String get trackingToolsIntro => 'AstroGods does not use tracking tools for statistics or advertising. It only uses the cookies and browser storage needed for it to work, for example to keep you signed in.';

	/// en: 'No tracking'
	String get trackingToolsSection => 'No tracking';

	/// en: 'Upon expiration, the trial period will automatically convert to the equivalent paid Product unless the User cancels the purchase before the trial period expires.'
	String get trialAutoConversion => 'Upon expiration, the trial period will automatically convert to the equivalent paid Product unless the User cancels the purchase before the trial period expires.';

	/// en: 'Trial Period'
	String get trialPeriod => 'Trial Period';

	/// en: 'Users have the opportunity to try AstroGods or individual Products free of charge for a 7-day, non-renewable trial period. Some functions or features of AstroGods may not be available during the trial period. Additional conditions applicable to the trial period will be specified on AstroGods.'
	String get trialPeriodAvailability => 'Users have the opportunity to try AstroGods or individual Products free of charge for a 7-day, non-renewable trial period. Some functions or features of AstroGods may not be available during the trial period. Additional conditions applicable to the trial period will be specified on AstroGods.';

	/// en: 'Trusted third parties that help us process them'
	String get trustedThirdParties => 'Trusted third parties that help us process them';

	/// en: 'Types of cookies we use'
	String get typesOfCookiesSection => 'Types of cookies we use';

	/// en: 'Users are not authorized to reproduce, duplicate, copy, sell, resell, or exploit AstroGods or the Service in whole or in part without the Owner's prior written consent, expressed directly or through a legitimate resale program.'
	String get unauthorizedResale => 'Users are not authorized to reproduce, duplicate, copy, sell, resell, or exploit AstroGods or the Service in whole or in part without the Owner\'s prior written consent, expressed directly or through a legitimate resale program.';

	/// en: 'United States'
	String get unitedStates => 'United States';

	/// en: 'Usage data'
	String get usageData => 'Usage data';

	/// en: 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire the usage rights of the ordered Products.'
	String get usageRightsReservation => 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire the usage rights of the ordered Products.';

	/// en: 'Usage rights reservation'
	String get usageRightsReservationTitle => 'Usage rights reservation';

	/// en: 'the use of AstroGods and'
	String get useOfService => 'the use of AstroGods and';

	/// en: 'Limitation of liability for User activities on AstroGods'
	String get userActivityLiabilityLimitation => 'Limitation of liability for User activities on AstroGods';

	/// en: 'The User is not authorized to assign or transfer their rights and obligations under the Terms without the written consent of the Owner.'
	String get userAssignmentRestriction => 'The User is not authorized to assign or transfer their rights and obligations under the Terms without the written consent of the Owner.';

	/// en: 'In the event that the purchased Product requires action by the User, such as the provision of information or personal data, specifications or particular requests, order submission also constitutes the User's obligation to collaborate accordingly.'
	String get userCollaborationObligation => 'In the event that the purchased Product requires action by the User, such as the provision of information or personal data, specifications or particular requests, order submission also constitutes the User\'s obligation to collaborate accordingly.';

	/// en: 'It is the User's exclusive responsibility to ensure that the use of AstroGods and/or the Service does not violate the law, regulations or the rights of third parties.'
	String get userExclusiveResponsibility => 'It is the User\'s exclusive responsibility to ensure that the use of AstroGods and/or the Service does not violate the law, regulations or the rights of third parties.';

	/// en: 'User Rights'
	String get userRights => 'User Rights';

	/// en: 'User Rights'
	String get userRightsSection => 'User Rights';

	/// en: 'Using the [account closure tools](/settings?section=deleteAccount) available on AstroGods.'
	String get usingAccountClosureTools => 'Using the [account closure tools](/settings?section=deleteAccount) available on AstroGods.';

	/// en: 'By using AstroGods the User declares to meet the following requirements:'
	String get usingAstroGodsUserDeclares => 'By using AstroGods the User declares to meet the following requirements:';

	/// en: 'View Cookie Policy'
	String get viewCookiePolicy => 'View Cookie Policy';

	/// en: 'View Privacy Policy'
	String get viewPrivacyPolicy => 'View Privacy Policy';

	/// en: 'violations of law, regulations and/or the Terms;'
	String get violationsOfLaw => 'violations of law, regulations and/or the Terms;';

	/// en: 'Any digital or paper code or voucher that allows the User to purchase the Product at a discounted price.'
	String get voucherDefinition => 'Any digital or paper code or voucher that allows the User to purchase the Product at a discounted price.';

	/// en: 'Voucher'
	String get voucherDefinitionTitle => 'Voucher';

	/// en: 'The Voucher must be used within the specified validity period. Once the period expires, the Voucher will be automatically canceled. Any possibility of claiming rights, including refund of the Voucher value, is excluded;'
	String get voucherExpiration => 'The Voucher must be used within the specified validity period. Once the period expires, the Voucher will be automatically canceled. Any possibility of claiming rights, including refund of the Voucher value, is excluded;';

	/// en: 'The Voucher can only be redeemed in full at the time of purchase – partial use is not permitted;'
	String get voucherFullRedemption => 'The Voucher can only be redeemed in full at the time of purchase – partial use is not permitted;';

	/// en: 'The User is not entitled to any credit/refund/compensation in case there is a difference between the Voucher value and the redeemed value;'
	String get voucherNoCredit => 'The User is not entitled to any credit/refund/compensation in case there is a difference between the Voucher value and the redeemed value;';

	/// en: 'The Voucher is to be understood exclusively for non-commercial use. The reproduction, counterfeiting and commercialization of the Voucher are strictly prohibited, as well as any illegal activity connected to the purchase and/or use of the Voucher.'
	String get voucherNonCommercialUse => 'The Voucher is to be understood exclusively for non-commercial use. The reproduction, counterfeiting and commercialization of the Voucher are strictly prohibited, as well as any illegal activity connected to the purchase and/or use of the Voucher.';

	/// en: 'Unless otherwise specified, single-use Vouchers can be redeemed only once per purchase and can therefore be redeemed only once even in the case of installment purchases;'
	String get voucherSingleUse => 'Unless otherwise specified, single-use Vouchers can be redeemed only once per purchase and can therefore be redeemed only once even in the case of installment purchases;';

	/// en: 'Each Voucher is valid only if used according to the methods and within the time period specified on the website and/or on the Voucher;'
	String get voucherValidityRule => 'Each Voucher is valid only if used according to the methods and within the time period specified on the website and/or on the Voucher;';

	/// en: 'Vouchers'
	String get vouchers => 'Vouchers';

	/// en: 'Any additional or divergent provisions applicable to the use of Vouchers reported in the relevant information page or on the Voucher itself prevail in any case, regardless of the provisions that follow.'
	String get vouchersAdditionalProvisions => 'Any additional or divergent provisions applicable to the use of Vouchers reported in the relevant information page or on the Voucher itself prevail in any case, regardless of the provisions that follow.';

	/// en: 'Vouchers are not cumulative;'
	String get vouchersNotCumulative => 'Vouchers are not cumulative;';

	/// en: 'Promotions and discounts may be offered in the form of Vouchers.'
	String get vouchersPromoForm => 'Promotions and discounts may be offered in the form of Vouchers.';

	/// en: 'Unless otherwise specified, the following rules apply to the use of Vouchers:'
	String get vouchersRules => 'Unless otherwise specified, the following rules apply to the use of Vouchers:';

	/// en: 'In case of violation of the conditions applicable to Vouchers, the Owner may legitimately refuse to fulfill their contractual obligations and expressly reserves the right to take action in appropriate venues, including judicial ones, in order to protect their rights and interests.'
	String get vouchersViolationConsequences => 'In case of violation of the conditions applicable to Vouchers, the Owner may legitimately refuse to fulfill their contractual obligations and expressly reserves the right to take action in appropriate venues, including judicial ones, in order to protect their rights and interests.';

	/// en: 'Cookies are small data files that are placed on your computer or mobile device when you visit a website. They are widely used to make websites work more efficiently, provide better user experience, and to provide reporting information.'
	String get whatAreCookiesContent => 'Cookies are small data files that are placed on your computer or mobile device when you visit a website. They are widely used to make websites work more efficiently, provide better user experience, and to provide reporting information.';

	/// en: 'What are cookies?'
	String get whatAreCookiesSection => 'What are cookies?';

	/// en: 'Who has the right of withdrawal'
	String get whoHasWithdrawalRights => 'Who has the right of withdrawal';

	/// en: 'When does the withdrawal deadline expire?'
	String get withdrawalDeadlineQuestion => 'When does the withdrawal deadline expire?';

	/// en: 'The Owner will refund all payments received, including delivery costs if any, to Users who have correctly exercised the right of withdrawal.'
	String get withdrawalEffects => 'The Owner will refund all payments received, including delivery costs if any, to Users who have correctly exercised the right of withdrawal.';

	/// en: 'To exercise the right of withdrawal, the User must send the Owner an unequivocal communication of their intention to withdraw from the contract.'
	String get withdrawalExercise => 'To exercise the right of withdrawal, the User must send the Owner an unequivocal communication of their intention to withdraw from the contract.';

	/// en: 'Arcangelo Massari - Bologna (Italy) contact@astrogods.it'
	String get withdrawalFormAddress => 'Arcangelo Massari - Bologna (Italy)\ncontact@astrogods.it';

	/// en: 'Address of consumer(s):_____________________________________________'
	String get withdrawalFormConsumerAddress => 'Address of consumer(s):_____________________________________________';

	/// en: 'Name of consumer(s):_____________________________________________'
	String get withdrawalFormConsumerName => 'Name of consumer(s):_____________________________________________';

	/// en: 'Date: _____________________________________________'
	String get withdrawalFormDate => 'Date: _____________________________________________';

	/// en: '_____________________________________________ (insert here a description of the goods/services from whose purchase you wish to withdraw)'
	String get withdrawalFormDescription => '_____________________________________________ (insert here a description of the goods/services from whose purchase you wish to withdraw)';

	/// en: 'Addressed to:'
	String get withdrawalFormHeader => 'Addressed to:';

	/// en: 'For this purpose, the User may use the standard withdrawal form found in the definitions section of this document. However, the User is free to express their intention to withdraw from the contract in any other suitable form. In order to comply with the period within which the right must be exercised, the User must send the withdrawal declaration before the withdrawal deadline expires.'
	String get withdrawalFormInstructions => 'For this purpose, the User may use the standard withdrawal form found in the definitions section of this document. However, the User is free to express their intention to withdraw from the contract in any other suitable form. In order to comply with the period within which the right must be exercised, the User must send the withdrawal declaration before the withdrawal deadline expires.';

	/// en: 'I/we hereby notify withdrawal from my/our contract of sale for the following goods/services:'
	String get withdrawalFormNotification => 'I/we hereby notify withdrawal from my/our contract of sale for the following goods/services:';

	/// en: 'Ordered on: _____________________________________________ (insert the date)'
	String get withdrawalFormOrderDate => 'Ordered on: _____________________________________________ (insert the date)';

	/// en: 'Received on: _____________________________________________ (insert the date)'
	String get withdrawalFormReceiveDate => 'Received on: _____________________________________________ (insert the date)';

	/// en: '(sign only if this form is notified in paper version)'
	String get withdrawalFormSignature => '(sign only if this form is notified in paper version)';

	/// en: 'Standard withdrawal form'
	String get withdrawalFormTitle => 'Standard withdrawal form';

	/// en: 'Unless an exception applies, the User may enjoy the right to withdraw from the contract within the period specified below (usually 14 days) for any reason and without justification. The User can find more information about the right of withdrawal in this section.'
	String get withdrawalRightSummary => 'Unless an exception applies, the User may enjoy the right to withdraw from the contract within the period specified below (usually 14 days) for any reason and without justification. The User can find more information about the right of withdrawal in this section.';
}

// Path: releaseNotes
class Translations$releaseNotes$en {
	Translations$releaseNotes$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Release notes'
	String get releaseNotes => 'Release notes';

	/// en: 'What's new'
	String get releaseNotesTitle => 'What\'s new';

	/// en: 'Initial release with birth chart readings, synastry analysis for couple compatibility, and daily and monthly transit predictions. PDF export. Full support for English and Italian.'
	String get releaseNotes_2_0_1 => 'Initial release with birth chart readings, synastry analysis for couple compatibility, and daily and monthly transit predictions. PDF export. Full support for English and Italian.';

	/// en: 'Bug fixes and stability improvements.'
	String get releaseNotes_2_0_2 => 'Bug fixes and stability improvements.';

	/// en: 'Performance improvements.'
	String get releaseNotes_2_0_3 => 'Performance improvements.';

	/// en: 'Bug fixes and stability improvements.'
	String get releaseNotes_2_0_4 => 'Bug fixes and stability improvements.';

	/// en: 'Chart-only PDF download for birth chart, synastry, and transits. PDF export for daily and monthly transit readings. House numbers now shown in chart details. Birth charts created before registration are now automatically linked to your account.'
	String get releaseNotes_2_1_0 => 'Chart-only PDF download for birth chart, synastry, and transits. PDF export for daily and monthly transit readings. House numbers now shown in chart details. Birth charts created before registration are now automatically linked to your account.';

	/// en: 'Faster transit calculations, up to 40% faster for monthly transits. New team member: Corrado Camponeschi.'
	String get releaseNotes_2_2_0 => 'Faster transit calculations, up to 40% faster for monthly transits. New team member: Corrado Camponeschi.';

	/// en: 'Bug fixes and stability improvements.'
	String get releaseNotes_2_2_1 => 'Bug fixes and stability improvements.';

	/// en: 'Enhanced chart visualization with degree markers and planet connector lines. Improved water sign colors for better contrast. Visual refinements to the chart display.'
	String get releaseNotes_2_3_0 => 'Enhanced chart visualization with degree markers and planet connector lines. Improved water sign colors for better contrast. Visual refinements to the chart display.';

	/// en: 'Readings can now resume if your connection is interrupted. Improved overall stability.'
	String get releaseNotes_2_4_0 => 'Readings can now resume if your connection is interrupted. Improved overall stability.';

	/// en: 'New release notes screen to view version history. The app now checks compatibility and notifies you when an update is available. Improved reading generation stability.'
	String get releaseNotes_3_0_0 => 'New release notes screen to view version history. The app now checks compatibility and notifies you when an update is available. Improved reading generation stability.';

	/// en: 'High-resolution images in fullscreen view. New aspect grid for synastry and transits. PDF exports now include details and aspect grid pages. Enhanced desktop navigation with arrows, clickable indicators, and keyboard shortcuts. Improved fullscreen zoom for charts and images. Lighter and faster app. Fixed layout issue in landscape mode on mobile.'
	String get releaseNotes_4_0_0 => 'High-resolution images in fullscreen view. New aspect grid for synastry and transits. PDF exports now include details and aspect grid pages. Enhanced desktop navigation with arrows, clickable indicators, and keyboard shortcuts. Improved fullscreen zoom for charts and images. Lighter and faster app. Fixed layout issue in landscape mode on mobile.';

	/// en: 'Fixed an issue where the PDF button did not appear after reading generation. Saved charts now refresh correctly when navigating back with the browser.'
	String get releaseNotes_4_0_1 => 'Fixed an issue where the PDF button did not appear after reading generation. Saved charts now refresh correctly when navigating back with the browser.';

	/// en: 'You can now regenerate readings in your preferred language. Saved transits now appear in saved analyses. Fixed authentication workflow bugs.'
	String get releaseNotes_4_10_0 => 'You can now regenerate readings in your preferred language. Saved transits now appear in saved analyses. Fixed authentication workflow bugs.';

	/// en: 'Success screen after subscription. Reorganized navigation in side menu. Clickable links in Codex. Subscription management improvements.'
	String get releaseNotes_4_10_1 => 'Success screen after subscription. Reorganized navigation in side menu. Clickable links in Codex. Subscription management improvements.';

	/// en: 'If you were born during a clock change, you can now pick which hour you mean. Charts for births before modern time zones are now more accurate. The Codex adds articles on precession and house systems, with interactive diagrams. Tap a citation in the Codex to read the original passage. New floating navigation bar and Google sign in on iPhone.'
	String get releaseNotes_4_11_0 => 'If you were born during a clock change, you can now pick which hour you mean. Charts for births before modern time zones are now more accurate. The Codex adds articles on precession and house systems, with interactive diagrams. Tap a citation in the Codex to read the original passage. New floating navigation bar and Google sign in on iPhone.';

	/// en: 'Small fixes to keep the app running smoothly.'
	String get releaseNotes_4_11_1 => 'Small fixes to keep the app running smoothly.';

	/// en: 'Subscription checks and payments work properly again. Email horoscope settings and dialogs now fit better on narrow phones. On iOS, pages now start below the top bar, and titles are centered on every device.'
	String get releaseNotes_4_11_2 => 'Subscription checks and payments work properly again. Email horoscope settings and dialogs now fit better on narrow phones. On iOS, pages now start below the top bar, and titles are centered on every device.';

	/// en: 'New app icons. Improved logo quality in the menu. Fixed a validation issue when editing birth charts.'
	String get releaseNotes_4_5_1 => 'New app icons. Improved logo quality in the menu. Fixed a validation issue when editing birth charts.';

	/// en: 'Connection error messages now translated.'
	String get releaseNotes_4_7_1 => 'Connection error messages now translated.';

	/// en: 'Improved font rendering.'
	String get releaseNotes_4_7_6 => 'Improved font rendering.';

	/// en: 'Fixed errors in monthly transit calculations. Subscription badges now display only when appropriate.'
	String get releaseNotes_4_7_7 => 'Fixed errors in monthly transit calculations. Subscription badges now display only when appropriate.';

	/// en: 'New app icon. Optimized starry night background.'
	String get releaseNotes_4_8_0 => 'New app icon. Optimized starry night background.';

	/// en: 'Updated terms and conditions and privacy policy. Fixed a registration issue with email and password. Birth chart is now automatically generated after registration.'
	String get releaseNotes_4_9_0 => 'Updated terms and conditions and privacy policy. Fixed a registration issue with email and password. Birth chart is now automatically generated after registration.';

	/// en: 'On iPhone and Mac you can sign in with Apple and subscribe through the App Store. Change your email or password from settings, or add a password to a Google or Apple account. Readings follow the gender you choose, or stay neutral if you prefer not to say. Your birth charts are visible only to you, and readings no longer send your names to the AI. Please log in again after updating. Profile pictures and charts created without an account are gone.'
	String get releaseNotes_5_0_0 => 'On iPhone and Mac you can sign in with Apple and subscribe through the App Store. Change your email or password from settings, or add a password to a Google or Apple account. Readings follow the gender you choose, or stay neutral if you prefer not to say. Your birth charts are visible only to you, and readings no longer send your names to the AI. Please log in again after updating. Profile pictures and charts created without an account are gone.';

	/// en: 'Small fixes to keep the app running smoothly.'
	String get releaseNotes_5_0_1 => 'Small fixes to keep the app running smoothly.';

	/// en: 'Version ${version}'
	String version({required Object version}) => 'Version ${version}';
}

// Path: ui
class Translations$ui$en {
	Translations$ui$en._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'About'
	String get about => 'About';

	/// en: 'Account'
	String get account => 'Account';

	/// en: 'Account deleted successfully'
	String get accountDeleted => 'Account deleted successfully';

	/// en: 'You have an active subscription. To delete your account, your subscription will be cancelled first. This action cannot be undone. All your data and saved charts will be permanently deleted.'
	String get activeSubscriptionDeleteWarning => 'You have an active subscription. To delete your account, your subscription will be cancelled first.\n\nThis action cannot be undone. All your data and saved charts will be permanently deleted.';

	/// en: 'Add email'
	String get addEmail => 'Add email';

	/// en: 'Add horoscope by email'
	String get addNewsletter => 'Add horoscope by email';

	/// en: 'All newsletters'
	String get allNewsletters => 'All newsletters';

	/// en: 'All Premium features'
	String get allPremiumFeatures => 'All Premium features';

	/// en: 'Already have an account?'
	String get alreadyHaveAccount => 'Already have an account?';

	/// en: 'ANALYZING...'
	String get analyzing => 'ANALYZING...';

	/// en: 'Annual'
	String get annual => 'Annual';

	/// en: 'Anticipate your day with transit analysis'
	String get anticipateYourDayWithTransits => 'Anticipate your day with transit analysis';

	/// en: 'Anticipate your month with transit analysis'
	String get anticipateYourMonthWithTransits => 'Anticipate your month with transit analysis';

	/// en: 'The subscription renews automatically at the price shown unless you cancel it at least 24 hours before the current period ends. Payment is charged to your Apple account. You can manage or cancel it in your App Store account settings.'
	String get appleAutoRenewNotice => 'The subscription renews automatically at the price shown unless you cancel it at least 24 hours before the current period ends. Payment is charged to your Apple account. You can manage or cancel it in your App Store account settings.';

	/// en: 'Deleting your account does not cancel your App Store subscription. To stop the renewals, cancel it in your App Store account settings. This action cannot be undone. All your data and saved charts will be permanently deleted.'
	String get appleSubscriptionDeleteWarning => 'Deleting your account does not cancel your App Store subscription. To stop the renewals, cancel it in your App Store account settings.\n\nThis action cannot be undone. All your data and saved charts will be permanently deleted.';

	/// en: 'AstroGods'
	String get appTitle => 'AstroGods';

	/// en: 'App Version'
	String get appVersion => 'App Version';

	/// en: 'at'
	String get at => 'at';

	/// en: 'Authentication required'
	String get authenticationRequired => 'Authentication required';

	/// en: 'Back to form'
	String get backToForm => 'Back to form';

	/// en: 'Back to login'
	String get backToLogin => 'Back to login';

	/// en: 'Billed annually'
	String get billedAnnually => 'Billed annually';

	/// en: 'billed ${amount}/year'
	String billedAnnuallyAt({required Object amount}) => 'billed ${amount}/year';

	/// en: 'Billed monthly'
	String get billedMonthly => 'Billed monthly';

	/// en: 'Billed every 6 months'
	String get billedSemiannually => 'Billed every 6 months';

	/// en: 'Birth chart'
	String get birthChart => 'Birth chart';

	/// en: 'Birth chart created successfully'
	String get birthChartCreated => 'Birth chart created successfully';

	/// en: 'The birth chart is the symbolic representation of the positions of celestial bodies at the moment of birth.'
	String get birthChartDescription => 'The birth chart is the symbolic representation of the positions of celestial bodies at the moment of birth.';

	/// en: 'Birth Chart for ${name}'
	String birthChartFor({required Object name}) => 'Birth Chart for ${name}';

	/// en: 'Birth chart'
	String get birthChartGraph => 'Birth chart';

	/// en: 'Birth chart not found'
	String get birthChartNotFound => 'Birth chart not found';

	/// en: 'Birth chart of ${name}'
	String birthChartOf({required Object name}) => 'Birth chart of ${name}';

	/// en: 'Birth chart preview'
	String get birthChartPreview => 'Birth chart preview';

	/// en: 'Birth Chart Reading'
	String get birthChartReading => 'Birth Chart Reading';

	/// en: 'Birth chart readings'
	String get birthChartReadings => 'Birth chart readings';

	/// en: 'Birth chart updated successfully'
	String get birthChartUpdated => 'Birth chart updated successfully';

	/// en: '${count} saved birth charts'
	String birthChartsCountPlural({required Object count}) => '${count} saved birth charts';

	/// en: '1 saved birth chart'
	String get birthChartsCountSingular => '1 saved birth chart';

	/// en: 'Birth charts'
	String get birthChartsFilter => 'Birth charts';

	/// en: 'The two birth charts must be different'
	String get birthChartsMustBeDifferent => 'The two birth charts must be different';

	/// en: 'Birth date'
	String get birthDate => 'Birth date';

	/// en: 'Birth Information'
	String get birthInfo => 'Birth Information';

	/// en: 'Birth Information'
	String get birthInformation => 'Birth Information';

	/// en: 'Birth place'
	String get birthPlace => 'Birth place';

	/// en: 'Birth time'
	String get birthTime => 'Birth time';

	/// en: 'Enter time or check unknown time'
	String get birthTimeRequired => 'Enter time or check unknown time';

	/// en: 'Cancel'
	String get cancel => 'Cancel';

	/// en: 'Cancel subscription and delete account'
	String get cancelSubscriptionAndDelete => 'Cancel subscription and delete account';

	/// en: 'Cancelling subscription...'
	String get cancellingSubscription => 'Cancelling subscription...';

	/// en: 'Change password'
	String get changePassword => 'Change password';

	/// en: 'Change plan'
	String get changePlan => 'Change plan';

	/// en: 'Chart not available.'
	String get chartNotAvailable => 'Chart not available.';

	/// en: 'Chart only, without reading'
	String get chartOnlyMode => 'Chart only, without reading';

	/// en: 'Chart removed from personal'
	String get chartRemovedFromPersonal => 'Chart removed from personal';

	/// en: 'Chart removed from saved'
	String get chartRemovedFromSaved => 'Chart removed from saved';

	/// en: 'Chart set as personal'
	String get chartSetAsPersonal => 'Chart set as personal';

	/// en: '${count} saved analyses'
	String chartsCountPlural({required Object count}) => '${count} saved analyses';

	/// en: '1 saved analysis'
	String get chartsCountSingular => '1 saved analysis';

	/// en: 'Please also check your spam or junk folder'
	String get checkSpamFolder => 'Please also check your spam or junk folder';

	/// en: 'Check your email'
	String get checkYourEmail => 'Check your email';

	/// en: 'You can close this window and return to the app'
	String get checkoutCancelledMessage => 'You can close this window and return to the app';

	/// en: 'Checkout cancelled'
	String get checkoutCancelledTitle => 'Checkout cancelled';

	/// en: 'Compatibility Analysis'
	String get compatibilityAnalysis => 'Compatibility Analysis';

	/// en: 'Confirm new password'
	String get confirmNewPassword => 'Confirm new password';

	/// en: 'Confirm Password'
	String get confirmPassword => 'Confirm Password';

	/// en: 'Confirming your subscription...'
	String get confirmingSubscription => 'Confirming your subscription...';

	/// en: 'Connection failed. Check your network and try again.'
	String get connectionError => 'Connection failed. Check your network and try again.';

	/// en: 'The request took too long. Please try again.'
	String get connectionTimeout => 'The request took too long. Please try again.';

	/// en: 'Continue with Apple'
	String get continueWithApple => 'Continue with Apple';

	/// en: 'Continue with Google'
	String get continueWithGoogle => 'Continue with Google';

	/// en: 'Couple's chart readings'
	String get couplesChartReadings => 'Couple\'s chart readings';

	/// en: 'Create'
	String get create => 'Create';

	/// en: 'Create your account'
	String get createAccount => 'Create your account';

	/// en: 'Create birth chart'
	String get createBirthChart => 'Create birth chart';

	/// en: 'Create first chart'
	String get createFirstChart => 'Create first chart';

	/// en: 'Create second chart'
	String get createSecondChart => 'Create second chart';

	/// en: 'Create synastry'
	String get createSynastry => 'Create synastry';

	/// en: 'Creating...'
	String get creating => 'Creating...';

	/// en: 'Current location'
	String get currentLocation => 'Current location';

	/// en: 'Current password'
	String get currentPassword => 'Current password';

	/// en: 'Current plan'
	String get currentPlan => 'Current plan';

	/// en: 'Daily'
	String get daily => 'Daily';

	/// en: 'Daily and monthly transits'
	String get dailyMonthlyTransits => 'Daily and monthly transits';

	/// en: 'Daily predictions'
	String get dailyPredictions => 'Daily predictions';

	/// en: 'Your daily astrological predictions.'
	String get dailyPredictionsContent => 'Your daily astrological predictions.';

	/// en: 'Daily Predictions'
	String get dailyPredictionsTitle => 'Daily Predictions';

	/// en: 'Sky of the day'
	String get dailySkyOf => 'Sky of the day';

	/// en: 'Daily transit chart'
	String get dailyTransitGraph => 'Daily transit chart';

	/// en: 'Daily transit of ${name}'
	String dailyTransitOf({required Object name}) => 'Daily transit of ${name}';

	/// en: '${count} saved daily transits'
	String dailyTransitsCountPlural({required Object count}) => '${count} saved daily transits';

	/// en: '1 saved daily transit'
	String get dailyTransitsCountSingular => '1 saved daily transit';

	/// en: 'Daily transits'
	String get dailyTransitsFilter => 'Daily transits';

	/// en: 'Dark'
	String get darkMode => 'Dark';

	/// en: 'Date of Birth'
	String get dateOfBirth => 'Date of Birth';

	/// en: 'Day ${day}'
	String dayCount({required Object day}) => 'Day ${day}';

	/// en: 'day ${number}'
	String dayNumber({required Object number}) => 'day ${number}';

	/// en: 'Delete'
	String get delete => 'Delete';

	/// en: 'Delete Account'
	String get deleteAccount => 'Delete Account';

	/// en: 'Are you absolutely sure you want to delete your account?'
	String get deleteAccountConfirmation => 'Are you absolutely sure you want to delete your account?';

	/// en: 'Delete Account'
	String get deleteAccountTitle => 'Delete Account';

	/// en: 'This action cannot be undone. All your data and saved charts will be permanently deleted.'
	String get deleteAccountWarning => 'This action cannot be undone. All your data and saved charts will be permanently deleted.';

	/// en: 'DELETE'
	String get deleteConfirmationWord => 'DELETE';

	/// en: 'Delete your only reading?'
	String get deleteFreeReadingTitle => 'Delete your only reading?';

	/// en: 'This is your only saved reading. An active subscription is required to generate new readings.'
	String get deleteFreeReadingWarning => 'This is your only saved reading. An active subscription is required to generate new readings.';

	/// en: 'Didn't receive the email?'
	String get didntReceiveEmail => 'Didn\'t receive the email?';

	/// en: 'Discover the heart of a relationship through its synastry'
	String get discoverHeartOfRelationship => 'Discover the heart of a relationship through its synastry';

	/// en: 'Don't have an account?'
	String get dontHaveAccount => 'Don\'t have an account?';

	/// en: 'I don't know the birth time'
	String get dontKnowBirthTime => 'I don\'t know the birth time';

	/// en: 'No email app available. Address copied to the clipboard: ${email}'
	String emailAddressCopied({required Object email}) => 'No email app available. Address copied to the clipboard: ${email}';

	/// en: 'No App Store subscription to restore'
	String get noPurchasesToRestore => 'No App Store subscription to restore';

	/// en: 'Password changed'
	String get passwordChanged => 'Password changed';

	/// en: 'Link sent to ${email}'
	String passwordSetupLinkSent({required Object email}) => 'Link sent to ${email}';

	/// en: 'The first time, during daylight saving time'
	String get repeatedTimeFirst => 'The first time, during daylight saving time';

	/// en: 'The second time, during standard time'
	String get repeatedTimeSecond => 'The second time, during standard time';

	/// en: 'Downgrade to Standard'
	String get downgrade => 'Downgrade to Standard';

	/// en: 'Download PDF'
	String get downloadPdf => 'Download PDF';

	/// en: 'Edit'
	String get edit => 'Edit';

	/// en: 'Edit Birth Chart'
	String get editBirthChart => 'Edit Birth Chart';

	/// en: 'Edit daily newsletter'
	String get editDaily => 'Edit daily newsletter';

	/// en: 'Edit monthly newsletter'
	String get editMonthly => 'Edit monthly newsletter';

	/// en: 'Email'
	String get email => 'Email';

	/// en: 'This email address is already registered'
	String get emailAlreadyExists => 'This email address is already registered';

	/// en: 'Horoscope by email'
	String get emailNotifications => 'Horoscope by email';

	/// en: 'Email sent successfully'
	String get emailSentSuccessfully => 'Email sent successfully';

	/// en: 'English'
	String get english => 'English';

	/// en: 'Enter new password'
	String get enterNewPassword => 'Enter new password';

	/// en: 'Error creating birth chart: ${error}'
	String errorCreatingBirthChart({required Object error}) => 'Error creating birth chart: ${error}';

	/// en: 'Error loading chart: ${error}'
	String errorLoadingChart({required Object error}) => 'Error loading chart: ${error}';

	/// en: 'Error loading saved charts'
	String get errorLoadingSavedCharts => 'Error loading saved charts';

	/// en: 'Error message copied to clipboard'
	String get errorMessageCopied => 'Error message copied to clipboard';

	/// en: 'Error opening URL'
	String get errorOpeningUrl => 'Error opening URL';

	/// en: 'Error'
	String get errorTitle => 'Error';

	/// en: 'Explore other plans'
	String get exploreOtherPlans => 'Explore other plans';

	/// en: 'Failed to load subscriptions'
	String get failedToLoadSubscriptions => 'Failed to load subscriptions';

	/// en: 'Last name is required'
	String get familyNameRequired => 'Last name is required';

	/// en: 'Finish'
	String get finish => 'Finish';

	/// en: 'First name'
	String get firstName => 'First name';

	/// en: 'First quarter'
	String get firstQuarter => 'First quarter';

	/// en: 'for "${term}"'
	String forSearchTerm({required Object term}) => 'for "${term}"';

	/// en: 'Forgot Password?'
	String get forgotPassword => 'Forgot Password?';

	/// en: '4 months FREE'
	String get fourMonthsFree => '4 months FREE';

	/// en: 'Full moon'
	String get fullMoon => 'Full moon';

	/// en: 'Gender'
	String get gender => 'Gender';

	/// en: 'Man'
	String get genderMan => 'Man';

	/// en: 'Non-binary'
	String get genderNonBinary => 'Non-binary';

	/// en: 'Prefer not to say'
	String get genderPreferNotToSay => 'Prefer not to say';

	/// en: 'Woman'
	String get genderWoman => 'Woman';

	/// en: 'Generate Analysis'
	String get generateAnalysis => 'Generate Analysis';

	/// en: 'Generate Daily Transit'
	String get generateDailyTransit => 'Generate Daily Transit';

	/// en: 'Generate a detailed compatibility analysis between ${relationshipTitle}'
	String generateDetailedCompatibilityAnalysis({required Object relationshipTitle}) => 'Generate a detailed compatibility analysis between ${relationshipTitle}';

	/// en: 'Generate Monthly Transit'
	String get generateMonthlyTransit => 'Generate Monthly Transit';

	/// en: 'Generate reading'
	String get generateReading => 'Generate reading';

	/// en: 'Generate reading'
	String get generateReadingAction => 'Generate reading';

	/// en: 'Generating...'
	String get generating => 'Generating...';

	/// en: 'Generating PDF...'
	String get generatingPdf => 'Generating PDF...';

	/// en: 'Generating reading...'
	String get generatingReading => 'Generating reading...';

	/// en: 'Generating: ${topic}...'
	String generatingTopic({required Object topic}) => 'Generating: ${topic}...';

	/// en: 'Get full reading'
	String get getFullReading => 'Get full reading';

	/// en: 'GET STARTED'
	String get getStarted => 'GET STARTED';

	/// en: 'First name is required'
	String get givenNameRequired => 'First name is required';

	/// en: 'Go to Home'
	String get goHome => 'Go to Home';

	/// en: 'Go to Home'
	String get goToHome => 'Go to Home';

	/// en: 'Login'
	String get goToLogin => 'Login';

	/// en: 'Apple Sign-In error: ${error}'
	String appleSignInError({required Object error}) => 'Apple Sign-In error: ${error}';

	/// en: 'Apple Sign-Up error: ${error}'
	String appleSignUpError({required Object error}) => 'Apple Sign-Up error: ${error}';

	/// en: 'Change email'
	String get changeEmail => 'Change email';

	/// en: 'Confirming your email'
	String get confirmingEmail => 'Confirming your email';

	/// en: 'Email updated'
	String get emailChangeConfirmed => 'Email updated';

	/// en: 'We've sent a confirmation link to ${email}. Open it to finish the change'
	String emailChangeLinkSent({required Object email}) => 'We\'ve sent a confirmation link to ${email}. Open it to finish the change';

	/// en: 'Google Sign-In error: ${error}'
	String googleSignInError({required Object error}) => 'Google Sign-In error: ${error}';

	/// en: 'Successfully signed in with Google'
	String get googleSignInSuccessful => 'Successfully signed in with Google';

	/// en: 'Google Sign-Up error: ${error}'
	String googleSignUpError({required Object error}) => 'Google Sign-Up error: ${error}';

	/// en: 'Successfully signed up with Google'
	String get googleSignUpSuccessful => 'Successfully signed up with Google';

	/// en: 'Hide other plans'
	String get hideOtherPlans => 'Hide other plans';

	/// en: 'Home'
	String get homeTitle => 'Home';

	/// en: 'Daily and monthly horoscope newsletter'
	String get horoscopeNewsletter => 'Daily and monthly horoscope newsletter';

	/// en: 'Please enter a valid email address'
	String get invalidEmail => 'Please enter a valid email address';

	/// en: 'Invalid or expired reset token'
	String get invalidResetToken => 'Invalid or expired reset token';

	/// en: 'Italian'
	String get italian => 'Italian';

	/// en: 'Language'
	String get language => 'Language';

	/// en: 'English'
	String get languageEnglish => 'English';

	/// en: 'Italian'
	String get languageItalian => 'Italian';

	/// en: 'Last name'
	String get lastName => 'Last name';

	/// en: 'Last quarter'
	String get lastQuarter => 'Last quarter';

	/// en: 'Light'
	String get lightMode => 'Light';

	/// en: 'Loading image...'
	String get loadingImage => 'Loading image...';

	/// en: 'Loading subscriptions...'
	String get loadingSubscriptions => 'Loading subscriptions...';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Please login to get your complete reading'
	String get loginRequiredForFullReading => 'Please login to get your complete reading';

	/// en: 'Sign in or create an account to subscribe'
	String get loginRequiredForSubscription => 'Sign in or create an account to subscribe';

	/// en: 'Login successful!'
	String get loginSuccessful => 'Login successful!';

	/// en: 'Login to your account'
	String get loginToAccount => 'Login to your account';

	/// en: 'Logout'
	String get logout => 'Logout';

	/// en: 'Logout successful'
	String get logoutSuccessful => 'Logout successful';

	/// en: 'Lunar phase'
	String get lunarPhase => 'Lunar phase';

	/// en: 'Manage subscription'
	String get manageSubscription => 'Manage subscription';

	/// en: '30-day money-back guarantee'
	String get moneyBackGuarantee => '30-day money-back guarantee';

	/// en: 'month'
	String get monthPeriod => 'month';

	/// en: 'Monthly'
	String get monthly => 'Monthly';

	/// en: 'Monthly predictions'
	String get monthlyPredictions => 'Monthly predictions';

	/// en: 'Your monthly astrological predictions.'
	String get monthlyPredictionsContent => 'Your monthly astrological predictions.';

	/// en: 'Monthly Predictions'
	String get monthlyPredictionsTitle => 'Monthly Predictions';

	/// en: 'Sky of the month'
	String get monthlySkyOf => 'Sky of the month';

	/// en: 'Monthly transit chart'
	String get monthlyTransitGraph => 'Monthly transit chart';

	/// en: 'Monthly transit of ${name}'
	String monthlyTransitOf({required Object name}) => 'Monthly transit of ${name}';

	/// en: '${count} saved monthly transits'
	String monthlyTransitsCountPlural({required Object count}) => '${count} saved monthly transits';

	/// en: '1 saved monthly transit'
	String get monthlyTransitsCountSingular => '1 saved monthly transit';

	/// en: 'Monthly transits'
	String get monthlyTransitsFilter => 'Monthly transits';

	/// en: 'Name'
	String get name => 'Name';

	/// en: 'You need a birth chart first for predictions'
	String get needBirthChartForPredictions => 'You need a birth chart first for predictions';

	/// en: 'To create a synastry you need at least two saved birth charts.'
	String get needTwoBirthChartsForSynastry => 'To create a synastry you need at least two saved birth charts.';

	/// en: 'Network error occurred'
	String get networkErrorOccurred => 'Network error occurred';

	/// en: 'New email'
	String get newEmail => 'New email';

	/// en: 'Add an email to your profile to receive the horoscope by email.'
	String get newsletterNeedsEmail => 'Add an email to your profile to receive the horoscope by email.';

	/// en: 'New improved version'
	String get newImprovedVersion => 'New improved version';

	/// en: 'New moon'
	String get newMoon => 'New moon';

	/// en: 'New password'
	String get newPassword => 'New password';

	/// en: 'Newsletter type'
	String get newsletterType => 'Newsletter type';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Next renewal'
	String get nextRenewal => 'Next renewal';

	/// en: 'No subscription'
	String get noActiveSubscription => 'No subscription';

	/// en: 'No active horoscope by email'
	String get noNewsletterSubscriptions => 'No active horoscope by email';

	/// en: 'No results found'
	String get noResultsFound => 'No results found';

	/// en: 'No saved analyses'
	String get noSavedAnalyses => 'No saved analyses';

	/// en: 'Analyses you save will appear here.'
	String get noSavedAnalysesDescription => 'Analyses you save will appear here.';

	/// en: 'No saved birth charts'
	String get noSavedBirthCharts => 'No saved birth charts';

	/// en: 'Birth charts you save will appear here.'
	String get noSavedBirthChartsDescription => 'Birth charts you save will appear here.';

	/// en: 'No saved charts'
	String get noSavedCharts => 'No saved charts';

	/// en: 'Birth charts you save will appear here.'
	String get noSavedChartsDescription => 'Birth charts you save will appear here.';

	/// en: 'No saved daily transits'
	String get noSavedDailyTransits => 'No saved daily transits';

	/// en: 'Daily transits you generate will appear here.'
	String get noSavedDailyTransitsDescription => 'Daily transits you generate will appear here.';

	/// en: 'No saved monthly transits'
	String get noSavedMonthlyTransits => 'No saved monthly transits';

	/// en: 'Monthly transits you generate will appear here.'
	String get noSavedMonthlyTransitsDescription => 'Monthly transits you generate will appear here.';

	/// en: 'No saved synastries'
	String get noSavedSynastries => 'No saved synastries';

	/// en: 'Synastries you create will appear here.'
	String get noSavedSynastriesDescription => 'Synastries you create will appear here.';

	/// en: 'Not provided'
	String get notProvided => 'Not provided';

	/// en: '1 month FREE'
	String get oneMonthFree => '1 month FREE';

	/// en: 'You have one chart. Create a second for synastry'
	String get oneMoreChartNeeded => 'You have one chart. Create a second for synastry';

	/// en: 'OR'
	String get or => 'OR';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Password reset successful'
	String get passwordResetSuccessful => 'Password reset successful';

	/// en: 'Password must be at least 8 characters long'
	String get passwordTooShort => 'Password must be at least 8 characters long';

	/// en: 'Passwords do not match'
	String get passwordsDoNotMatch => 'Passwords do not match';

	/// en: 'PDF downloaded successfully'
	String get pdfDownloadedSuccessfully => 'PDF downloaded successfully';

	/// en: 'Error generating PDF: ${error}'
	String pdfGenerationError({required Object error}) => 'Error generating PDF: ${error}';

	/// en: 'Person'
	String get person => 'Person';

	/// en: 'Person A'
	String get personA => 'Person A';

	/// en: 'Person B'
	String get personB => 'Person B';

	/// en: 'Personal'
	String get personal => 'Personal';

	/// en: 'Personal Information'
	String get personalInfo => 'Personal Information';

	/// en: 'Personality'
	String get personalityTitle => 'Personality';

	/// en: 'Place: ${place}'
	String place({required Object place}) => 'Place: ${place}';

	/// en: 'Place of Birth'
	String get placeOfBirth => 'Place of Birth';

	/// en: 'Please enter first name'
	String get pleaseEnterFirstName => 'Please enter first name';

	/// en: 'Please enter last name'
	String get pleaseEnterLastName => 'Please enter last name';

	/// en: 'Please fill all required fields'
	String get pleaseFillAllFields => 'Please fill all required fields';

	/// en: 'Please login to save birth charts to your account. Without login, charts cannot be saved for future use.'
	String get pleaseLoginToSaveCharts => 'Please login to save birth charts to your account. Without login, charts cannot be saved for future use.';

	/// en: 'Please select a birth chart'
	String get pleaseSelectBirthChart => 'Please select a birth chart';

	/// en: 'Please select a birth date'
	String get pleaseSelectBirthDate => 'Please select a birth date';

	/// en: 'Please select a birth place'
	String get pleaseSelectBirthPlace => 'Please select a birth place';

	/// en: 'Please select birth time'
	String get pleaseSelectBirthTime => 'Please select birth time';

	/// en: 'Please select a date'
	String get pleaseSelectDate => 'Please select a date';

	/// en: 'Please select a location'
	String get pleaseSelectLocation => 'Please select a location';

	/// en: 'You can close this window and return to the app.'
	String get portalReturnMessage => 'You can close this window and return to the app.';

	/// en: 'Done'
	String get portalReturnTitle => 'Done';

	/// en: 'Forecast'
	String get predictionsTitle => 'Forecast';

	/// en: 'Preferences'
	String get preferences => 'Preferences';

	/// en: 'Premium - annual'
	String get premiumAnnual => 'Premium - annual';

	/// en: 'Premium - monthly'
	String get premiumMonthly => 'Premium - monthly';

	/// en: 'Premium subscription required to generate daily transit readings'
	String get premiumRequiredForDailyTransit => 'Premium subscription required to generate daily transit readings';

	/// en: 'Premium subscription required to generate monthly transit readings'
	String get premiumRequiredForMonthlyTransit => 'Premium subscription required to generate monthly transit readings';

	/// en: 'To regenerate this reading in another language you need a premium subscription'
	String get premiumRequiredForRegeneration => 'To regenerate this reading in another language you need a premium subscription';

	/// en: 'Premium subscription required to create couple compatibility analyses'
	String get premiumRequiredForSynastry => 'Premium subscription required to create couple compatibility analyses';

	/// en: 'Premium - semiannual'
	String get premiumSemiannual => 'Premium - semiannual';

	/// en: 'Preparing reading...'
	String get preparingReading => 'Preparing reading...';

	/// en: 'Sign in or create an account to access your complete reading'
	String get previewDescription => 'Sign in or create an account to access your complete reading';

	/// en: 'Your birth chart awaits'
	String get previewTitle => 'Your birth chart awaits';

	/// en: 'Previous'
	String get previous => 'Previous';

	/// en: 'Processing unsubscribe request...'
	String get processingUnsubscribeRequest => 'Processing unsubscribe request...';

	/// en: 'Profile'
	String get profile => 'Profile';

	/// en: 'Profile'
	String get profileTitle => 'Profile';

	/// en: 'Profile updated successfully'
	String get profileUpdatedSuccessfully => 'Profile updated successfully';

	/// en: 'Reactivate'
	String get reactivateSubscription => 'Reactivate';

	/// en: 'Read'
	String get read => 'Read';

	/// en: 'Reading available'
	String get readingAvailable => 'Reading available';

	/// en: 'This reading was generated in ${language}'
	String readingGeneratedIn({required Object language}) => 'This reading was generated in ${language}';

	/// en: 'Reading generated successfully!'
	String get readingGeneratedSuccessfully => 'Reading generated successfully!';

	/// en: 'BEST VALUE'
	String get recommendedPlan => 'BEST VALUE';

	/// en: 'Regenerate in ${language}'
	String regenerateInLanguage({required Object language}) => 'Regenerate in ${language}';

	/// en: 'Regenerate reading'
	String get regenerateReading => 'Regenerate reading';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Relationships'
	String get relationshipsTitle => 'Relationships';

	/// en: 'Remove'
	String get remove => 'Remove';

	/// en: 'Remove chart'
	String get removeChart => 'Remove chart';

	/// en: 'Are you sure you want to remove "${name}" from saved charts?'
	String removeChartConfirmation({required Object name}) => 'Are you sure you want to remove "${name}" from saved charts?';

	/// en: 'Not my theme'
	String get removeFromPersonal => 'Not my theme';

	/// en: 'Remove from saved'
	String get removeFromSaved => 'Remove from saved';

	/// en: 'Resend email'
	String get resendEmail => 'Resend email';

	/// en: 'We've sent a password reset link to ${email}'
	String resetLinkSent({required Object email}) => 'We\'ve sent a password reset link to ${email}';

	/// en: 'Reset password'
	String get resetPassword => 'Reset password';

	/// en: 'Reset your password'
	String get resetPasswordTitle => 'Reset your password';

	/// en: 'Restore purchases'
	String get restorePurchases => 'Restore purchases';

	/// en: 'Retry'
	String get retry => 'Retry';

	/// en: 'Save'
	String get save => 'Save';

	/// en: 'Save 20%'
	String get save20Percent => 'Save 20%';

	/// en: 'Save 33%'
	String get save33Percent => 'Save 33%';

	/// en: 'Save 40%'
	String get save40Percent => 'Save 40%';

	/// en: 'SAVE ${amount}/YEAR'
	String saveAmount({required Object amount}) => 'SAVE ${amount}/YEAR';

	/// en: 'Save changes'
	String get saveChanges => 'Save changes';

	/// en: 'Save password'
	String get savePassword => 'Save password';

	/// en: 'Save PDF'
	String get savePdfDialogTitle => 'Save PDF';

	/// en: 'Saved analyses'
	String get savedChartsTitle => 'Saved analyses';

	/// en: 'Search birth charts...'
	String get searchBirthCharts => 'Search birth charts...';

	/// en: 'Search by name or place'
	String get searchByNameOrPlace => 'Search by name or place';

	/// en: 'Search charts...'
	String get searchCharts => 'Search charts...';

	/// en: 'Search daily transits...'
	String get searchDailyTransits => 'Search daily transits...';

	/// en: 'Search in progress...'
	String get searchInProgress => 'Search in progress...';

	/// en: 'Search monthly transits...'
	String get searchMonthlyTransits => 'Search monthly transits...';

	/// en: 'Search synastries...'
	String get searchSynastries => 'Search synastries...';

	/// en: 'Select chart'
	String get selectChart => 'Select chart';

	/// en: 'Select Date'
	String get selectDate => 'Select Date';

	/// en: 'Select location'
	String get selectLocation => 'Select location';

	/// en: 'Select Month'
	String get selectMonth => 'Select Month';

	/// en: 'Semiannual'
	String get semiannual => 'Semiannual';

	/// en: 'Send confirmation link'
	String get sendConfirmationLink => 'Send confirmation link';

	/// en: 'Send link'
	String get sendLink => 'Send link';

	/// en: 'Send reset link'
	String get sendResetLink => 'Send reset link';

	/// en: 'We're making some improvements. Back in a moment!'
	String get serverUnavailable => 'We\'re making some improvements. Back in a moment!';

	/// en: 'This is my theme'
	String get setAsPersonal => 'This is my theme';

	/// en: 'Set password'
	String get setPassword => 'Set password';

	/// en: 'We will send a link to ${email} to choose a password. Then you can also sign in with your email.'
	String setPasswordDescription({required Object email}) => 'We will send a link to ${email} to choose a password. Then you can also sign in with your email.';

	/// en: 'Add an email to your account first, so we can send you the link to choose a password.'
	String get setPasswordNeedsEmail => 'Add an email to your account first, so we can send you the link to choose a password.';

	/// en: 'Settings'
	String get settingsTitle => 'Settings';

	/// en: '7 days of free trial'
	String get sevenDaysFreeTrial => '7 days of free trial';

	/// en: 'Share PDF'
	String get sharePdf => 'Share PDF';

	/// en: 'Sign in'
	String get signIn => 'Sign in';

	/// en: 'Sign up'
	String get signUp => 'Sign up';

	/// en: '6 months'
	String get sixMonthsPeriod => '6 months';

	/// en: 'Standard - annual'
	String get standardAnnual => 'Standard - annual';

	/// en: 'Standard - monthly'
	String get standardMonthly => 'Standard - monthly';

	/// en: 'Standard - semiannual'
	String get standardSemiannual => 'Standard - semiannual';

	/// en: 'START FREE - 7 DAYS'
	String get startFreeSevenDays => 'START FREE - 7 DAYS';

	/// en: 'Start now'
	String get startNow => 'Start now';

	/// en: 'Successfully subscribed to newsletter'
	String get subscribeSuccess => 'Successfully subscribed to newsletter';

	/// en: 'Subscribe to daily horoscope'
	String get subscribeToDaily => 'Subscribe to daily horoscope';

	/// en: 'Subscribe to monthly horoscope'
	String get subscribeToMonthly => 'Subscribe to monthly horoscope';

	/// en: 'Subscription activated successfully!'
	String get subscriptionActivated => 'Subscription activated successfully!';

	/// en: 'Active'
	String get subscriptionActive => 'Active';

	/// en: 'Amount'
	String get subscriptionAmount => 'Amount';

	/// en: 'Subscription cancelled successfully'
	String get subscriptionCancelledSuccessfully => 'Subscription cancelled successfully';

	/// en: 'Ends on'
	String get subscriptionCancelsOn => 'Ends on';

	/// en: 'Failed to confirm subscription. Please contact support'
	String get subscriptionConfirmationFailed => 'Failed to confirm subscription. Please contact support';

	/// en: 'Renews on'
	String get subscriptionEndDate => 'Renews on';

	/// en: 'Payment Incomplete'
	String get subscriptionIncomplete => 'Payment Incomplete';

	/// en: 'This subscription was purchased outside the App Store: you can manage it on the website'
	String get subscriptionManagedElsewhere => 'This subscription was purchased outside the App Store: you can manage it on the website';

	/// en: 'Payment Overdue'
	String get subscriptionPastDue => 'Payment Overdue';

	/// en: 'This subscription was purchased in the Android app: you can manage it there or on the website'
	String get subscriptionPurchasedOnAndroid => 'This subscription was purchased in the Android app: you can manage it there or on the website';

	/// en: 'This subscription was purchased in the Linux app: you can manage it there or on the website'
	String get subscriptionPurchasedOnLinux => 'This subscription was purchased in the Linux app: you can manage it there or on the website';

	/// en: 'This subscription was purchased on the website: you can manage it there'
	String get subscriptionPurchasedOnWeb => 'This subscription was purchased on the website: you can manage it there';

	/// en: 'This subscription was purchased in the Windows app: you can manage it there or on the website'
	String get subscriptionPurchasedOnWindows => 'This subscription was purchased in the Windows app: you can manage it there or on the website';

	/// en: 'To regenerate this reading in another language you need a subscription (standard is enough)'
	String get subscriptionRequiredForRegeneration => 'To regenerate this reading in another language you need a subscription (standard is enough)';

	/// en: 'Started on'
	String get subscriptionStartDate => 'Started on';

	/// en: 'Go to home'
	String get subscriptionSuccessGoHome => 'Go to home';

	/// en: 'Thank you for your support. You now have access to all features.'
	String get subscriptionSuccessMessagePremium => 'Thank you for your support. You now have access to all features.';

	/// en: 'Thank you for your support. You can now read unlimited birth charts.'
	String get subscriptionSuccessMessageStandard => 'Thank you for your support. You can now read unlimited birth charts.';

	/// en: 'Welcome to AstroGods!'
	String get subscriptionSuccessTitle => 'Welcome to AstroGods!';

	/// en: 'Your 7-day trial has started'
	String get subscriptionSuccessTrialInfo => 'Your 7-day trial has started';

	/// en: 'Trial'
	String get subscriptionTrialing => 'Trial';

	/// en: 'Payment Failed'
	String get subscriptionUnpaid => 'Payment Failed';

	/// en: 'Align'
	String get subtitlePart1 => 'Align';

	/// en: 'with your'
	String get subtitlePart2 => 'with your';

	/// en: 'sky'
	String get subtitlePart3 => 'sky';

	/// en: 'Surname'
	String get surname => 'Surname';

	/// en: 'Swipe to view'
	String get swipeToView => 'Swipe to view';

	/// en: '${count} saved synastries'
	String synastriesCountPlural({required Object count}) => '${count} saved synastries';

	/// en: '1 saved synastry'
	String get synastriesCountSingular => '1 saved synastry';

	/// en: 'Synastries'
	String get synastriesFilter => 'Synastries';

	/// en: 'Synastry'
	String get synastry => 'Synastry';

	/// en: 'Synastry between ${person1} and ${person2}'
	String synastryBetween({required Object person1, required Object person2}) => 'Synastry between ${person1} and ${person2}';

	/// en: 'Synastry is the art of comparing two birth charts to understand the dynamics of a relationship.'
	String get synastryDescription => 'Synastry is the art of comparing two birth charts to understand the dynamics of a relationship.';

	/// en: 'Synastry chart'
	String get synastryGraph => 'Synastry chart';

	/// en: 'Synastry not found'
	String get synastryNotFound => 'Synastry not found';

	/// en: 'Synastry removed from saved'
	String get synastryRemovedFromSaved => 'Synastry removed from saved';

	/// en: 'System'
	String get systemMode => 'System';

	/// en: 'Terms of Service'
	String get termsOfService => 'Terms of Service';

	/// en: 'Theme'
	String get theme => 'Theme';

	/// en: 'Then ${price}/${period}'
	String thenPrice({required Object price, required Object period}) => 'Then ${price}/${period}';

	/// en: 'Time of Birth'
	String get timeOfBirth => 'Time of Birth';

	/// en: 'Transit date'
	String get transitDate => 'Transit date';

	/// en: 'Transits are the movements of planets that, passing over natal sky positions, activate temporary astrological influences.'
	String get transitDescription => 'Transits are the movements of planets that, passing over natal sky positions, activate temporary astrological influences.';

	/// en: 'Transit for'
	String get transitFor => 'Transit for';

	/// en: 'Transit information'
	String get transitInformation => 'Transit information';

	/// en: 'Transit location'
	String get transitLocation => 'Transit location';

	/// en: 'Transit period'
	String get transitPeriod => 'Transit period';

	/// en: 'Transit removed from saved'
	String get transitRemovedFromSaved => 'Transit removed from saved';

	/// en: 'Try again'
	String get tryAgain => 'Try again';

	/// en: 'Type DELETE to confirm'
	String get typeDeleteToConfirm => 'Type DELETE to confirm';

	/// en: 'Unknown'
	String get unknown => 'Unknown';

	/// en: 'Unknown error occurred'
	String get unknownErrorOccurred => 'Unknown error occurred';

	/// en: 'Unknown'
	String get unknownTime => 'Unknown';

	/// en: 'Unsubscribe'
	String get unsubscribe => 'Unsubscribe';

	/// en: 'Failed to unsubscribe'
	String get unsubscribeError => 'Failed to unsubscribe';

	/// en: 'Successfully unsubscribed from newsletter'
	String get unsubscribeSuccess => 'Successfully unsubscribed from newsletter';

	/// en: 'You will no longer receive these emails. You can resubscribe anytime from your account settings.'
	String get unsubscribeSuccessMessage => 'You will no longer receive these emails. You can resubscribe anytime from your account settings.';

	/// en: 'Unveil the heart of a person through their birth chart'
	String get unveilHeart => 'Unveil the heart of a person through their birth chart';

	/// en: 'Update'
	String get updateNow => 'Update';

	/// en: 'Update Payment Method'
	String get updatePaymentMethod => 'Update Payment Method';

	/// en: 'Just a moment!'
	String get updateRequired => 'Just a moment!';

	/// en: 'Newsletter updated successfully'
	String get updateSuccess => 'Newsletter updated successfully';

	/// en: 'Upgrade to Premium'
	String get upgrade => 'Upgrade to Premium';

	/// en: 'Indicates any natural person who uses AstroGods.'
	String get userDefinition => 'Indicates any natural person who uses AstroGods.';

	/// en: 'User (or You)'
	String get userDefinitionTitle => 'User (or You)';

	/// en: 'User not found'
	String get userNotFound => 'User not found';

	/// en: 'View chart'
	String get viewChart => 'View chart';

	/// en: 'View plans'
	String get viewPlans => 'View plans';

	/// en: 'View reading'
	String get viewReading => 'View reading';

	/// en: 'Visit source'
	String get visitSource => 'Visit source';

	/// en: 'Waning crescent'
	String get waningCrescent => 'Waning crescent';

	/// en: 'Waning gibbous'
	String get waningGibbous => 'Waning gibbous';

	/// en: 'Waxing crescent'
	String get waxingCrescent => 'Waxing crescent';

	/// en: 'Waxing gibbous'
	String get waxingGibbous => 'Waxing gibbous';

	/// en: 'Welcome back!'
	String get welcomeBack => 'Welcome back!';

	/// en: 'Without the time of birth the reading will not take the Ascendant into account'
	String get withoutBirthTimeWarning => 'Without the time of birth the reading will not take the Ascendant into account';

	/// en: 'year'
	String get yearPeriod => 'year';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'about.aboutAndFaq' => 'About and FAQ',
			'about.aboutFaqTableOfContents' => 'Table of contents',
			'about.aboutFaqTitle' => 'About AstroGods',
			'about.additionalInfoContent' => '### Legal action\n\nThe User\'s Personal Data may be used for legal purposes by the Owner in Court or in the stages leading to possible legal action arising from improper use of this Application or the related Services.\n\nThe User declares to be aware that the Owner may be required to reveal personal data upon request of public authorities.\n\n### Additional information about User\'s Personal Data\n\nIn addition to the information contained in this privacy policy, this Application may provide the User with additional and contextual information concerning particular Services or the collection and processing of Personal Data upon request.\n\n### System logs and maintenance\n\nFor operation and maintenance purposes, this Application and any third-party services may collect files that record interaction with this Application (System logs) or use other Personal Data (such as the IP Address) for this purpose.\n\n### Information not contained in this policy\n\nMore details concerning the collection or processing of Personal Data may be requested from the Owner at any time. Please see the contact information at the beginning of this document.\n\nUsers are also encouraged to check the privacy policies of any third-party services used by this Application.\n\n### Changes to this privacy policy\n\nThe Owner reserves the right to make changes to this privacy policy at any time by notifying its Users on this page and possibly within this Application and/or - as far as technically and legally feasible - sending a notice to Users via any contact information available to the Owner. It is strongly recommended to check this page often, referring to the date of the last modification listed at the bottom.\n\nShould the changes affect processing activities performed on the basis of the User\'s consent, the Owner shall collect new consent from the User, where required.',
			'about.additionalInfoSection' => 'Additional information',
			'about.chooseAstrologicalPath' => 'Nourish to be nourished',
			'about.faq1Answer' => 'AI plays a minor role in AstroGods. The interpretations are handwritten and curated by Jacopo Trombetti and Arcangelo Massari. The astronomical calculations use the Swiss Ephemeris, the most precise in the world. AI only assembles the various interpretive pieces into coherent sentences, nothing more.',
			'about.faq1Question' => 'Does artificial intelligence make interpretations random?',
			'about.faq2Answer' => 'According to this interpretive approach, the human energy constitution articulates across seven chakras corresponding to seven planets, from the Moon to Saturn. Beyond these, the human constitution simply has no receptive channels for superior planetary powers. These planets have an impact, but of a generational type: for example, Pluto in Scorpio (1983-1995) characterizes an entire generation. They are more useful for studying historical periods than individuals, and therefore are not included.',
			'about.faq2Question' => 'Why are Uranus, Neptune, and Pluto not included?',
			'about.faq3Answer' => 'Domification is the method used to calculate the twelve astrological Houses. Most apps use Placidus, which divides the sky based on time, creating unequal Houses that vary by latitude: some can be enormous, others tiny. We use Vehlow, which divides the zodiac into twelve equal Houses of 30 degrees each. It makes no symbolic sense to divide the human soul into unequal parts: no area of life is less important than another.',
			'about.faq3Question' => 'Why are the planets in different Houses compared to other apps?',
			'about.faq4Answer' => 'The Ascendant and Houses depend on the exact birth time. The entire chart rotates completely in 24 hours. Without the time of birth, we can only analyze planetary positions in signs, missing half of the symbolic picture: the Houses that describe in which areas of life planetary energies manifest.',
			'about.faq4Question' => 'Why is the birth time important?',
			'about.faq5Answer' => 'We use the Swiss Ephemeris, the most precise astronomical tables in the world. Developed and maintained by Astrodienst (astro.com), they calculate exact planetary positions for any date in history or the future. They are the standard reference for professional astrological software.',
			'about.faq5Question' => 'What is the source of the astrological calculations?',
			'about.faq6Answer' => 'Egypt is the hermetic matrix of Western culture. Horoscopic Astrology was born in Alexandria, Egypt, where Pharaoh Nechepso and priest Petosiris wrote the foundational texts (~150-120 BCE) from which all Greek and Roman astrologers drew. Ptolemy, author of the Tetrabiblos (foundation of Western Astrology), worked in Alexandria. Hermes Trismegistus, the fusion of Greek Hermes and Egyptian Thoth, is considered the founder of this tradition. Egyptian Astrology is not a variant: it is the original source.',
			'about.faq6Question' => 'Why Egyptian Astrology?',
			'about.faq7Answer' => 'No. Astrological elements have multiple symbolic meanings, and interpreting them within a specific energetic constitution requires an exchange between souls, hearts, and sensibilities. Moreover, the birth chart reveals a person\'s potentials, but not how much these have been developed or transcended: two individuals with identical charts can live in radically different ways. Only an astrologer, by knowing the person, can calibrate the interpretation.',
			'about.faq7Question' => 'Does this app replace consultation with an astrologer?',
			'about.faqNotSeriousSectionTitle' => 'Not serious stuff',
			'about.faqRefundAnswerAfter' => ' and we\'ll refund you. We\'ll ask what went wrong because we want to improve, but you don\'t have to answer.',
			'about.faqRefundAnswerBefore' => 'Yes. Email ',
			'about.faqRefundQuestion' => 'I didn\'t like the service, can I get a refund?',
			'about.faqSectionTitle' => 'Frequently asked questions',
			'about.faqSeriousSectionTitle' => 'Serious stuff',
			'about.missionSectionTitle' => 'Our mission',
			'about.missionText' => 'Ours is first and foremost a research mission: we ourselves are curious to discover what is possible with this tool. We use software that considers all factors simultaneously to reach increasingly precise interpretations. AstroGods makes astrological interpretation more accessible to non-experts, while also simplifying the work of astrologers: no matter how skilled or experienced, they must symbolically blend infinite elements. Having a tool that keeps them all in consideration means nothing gets forgotten: a support that enhances, not replaces, human expertise.',
			'about.storySectionTitle' => 'Our story',
			'about.storyText' => 'AstroGods was born from a friendship. Arcangelo has always been struck by Jacopo\'s ability to describe people with precision based only on their birth date, and to read moments of his life with an inexplicable depth. He wanted to always carry that perspective with him, and so AstroGods was born: an attempt to translate into an algorithm the method Jacopo uses to decipher reality through Astrology.',
			'about.teamMemberArcangeloDescription' => 'Student of Jacopo and responsible for the technical side of AstroGods. Passionate about Astrology, studying the subject since 2016.',
			'about.teamMemberArcangeloRole' => 'Technical development',
			'about.teamMemberArcangeloTitle' => 'Arcangelo Massari',
			'about.teamMemberCorradoDescription' => 'Explorer of various paths of self-knowledge, Corrado is responsible for spreading AstroGods to the world and building bridges between Astrology and other disciplines.',
			'about.teamMemberCorradoRole' => 'Community',
			'about.teamMemberCorradoTitle' => 'Corrado Camponeschi',
			'about.teamMemberJacopoDescription' => 'Trained at the Accademia di Astrologia Egizia founded by Pascal Fabio Patruno, Jacopo is a brilliant astrologer capable of computing synastry mentally, memorizing degrees and planets from charts he has seen only once in his life.',
			'about.teamMemberJacopoRole' => 'Astrologer',
			'about.teamMemberJacopoTitle' => 'Jacopo Trombetti',
			'about.teamSectionTitle' => 'The team',
			'caverns.cavernComingSoon' => ({required Object number}) => 'Cavern ${number} - Coming Soon',
			'caverns.cavernDetailsNotFound' => 'Cavern details not found',
			'caverns.cavernDetailsTitle' => 'Book of Caverns',
			'caverns.centralScene' => 'central scene',
			'caverns.divisionStructureAlt3' => 'Structure of the third division',
			'caverns.divisionStructureAlt4' => 'Structure of the fourth division',
			'caverns.eighthCavernEsotericMeaning' => '## The cavern of divine assistance and spiritual discernment\n\nAccording to Angelini, the Eighth Cavern represents first and foremost **divine assistance for spiritual ascension**. The deities who "carry those seated upon them to heaven" concretely symbolize how higher spiritual forces provide a vehicle of elevation through profound introspection.\n\n## Discernment between truth and falsehood\n\nThe cavern\'s very name - "She who judges, distinguishing truth from falsehood" - reveals its essential function. The deities described as "judges of souls" represent not an external tribunal, but the **inner discernment process** that every spiritual seeker must develop. The prostrate figures (Groups 3, 4, 5) show the dangers of this search: "Those who mourn for Ra" warn of possible deviations in metaphysical studies and afterlife research.\n\n## The duality of spiritual and material resources\n\nWhile the second cavern governs earnings from one\'s own work, the eighth rules **resources received through others**: "Those who carry gifts" and "Those who carry offerings" (Groups 4 and 7) indicate both material gifts (inheritances, legacies) and transformative experiences that arrive unexpectedly. Angelini specifies that these "gifts" may also derive from marriage to wealthier individuals.\n\n## The danger of occult research\n\nThe prostrate figures represent the **death-bringing significance of the eighth house**: research in supernatural studies carries real risks. "The Tired Ones" (Group 5) symbolize "those who reach life\'s end" for having incorrectly traveled the path of hidden knowledge. However, those who succeed in "distinguishing truth from falsehood" can "pass through the Wide Hall of the Two Truths."\n\n## The eighth house as alchemical process\n\nThis cavern represents the **alchemical process of death and rebirth** - the dissolution of old forms to allow new spiritual growth. It is the house of radical transformation, where investigation into "hidden things" can lead to both illumination and spiritual destruction.',
			'caverns.eighthCavernLiteralMeaning' => 'The Eighth Cavern, called **"She who protects the Souls, She who judges, distinguishing truth from falsehood"**, is organized into **seven groups of deities**, each with specific functions in the divine organization of the Netherworld.\n\n![Structure of the eighth division](ottava_divisione.webp)\n\n## Different representations across sources\n\nAncient sources present two modes of representation:\n\n- **In the Osireion at Abydos**: Each group is depicted *in extenso* with all deities (generally four per group) shown in procession\n- **In papyri** (such as British Museum 10.478 shown above): **Each group is symbolically represented by a single figure inscribed in a rectangle**, with the number of group members indicated below the figure. This single deity represents the entire collective.\n\n## The Seven Groups of Deities\n\n### Group 1: "Those who carry [the ones who are seated] upon them"\n**Papyrus representation**: A deity walking carrying a female child seated on the shoulder, with the number "4" below.\n**Meaning**: Four deities who guarantee the deceased "sees Ra at his rising" and follows him "in Ra\'s bark."\n\n### Group 2: "Those who carry the ones who are [seated] upon them"\n**Papyrus representation**: A deity carrying a male child seated on the shoulder, with the number "4".\n**Meaning**: Four deities who transport specifically male seated figures, granting the same benefits as the first group.\n\n### Group 3: "Those who mourn for Ra"\n**Papyrus representation**: A goddess prostrate face down with hair locks hanging before her face and hands raised, with the number "4".\n**Meaning**: Four figures who guarantee "offerings come to the deceased as they come to Ra\'s followers at his setting."\n\n### Group 4: "Those who carry gifts"\n**Papyrus representation**: A goddess prostrate face down with hands raised, with the number "4".\n**Meaning**: Four figures who hold round bread and grant the deceased to "be like those who are in the Netherworld."\n\n### Group 5: "The Tired Ones"\n**Papyrus representation**: A goddess prostrate with hair before her face and hands raised inward.\n**Meaning**: Four figures who allow the deceased to "pass through the Wide Hall of the Two Truths."\n\n### Group 6: "Those who render homage"\n**Papyrus representation**: A bowing god, with the number "4".\n**Meaning**: Four deities who guarantee the deceased can "follow Ra in his bark."\n\n### Group 7: "Those who carry offerings"\n**Papyrus representation**: A god walking holding a conical object.\n**Meaning**: Four deities who grant "offerings and food to the deceased in the Necropolis."',
			'caverns.eighthCavernTitle' => 'Eighth cavern - The cavern of transformation',
			'caverns.eleventhCavernEsotericMeaning' => '## The cavern of spiritual friendship\n\nAccording to Angelini, the Eleventh Cavern **"She who covers the Tired One, who conceals that which is hidden"** reveals its **friendly characteristics** while encompassing both the **joys and sorrows that friendships can bring** in both material and spiritual domains.\n\n## Divine support and protection of the weary soul\n\nThe cavern\'s name reveals its fundamental role: "She who covers the Tired One" refers to **divine protection for the soul weary** from the long spiritual journey. "The Swallower" (Group 1) and "The Soul of the West" (Group 2) represent forces that **welcome and sustain** those needing rest and regeneration. "Those who acclaim" (Group 4) show the **celestial companionship** that encourages the soul toward peace.\n\n## Regeneration through sacred mourning\n\n"The Ennead of Mourners" (Group 10) and "The Ennead of Watchers" (Group 9) reveal a profound aspect: the **regenerative power of shared sorrow**. As the goddesses weep for Osiris guaranteeing his resurrection, so authentic friendships traverse trials together, transforming suffering into spiritual strength. The nine jackals on standards "protect the awakening" showing how true friends watch over our spiritual rebirth.\n\n## The serpents of the Enveloper: protection and transformation\n\n"The Enveloper" (Group 15) and "Those who are in the Enveloper" (Group 16) show how **apparent constraints** can become protection. Like the serpent Mehen that wraps Osiris to protect him, so the limitations imposed by authentic friendships become means of spiritual growth.\n\n## Material and spiritual benefits\n\nAngelini specifies that this cavern governs **"financial situations dependent on the influence of protections and legacies from friends, or strokes of fortune"**. The protective groups show how spiritual friendships manifest concretely: "The Souls of the Earth" (Group 3) grant "pure things," while "The Summoner" (Group 11) brings together the right people at the right time.\n\n## The eleventh astrological house\n\nThis cavern corresponds to the **eleventh house**: the house of friendship, hopes, wishes, and **deep scientific and philosophical interests**. Through authentic friendships the soul can reach higher levels of understanding, passing from shared trials (the mourning) to spiritual freedom and transformative protection (the Enveloper).',
			'caverns.eleventhCavernLiteralMeaning' => 'The Eleventh Cavern, called **"She who covers the Tired One, who conceals that which is hidden"**, contains **eighteen groups of deities** embodying themes of protection, regeneration, and spiritual support.\n\n![Structure of the eleventh division](undicesima_divisione.webp)\n\n## The cavern\'s name\n\nThe name reveals this dwelling\'s protective nature: "She who covers the Tired One" refers to divine care for those weary from spiritual journey, while "who conceals that which is hidden" indicates protection of sacred mysteries.\n\n## Differences between ancient sources\n\nAs in other caverns:\n\n**In the Osireion at Abydos**: Each group is shown with all its deities - for example, the ninth group shows nine jackals on standards, the tenth group shows nine prostrate mourning goddesses.\n\n**In funerary papyri**: Symbolic representation with one figure per group and an indicative number - a single jackal with "9" representing the nine guardians.\n\n## The Eighteen Groups of Deities\n\n### Group 1: "The Swallower"\n**Representation**: Standing goddess with upright serpent before her, number "1".\n**Meaning**: A goddess who guarantees "prosperity, life, stability and wealth for the Great God in the netherworld".\n\n### Group 2: "The Soul of the West"\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: One deity who guarantees "an invocation offering in the Necropolis".\n\n### Group 3: "The Souls of the Earth"\n**Representation**: Four striding gods.\n**Meaning**: Four deities who grant "all pure things on earth and before the Great God".\n\n### Group 4: "Those who acclaim"\n**Representation**: Four striding gods with raised arms.\n**Meaning**: Four deities who "acclaim so that Osiris may be at ease among those in heaven".\n\n### Group 5: "The Ennead of the Ruler of the West"\n**Representation**: Nine mummified gods lying on beds (on serpents in the Osireion).\n**Meaning**: Nine guardians who watch over the western realm of the dead.\n\n### Group 6: "The Ennead in the following of Ra"\n**Representation**: Nine mummified gods with hidden arms, lying on serpents and beds.\n**Meaning**: Nine deities who accompany Ra on his journey.\n\n### Group 7: "Ikh" (cryptic name)\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: Deity who guarantees being "at the side of the Great God when he traverses the sky".\n\n### Group 8: "The Vivifiers of Osiris" (uncertain name)\n**Representation**: Four standing mummiform gods.\n**Meaning**: Deities who give life to Osiris.\n\n### Group 9: "The Ennead of Watchers"\n**Representation**: Nine jackals on standards (in the Osireion).\n**Meaning**: Nine guardians who "protect Osiris\'s awakening so he may never be annihilated".\n\n### Group 10: "The Ennead of Mourners"\n**Representation**: Nine prostrate goddesses with hair before faces and hands raised.\n**Meaning**: Nine goddesses who "grant the deceased the same ritual mourning that was done for the god Osiris", ensuring the same funerary honors that enabled divine resurrection.\n\n### Group 11: "The Summoner"\n**Representation**: Striding god with one hand raised, number "1".\n**Meaning**: Deity who "summons Osiris before Ra near his ennead".\n\n### Group 12: "Iqeheren" (divine name)\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: Deity who "drives away all evil from Osiris forever".\n\n### Group 13: "Sacred Head"\n**Representation**: Coiled cobra with woman\'s head, number "1".\n**Meaning**: Sacred serpent who "helps Osiris to have power over the waters".\n\n### Group 14: "Those who are in the Sacred Head"\n**Representation**: Three standing mummiform gods (four in the Osireion).\n**Meaning**: Deities who "help Osiris to enter and exit freely, to move as Lord of the netherworld".\n\n### Group 15: "The Enveloper"\n**Representation**: Coiled cobra, number "1".\n**Meaning**: Serpent who wraps and protects.\n\n### Group 16: "Those who are in the Enveloper"\n**Representation**: Four striding gods.\n**Meaning**: Deities who enable one to "walk unhindered in the sacred place".\n\n### Group 17: "The Ennead of those who conceal Osiris"\n**Representation**: Nine kneeling gods looking back (in the Osireion), prostrate goddess looking back (in papyri).\n**Meaning**: Nine deities who "grant that Osiris be happy in the place he desires".\n\n### Group 18: "Ferocious Face"\n**Representation**: Standing mummiform god, number "1".\n**Meaning**: Deity who "opens the eyes to Osiris so he can see Ra\'s light".',
			'caverns.eleventhCavernTitle' => 'Eleventh cavern - The cavern of the weary protector',
			'caverns.esotericMeaning' => 'Esoteric meaning',
			'caverns.fifthCavernEsotericMeaning' => '## The fifth astrological house\n\nThis cavern corresponds to the **fifth house**: the house of love, creativity and generation. It is the place where vital energy expresses itself through creation, both material and spiritual. It represents children, artistic expression and everything born from the individual\'s creative impulse.',
			'caverns.fifthCavernLiteralMeaning' => 'Division Five represents **the beginning of the rebirth of the sun god Ra**, as clearly indicated in the ancient texts. It is structured in three registers with fourteen scenes:\n\n[TABLE_CAVERNA_5]\n\n![Structure of the fifth division](quinta_divisione.webp)\n\nThe start of the rebirth process is symbolized by the **large image of Nut** at the beginning of the division, the sky goddess who gives birth to the sun each morning.\n\nAt the center of the division appears the **large figure of ithyphallic Osiris** - Osiris depicted with an erect phallus, symbol of regenerative power and resurrection - that continues the Solar-Osirian unity process: the temporary nightly union of Ra (the sun) with Osiris (regenerative death) necessary for the sun to be reborn each morning.\n\nRebirth is further symbolized by **two seated children in an oval** (R1, S3-1), called "The Youth Ra" and "The Child Ra", representing the first manifestations of the sun god. In scene **R1, S1(2)** appear the **pieces of flesh of Osiris**, elements of the dismembered body that must be reassembled to allow resurrection.',
			'caverns.fifthCavernTitle' => 'Fifth cavern - The cavern of divine children',
			'caverns.firstCavernEsotericMeaning' => '## Sons of earth\n\nAt the entrance to the caverns, Ra addresses the three guardian serpents with the words: "O son of earth". This invocation introduces the fundamental theme of the **terrestrial dimension of domification**: astrological houses are born from the encounter between heaven (the zodiac) and earth (the horizon at the time of birth), rooting cosmic energies in the concrete reality of human experience.\n\n## Ovals as magnetic envelopes\n\nThe **ovals that enclose the deities** are traditionally identified as sarcophagi. However, at a deeper level of interpretation, they are to be interpreted as **magnetic envelopes**: auras that surround the divine entities preventing their energies from dispersing. The bodies in their sepulchers are therefore bundles of energies that resolve into matter, enveloped by this magnetic ampule.\n\n## The first house\n\nIn astrological terms, the first cavern corresponds to the **first house**: the house of the ascendant, of the self and individual identity. This cavern represents the beginning of the initiatory journey through the twelve astrological houses, where the human soul must confront terrestrial and celestial forces to complete its process of spiritual evolution.',
			'caverns.firstCavernLiteralMeaning' => 'The first division is composed of five registers (R) and 13 scenes (S), with a precise iconographic structure:\n\n[TABLE_CAVERNA_1]\n\n![Division structure](prima_divisione.webp)\n\nThis division begins with three serpentine guardians that Ra must convince to allow him to enter the afterlife.\n\nThis division also contains the first appearance of deities enclosed in ovals and the first appearance of Osiris in a sanctuary. It also includes elements of Osiris\' body, represented by the two discs raised above the heads of the deities and by the pieces of flesh that appear in the mounds in R4, S3. The inclusion of parts of Osiris\' body symbolizes the elements necessary for **solar-Osirian unity** - the process through which Ra (the daytime sun) and Osiris (the nighttime sun and the regenerative force of death) merge to complete the cosmic cycle of death and rebirth, allowing the daily resurrection of the sun.\n\nThe lower register is finally reserved for the punishment of the enemies of Ra and Osiris.',
			'caverns.firstCavernTitle' => 'First cavern - The entrance portal',
			'caverns.firstDivisionTitle' => 'First Division',
			'caverns.fourthCavernEsotericMeaning' => '## The cavern of family\n\nAccording to Angelini, the Fourth Cavern represents the **root, paternal home, origin and hearth**. The central figures are members of the divine family: Osiris (the father), Horus (the son and heir), Isis and Nephthys (the sisters who protect and regenerate). These family relationships show how this cavern is the foundation of existence.\n\n## The fourth astrological house\n\nThis cavern corresponds to the **fourth house**: the house of family origins and ancestral roots. It is the place where the individual finds their primary identity and sense of belonging. It represents the emotional foundations on which existence is built, the family nucleus that provides security and continuity.',
			'caverns.fourthCavernLiteralMeaning' => 'Division Four consists of 3 registers (R) and 9 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_4]\n\n![Structure of the fourth division](quarta_divisione.webp)\n\nIn this division the theme of **Solar-Osirian unity** that began in Division Three continues. The theme is present in the first register (R1, S1) which shows an image of Osiris bent in a crescent shape, with a sun disk at his feet, being lifted by Isis and Nephthys.',
			'caverns.fourthCavernTitle' => 'Fourth cavern - The cavern of origins',
			'caverns.house10Alt' => 'Career and public image',
			'caverns.house11Alt' => 'Friendships and innovation',
			'caverns.house12Alt' => 'Transcendence and hidden realms',
			'caverns.house1Alt' => 'Identity and self-expression',
			'caverns.house2Alt' => 'Material resources and values',
			'caverns.house3Alt' => 'Communication and learning',
			'caverns.house4Alt' => 'Family and emotional foundation',
			'caverns.house5Alt' => 'Creativity and self-expression',
			'caverns.house6Alt' => 'Work and health',
			'caverns.house8Alt' => 'Transformation and hidden matters',
			'caverns.house9Alt' => 'Higher knowledge and spirituality',
			'caverns.largeIthyphallicOsiris' => 'Large Ithyphallic Osiris',
			'caverns.largeNut' => 'Large Nut',
			'caverns.literalMeaning' => 'Literal meaning',
			'caverns.ninthCavernEsotericMeaning' => '## The cavern of metaphysical order and profound religiosity\n\nAccording to Angelini, the Ninth Cavern represents the **metaphysical, religious, juridical, and mystical order**. Group 1 - "The gods in their temples above the Watery Abyss" - immediately reveals the **profound religiosity** of this house, where the mummified figure of Osiris in the temple establishes the sacred and spiritual character of the domain.\n\n## The higher spiritual principles\n\nThe deities "in their temples above the Waters of the Abyss (Nu)" (Group 1) represent the **higher spiritual principles** that govern from above. These fourteen gods who allow one to "drink from the middle of the stream" symbolize access to higher knowledge through **elevated consciousness** that transcends the chaotic primordial waters.\n\n## The duality of divine justice\n\nThe numerous groups (5, 8, 10, 12, 13, 14, 17) that Angelini identifies as the realm of justice show the **dual nature** of this cavern. The "Hidden-Armed Figures" (Groups 12-14) represent those who have lost worldly means: the "gods without hands" symbolize loss of work and material means. However, through this loss one can reach **higher knowledge** - the mystic\'s path that gains spiritual wealth through material renunciation.\n\n## Magical power and earthly justice\n\nThe bulls on standards with uraeus (Groups 4, 6, 7) who "give power to Osiris in heaven and earth" represent **magical power** operating through natural forces. This can manifest both as divine justice and as **loss of freedom** through earthly tribunal judgments. The "Protective Deities" (Groups 8-11) show how moral discipline and spiritual ascension allow one to reach **self-knowledge** through infinite trials: illness, infirmities, worldly losses.\n\n## Spiritual religion through adversity\n\n"The Souls who come forth" (Group 16) and "The Bright Ones" (Group 19) indicate the positive result of the spiritual path, while "He of the Repugnant Face" (Group 18) warns of the dangers of deviation. The house reveals how through **moral discipline and spiritual ascension** one can reach authentic spiritual religion, transforming trials into higher wisdom.\n\n## The ninth astrological house\n\nThis cavern corresponds to the **ninth house**: the house of philosophy, religion, law, higher studies, and long journeys. Angelini clearly identifies this domain as the realm of **metaphysical, religious, juridical, and mystical order**. Here both divine and earthly justice manifest - the tribunals that can take away freedom, but also the moral discipline that leads to spiritual liberation. It is the house where one accesses **higher knowledge** through direct experience of spiritual trials, transforming adversity into wisdom.',
			'caverns.ninthCavernLiteralMeaning' => 'The Ninth Cavern, called **"She of mysterious forms, who cuts off the [vital] air"**, is organized into **twenty groups of deities**, the most complex among all caverns.\n\n![Structure of the ninth division](nona_divisione.webp)\n\n## Different representations across sources\n\nAs with the Eighth Cavern, sources present two modes:\n- **In the Osireion at Abydos**: Each group shown with all deities\n- **In papyri**: Symbolic representation with one figure per group\n\n## The Twenty Groups of Deities\n\n### Group 1: "The gods who are in their shrines above the Watery Abyss"\n**Representation**: Mummified figure of Osiris with Upper Egyptian crown in shrine with serpents, number "14".\n**Meaning**: Fourteen deities who guarantee the deceased "may drink from the middle of the stream".\n\n### Group 2: "The gods and goddesses who are in the following of Osiris"\n**Representation**: Standing goddess followed by god with scepter, number "24".\n**Meaning**: Twenty-four deities (12 gods and 12 goddesses) who enable the deceased to "repose with his mummy".\n\n### Group 3: "The Standing One"\n**Representation**: Striding god with scepter, number "1".\n**Meaning**: One deity who guarantees the deceased "may adore Ra at his rising".\n\n### Groups 4, 6-7: Taurine Deities\n**Group 4**: "Amun-Osiris" - Bull on standard with uraeus who grants "power in the Wide Hall of Geb". The **uraeus** is the sacred rearing cobra, symbol of sovereignty and divine protection, that adorned pharaohs\' foreheads and represented the goddess Wadjet.\n**Group 6**: "He who nourishes Osiris" - Bull on standard carried by mummiform god, grants bread and beer to the deceased\n**Group 7**: "He who makes Osiris inaccessible" - Bull on standard that protects Osiris in the underworld, grants mastery of steps in the Holy Place\n\n### Group 5: "The Mysterious One"\n**Representation**: Standing mummiform god.\n**Meaning**: Deity who guarantees the deceased "an enduring and healthy body".\n\n### Groups 8-11: Protective Deities\n**Group 8**: "The Protector" - Mummiform god who does not allow evil to approach the deceased\n**Group 9**: "He who Tows Osiris" - Deity who guides Osiris through the afterlife, allows seeing Ra\n**Group 10**: "The Dark One" - Mummiform god who grants glory on earth and power in the West\n**Group 11**: "He-who-is-between-the-two-eyes" - Crocodile-headed god who brings the deceased before the sacred braziers\n\n### Groups 12-14: Hidden-Armed Figures\n**Group 12**: "The assistants of Osiris" - Four mummified goddesses who accompany the deceased beside the Great God of the West\n**Group 13**: "Those with hidden arms" (masculine) - Four mummiform gods with arms concealed under garments, guarantee the deceased remains in the Necropolis forever\n**Group 14**: "Those with hidden arms" (feminine) - Four mummified goddesses with concealed arms, ensure prosperity and lasting offerings\n\n### Groups 15-20: Specialized Deities\n**Group 15**: "He who hides the limbs" - God with scepter\n**Group 16**: "The Souls who come forth" - Four birds on trees\n**Group 17**: "Those of the sycamores" - Four mummified gods\n**Group 18**: "He of the Repugnant Face" - Mummiform god\n**Group 19**: "The Bright Ones" - Nine gods with solar disks\n**Group 20**: "Those who rest on their beds" - Nine reclining gods',
			'caverns.ninthCavernTitle' => 'Ninth cavern - The cavern of divine wisdom',
			'caverns.secondCavernEsotericMeaning' => '## The cavern of nourishment\n\nAccording to Angelini, the Second Cavern has nourishment and abundance as its central theme. Ra addresses the deities: "I illuminate you, oh afflicted ones, and make you satisfied with your sustenance". The **Nariu** are primeval gods of abundance and nourishment, represented with catfish heads.\n\n## The second astrological house\n\nThis cavern corresponds to the **second house**: the place where the individual finds the resources necessary for their physical survival. It is the house of earnings and income, which reveals the impulse to gather and accumulate everything needed to maintain and protect material existence.',
			'caverns.secondCavernLiteralMeaning' => 'Division Two consists of five registers (R) and 10 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_2]\n\n![Structure of the second division](seconda_divisione.webp)\n\nThis division begins, like the first, with serpent doorkeepers whom Ra must convince to gain access to the Underworld. It contains various groups of ovals with solar and Osirian elements.\n\n## The catfish-headed deities\n\nThe **catfish-headed deities** (R1, S2) are called **Nariu** and are associated with the inscription: "O Nariu, lords of sustenance, who have become as Osiris...".\n\n## The death of Osiris\n\nThe death of Osiris is highlighted by the **deities who mourn him** (R2, S1) and by the deities who guard a **chest containing the body of Osiris** (R3, S2).',
			'caverns.secondCavernTitle' => 'Second cavern - The cavern of sustenance',
			'caverns.secondDivisionTitle' => 'Division Two',
			'caverns.seventhCavernEsotericMeaning' => '## The seventh astrological house\n\nThis cavern corresponds to the **seventh house**: the house of partnerships, marriage, open enemies, and legal contracts. However, according to Angelini, **"Della settima casa nulla si può dire poichè non si hanno elementi di discusione"** ("Of the seventh house nothing can be said since there are no elements for discussion").\n\n## The passage from night to day\n\nThe seventh cavern represents **the passage from the nocturnal to the diurnal part of domification**, namely that below the ascendant line and that above the ascendant line. The complete absence of this cavern from all sources - both the Osireion reliefs and the papyri - keeps hidden the esoteric meaning of this transitional house.',
			'caverns.seventhCavernLiteralMeaning' => 'Following Angelo Angelini\'s interpretation, the **first six caverns** correspond to the six sections of the Book of the Twelve Caverns in the Osireion at Abydos, while the **other caverns are represented only in papyri**.\n\nAccording to this interpretation, the Seventh Cavern has **no attestation** in either source: it is absent from the Osireion reliefs and **"Manca nei Papiri"** ("Missing in the Papyri") as Angelini explicitly states.',
			'caverns.seventhCavernTitle' => 'Seventh cavern - The cavern of the sacred union',
			'caverns.sixthCavernEsotericMeaning' => '## The sixth astrological house\n\nThis cavern corresponds to the **sixth house**: the house of work, health and service, which **ends the dark zone of domification**. It is the house of **defeating chaos**, symbolized by the decapitated heads (R3, S1) representing the forces of disorder definitively vanquished.\n\nThe Sixth House represents the **fulcrum of spiritual transformation through sacrifice**. It is the place where, through discipline, service and acceptance of difficulties, the individual defeats inner chaos and can access higher planes of awareness. Just as Ra is reborn every morning after defeating the forces of nightly chaos, so sacrifice becomes an instrument of regeneration, transforming suffering into spiritual growth.',
			'caverns.sixthCavernLiteralMeaning' => 'Division Six represents **the completion of the rebirth process** begun in the fifth division. It is structured in three registers with thirteen scenes:\n\n[TABLE_CAVERNA_6]\n\n![Structure of the sixth division](sesta_divisione.webp)\n\nThe central theme is the **imminent birth of the sun god Ra**. This is symbolized by the figure of the **scarab beetle emerging from between two mounds** (R2, S1), an image representing the sun god about to be born after completing his nightly journey through the Underworld.\n\nThe division also contains other figures connected to rebirth: the image of **Tatenen** (R2, S3), funerary deity representing the land that emerged from primordial Chaos, creator of primordial energy, **rams** (R1, S2) and **ram heads** (R1, S3 and R2, S3), all symbols associated with the sun god and the regenerative process.\n\nThe lower register maintains the customary representation of **decapitated enemies** (R3, S1), symbolizing the defeat of the forces of chaos that oppose solar rebirth.',
			'caverns.sixthCavernTitle' => 'Sixth cavern - The cavern of service',
			'caverns.table1R1S1' => '3 coiled serpents',
			'caverns.table1R1S2' => '9 cobras',
			'caverns.table1R1S3' => '9 bull-headed deities',
			'caverns.table1R2S1' => '9 male deities in ovals',
			'caverns.table1R2S2' => '9 jackal-headed deities',
			'caverns.table1R2S3' => 'Male and female deity holding a disc above their heads',
			'caverns.table1R3S1' => '11 deities',
			'caverns.table1R3S2' => 'Osiris in a sanctuary with 8 male and female deities in ovals surrounding him',
			'caverns.table1R4S1' => '9 female deities standing on baskets',
			'caverns.table1R4S2' => '8 female deities in ovals',
			'caverns.table1R4S3' => '2 male deities on sides of a mound; 2 female deities on sides of a mound; Mongoose-headed deity',
			'caverns.table1R5S1' => '3 coiled serpents',
			'caverns.table1R5S2' => '16 male enemies (8 decapitated)',
			'caverns.table2R1S1' => 'Serpent raised on its tail + 4 coiled serpents',
			'caverns.table2R1S2' => '4 catfish-headed deities and 8 shrewmouse-headed deities in ovals + two hawk-headed deities',
			'caverns.table2R1S3' => '7 female deities in ovals + male deity',
			'caverns.table2R2S1' => 'Shrewmouse-headed deity + 9 male mourners',
			'caverns.table2R2S2' => '12 mummified male deities in ovals + ram-headed deity',
			'caverns.table2R3S1' => 'Ram-headed deity + 9 male deities',
			'caverns.table2R3S2' => '4 males around the chest of Osiris + 4 ram-headed standards + 4 jackal-headed standards',
			'caverns.table2R4S1' => 'Hawk-headed deity + 12 Osiride figures in ovals + male deity',
			'caverns.table2R4S2' => 'Ram-headed deity + 9 ram-headed deities in ovals + 1 ram-headed deity',
			'caverns.table2R5S1' => '4 male deities with bullhorns holding knives + 16 male enemies (4 are decapitated; 4 are laying face down; last 8 are upside down)',
			'caverns.table3R1S1' => 'Sun disk + 2 coiled serpents + 1 male deity in an oval',
			'caverns.table3R1S2' => '7 catfish-headed deities standing under a serpent',
			'caverns.table3R1S3' => '2 mummified ram-headed deities in mounds',
			'caverns.table3R1S4' => '3 male and female deities in ovals',
			'caverns.table3R1S5' => 'Osiris in a shrine + 10 male and female deities in ovals',
			'caverns.table3R2S1' => 'Ram-headed deity',
			'caverns.table3R2S2' => '4 Osiride figures',
			'caverns.table3R2S3' => 'Double sphinx Aker + reposing ithyphallic Osiris encircled by a serpent',
			'caverns.table3R2S4' => '3 ovals encircled by an ouroboros serpent + 4 male deities',
			'caverns.table3R2S5' => 'Mongoose-headed deity standing on a serpent + 2 male deities',
			'caverns.table3R3S1' => '4 upside down male figures + 4 upside down female figures + 1 male figure',
			'caverns.table3R3S2' => '8 upside down male enemies (4 decapitated)',
			'caverns.table3R3S3' => '4 upside down female enemies + 4 upside down ba birds',
			'caverns.table4R1S1' => 'Human Osiris bent in crescent shape lifted by Isis and Nephthys',
			'caverns.table4R1S2' => 'Anubis + human Osiris + Horus',
			'caverns.table4R1S3' => 'Male deity with bull horns + 2 ovals',
			'caverns.table4R2S1' => 'Ram-headed deity + 3 human Osiris figures',
			'caverns.table4R2S2' => 'Horus + coiled serpent separating 2 ovals, each containing a mummiform figure',
			'caverns.table4R2S3' => 'Anubis + human Osiris + ba bird',
			'caverns.table4R3S1' => '4 upside down male enemies + cat-headed deity',
			'caverns.table4R3S2' => 'Lion-headed female deity + 1 female deity + 1 reposing male deity',
			'caverns.table4R3S3' => '4 upside down male enemies + male figure',
			'caverns.table5Division' => 'Fifth Division',
			'caverns.table5R1S1P1' => 'Human Osiris + 4 standing serpents with human heads',
			'caverns.table5R1S1P2' => 'Oval flanked by a male deity and a ram-headed deity',
			'caverns.table5R1S2P1' => 'Tatenen flanked by 2 male deities',
			'caverns.table5R1S3P1' => 'Male deity + 2 ovals',
			'caverns.table5R2S1P1' => '4 hawk-headed mummies + Anubis + oval',
			'caverns.table5R2S1P2' => 'Ram-headed deity + female deity',
			'caverns.table5R2S2P1' => '4 female deities each in an oval',
			'caverns.table5R2S2P2' => 'Human Osiris with Horus with a ram head between them',
			'caverns.table5R3S1P1' => 'Female deity holding a pole in each hand, with 2 kneeling male enemies in front of them',
			'caverns.table5R3S1P2' => '2 kneeling female deities on either side of a cauldron containing 4 upside down ba birds + 4 fans',
			'caverns.table5R3S2P1' => 'Serpent headed (?) figure kneeling in front of a cauldron containing 4 heads and 4 hearts',
			'caverns.table5R3S3P1' => '2 cobras on either side of a cauldron containing 4 upside down decapitated male enemies',
			'caverns.table6Division' => 'Sixth Division',
			'caverns.table6R1S1' => 'Anubis standing between two ovals, each containing a mummified deity + a ba bird on top of each oval',
			'caverns.table6R1S2' => 'Anubis + three ovals',
			'caverns.table6R1S3' => '2 female deities flanking 2 ovals',
			'caverns.table6R1S4' => 'Osiris-Orion standing on top of a mound containing a decapitated enemy + male deity + hawk sitting on top of a mound',
			'caverns.table6R2S1' => 'Scarab emerging between 2 mounds + 4 male deities',
			'caverns.table6R2S2' => 'Scarab surrounded by a serpent + 2 male deities in ovals',
			'caverns.table6R2S3' => 'Mound with coiled serpent and ram head emerging + Tatenen in a mound emerging from the ground + 2 male deities',
			'caverns.table6R2S4' => '2 deities in ovals',
			'caverns.table6R2S5' => '4 decapitated enemies in ovals',
			'caverns.table6R3S1' => '4 decapitated enemies + male and female deities with knives + female deity',
			'caverns.table6R3S2' => '2 Anubis-headed female deities + 4 female enemies',
			'caverns.table6R3S3' => 'Male and female deities + 4 kneeling male enemies',
			'caverns.table6R3S4' => 'Osiris emerging from between a serpent + 2 upside down male figures with their heads in the ground',
			'caverns.tapToExploreCavern' => 'Tap to explore this cavern',
			'caverns.tenthCavernEsotericMeaning' => '## The cavern of worldly achievement and divine recognition\n\nAccording to Angelini, the Tenth Cavern is **associated with solar illumination** and demonstrates how **elevation and popularity are achievable through sacrifice**, revealing that social position results from sustained effort and divine favor.\n\n## The sacred clamor and inviolable mysteries\n\nThe name "the Clamorous One whose mysteries are sacred" reveals this house\'s paradoxical nature: **public success** (the clamor) must coexist with **protection of inner mysteries** (the sacred). "Those who belong to the light" (Group 1) represent the illumination that comes from achieving social position and guarantee one "may see Ra at his rising".\n\n## The vigilant divine council\n\n"The Ennead who guard those who are in the earth" (Group 3) represents the **cosmic oversight** that governs worldly success. These nine guardians lying on ritual beds show how earthly power requires constant vigilance and divine protection. Their gift of "the breath of life" indicates that true authority derives from alignment with cosmic vital forces.\n\n## The paradox of hidden power\n\n"The Ennead of those whose arm is hidden" (Group 4) reveals a profound teaching: **true power is often exercised invisibly**. The concealed arms symbolize influence operating behind the scenes, subtle diplomacy, and the wisdom of not displaying all one\'s capabilities. This group guarantees being "glorious as the accomplished spirits," indicating that true glory derives from inner mastery, not ostentation.\n\n## Transformation through sacrifice\n\n"The souls of the gods who came into being from the limbs of Osiris" (Group 6) - thirty-one deities emanated from the dismembered body of the god - teach that **lasting success requires sacrifice and transformation**. As Osiris was dismembered and reassembled, so those who aspire to power must be willing to sacrifice parts of themselves to be reborn in a higher form. The number 31 (or 21) suggests the days of the lunar month, indicating cycles of rise and fall in power.\n\n## Refreshment in the place of heat\n\n"Those with repulsive faces" (Group 8) who paradoxically grant "refreshment in the place of heat" reveal a profound truth: the **most difficult challenges** (the repulsive faces) in achieving and maintaining power can bring the greatest relief and satisfaction. The "place of heat" represents the pressure and stress of elevated positions, while "refreshment" is the inner peace that comes from overcoming such trials.\n\n## The tenth astrological house\n\nThis cavern corresponds to the **tenth house**: the house of career, reputation, public status, and social achievement. It represents the **culmination of earthly ambitions** when aligned with divine will. The groups of deities show that true success requires: illumination (Group 1), ability to "seize" opportunities (Group 2), divine protection (Group 3), hidden wisdom (Group 4), personal mystery (Group 5), transformative sacrifice (Group 6), devotion (Group 7), and the ability to transform adversities into blessings (Group 8).',
			'caverns.tenthCavernLiteralMeaning' => 'The Tenth Cavern, called **"the Clamorous One whose mysteries are sacred"**, contains **eight groups of deities** embodying themes of divine illumination and sacred protection.\n\n![Structure of the tenth division](decima_divisione.webp)\n\n## The cavern\'s name\n\nThe name "the Clamorous One" refers to the ritual sounds and sacred invocations that resonate in this domain, while "whose mysteries are sacred" emphasizes the inviolable nature of the divine secrets guarded here.\n\n## Differences between ancient sources\n\nAs with other caverns in the Book of the Twelve Caverns, two modes of representation exist:\n\n**In the Osireion at Abydos** (Seti I\'s underground temple): Each group is represented with all its deities - for example, the first group shows eight striding gods arranged in two registers, the second group shows eight goddesses pouring water, and so forth.\n\n**In funerary papyri** (such as British Museum 10.478): For space economy, each group is represented by **a single symbolic figure** accompanied by a number indicating how many deities it represents. Thus a single goddess pouring water with the number "8" represents the entire group of eight goddesses.\n\n## The Eight Groups of Deities\n\n### Group 1: "Those who belong to the light"\n**Representation**: Eight striding gods arranged in two registers (in the Osireion).\n**Meaning**: Eight solar deities who guarantee the deceased "may see Ra at his rising" and participate in divine luminosity.\n\n### Group 2: "Those who seize"\n**Representation**: Eight goddesses pouring water from vessels topped with Anubis heads (in the Osireion).\n**Meaning**: Eight female deities who "seize" souls, guaranteeing the deceased "may be in jubilation".\n\n### Group 3: "The Ennead who guard those who are in the earth"\n**Representation**: Nine mummified gods lying on ritual beds.\n**Meaning**: Nine guardians who watch over the dead, granting "the breath of life on earth and in the Necropolis".\n\n### Group 4: "The Ennead of those whose arm is hidden"\n**Representation**: Nine standing mummiform gods (in the Osireion, eight gods spitting water).\n**Meaning**: Nine deities with concealed arms who guarantee the deceased "may be glorious as the accomplished spirits".\n\n### Group 5: "The Mysterious One"\n**Representation**: A standing goddess, sometimes with the Eye of Horus (Wedjat).\n**Meaning**: A female deity who causes "the soul to endure and the body to prosper like those of the gods in the netherworld".\n\n### Group 6: "The souls of the gods who came into being from the limbs of Osiris"\n**Representation**: Thirty-one (or twenty-one in papyri) recumbent deities, organized in groups.\n**Meaning**: Divine souls emanated from Osiris\'s body, who grant "peace" to the deceased.\n\n### Group 7: "The Adorers"\n**Representation**: Four striding gods.\n**Meaning**: Four adorers of Ra who ensure "there is no opposition to the deceased at any gate of the netherworld".\n\n### Group 8: "Those with repulsive faces"\n**Representation**: Four striding gods (sometimes represented as a goddess).\n**Meaning**: Four terrifying-looking deities who paradoxically grant "refreshment in the place of heat".',
			'caverns.tenthCavernTitle' => 'Tenth cavern - The cavern of sacred clamor',
			'caverns.thirdCavernEsotericMeaning' => '## The cavern of spiritual qualities\n\nAccording to Angelini, the Third Cavern is characterized by the presence of **Neheb-Kau**, the great primeval serpent god. His name means "He who unites the Ka" and is also conceptually translated as "Bestower of dignities", that is, he who assigns positions and honors in the afterlife. The **Ka** in Egyptian conception is the life force, the spiritual double that distinguishes the living from the dead and must be nourished and preserved to ensure continuity in the afterlife.\n\n## The unifier of attributes\n\nNeheb-Kau is called in ancient texts "unifier of attributes", that is, he who reunites and coordinates the different spiritual qualities and characteristics necessary for complete existence in the afterlife. He is considered the "Ka of every god" and his function was to endow gods and humans with life.\n\n## The third astrological house\n\nThis cavern corresponds to the **third house**: the place of gathering elements for the formation of the Spirit. It is the house of instruction, of ideas that form the new personality and of relationships with others. According to Angelini, it represents the centripetal movement directed toward acquiring qualities that nourish the Spirit.',
			'caverns.thirdCavernLiteralMeaning' => 'Division Three consists of 3 registers (R) and 13 scenes (S), the contents of which are contained in the following chart:\n\n[TABLE_CAVERNA_3]\n\n![Structure of the third division](terza_divisione.webp)\n\nIn this division Ra physically enters the Underworld after gaining access from the doorkeepers. This division is the starting point for the **Solar-Osirian unity**, a process necessary for the sun god Ra to be reborn in the morning. The unity is represented in the central scene (R2, S3) where the reposing ithyphallic Osiris appears with a sun disk above his erect phallus.\n\n## The catfish-headed deities\n\nIn the first register (R1, S2) appear **7 catfish-headed deities** standing under a serpent. These are associated with the text addressing the "gods who are in the sheepfold of Neheb-Kau".\n\n## The double sphinx Aker\n\nThe central scene shows the **double sphinx Aker** with ithyphallic Osiris encircled by a serpent, representing the moment when the unity between Ra and Osiris begins. Aker is the ancient Egyptian earth deity and guardian of the Underworld, depicted as a double sphinx that protects the sun god during his nightly journey through the afterlife.',
			'caverns.thirdCavernTitle' => 'Third cavern - The cavern of formative relationships',
			'caverns.twelfthCavernEsotericMeaning' => '## The cavern of the ultimate shore where domification ends\n\nAccording to Angelini, **"With the XII Cavern one reaches the end of domification, one reaches the shore beyond which the sea exists"**. This dwelling represents **"the end of domification, the closure of this subliminal circuit"**, poetically compared to **"a shore where one must stop"**.\n\n## The great journeys beyond the shore\n\nAngelini specifies that **"The Twelfth House with the first vignettes indicates the end of domification, but also great journeys, sojourns beyond the shore"** - journeys that are not limited to the ninth house but extend beyond the boundaries of earthly experience. The **Shore Deities** ("He who controls the shore," "The Chief of the shore," "The gods who are on the shore") govern this ultimate boundary where the individual meets the infinite.\n\n## The Mysterious Head on the shore: spirituality and suffering\n\nThe **"Mysterious Head on the shore"** (Group 7) - **"a ram\'s head placed on a pole"** - reveals according to Angelini **"the spirituality of this house, but also, and above all, its negative part, woven with suffering, ineluctable bonds, constraints"**.\n\n## The constraining coils and the paradox of liberation\n\nThe distinctive trait of the twelfth house is its **"constraining, immobilizing function, with the many coils of the serpent that trap the god"**. The **"Gods who are in the following of the Enveloper"** and **"The gods who are in the coils"** (Groups 3 and 8) show divine figures **"wrapped in serpent coils"**, representing those who are **"immobilized by external and internal circumstances"**.\n\nHowever, as Angelini observes in the general context of the Book of Caverns, apparent constraints can become means of spiritual liberation. The coils that immobilize are also those that protect, following the model of Mehen, the great serpent that wraps Osiris to guard him in his journey of regeneration.\n\n## The twelfth astrological house\n\nThis cavern corresponds to the **twelfth house**: the domain of hidden realities, spiritual sacrifice, and ultimate transcendence. It is the place where **"the Neter Kether ends"** (the hidden world) and where earthly domification gives way to the infinite sea of transcendent existence, reached paradoxically through acceptance of final constraints.',
			'caverns.twelfthCavernLiteralMeaning' => 'The Twelfth Cavern, called **"She who unites the gods and embraces their manifestations"**, contains **nine groups of deities** organized around the theme of the sacred shore as the final boundary of the netherworld.\n\n![Structure of the twelfth division](dodicesima_divisione.webp)\n\n## The Nine Groups of Deities\n\n### Groups 1-2, 4-6: The Shore Deities\n\n**Group 1: "He who controls the shore"** - A striding deity with scepter who guarantees the deceased "may be Lord of the Island of the Just."\n\n**Group 2: "The gods who are on the shore of the netherworld"** - Thirteen deities (in the Osireion) symbolically represented by one figure in papyri, who grant "truth in the Wide Hall of the Two Truths."\n\n**Group 4: "The gods who belong to the shore"** - Four mummified deities who "give an island in the Fields of Iaru."\n\n**Group 5: "The Chief of the shore"** - A deity with scepter who grants "an endowment in the Field of Offerings."\n\n**Group 6: "The gods who are on the shore"** - Eight deities (four in papyri) who guarantee "offerings, food, and a great quantity of meat in the Necropolis."\n\n### Group 7: The Mysterious Heads\n\n**"The Mysterious Heads on the shore"** - Eleven ram\'s heads mounted on staffs (in the Osireion), symbolically represented by a single head in papyri. They grant "their protection as it is done for Tired-Heart."\n\n### Groups 3 and 8: The Figures in Coils\n\n**Group 3: "The gods who are in the following of the Enveloper"** - Fourteen recumbent deities wrapped in serpent coils (in the Osireion), who guarantee the deceased "may be in any place in which his Ka desires him to be."\n\n**Group 8: "The gods who are in the coils"** - Fourteen deities similarly wrapped, who grant "the sight of the Solar Disk."\n\n### Group 9: The Bowing Ones\n\n**Group 9: "iwwtyw"** (cryptic name) - Four bowing deities who guarantee "rest in the beautiful West."',
			'caverns.twelfthCavernTitle' => 'Twelfth cavern - The cavern of the final shore',
			'codex.astronomyFundamentalsTitle' => 'Astronomy fundamentals',
			'codex.bookOfCaverns' => 'Book of Caverns',
			'codex.bookOfCavernsIntroduction' => '## Egyptian Funerary Texts and Astrology\n\nThis treatment of the **12 astrological houses** is based on Egyptian funerary texts from the New Kingdom describing the sun god Ra\'s journey through the underworld, following Angelo Angelini\'s astrological interpretation.\n\n## The Two Source Texts\n\nThe twelve caverns presented here derive from two distinct Egyptian texts:\n\n### Caverns 1-6: The Book of Caverns Proper\nA Ramesside funerary text describing Ra\'s nocturnal journey through six sections of the Duat. Characterized by scenes of punishment for Ra and Osiris\'s enemies, this text is attested in its most complete versions in the tomb of Ramses VI (KV9) and the Osireion of Seti I at Abydos.\n\nContemporary Egyptology maintains that the Book of Caverns actually contains all twelve caverns, organized with multiple caverns per section ([Power, 2015](https://doi.org/10.17638/03032971)). For this astrological treatment, however, we follow Angelini\'s interpretation that assimilates each of the six sections to an astrological house.\n\n### Caverns 8-12: The Book of the Twelve Caves\nAlso known as **Spell of the Twelve Caves**, this text was long considered part of the Book of the Dead. Alexandre Piankoff demonstrated it is an independent composition with a benevolent liturgical character: deities grant favors to the deceased without scenes of punishment.\n\nThe first seven caverns of the Book of the Twelve Caves are represented in an extremely synthetic and schematic manner, providing very little information about their content, while only the last five (from 8 to 12) are described in detail.\n\nAngelo Angelini interprets the eighth cavern of the Book of the Twelve Caves as the eighth astrological house—a symbolic, not philological connection.\n\n## The Meaning of "Cavern"\n\nIn Egyptian: **Kerreret** or **Kerret**\n\n![Hieroglyph of Kerreret](caverna.webp)\n\nAccording to Angelo Angelini, the hieroglyph combines:\n- **Q** (triangle): matter to be worked\n- **Seeds**: time\n- **Open rectangle**: space\n\nThe term thus indicates "a temporal space"—the essence of astrological domification, where celestial time (planetary transits) crystallizes into earthly experience.\n\n## Sources\n\n### Book of Caverns (caverns 1-6)\n- **Philological reconstruction**: Werning, D. A. (2019). The Book of Caverns in Theban Tomb 33: Late Period reception process and individual adaptation. *Bulletin de l\'Institut français d\'archéologie orientale*, *118*, 525-554. [https://doi.org/10.4000/bifao.5059](https://doi.org/10.4000/bifao.5059)\n- **Iconographic interpretation**: Power, D. M. (2019). *Aspects of iconography and transmission in the Book of Caverns* [Doctoral dissertation]. University of Liverpool. [https://doi.org/10.17638/03032971](https://doi.org/10.17638/03032971)\n- **Iconographic source**: [Theban Mapping Project](https://thebanmappingproject.com/tombs/kv-09-rameses-v-and-rameses-vi), tomb of Ramses VI\n\n### Book of the Twelve Caves (caverns 8-12)\n- **Philological reconstruction**: Méndez Rodríguez, D. M. (2015). The transmission of the Book of the Twelve Caverns. In G. Rosati & M. C. Guidotti (Eds.), *Proceedings of the XI International Congress of Egyptologists* (pp. 405-409). Archaeopress. [https://doi.org/10.2307/j.ctv177tjnf.77](https://doi.org/10.2307/j.ctv177tjnf.77)\n- **Iconographic interpretation**: Piankoff, A. (1974). *The wandering of the soul*. Princeton University Press. [https://archive.org/details/wanderingofsoul0006pian](https://archive.org/details/wanderingofsoul0006pian)\n- **Iconographic source**: [Papyrus EA 10478](https://www.britishmuseum.org/collection/object/Y_EA10478-6), British Museum\n\n### Astrological Interpretation\n- Angelini, A. (1992). *Manuale di astrologia egizia*. Kemi.\n\n**Note**: Colors in illustrations of caverns 1-6 are suggestive and serve a communicative function to evoke the underworld atmosphere, not philological, as the originals on tomb walls are heavily deteriorated. For caverns 8-12, original colors from Papyrus EA 10478 of the British Museum have been used.',
			'codex.celestialSphereContent' => '## Looking up\n\nStep outside on a clear night, away from city lights, and you see thousands of stars scattered across a dark dome overhead. Watch for an hour or two and something becomes obvious: the stars move. Not relative to each other, though. The entire pattern shifts as a single piece, like a bowl slowly rotating above you. Orion drifts westward. New stars appear on the eastern horizon. Others sink below the west.\n\nThis apparent rotation is, of course, a consequence of Earth spinning on its axis. But for the purposes of observational astronomy and astrology, it is far more practical to work with what you actually see. And what you see is a sphere.\n\n## The celestial sphere\n\nThe celestial sphere is an imaginary sphere of arbitrarily large radius, centered on the observer. Every star, planet, and celestial body is projected onto its inner surface. The model is ancient, and it remains useful because angular positions and relationships between objects are the same whether you think of the sky as a sphere or as empty space extending billions of light-years in every direction. What matters is where things appear, not how far away they are.\n\nThe sphere has several reference points defined by the observer\'s position on Earth.\n\n## Reference points\n\nThe **horizon** is the circle that separates the visible half of the celestial sphere (above us) from the invisible half (below us). Four cardinal directions mark the horizon: **North**, **East**, **South**, and **West**. The point directly overhead is the **zenith**; the opposite point, below your feet, is the **nadir**.\n\nThe **meridian** is the imaginary arc that starts at the north horizon, rises to the zenith, and descends to the south horizon. It divides the sky into an eastern half and a western half.\n\nIn the birth chart, these reference points define the four angles. The zodiacal degree rising in the East is the **Ascendant**; the one setting in the West is the **Descendant**. The zodiacal degree at the highest point of the meridian is the **Midheaven** (MC); the opposite point below the horizon is the **Imum Coeli** (IC).\n\n[CELESTIAL_SPHERE_DIAGRAM]',
			'codex.celestialSphereTitle' => 'The celestial sphere',
			'codex.codexAttributionRequired' => 'Mandatory condition: Attribution through citation "Source: AstroGods (astrogods.it) - CC BY 4.0 License"',
			'codex.codexCreativeCommons' => 'B) Codex - Educational content (CC BY 4.0 license)',
			'codex.codexCreativeCommonsText' => 'The contents of the Codex, including interpretive texts, images and educational materials, are released under the Creative Commons Attribution 4.0 International license. Users may:',
			'codex.codexRights1' => 'Reproduce, distribute and publicly communicate the work',
			'codex.codexRights2' => 'Modify, transform the work and create derivative works',
			'codex.codexRights3' => 'Use the work for commercial purposes',
			'codex.codexThirdPartyLicenseHierarchy' => 'Where Codex content incorporates third-party materials subject to more restrictive licenses, the terms of the more restrictive license shall prevail. Users must identify and comply with all applicable license requirements, including attribution to original sources.',
			'codex.codexTitle' => 'Codex',
			'codex.contentComingSoon' => 'Content coming soon',
			'codex.diagramAquarius' => 'Aquarius',
			'codex.diagramAries' => 'Aries',
			'codex.diagramAscendingSign' => ({required Object sign}) => 'Ascending sign: ${sign}',
			'codex.diagramAutumn' => 'Autumn',
			'codex.diagramAutumnalEquinox' => 'Autumnal eq.',
			'codex.diagramAverageRising' => 'Average rising',
			'codex.diagramCancer' => 'Cancer',
			'codex.diagramCapricorn' => 'Capricorn',
			'codex.diagramCelestialEquator' => 'Celestial equator',
			'codex.diagramCelestialEquatorShort' => 'Cel. equator',
			'codex.diagramCelestialPole' => 'Celestial pole',
			'codex.diagramEarth' => 'Earth',
			'codex.diagramEast' => 'East',
			'codex.diagramEcliptic' => 'Ecliptic',
			'codex.diagramEquator' => 'Equator',
			'codex.diagramFastRising' => 'Fast rising',
			'codex.diagramGemini' => 'Gemini',
			'codex.diagramHorizon' => 'Horizon',
			'codex.diagramLatitude' => ({required Object degrees}) => 'Latitude: ${degrees}°',
			'codex.diagramLeo' => 'Leo',
			'codex.diagramLibra' => 'Libra',
			'codex.diagramLongAscension' => 'Long ascension',
			'codex.diagramMeridian' => 'Meridian',
			'codex.diagramNadir' => 'Nadir',
			'codex.diagramNorth' => 'North',
			'codex.diagramPisces' => 'Pisces',
			'codex.diagramPrecessionAge' => ({required Object symbol, required Object sign, required Object year}) => '${symbol} ${sign}, ~${year}',
			'codex.diagramPolarCircleShort' => 'Polar c.',
			'codex.diagramPole' => 'Pole',
			'codex.diagramRome' => 'Rome',
			'codex.diagramRomeLatitude' => 'Rome · 42° N',
			'codex.diagramSagittarius' => 'Sagittarius',
			'codex.diagramScorpio' => 'Scorpio',
			'codex.diagramShortAscension' => 'Short ascension',
			'codex.diagramSlowRising' => 'Slow rising',
			'codex.diagramSpring' => 'Spring',
			'codex.diagramSummer' => 'Summer',
			'codex.diagramSummerSolstice' => 'Summer solst.',
			'codex.diagramTaurus' => 'Taurus',
			'codex.diagramVernalEquinox' => 'Vernal eq.',
			'codex.diagramVirgo' => 'Virgo',
			'codex.diagramWest' => 'West',
			'codex.diagramWinter' => 'Winter',
			'codex.diagramWinterSolstice' => 'Winter solst.',
			'codex.diagramYearBCE' => 'BCE',
			'codex.diagramYearCE' => 'CE',
			'codex.diagramZenith' => 'Zenith',
			'codex.diagramCaptionCelestialSphere' => 'The celestial sphere as seen from a mid-latitude observer. The slider rotates the sphere to show the apparent motion of the sky',
			'codex.diagramCaptionEquatorEcliptic' => 'Celestial equator and ecliptic. The slider moves the Sun along the ecliptic over the course of a year',
			'codex.diagramCaptionLatitudeSky' => 'The celestial sphere at different latitudes. The slider changes the observer\'s latitude and shows how the celestial pole altitude and the tilt of stellar circles change relative to the horizon',
			'codex.diagramCaptionEclipticRising' => 'Long ascension vs short ascension. The number of zodiacal degrees rising in the same time interval changes depending on the angle between ecliptic and horizon',
			'codex.diagramCaptionEclipticHorizon' => 'The ecliptic at the eastern horizon. The hour slider shows how the angle of incidence changes during diurnal rotation',
			'codex.diagramCaptionSemidiurnalArc' => 'Celestial sphere with ecliptic and horizon. The latitude slider changes the tilt of the sphere; the hour slider shows diurnal rotation',
			'codex.diagramCaptionPlacido' => 'Placido houses seen from above. The slider changes latitude to show how distortion increases away from the equator',
			'codex.diagramCaptionPrecession' => 'Earth\'s axis traces a cone in space over approximately 25,772 years. The slider rotates the axis to show the wobble',
			'codex.diagramCaptionWholeSign' => 'Whole sign houses. Each zodiacal sign constitutes a complete house. The slider moves the Ascendant to show how the house distribution changes',
			'codex.domificationArticleContent' => '## Introduction\n\nWhy does AstroGods use Vehlow domification rather than Placidus? The question is fair. The vast majority of astrological software uses the system of Placido de Titis, a 17th-century Olivetan monk whose method became, through historical inertia rather than philosophical merit, the modern standard. But looking back at astrology\'s origins reveals that equal houses are the oldest, most widespread system, and the one most coherent with the cosmological vision on which astrology rests. The following sections trace the reasons for this choice, starting from a deeper question: what, exactly, are the houses?\n\n## What the houses are: a necessary premise\n\nBefore choosing a house system, it helps to understand what houses actually are.\n\nModern astrology often treats them as simple geometric divisions of celestial space, sectors calculated with trigonometric formulas. The ancient conception is radically different. The houses are the twelve portions of the human etheric aura: that part of the microcosmic subtle body that allows the macrocosmic celestial matrix (the signs) to crystallize into the microcosmic earthly matrix (the physical and etheric body).\n\nThe Egyptian word for the houses is *Kereret* (or *Kerret*), typically translated as "cavern" in the [Book of Caverns](/codex/domification/book-of-caves). But this translation is reductive. As Angelini observes through hieroglyphic etymology, *Kereret* contains both a concept of space and a concept of time: it is a *space-time*, an inseparable unit of place and duration [(Angelini, 1992)](https://www.kemiassociazione.it/product/?manuale-di-astrologia-egizia){{la caverna è uno spazio temporale, un luogo che è collegato al tempo. Con questa definizione gli Egizi hanno magistralmente indicato cosa sia, in sostanza, la domificazione: uno spazio che è in funzione del tempo, oppure un tempo che non si può dissociare dallo spazio}}.\n\nThis conception immediately exposes the limitation of modern house systems: Campanus treats the houses as a purely spatial phenomenon, Placidus treats them as temporal. Neither captures the nature of *Kereret* as an indivisible space-time unit.\n\n## The premise determines the conclusion\n\nIn a 1991 astrology course, Angelo Angelini formulated a principle that illuminates the entire question of domification: a calculation always resolves the premise set at its foundation, but if that premise is wrong, the result will inevitably be wrong, regardless of mathematical rigor [(Angelini, 1991)](https://www.kemiassociazione.it/astrologia-iv---angelini.html){{La premessa di un calcolo è fondamentale. Il calcolo ti risolve la premessa che tu hai posto a monte, ma se questa premessa è sbagliata, ti porta ad una conclusione sbagliata.}}.\n\nPlacidus domification starts from an astronomical-mathematical premise: it divides the [semi-diurnal arc](/codex/domification/understanding-placido/semidiurnal-arcs) of each zodiacal degree into equal time intervals and derives house cusps from the degrees corresponding to each division. The calculation is trigonometrically impeccable, but converting from time back to zodiacal degrees produces houses of unequal size, because the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) meets the horizon at different angles during celestial rotation. Distortion increases with the observer\'s [latitude](/codex/domification/understanding-placido/latitude-sky): at the equator the houses remain nearly regular; at high latitudes some expand enormously while others shrink to slivers. For a detailed treatment with interactive diagrams, see [Understanding Placido domification](/codex/domification/understanding-placido).\n\n[PLACIDO_DIAGRAM]\n\nThe calculation is correct. But is the premise? Vehlow domification starts from an entirely different foundation: metaphysical and analogical. The houses represent the twelve archetypal fields of experience, the twelve sections of the human aura. Their structure should reflect cosmic order, not the astronomical contingency of a given place and moment. However mathematically impeccable a calculation may be, what matters is the conception of the world on which that calculation was built.\n\n## A brief history of domification\n\nEqual houses are not a recent innovation. They are the dominant system in astrology for most of its documented history.\n\nThe prevailing method was Whole Sign Houses, where each zodiacal sign corresponds to a complete house. This is attested in the sources of Hellenistic astrology (3rd c. BCE to 1st c. CE), through the imperial Roman period (Vettius Valens, 2nd c. CE; Firmicus Maternus, 4th c. CE), and the early medieval Arabic tradition up through the 9th–10th centuries [(Hand, 2007)](https://www.cultureandcosmos.org/pdfs/11/11_Hand_Signs_as_Houses_Vol11.pdf){{The practice of using signs as places did not die out at the end of the Greek era. We also find it in early Arabic era authors such as Masha\'allah (fl. 762-815)}}. In Indian Vedic astrology, the same principle (*Rashi Chakra*) has remained in continuous use to this day.\n\n[WHOLE_SIGN_HOUSES_DIAGRAM]\n\nUnlike Whole Sign Houses, where each sign forms a house of exactly 30°, quadrant systems take the [four angles](/codex/astronomy-fundamentals/celestial-sphere) as their reference: Ascendant, Descendant, Midheaven, and IC. These four points divide the ecliptic into four sectors, which are then subdivided to produce the intermediate houses. Since the four sectors are never exactly equal, the resulting houses vary in size.\n\nThe first quadrant system to spread widely was that of Alcabitius (al-Qabisi, 10th c.), which became the standard method in medieval Arabic and Latin astrology. Campanus followed in the 13th century, then Regiomontanus in the 15th, and finally Placidus.\n\nPlacidus developed his system within the context of the 17th-century scientific revolution. The mechanistic paradigm of Galileo, Newton, and Descartes was redefining the criteria for legitimate knowledge: what counted was what could be measured, calculated, reproduced. Astrology lost its status as an analogical science and was pushed to the margins. In that climate it was natural for new house systems to be grounded solely in astronomical calculation, abandoning the metaphysical premises that had sustained equal houses for millennia.\n\nIn the 20th century, the German astrologer Johannes Vehlow revived the equal house system and refined it by placing the Ascendant at the center of the first house, extending 15 degrees before and 15 degrees after. He called his approach "antike Manier" (ancient method) because he found it in the classical sources [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Die Bezeichnung "antike Manier" habe ich deshalb gewählt, weil die Einteilung der Häuser mit den Kardinalpunkten in den Mitten einer uralten Methode entspricht unter Zugrundelegung der antiken Urtypen, dem Thema mundi}}.\n\nThe invention of unequal houses, Vehlow wrote, generated a "Rattenkönig" (a tangle of rats\' tails) of ever-multiplying calculation methods. The ancient system was not abandoned because it failed, but because rationalism reformed the horoscope until it lost its symbolic character, reducing it to a dry exercise in computation.\n\n## Why equal houses\n\n### Convergences across traditions\n\nThe equal house system is not an isolated invention. Several traditions converge on the same proportional twelve-fold structure.\n\n#### Vedic astrology (Jyotish)\n\nHoroscopic astrology with twelve houses entered India through contact with the Hellenistic tradition, documented at least as early as the *Yavanajataka*, a Sanskrit versification dated to 269/270 CE of a Greek treatise [(Pingree, 1978)](https://archive.org/details/PingreeYJ){{From the concluding three verses of the Yavanajataka we know the author\'s name and that the date of his composition was A.D. 269/270. We are further informed that it is a versified version of a prose translation, made by one Yavanesvara, "the lord of the Greeks," in the year A.D. 149/150}}. The title is telling: *Yavanajataka* literally means "the horoscopy of the Greeks," since *Yavana* was the Sanskrit term for Greeks, derived from the ancient Greek *Ἴωνες* (Ionians).\n\nThe twelve-house system of Jyotish is not an independent invention. The relevant question is not whether Indians arrived at Whole Sign Houses on their own, but why, once they received the Hellenistic system, India preserved it while the West progressively replaced it with latitude-dependent methods. In Jyotish the *Rashi Chakra* (the wheel of signs) serves directly as the map of *bhāva* (houses): each *rashi* coincides with a field of experience.\n\nThe answer lies in a deep philosophical compatibility. The Vedic tradition already had the concept of *Ṛta*: the primordial cosmic order, from the Indo-European root *\*h₂ar-*. The same root gives the Greek *ἁρμονία* (harmony) and the Latin *ars* (art, skill): three words in three languages naming the same thing, the proportionate joining of parts. A system of twelve equal sectors, none distorted by latitude, resonated naturally with a worldview where cosmic order is symmetrical and universal by definition.\n\n#### The Chinese Twelve Earthly Branches\n\nIn Chinese cosmology, the Twelve Earthly Branches (*Dizhi*) articulate time and space on three simultaneous levels: the twelve double-hours of two hours each that compose the day, the twelve lunar months that compose the year, and twelve compass directions at equal 30° intervals. At every level the division is equidistant: twelve principles equal in dignity, none inflated or compressed by geographical position.\n\nThe double-hours are the level most directly comparable to astrological houses. Houses in Western astrology divide the diurnal cycle into twelve experiential sectors. The Earthly Branches divide the same twenty-four hours into twelve identical two-hour periods, regardless of latitude. No Chinese doctrine holds that the hour of the Dragon should last longer than the hour of the Rabbit because a nativity is cast at Oslo rather than Mumbai.\n\nThis structure finds its most developed astrological expression in *Zi Wei Dou Shu* (紫微斗數), or Purple Star Astrology. In this system the natal chart is organized into twelve equal palaces, one for each Earthly Branch: Life, Siblings, Spouse, Children, Wealth, Health, Travel, Friends, Career, Property, Mind, Parents. The palaces are experiential sectors functionally equivalent to Western houses, and their equality is structural: it does not depend on where the observer stands on Earth.\n\n#### Kabbalah and the Sefer Yetzirah\n\nThe *Sefer Yetzirah* (Book of Formation, 3rd–6th c. CE) assigns the twenty-two letters of the Hebrew alphabet to the geometry of a cube: three to the three dimensions of space (height, width, depth), seven to the six cardinal directions (up, down, north, south, east, west) and the central point, twelve to the edges where two adjacent faces meet. Kabbalistic commentary has named this model the Cube of Space. §47 of the text, the paragraph listing the twelve diagonal directions, calls these positions *גבולי אלכסון*, "diagonal borders," and associates them with the twelve zodiacal constellations, the twelve months, and twelve principal organs of the body [(Hayman, 2004)](https://doi.org/10.1628/978-3-16-158795-5){{Twelve simple letters: He, Waw, Zayin, Ḥet, Tet, Yod, Lamed, Nun, Samek, Ayin, Sade, Qof. He carved them, he combined them, he hewed them, he weighed them and exchanged them, and formed with them the constellations, the months, and the principal (bodily) organs}}. All twelve edges of a cube are geometrically identical: the solid\'s symmetry permits no hierarchy among them.\n\n#### Pythagoreanism and the regular dodecagon\n\nIn the Pythagorean tradition, numbers are formal principles through which the order of the cosmos becomes intelligible [(Aristotle, *Metaphysics*, c. 350 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0052%3Abook%3D1%3Asection%3D985b){{all other things have their whole nature modelled upon numbers, and that numbers are the ultimate things in the whole physical universe}}. At the centre of this tradition stands the Tetractys, the triangular figure generated by the sum of the first four integers (1 + 2 + 3 + 4 = 10), which the Pythagoreans revered as the foundation of cosmic harmony.\n\nOn a vibrating string, halving the length produces the note an octave higher; shortening it to two-thirds produces the fifth; shortening it to three-quarters produces the fourth. The ratios 2:1, 3:2 and 4:3 use only the numbers 1, 2, 3 and 4 of the Tetractys [(Theon of Smyrna, *Expositio rerum mathematicarum*, c. 115–140 CE)](https://archive.org/details/theonissmyrnaei00theogoog){{τοὺς δὲ συμφωνοῦντας φθόγγους ἐν λόγοις τοῖς πρὸς ἀλλήλους πρῶτος ἀνευρηκέναι δοκεῖ Πυθαγόρας, τοὺς μὲν διὰ τεσσάρων ἐν ἐπιτρίτῳ, τοὺς δὲ διὰ πέντε ἐν ἡμιολίῳ, τοὺς δὲ διὰ πασῶν ἐν διπλασίῳ}}. The least common multiple of 1, 2, 3 and 4 is 12: the smallest integer divisible by each of them. A circle divided into twelve sectors of 30 degrees translates this structure into the plane.\n\nPlato, in the *Timaeus*, closes the system of regular solids by assigning the dodecahedron, the solid with twelve pentagonal faces, to the structure of the whole cosmos: \'the god made use of it for the whole\' [(Plato, *Timaeus*, c. 360 BCE)](https://www.perseus.tufts.edu/hopper/text?doc=Perseus%3Atext%3A1999.01.0180%3Atext%3DTim.%3Asection%3D55c){{And seeing that there still remained one other compound figure, the fifth, God used it up for the Universe in his decoration thereof}}; the reason is that the dodecahedron is the Platonic solid that most closely approximates a sphere, and the Platonic cosmos is spherical [(Zeyl & Sattler, 2022)](https://plato.stanford.edu/entries/plato-timaeus/){{The remaining regular solid, the dodecahedron, is "used for the universe as a whole," since it approaches most nearly the shape of a sphere}}. The regular dodecagon is the planar projection of this cosmological structure: twelve equal sectors, none wider or narrower than the others.\n\n### The metaphysical foundation: the aura and symmetry\n\nThese convergences are explained by the following metaphysical premise: houses are not sectors of celestial space defined by trigonometric formulas, but the twelve sections of the human etheric aura, what the [Book of Caverns](/codex/domification/book-of-caves/cavern/1) depicts as an oval, a magnetic envelope surrounding the human figure.\n\nIf houses are the sections of the aura, the question of their size has a necessary answer: they must be equal. Their size cannot depend on the observer\'s latitude because the aura is an intrinsic property of the being, not of the astronomical horizon. A first house of 40 degrees at Oslo and 28 at Rome would mean that the section of the aura linked to identity changes size with latitude. Within the same chart, a first house wider than the second would mean that the aura devotes more space to identity than to resources. At the poles some houses vanish, and the person would lack the corresponding fields of experience.\n\nThe same structure appears at cosmic scale. The zodiac is the Sun\'s aura: not the Sun\'s apparent path in the sky, but its energy field, divided into twelve equal signs of 30 degrees. No one would dream of dividing the zodiac into unequal parts on the grounds that the constellations sharing their names have different sizes. From a strictly astronomical standpoint, the constellations crossed by the ecliptic are not even twelve: Ophiuchus lies between Scorpius and Sagittarius, and the Sun transits it longer than it transits Scorpius itself. Yet no astrological system includes it among the signs, because the zodiac is not an astronomical catalogue of star clusters: it is a metaphysical and symbolic structure.\n\n## Why the Ascendant is at the fifteenth degree\n\n### The Thema Mundi\n\nIn the fourth century, Firmicus Maternus described the *Thema Mundi*, the mythic birth chart of creation, attributing its doctrine to the Egyptian tradition: the secret had passed from Aesculapius and Anubis to Petosiris and Nechepso through the intermediary of Mercury. In this chart each planet sits at the fifteenth degree of its own domicile: the Sun at 15° Leo, the Moon at 15° Cancer, Saturn at 15° Capricorn, Jupiter at 15° Sagittarius, Mars at 15° Scorpio, Venus at 15° Libra, Mercury at 15° Virgo. The Ascendant is placed at the fifteenth degree of Cancer [(Firmicus Maternus, *Matheseos Libri VIII*, c. 334 CE)](https://www.astrologiahumana.com/firmicusmaternustheoryandpractice.pdf){{the Sun in the 15th degree of Leo, the Moon in the 15th degree of Cancer, Saturn in the 15th degree of Capricorn, Jupiter in the 15th degree of Sagittarius, Mars in the 15th degree of Scorpio, Venus in the 15th degree of Libra, Mercury in the 15th degree of Virgo, and the ascendant in the 15th degree of Cancer}}. The fifteenth degree is the exact center of the sign.\n\nFirmicus makes clear that the *Thema Mundi* is not the account of a historical event: it is a normative model, constructed by ancient sages for astrologers to adopt in the construction of individual charts. The question is: what, concretely, does a model in which every element is centered in its sign teach?\n\nIt cannot teach that planets should be placed at the fifteenth degree: planetary positions are astronomical data determined by the moment of birth, not methodological choices. What the model transmits is a structural principle: the center of the sign is the place of maximum potency. Each planet in the *Thema Mundi* sits in the sign it rules, its strongest essential dignity; placing it at the fifteenth degree brings it to the peak of its strength.\n\nThe Ascendant is the one element for which this principle can be applied operationally. Its zodiacal position is calculated like that of the planets, but the way the houses are organized around it is a methodological choice. The *Thema Mundi* teaches that the organizing point of the chart belongs at the center of the house, not at its edge. Vehlow built his system on this evidence, recognizing in it the original method of ancient Astrology [(Vehlow, 1933)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_I.pdf){{Der Aszendent, der die Stunde — hora oder Horoscopus bedeutet, wurde in die Mitte des Zeichens Krebs verlegt. Von Häuserspitzen ist hier nirgends die Rede!}}. The Egyptian origin of the doctrine is why the Vehlow system is also known as Egyptian domification.\n\n### The center as the point of maximum potency\n\nThe Jyotish tradition formalized the same principle with a precise name: *bhava madhya*, literally "middle of the house." The degree of the *lagna* (Ascendant) does not mark the edge of the first house but occupies its center: the house extends 15 degrees before and 15 degrees after the ascending degree. The boundaries between one house and the next are called *bhava sandhi*, the house junctions.\n\nThe distinction between madhya and sandhi has a foundation that is not merely topological but functional. The *Phaladeepika* of Mantreswara, one of the classic texts of Jyotish, establishes an unambiguous principle: even a planet in exaltation or in a friendly sign loses all its efficacy if situated at the *bhava sandhi*; conversely, planets occupying the exact degree of the *bhava madhya* produce the full effects of that house, while those at intermediate positions yield partial effects [(Mantreswara, *Phaladeepika*, 13th c. CE)](https://www.panchanga.lv/wp-content/uploads/2020/06/Phaladipika_Shri-Mantreswara.pdf){{Even if a planet be posited in his sign of exaltation or a friendly sign, he proves in affliction if he is situated in Bhava-Sandhi. The planets occupying the exact degrees (Bhava-Madhya) produce the full effects of that house. The planets situated in Bhava-Sandhi produce no effects}}.\n\nThis gradient of strength transforms the position of the Ascendant from a geometric choice into a functional one. If the center of the house is its point of maximum efficacy, the Ascendant, the most decisive point in the entire chart, must coincide with the *bhava madhya* of the first house. Placing it at the edge would mean situating the organizing principle of the chart at its point of least potency: a structural contradiction.\n\n## Why Placidus fails\n\n### Impossibility above the 60th parallel\n\nPlacidus domification breaks down above approximately 66 degrees latitude. Fomalhaut documented this already in 1897 in his *Manuel d\'astrologie sphérique et judiciaire* [(Nicoullaud, 1897)](https://archive.org/details/BSG_DELTA61179FA){{Or il est inadmissible d\'adopter un système qui ne s\'applique pas à tous les lieux du Globe}}: "It is inadmissible to adopt a system that does not apply to all places on the Globe." This limitation alone should call into question any system claiming to describe a universal order. Inhabitants of Alaska, northern Scandinavia, and Arctic Russia would be excluded from the relationship between cosmos and individual by a defect in the calculation method.\n\n### Distortion of planetary aspects\n\nIn Placidus, the disproportion in house size produces aberrations in aspects between houses. Cases arise where the first house falls in trine with the fourth, or the tenth in sextile with the seventh: houses that should be in square, as they mark the axes of the chart, end up in harmonic relationships. This contradicts the entire structural logic of the horoscope.\n\n### Intercepted signs: an artifact of calculation\n\nIn quadrant house systems like Placidus, houses can exceed 30° in width. When a house is large enough to contain an entire zodiacal sign without that sign appearing on any house cusp, the sign is said to be *intercepted*: it is swallowed by the house, with no cusp of its own. The phenomenon always occurs in opposite pairs. Some astrologers interpret intercepted signs as hidden or blocked energies that are more difficult to express.\n\nThe theory is relatively recent. There are no significant references to interceptions in the classical authors (Vettius Valens, Ptolemy, Manilius) or the medieval ones (Al-Biruni, Masha\'allah, Guido Bonatti), who predominantly used whole sign houses, in which interceptions are structurally impossible. The first book-length treatment appears in the work of Joanne Wickenburg, who published *Intercepted Signs: Environment vs. Destiny* in 1978 [(Wickenburg, 1978)](https://www.goodreads.com/book/show/18669388-intercepted-signs).\n\nInterceptions are artifacts of the calculation method, not real cosmic phenomena. The most telling case is that of the equator: at zero latitude, Placidus houses all measure approximately 30° and interceptions effectively do not occur. Someone born in Quito, Nairobi, or Jakarta has no intercepted signs in their natal chart. As latitude increases, houses begin to distort; above 40° interceptions become systematic; at polar latitudes some houses stretch beyond 60°. The theory implies that entire equatorial populations lack the "hidden energies" it attributes to those born at mid-to-high latitudes, while two twins born at the same moment in Quito and Stockholm would have structurally different charts under the same sky, with the same planets in the same positions. Does it make sense to attribute deep psychological dynamics to an artifact that depends solely on birth latitude?',
			'codex.domificationArticleTitle' => 'Why we use Vehlow domification',
			'codex.domificationSectionTitle' => 'Domification',
			'codex.equatorEclipticContent' => '## Two circles, two rhythms\n\nThe celestial sphere described in the [previous article](/codex/astronomy-fundamentals/celestial-sphere) needs a coordinate system. Two great circles provide it, and both are projections of real physical phenomena onto the sphere.\n\nThe first is the **celestial equator**: Earth\'s equator projected outward onto the celestial sphere. It is perpendicular to Earth\'s rotation axis.\n\nThe second is the **ecliptic**: the apparent path the Sun traces through the stars over the course of a year. It is Earth that orbits the Sun, but from our perspective the Sun appears to move against the background of stars, completing one full circuit in about 365.25 days, roughly 1 degree per day. The ecliptic is the single most important circle in astrology: the zodiac is defined along it, planetary positions are measured along it, the houses are divisions of it.\n\n## Obliquity: the tilt\n\nThe ecliptic is not aligned with the celestial equator. It is tilted at an angle of approximately **23.44 degrees**. This tilt, called the **obliquity of the ecliptic**, exists because Earth\'s rotation axis is not perpendicular to its orbital plane. Earth spins on an axis tilted about 23.44 degrees from the vertical of its orbit.\n\nIf Earth\'s axis were perfectly vertical relative to its orbit, the ecliptic and the equator would coincide. There would be no seasons, the day would always last 12 hours everywhere, and Astrology would lose much of its structure.\n\n[EQUATOR_ECLIPTIC_DIAGRAM]\n\nThe slider moves the Sun along the ecliptic over the course of a year.\n\nAt the equinoxes, the Sun sits on the celestial equator: day and night have equal length. At the solstices, the Sun reaches its maximum distance from the equator, producing the longest and shortest days of the year.\n\n## Where the circles cross: the equinoxes\n\nThe celestial equator and the ecliptic intersect at exactly two points. These are the **equinoxes**.\n\nThe **vernal equinox** (around March 20) is where the Sun crosses the equator moving northward. This point is designated 0 degrees Aries in the tropical zodiac, and it serves as the origin of both the ecliptic coordinate system and the zodiacal signs.\n\nThe **autumnal equinox** (around September 22) is the opposite crossing, where the Sun moves southward across the equator. This corresponds to 0 degrees Libra.\n\nAt both equinoxes, the Sun sits exactly on the celestial equator, so day and night are approximately equal in length everywhere on Earth.\n\n## The solstices\n\nHalfway between the equinoxes, the Sun reaches its maximum distance from the equator. These points are the **solstices**.\n\nThe **summer solstice** (around June 21) occurs when the Sun reaches its highest point above the celestial equator, 23.44 degrees to the north. This corresponds to 0 degrees Cancer. The **winter solstice** (around December 21) is when the Sun reaches its lowest point, 23.44 degrees south of the celestial equator, corresponding to 0 degrees Capricorn.\n\n## The cause of seasons\n\nThe obliquity is the reason seasons exist. When the Sun is on the northern part of the ecliptic (spring and summer in the northern hemisphere), it rises higher in the sky, stays above the horizon longer, and delivers more energy per square meter of ground. When the Sun is on the southern part, the opposite occurs.\n\nSeasons are not caused by changes in Earth\'s distance from the Sun. Earth is actually closest to the Sun in January (perihelion) and farthest in July (aphelion). The effect of distance is negligible compared to the effect of axial tilt.\n\n## The zodiac\n\nThe zodiac is a band extending roughly 8-9 degrees on each side of the ecliptic. All major planets stay within this band because the solar system is roughly flat: planetary orbits are all close to the same plane.\n\nThe 12 zodiacal signs divide the ecliptic into 12 equal segments of 30 degrees each, starting from the vernal equinox. These are the tropical signs used in Western astrology. They are defined by the equinoxes and solstices, not by the constellations of the same name (which have drifted due to the [precession of the equinoxes](/codex/astronomy-fundamentals/precession)).',
			'codex.equatorEclipticTitle' => 'Celestial equator and ecliptic',
			'codex.exploreMore' => 'Learn More',
			'codex.latitudeSkyContent' => 'This article assumes familiarity with the celestial sphere, celestial equator, and ecliptic. If you are not familiar with these concepts, see the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic).\n\n## The tilted sphere\n\n**Latitude** is the angle measuring how far north or south a point on Earth\'s surface is from the equator: 0 degrees at the equator, 90 degrees at the poles.\n\nStand at the north pole and look up. The north celestial pole, the point around which all stars appear to rotate, sits directly at your zenith. Every star traces a full circle around the pole once in about 24 hours. This circular motion is the same east-to-west drift described in the article on the [celestial sphere](/codex/astronomy-fundamentals/celestial-sphere): the portion of each circle above the horizon is the visible arc from rising to setting; the portion below is the time the star is invisible. Stars do not rise or set. They circle horizontally, eternally above or eternally below the horizon.\n\nStars that never drop below the horizon are called **circumpolar**. At the north pole, every star in the northern celestial hemisphere is circumpolar; every star in the southern hemisphere is permanently invisible.\n\nNow travel to the equator. The north celestial pole has dropped all the way to the northern horizon. Stars rise vertically from the east, arc overhead, and set vertically in the west. Every star in the sky is visible for exactly 12 hours out of every 24.\n\nBetween these two extremes, the sky behaves differently at every latitude.\n\n## The pole and the latitude\n\nThere is a direct, exact relationship between your geographic latitude and the altitude of the celestial pole above your horizon:\n\n**The altitude of the celestial pole equals your latitude.**\n\nAt Rome (latitude 42 degrees N), the north celestial pole stands 42 degrees above the northern horizon. At London (51.5 degrees N), it stands 51.5 degrees up. At the equator (0 degrees), it sits on the horizon. At the north pole (90 degrees N), it is at the zenith.\n\n[LATITUDE_SKY_DIAGRAM]\n\n## The sky at intermediate latitudes\n\nAt intermediate latitudes like Rome (42 degrees N), the north celestial pole stands 42 degrees above the north cardinal point on the horizon. Stars trace circles around the celestial pole, and the closer a star is to the celestial pole, the tighter its circle. When the circle is tight enough to remain entirely above the horizon, the star is circumpolar. In the interactive diagram, circumpolar stars correspond to the circles that do not cross the horizon line.\n\nAll other stars rise and set, but they remain above the horizon for different amounts of time. Stars further north of the celestial equator stay visible longer; those further south, for less time. The reason is simple: every star traces a circle around the celestial pole, and the closer a star is to the pole, the more of its circle stays above the horizon.',
			'codex.latitudeSkyTitle' => 'How latitude changes the sky',
			'codex.methodologicalNote' => 'Methodological note',
			'codex.nextSection' => ({required Object title}) => 'Next: ${title}',
			'codex.placidoIntroContent' => 'If you are not familiar with the celestial sphere, celestial equator, and ecliptic, we recommend reading the two articles in the [Astronomy fundamentals](/codex/astronomy-fundamentals) section first: [The celestial sphere](/codex/astronomy-fundamentals/celestial-sphere) and [Celestial equator and ecliptic](/codex/astronomy-fundamentals/equator-ecliptic).\n\n## Houses: dividing the sky into twelve\n\nIn astrology, the birth chart is divided into twelve houses. Each house governs a domain of experience: identity, resources, communication, home, creativity, and so on. The zodiacal signs and the houses share the number twelve, but they are distinct structures. The signs divide the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) into twelve equal segments of 30 degrees. The houses divide it according to the observer\'s position on Earth at a specific moment.\n\nThe question that separates one house system from another is: how should that division be made?\n\n## The Placidus method\n\nPlacido de Titis, a 17th-century Italian monk, proposed a method based on time. His reasoning starts from a simple observation: every point of the ecliptic rises at the eastern horizon, climbs to its highest point at the meridian (the Midheaven), then descends and sets at the western horizon. The time it takes to travel from rising to culmination is the semi-diurnal arc.\n\nPlacidus divides this semi-diurnal arc into three equal time intervals. The ecliptic degrees that mark the one-third and two-thirds boundaries become the house cusps. The same procedure is applied to the descending half (from culmination to setting), producing six houses above the horizon and six below.\n\nThe idea is intuitive: each house represents an equal phase of a degree\'s journey across the visible sky.\n\n## Why it produces unequal houses\n\nThe problem is that different parts of the ecliptic travel at different speeds. Some zodiacal degrees spend many hours above the horizon; others spend far fewer. This asymmetry is caused by two factors: the tilt of the ecliptic relative to the celestial equator, and the observer\'s geographic latitude.\n\nWhen Placidus divides the semi-diurnal arc into equal time segments and then maps those segments back onto the ecliptic, the resulting houses span different numbers of degrees. A house containing degrees of long ascension (slow risers) will be wide; a house containing degrees of short ascension (fast risers) will be narrow. At moderate latitudes like Rome, the difference is noticeable. At high latitudes, it becomes extreme.\n\nIf these concepts are not immediately clear, that is perfectly normal: they are difficult to visualize without graphical support. The articles that follow are designed for exactly this purpose, with interactive diagrams that help build an intuition for the problem.\n\n## What comes next\n\nThe articles in this section build the astronomical understanding needed to see exactly how and why this happens:\n\n1. [How latitude changes the sky](/codex/domification/understanding-placido/latitude-sky) shows how the observer\'s position on Earth determines the orientation of the entire celestial sphere\n2. [Semi-diurnal arcs and the ecliptic at the horizon](/codex/domification/understanding-placido/semidiurnal-arcs) explains the mechanism that produces unequal rising times',
			'codex.placidoIntroTitle' => 'What is Placido domification',
			'codex.precessionContent' => '## What is precession?\n\nThe precession of the equinoxes is a slow astronomical movement caused by the Earth behaving like a gigantic gyroscope. The Earth is not a perfect sphere: it is slightly flattened at the poles. The combined gravitational pull of the Sun and Moon on the equatorial bulge causes our planet\'s axis to trace a circle in space over approximately 25,772 years, in a motion similar to that of a spinning top.\n\nThis motion has an important consequence: the celestial north pole changes position from one epoch to the next and the background stars slowly drift relative to the zodiacal signs. Precession produces a measurable difference between two types of year: the **tropical year** (the time between two successive vernal equinoxes, 365 days 5 hours 48 minutes 45 seconds) and the **sidereal year** (the time for the Sun to return to the same position relative to the fixed stars, 365 days 6 hours 9 minutes 10 seconds). The difference of approximately 20 minutes accumulates over the centuries, revealing the shift of the vernal point.\n\n[PRECESSION_DIAGRAM]\n\n## The discovery of precession\n\nThe first scientific measurement of this discrepancy is owed to Hipparchus of Nicaea (c. 190-120 BCE), who compared his observations with those of his Greek predecessors Timocharis and Aristyllus and detected a 2° shift of the star Spica relative to the autumnal equinox. The thesis that Babylonian astronomers had already formalised the discovery has been refuted [(Neugebauer, 1950)](https://www.jstor.org/stable/595428){{there is no basis visible anywhere in the cuneiform texts of the Seleucid period to support the assumption of a conscious recognition of precession}}. The phenomenon was however observed before Hipparchus: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations. A systematic review of archaeoastronomical evidence has concluded that although definitive proof is still lacking the quantity of hints is remarkable [(Magli, 2004)](https://arxiv.org/pdf/physics/0407108){{Although definitive evidence of the discovery is still lacking, the quantity of hints (for instance, coming from ancient Egypt) is impressive and stimulating}}.\n\n## The astrological ages\n\nAs the Earth\'s axis shifts, the relationship between the equator and the ecliptic changes, and the equinoxes and solstices move by approximately one degree every 71.6 years. The Gamma point (0° Aries), from which ecliptic longitudes are measured in both Astrology and Astronomy, slowly moves backward through the zodiacal constellations:\n\n- **Age of Aries** (c. 2160-60 BCE): marked by the rise of great military civilizations and the individual hero. From the Egyptian New Kingdom to Persia, from the Greek city-states to the Roman Republic, empires expand through conquest. Aries is a fire sign ruled by Mars: the era\'s dominant themes are assertion of individual will, military valor, the quest for glory, and the founding of new orders through force and law\n- **Age of Pisces** (from c. 60 BCE): marked by the birth and spread of Christianity, whose earliest symbol is the fish. The Greek word ἰχθύς (ichthýs, "fish") forms the acronym for "Jesus Christ, Son of God, Saviour"; the first Christians used it as a sign of recognition during the persecutions. The era\'s dominant themes reflect the qualities of the sign: compassion, sacrifice, faith, devotion, seeking salvation through an external spiritual authority\n- **Age of Aquarius**: the next great cycle, whose beginning has been variously estimated between the twenty-second and twenty-seventh century. Aquarius is an air sign: astrological tradition associates it with scientific and technological progress, the pursuit of universal brotherhood and individual freedom, the replacement of blind faith by inner knowledge, and collective consciousness taking the place of obedience to authority\n\nThe dates above are approximate, and the formal concept of precessional ages is more recent than commonly assumed. The first systematic theory linking historical periods to the precession of the equinoxes was formulated not in antiquity but during the French Enlightenment, by Charles-François Dupuis and Constantin-François Volney [(Campion, 2011)](https://constable.blog/wp-content/uploads/15-1_Campion_Age_Aquarius-1.pdf){{there are no extant classical or medieval astrological texts that attribute any astrological or historical significance to precession. Instead the increasing separation between the tropical and sidereal zodiacs was used to discredit astrology}}. There is not a single known example of this use of precession by astrologers before the late nineteenth century. Between the Middle Ages and the Renaissance, astrologers such as Guido Bonatti and Tommaso Campanella regarded the divergence between tropical and sidereal zodiacs as a problem for astrology, not as a forecasting tool. The observation, however, predates the formalization by millennia: as the Egyptian testimony below will show, temples, dynasties and theology reflect the passage of the vernal point through the constellations.\n\nThe astrological zodiac divides the ecliptic into twelve equal arcs of 30 degrees measured from the vernal point; the constellations that share these names span very different sizes and their boundaries, conventionally fixed by the International Astronomical Union in 1930, do not coincide with these divisions. There is no single criterion for establishing the exact moment when one age ends and the next begins, and published estimates span over two thousand years. Johannes Vehlow placed the transition in 1793, coinciding with the French Revolution [(Vehlow, 1934)](http://www.astrologie-chirologie.com/johannes_vehlow_werke/johannes_vehlow_band_VIII.pdf){{So hat sich mit Hilfe der statischen, weltpolitischen Achsen endlich eindeutig feststellen lassen, wo sich gegenwärtig der Frühlingspunkt, am Sternbilderzodiakus gemessen, befindet. Die beiden anfangs erwähnten französischen Autoren hatten mit ihren Feststellungen also recht, und mit ihnen nehmen wir an, daß das Wassermannzeitalter bereits im Jahre 1793, zur Zeit der französischen Revolution begonnen hat!}}; the latest estimate, 2597, is owed to Jean Meeus and rests on the IAU constellation boundaries fixed in 1930 [(Meeus, 1997)](https://openlibrary.org/isbn/9780943396514){{Not until A.D. 2597 will the March equinox cross the boundary into Aquarius.}}. As [argued in the discussion on domification](/codex/domification/why-vehlow), the premise of a calculation is more important than the calculation itself: determining the start of an astrological age on the basis of IAU constellation boundaries amounts to superimposing a modern astronomical criterion on a millennial symbolic system, much as Placidus domification juxtaposes [semi-diurnal arcs](/codex/domification/understanding-placido/semidiurnal-arcs) onto an order that is not astronomical but metaphysical. Equal 30-degree divisions, more consistent with the structure of the astrological zodiac, place the transition around the twenty-second century. The vernal point currently lies within the constellation of Pisces by every calculation method.\n\nThe mundane astrology of Great Conjunctions offers another interpretation of the Aquarian themes attributed to contemporary society, without requiring a change of precessional age.\n\nJupiter and Saturn conjoin approximately every twenty years. Their conjunctions form sequences occurring predominantly in signs of the same element, with some interruptions. The conjunctions of 1980–1981 took place in Libra, an Air sign, while the conjunction of 2000 returned to an Earth sign. The conjunction of 21 December 2020 in Aquarius marks the beginning of a series predominantly in Air signs [(Nolle, n.d.)](https://www.astropro.com/features/tables/geo/ju-sa/ju000sa.html){{It begins with the December 21, 2020 alignment and concludes with the 2199 conjunction}}. In an astrological interpretation, this transition can be associated with themes of communication and collective networks, without implying the beginning of the Age of Aquarius.\n\n## From Bull to Ram in pharaonic Egypt\n\nAmong the hints that Magli calls "impressive and stimulating," the Egyptian case deserves close examination. In pharaonic Egypt the transition from one animal cult to another can be traced across iconographic, architectural, and textual sources over more than two thousand years.\n\n### The three sacred bulls\n\nAncient Egypt venerated three sacred bulls, each at a major religious center.\n\nAt Memphis resided the **Apis**, the living manifestation (in Egyptian, the *Ba*) of the creator god Ptah. The cult dates to the First Dynasty, around 3100 BCE [(Simpson, 1957)](https://www.jstor.org/stable/43581573){{Facing the name of the Horus \'Aha is the text: sp tpy pḥrr Ḥp, "the first occasion of the running of the Apis". The text thus provides us with an earlier mention of the running of the Apis than that given for the reign of Dn by the sealing from Saḳḳarah and the text of the Palermo Stone}}. Upon death the bull was mummified and buried in the Serapeum of Saqqara, the necropolis of Memphis discovered by Auguste Mariette in 1851.\n\n![The Apis bull, with its characteristic black-and-white markings and the solar disc between its horns](codex/apis.webp)\n\nAt Heliopolis, the **Mnevis**, herald of the sun god Re-Atum. The "bull of Heliopolis" appears in the Pyramid Texts of the Fifth Dynasty (c. 2350 BCE), squarely in the Age of Taurus [(Allen, 2005)](https://archive.org/details/the-ancient-egyptian-pyramid-texts_202103){{Unis has come against you: it is Unis, wild bull of the savannah, a bigfaced bull who comes from Heliopolis — Pyramid of Unis, Recitation 212}}.\n\nAt Hermonthis, the **Buchis**, incarnation of the war god Montu [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Montu could also be represented in the form of his sacred bull, the Buchis, or occasionally in the later dynasties as a bull-headed man}} and living Ba of the sun god Re. The Bucheum, its burial necropolis discovered by Robert Mond and Oliver Myers, preserves stelae that acclaim the bull with this title [(Mond & Myers, 1934)](https://archive.org/details/EXCMEM41_2){{there appeared Buchis, the living Ba of Re, manifestation of Re. He was born in Hermonthis}}.\n\nNot by chance, in the Egyptian language the word *Ka* means both "bull" and "life force", the spiritual principle that accompanies every person from birth to death: for the ancient Egyptians the bull embodied the life force itself [(Gordon & Schwabe, 2004)](https://doi.org/10.1163/9789047404163){{ka was also the name for \'bull\', an equation surely not meaningless to the Egyptians}}.\n\n![Left: Ka statue of pharaoh Hor I (ca. 1760 BCE, Egyptian Museum, Cairo). Right: temple relief. The hieroglyph on the head depicts two raised arms, meaning both "bull" and "life force"](codex/ka.webp)\n\n### From Montu to Amun\n\nBetween the Old Kingdom and the Middle Kingdom, the capital of Egypt was Thebes, whose chief deity was none other than Montu. The last three rulers of the Eleventh Dynasty bore the name Mentuhotep ("Montu is satisfied"); the Twelfth Dynasty that followed produced four Amenemhats ("Amun is at the forefront") and not a single Mentuhotep. Within a century and a half Amun gradually displaced Montu and rose to the position of supreme god of the entire Egyptian pantheon [(Wilkinson, 2003)](https://openlibrary.org/isbn/9780500051207){{Within a century and a half Amun gradually displaced the old god of that region, Montu, and the ascendancy of the Theban kings in Middle and New Kingdom times eventually propelled him (as the combined Amun-Re) to the position of supreme god of the Egyptian pantheon}}. Amun is a ram-headed god. Amenemhat I moved the capital to Itjtawy, but Thebes remained the religious center of Egypt: the great temple complex of Karnak, originally dedicated to Montu, became the sanctuary of Amun-Re. Its processional avenues are lined with ram-headed sphinxes.\n\n![Criosphinxes along the processional avenue of the Karnak temple. Each ram-headed sphinx protects a small figure of the pharaoh between its front paws](codex/karnak.webp)\n\nThe chronology of this transition is noteworthy [(Angelini, 1988)](https://www.kemiassociazione.it){{Verso il 2200 il punto Gamma passa da Toro ad Ariete, cade la XII Dinastia ed in Egitto vi è l\'avvento di AMON, la Testa di Ariete}}. The Age of Taurus ends around 2160 BCE; the fall of the Old Kingdom is dated to approximately 2181 BCE. In the Age of Aries that follows, Amun rises to become king of the gods. For over twenty centuries Egyptian theology venerated the bull as supreme symbol in the Age of Taurus and the ram in the Age of Aries.',
			'codex.precessionTitle' => 'Precession of the Equinoxes',
			'codex.readMethodologicalNote' => 'Read the methodological note',
			'codex.semidiurnalArcsContent' => 'Three factors govern the way ecliptic degrees rise at the horizon: [Earth\'s rotation](/codex/astronomy-fundamentals/celestial-sphere), the tilt of the [ecliptic](/codex/astronomy-fundamentals/equator-ecliptic) relative to the equator, and the observer\'s [latitude](/codex/domification/understanding-placido/latitude-sky). This article shows how their combination produces the phenomenon at the heart of Placidus domification: the fact that different ecliptic degrees take different amounts of time to rise.\n\n## The arc of a star\'s day\n\nEvery celestial body that rises and sets traces an arc across the sky. The full arc from rising to setting is the **diurnal arc**. Half of it, from rising to culmination or from culmination to setting, is the **semi-diurnal arc**.\n\nFor a star sitting exactly on the celestial equator, the math is simple. The equator is a great circle perpendicular to the axis of rotation, so it is always cut in half by the horizon. An equatorial star spends exactly 12 hours above the horizon and 12 hours below. Its semi-diurnal arc is exactly 6 hours, or 90 degrees of rotation.\n\nBut most celestial bodies are not on the equator.\n\n## Declination and time above the horizon\n\nA star with positive declination, north of the equator, in the northern hemisphere spends more than 12 hours above the horizon. Its diurnal arc is longer than 180 degrees and its semi-diurnal arc is longer than 90 degrees.\n\nA star with negative declination spends less than 12 hours up. Its semi-diurnal arc is shorter than 90 degrees.\n\nThe reason is geometric: every star traces a circle around the celestial pole. When the pole is high above the horizon, stars orbiting close to it describe circles that remain almost entirely above the horizon line, so they stay visible longer. Stars far from the pole trace circles that pass mostly below the horizon. The effect grows with latitude, because at higher latitudes the celestial pole is higher and the disparity between the circles increases.\n\n[LATITUDE_SKY_DIAGRAM]\n\nThe formula connecting declination (d), observer\'s latitude (L), and the semi-diurnal arc (H) is:\n\n**cos(H) = -tan(L) x tan(d)**\n\nAt Rome (L = 42 degrees), a star with declination +23.44 degrees, the maximum solar declination at the summer solstice, has a semi-diurnal arc of about 113 degrees, corresponding to roughly 7 hours and 32 minutes. The same calculation for declination -23.44 degrees gives about 67 degrees, or roughly 4 hours and 28 minutes.\n\nThat is a difference of just over three hours. The summer solstice point spends about 15 hours and 4 minutes above the horizon; the winter solstice point spends about 8 hours and 56 minutes.\n\n## The ecliptic at the horizon\n\nEach degree of the ecliptic has a different declination, from +23.44° at 0° Cancer to -23.44° at 0° Capricorn, so each has its own semi-diurnal arc. But Placidus house division rests on a closely related phenomenon: the speed at which ecliptic degrees cross the horizon at the moment of rising.\n\nThe celestial sphere rotates at a constant speed: one full turn per sidereal day. But the Ascendant, the zodiacal degree rising in the east, does not advance through the zodiac at a constant speed. Sometimes it crosses many degrees in an hour and sometimes few. The reason: because the ecliptic is a circle tilted 23.44° from the equator, as the sky rotates its different segments arrive at the eastern horizon at different angles.\n\n[ECLIPTIC_RISING_COMPARISON_DIAGRAM]\n\n[ECLIPTIC_HORIZON_DIAGRAM]\n\nWhen the ecliptic cuts the horizon nearly perpendicularly, zodiacal degrees are stacked on top of one another. The rotation carries them downward, not along the horizon: each must cross the horizon line individually. Few degrees rise in a given interval of time. These are called **signs of long ascension**.\n\nWhen the ecliptic runs nearly parallel to the horizon, many degrees lie near the horizon line simultaneously. The rotation sweeps them past the edge almost together: many degrees rise in the same time. These are **signs of short ascension**.\n\n[SEMIDIURNAL_ARC_DIAGRAM]\n\nThe latitude slider changes the overall tilt of the celestial sphere relative to the horizon. The hour slider shows the sky\'s daily rotation: the way the horizon successively meets different parts of the ecliptic. At the equator the effect almost disappears, because every stretch of the ecliptic meets the horizon at a similar angle. At Rome the difference is already clear and at higher latitudes it becomes stronger.\n\n## How Placidus derives the houses\n\nAt this point the decisive step becomes visible. The Ascendant is the degree rising now in the east. The Midheaven is the degree culminating at the meridian. Between those two points there is a whole stretch of the ecliptic in motion, but Placidus does not divide it into three equal arcs of 30 degrees.\n\nIt divides it into **three equal times**.\n\nIn practice, it takes the journey a degree makes from rising to culmination and looks for two intermediate temporal thresholds: the point reached after one third of the time and the point reached after two thirds. The ecliptic degrees corresponding to those two temporal thresholds become the intermediate house cusps of that quadrant.\n\nThe same criterion is applied to the other quadrants of the chart. The result is not a sequence of cusps spaced regularly every 30 degrees, because ecliptic degrees do not all rise at the same speed. Where rising is slow, translating time into zodiacal longitude gives one outcome; where rising is fast, it gives another.\n\nThat is why Placidus produces unequal houses: the principle of division remains the same, time, but the zodiacal degrees on which that time falls change continuously with latitude, obliquity, and daily rotation.\n\nThe following diagram shows the concrete result: the twelve Placidus houses seen from above, with a slider to vary the latitude. At the equator all houses are equal, because every stretch of the ecliptic rises at the same speed. As latitude increases, the disparity between houses grows until it becomes extreme near the poles.\n\n[PLACIDO_DIAGRAM]',
			'codex.semidiurnalArcsTitle' => 'Semi-diurnal arcs and the ecliptic at the horizon',
			'codex.understandingPlacidoTitle' => 'Understanding Placido domification',
			'legal.accountClosureProcedure' => 'Users are free to close their account and cease using the Service at any time by following this procedure:',
			'legal.accountClosureTitle' => 'Account Closure',
			'legal.accountRequirements' => 'Account Requirements',
			'legal.accountResponsibility' => 'By creating an account, the User accepts to be fully responsible for all activities carried out with their access credentials. Users are required to inform the Owner immediately and unambiguously through the [contact details indicated in this document](mailto:contact@astrogods.it) if they believe that their personal information, such as the User account, access credentials or personal data, have been violated, unlawfully disclosed or stolen.',
			'legal.accountSharingProhibited' => 'Unless expressly permitted, a User\'s account may not be shared with other people.',
			'legal.accountSuspension' => 'Account Suspension and Cancellation',
			'legal.accountSuspensionText' => 'The Owner reserves the right to suspend or cancel a User\'s account at any time at its sole discretion and without notice if deemed inappropriate, offensive, or contrary to these Terms.',
			'legal.actsHarmingOwnerInterests' => 'acts that may considerably harm the Owner\'s legitimate interests;',
			'legal.additionalConditions' => 'Additional conditions of use or access applicable in particular situations are expressly indicated in this document.',
			'legal.advanceNotice' => 'The Owner undertakes to inform Users with at least 30 days\' notice, where possible.',
			'legal.advanceNotificationRequirement' => 'If required by law, the Owner will notify Users in advance of the effective date of the modified Terms.',
			'legal.agreementDefinition' => 'Any legally binding relationship or contract between the Owner and the User governed by the Terms.',
			'legal.agreementDefinitionTitle' => 'Agreement',
			'legal.amicableDisputeComposition' => 'Amicable dispute composition',
			'legal.amicableDisputeResolution' => 'Users may report any disputes to the Owner, who will seek to resolve them amicably.',
			'legal.anthropicApiDescription' => 'The Anthropic API gives access to Claude, the language model by Anthropic PBC that AstroGods uses to write the text of the readings.',
			'legal.anthropicApiName' => 'Anthropic API',
			'legal.appStoreDescription' => 'The App Store is Apple\'s service for buying apps and subscriptions. For subscriptions bought on iPhone, iPad and Mac, Apple handles the payment and shares with AstroGods only the details of the purchased subscription, such as the product, the dates and the transaction identifier.',
			'legal.appStorePurchases' => 'AstroGods or certain Products sold on AstroGods must be purchased through a third-party app store. To make such purchases, Users are asked to follow the instructions in the relevant app store (for example "Apple App Store" or "Google Play"). This information may vary depending on the specific device used.',
			'legal.appStoreTermsAcceptance' => 'Therefore, Users who make purchases through such third-party online stores are asked to carefully read and accept the related terms and conditions of sale.',
			'legal.appStoreTermsPrecedence' => 'Unless otherwise specified, purchases made through third-party online stores are also subject to the terms and conditions of such third parties, such as the [App Store terms](https://www.apple.com/legal/internet-services/itunes/) and the [Google Play terms](https://play.google.com/about/play-terms/). Such terms and conditions prevail in any case of inconsistency or conflict with respect to these Terms.',
			'legal.appleAccountAutoRenewal' => 'subscriptions automatically renew for the same duration unless the User communicates cancellation at least 24 hours before the expiration of the current subscription period;',
			'legal.appleAccountManagement' => 'subscriptions can be managed or canceled directly through the User\'s [Apple App Store account settings](https://apps.apple.com/account/subscriptions).',
			'legal.appleAccountPayment' => 'any payment due will be charged to the Apple account;',
			'legal.appleAccountRefunds' => 'refunds for purchases made through the App Store are handled by Apple and must be requested from Apple through [its procedure](https://reportaproblem.apple.com).',
			'legal.appleAccountRenewalCharges' => 'all fees or payments due for renewal will be charged within 24 hours before the expiration of the current period;',
			'legal.appleAccountSubscriptions' => 'Users can subscribe to a Product using the Apple Account associated with their Apple App Store account through the related procedure on AstroGods. In doing so, Users acknowledge and accept that:',
			'legal.appleAccountSubscriptionsTitle' => 'Subscriptions managed through Apple Account',
			'legal.appleTermsPrecedence' => 'The above prevails over any conflicting or divergent provision of the Terms.',
			'legal.appleThirdPartyBeneficiary' => 'Notwithstanding that the contractual relationship for the purchase of such Products is concluded exclusively between Owner and Users, Users acknowledge and accept that, should the provision of AstroGods have occurred through the Apple App Store or Google Play Store, the respective platform provider may exercise rights arising from these Terms as a third party beneficiary.',
			'legal.applicableLaw' => 'Applicable Law',
			'legal.assignmentTermsApplication' => 'The provisions relating to the modification of these Terms apply.',
			'legal.astroGodsDefinition' => 'The structure that enables the provision of the Service.',
			'legal.astroGodsDefinitionTitle' => 'AstroGods (or this Application)',
			'legal.astroGodsRefersTo' => '"AstroGods" refers to',
			'legal.astroGodsServiceOf' => 'AstroGods is a service of:',
			'legal.astrologicalInterpretations' => 'C) Astrological interpretations',
			'legal.astrologicalInterpretationsText' => 'The astrological interpretations generated by the service may be freely reused by users for any purpose, provided they are accompanied by the statement: "Interpretation generated by AstroGods (astrogods.it)"',
			'legal.astrologicalServiceDescription' => 'AstroGods uses astrology as a system of symbolic knowledge and personal research tool. The User understands that:',
			'legal.astrologicalServiceNature' => 'Nature of the astrological service',
			'legal.astrologicalServiceNatureSection' => 'Nature of the astrological service',
			'legal.astrologicalServicePoint1' => 'Astrology is an ancient system of interpretation based on symbolic correlations, not on demonstrable scientific causality',
			'legal.astrologicalServicePoint2' => 'The service offers tools for self-exploration and self-understanding through astrological language',
			'legal.astrologicalServicePoint3' => 'The interpretations provided are aimed at inner research and the development of personal awareness',
			'legal.astrologicalServicePoint4' => 'No professional advice of a medical, psychological, legal or financial nature is provided',
			'legal.astrologicalServicePoint5' => 'Astrological analyses are tools for reflection and do not predict events with absolute certainty',
			'legal.astrologicalServicePoint6' => 'The User is responsible for the use they make of the information received in their personal growth journey',
			'legal.authenticationDescription' => 'By registering or authenticating, Users allow AstroGods to identify them and give them access to dedicated services.\nDepending on what is indicated below, third-party services could provide simplified registration and authentication.',
			'legal.authenticationTitle' => 'Registration and authentication',
			'legal.automaticRenewal' => 'Automatic Renewal',
			'legal.automaticRenewalPolicy' => 'Subscriptions renew automatically when they expire and are charged to the payment method used for the purchase: the method chosen at checkout for purchases through Stripe, or the Apple Account for purchases through the App Store.',
			'legal.backendApi' => 'Backend API',
			'legal.backendApiDescription' => 'To write readings, AstroGods replaces the names of the people in the charts with a placeholder. The services below receive only the planetary positions calculated from the birth data, the language of the reading and the grammatical gender to use in the text, if the User gave one. Giving a gender is optional; without it, the reading uses neutral wording, with no gendered agreement. They receive no names, birth dates or birth places, and no data that identifies the User or the people in the charts. AstroGods puts the real names back into the text on its own servers.',
			'legal.backendApiTitle' => 'Backend API',
			'legal.billingAddress' => 'Billing address',
			'legal.bindingManner' => 'in a binding manner. Capitalized terms are defined in the relevant section of this document.',
			'legal.botRegistrationProhibited' => 'Account opening via bots or other automated means is not permitted.',
			'legal.browserSettingsContent' => 'Most web browsers allow you to control cookies through their settings preferences. You can set your browser to refuse cookies or delete certain cookies. Generally, you can also manage similar technologies in the same way.',
			'legal.browserSettingsTitle' => 'Browser settings',
			'legal.cancellation' => 'Cancellation',
			'legal.cancellationEffectiveTiming' => 'If the cancellation notice reaches the Owner before the subscription renewal date, the termination will take effect at the end of the current period.',
			'legal.commonProvisions' => 'Common Provisions',
			'legal.commonProvisionsSection' => 'Common Provisions',
			'legal.communicatedDataDuringService' => 'Data communicated during service use',
			'legal.communicationRequirement' => 'All communications relating to the use of AstroGods must be sent to the [contact details indicated in this document](mailto:contact@astrogods.it).',
			'legal.competentJurisdiction' => 'Competent Jurisdiction',
			'legal.complaintProcedure' => 'Users may address a complaint to the [Owner\'s email address](mailto:contact@astrogods.it) indicated in this document, including a brief description and, if applicable, details of the affected order, purchase, or account.',
			'legal.complianceContent' => 'Our cookie policy complies with EU data protection standards. We do not use tracking tools for statistics or advertising and do not share your data with advertisers. To learn how we process your personal data, consult the [Privacy Policy](/privacy-policy).',
			'legal.complianceSection' => 'Compliance',
			'legal.consequencesOfBlockingContent' => 'If you choose to block or delete cookies, some features of our website may not work properly.',
			'legal.consequencesOfBlockingTitle' => 'Consequences of blocking cookies',
			'legal.consumerDefinition' => 'Any User considered as such under applicable law.',
			'legal.consumerDefinitionTitle' => 'Consumer',
			'legal.consumerRequirement' => 'User acts as a Consumer',
			'legal.contactForCookiesContent' => 'If you have any questions about our use of cookies, please contact us:',
			'legal.contactForCookiesTitle' => 'Contact us about cookies',
			'legal.contactUs' => 'Contact us',
			'legal.contactUsSection' => 'Contact Us',
			'legal.contacts' => 'Contacts',
			'legal.contractAssignment' => 'Contract Assignment',
			'legal.contractConclusion' => 'Order submission by the user determines the conclusion of the contract and gives rise to the User\'s obligation to pay the price, taxes and any additional charges and expenses, as specified in the order page.',
			'legal.contractDuration' => 'Contract Duration',
			'legal.contractDurationSection' => 'Contract Duration',
			'legal.contractTransferRight' => 'The Owner reserves the right to transfer, assign, dispose of, novate, or subcontract any or all rights and obligations under these Terms, having regard for the legitimate interests of Users.',
			'legal.contractualWithdrawalRight' => 'The Owner grants Users the contractual right to withdraw from the purchase contract according to the terms and conditions set out in the [relevant section of AstroGods](/subscription-plans) within 30 days of the conclusion of the contract. For purchases made through the App Store, [Apple\'s refund procedure](https://reportaproblem.apple.com) applies.',
			'legal.contractualWithdrawalRightTitle' => 'Contractual withdrawal right',
			'legal.cookiePolicy' => 'Cookie Policy',
			'legal.cookiePolicyContent' => 'AstroGods only uses the cookies and browser storage needed for it to work and no tracking tools for statistics or advertising. To learn more, consult the [Cookie Policy](/cookie-policy).',
			'legal.cookiePolicyLastModified' => 'Last modified: October 19, 2026',
			'legal.cookiePolicyPageTitle' => 'Cookie Policy',
			'legal.cookiePolicySection' => 'Cookie Policy',
			'legal.cookiePolicyTitle' => 'Cookie Policy',
			'legal.cookiePolicyWelcomeText' => 'This page explains which cookies and browser data AstroGods uses and why.',
			'legal.cookiesAndTrackingReferenceContent' => 'To find out which cookies and browser data AstroGods needs to work, please refer to our complete Cookie Policy.',
			'legal.cookiesAndTrackingSection' => 'Cookies',
			'legal.cookiesAndTrackingTitle' => 'Cookies',
			'legal.dataControllerEmail' => 'contact@astrogods.it',
			'legal.dataControllerEmailLabel' => 'Data Controller email address: ',
			'legal.dataControllerName' => 'Arcangelo Massari - Bologna (Italy)',
			'legal.dataControllerSection' => 'Data Controller',
			'legal.dataTypesDetailedContent' => 'Complete details on each type of Personal Data collected are provided in the dedicated sections of this privacy policy or through specific information texts displayed before the collection of the Data.\n\nPersonal Data may be freely provided by the User or, in the case of Usage Data, collected automatically during the use of AstroGods.\n\nUnless otherwise specified, all Data requested by AstroGods is mandatory. If the User refuses to provide it, it might be impossible for AstroGods to provide the Service. In cases where AstroGods indicates some Data as optional, Users are free to refrain from providing such Data without any consequence on the availability or operation of the Service.\n\nUsers who have doubts about which Data is mandatory are encouraged to contact the Owner.\n\nAstroGods uses Cookies only to provide the Service requested by the User, as described in the [Cookie Policy](/cookie-policy).\n\nThe User takes responsibility for the Personal Data of third parties obtained, published or shared through AstroGods.',
			'legal.dataTypesIntro' => 'Among the Personal Data collected by AstroGods, independently or through third parties, there are:',
			'legal.dataTypesSection' => 'Types of Data collected',
			'legal.dataWeCollectAutomatically' => 'Data we collect automatically',
			'legal.dataWeCollectAutomaticallyDesc' => 'We automatically collect your data, for example when you visit AstroGods.',
			'legal.dataYouProvide' => 'Data you provide us',
			'legal.dataYouProvideDesc' => 'We collect data you provide us, for example when you create an account on AstroGods.',
			'legal.definitions' => 'Definitions and Legal References',
			'legal.definitionsContent' => '### Personal Data (or Data)\n\nAny information that directly, indirectly, or in connection with other information allows for the identification or identifiability of a natural person.\n\n### Usage Data\n\nInformation collected automatically through AstroGods (or third-party services employed in AstroGods), which can include: the IP addresses or domain names of the computers utilized by the Users who use AstroGods, the URI addresses (Uniform Resource Identifier), the time of the request, the method utilized to submit the request to the server, the size of the file received in response, the numerical code indicating the status of the server\'s answer (successful outcome, error, etc.), the country of origin, the features of the browser and the operating system utilized by the User, the various time details per visit (e.g., the time spent on each page within the Application) and the details about the path followed within the Application with special reference to the sequence of pages visited, and other parameters about the device operating system and/or the User\'s IT environment.\n\n### User\n\nThe individual using AstroGods who, unless otherwise specified, coincides with the Data Subject.\n\n### Data Subject\n\nThe natural person to whom the Personal Data refers.\n\n### Data Processor (or Processor)\n\nThe natural or legal person, public authority, agency or other body which processes Personal Data on behalf of the Controller, as described in this privacy policy.\n\n### Data Controller (or Owner)\n\nThe natural or legal person, public authority, agency or other body which, alone or jointly with others, determines the purposes and means of the processing of Personal Data, including the security measures concerning the operation and use of AstroGods. The Data Controller, unless otherwise specified, is the Owner of AstroGods.\n\n### AstroGods (or this Application)\n\nThe means by which the Personal Data of the User is collected and processed.\n\n### Service\n\nThe service provided by AstroGods as described in the relative [terms](/terms-and-conditions) and on this site/application.\n\n### European Union (or EU)\n\nUnless otherwise specified, all references made within this document to the European Union include all current member states to the European Union and the European Economic Area.\n\n### Cookie\n\nCookies are small sets of data stored in the User\'s browser.\n\n### Legal information\n\nThis privacy policy relates solely to AstroGods, if not stated otherwise within this document.',
			'legal.definitionsSection' => 'Definitions and Legal References',
			'legal.delivery' => 'Delivery',
			'legal.deliveryCostException' => 'However, the additional cost arising from the choice of a particular delivery method other than the cheapest standard delivery offered by the Owner will remain the User\'s responsibility.',
			'legal.deliveryOfDigitalContent' => 'Delivery of Digital Content',
			'legal.deliverySection' => 'Delivery',
			'legal.deviceIdentifiers' => 'Device identifiers',
			'legal.deviceInformation' => 'Device information',
			'legal.deviceRequirements' => 'Users acknowledge and accept that, to download and/or use the Product, the chosen device(s) and their respective software (including operating systems) must be legal, commonly used, updated and in line with current market standards.',
			'legal.differentiatedLicensing' => 'Differentiated licensing for content',
			'legal.differentiatedLicensingSection' => 'Differentiated licensing',
			'legal.differentiatedLicensingText' => 'The contents of AstroGods are subject to three distinct licensing regimes:',
			'legal.digitalContentDeliveryDetails' => 'Unless otherwise specified, astrological content purchased on AstroGods consists of textual interpretations and analyses (including birth chart analyses, predictions, and compatibility reports) delivered digitally through the online application interface. AstroGods functions primarily as an online service accessible through web browsers and mobile applications.',
			'legal.digitalContentWithdrawalDeadline' => 'In the case of contracts for the purchase of digital content not provided on a material medium, the withdrawal deadline expires 14 days after the day of conclusion of the contract, unless the User has waived the right of withdrawal.',
			'legal.directRegistration' => 'Direct registration',
			'legal.directRegistrationDescription' => 'The User registers by filling out the registration form and directly providing their Personal Data to AstroGods.',
			'legal.disputeResolution' => 'Dispute Resolution',
			'legal.disputeResolutionSection' => 'Dispute Resolution',
			'legal.doNotHesitateContact' => 'In such cases, do not hesitate to contact us.',
			'legal.downloadLimitations' => 'Users acknowledge and accept that the possibility of downloading the purchased Product may be limited in time and space.',
			'legal.effectsOfWithdrawal' => 'Effects of withdrawal',
			'legal.emailSendingDescription' => 'AstroGods sends service emails, such as password recovery and email change confirmation, and, if the User subscribes, newsletters with the daily and monthly horoscope. The emails are sent from an AstroGods mail server hosted by IONOS SE.',
			'legal.emailSendingTitle' => 'Email delivery',
			'legal.euExtendedContent' => '### Legal basis for processing\n\nThe Owner may process User Personal Data if one of the following conditions exists:\n\n- Users have given their consent for one or more specific purposes;\n- processing is necessary for the performance of an agreement with the User and/or for any pre-contractual obligations thereof;\n- processing is necessary for compliance with a legal obligation to which the Owner is subject;\n- processing is necessary for the performance of a task carried out in the public interest or in the exercise of official authority vested in the Owner;\n- processing is necessary for the legitimate interests pursued by the Owner or by a third party.\n\nIn any case, the Owner will gladly help to clarify the specific legal basis that applies to the processing, and in particular whether the provision of Personal Data is a statutory or contractual requirement, or a requirement necessary to enter into a contract.\n\n### Further information about retention time\n\nUnless specified otherwise in this document, Personal Data shall be processed and stored for as long as required by the purpose they have been collected for and may be stored for longer due to applicable legal obligation or based on the Users\' consent.\n\nTherefore:\n\n- Personal Data collected for purposes related to the performance of a contract between the Owner and the User shall be retained until such contract has been fully performed.\n- Personal Data collected for the purposes of the Owner\'s legitimate interests shall be retained as long as needed to fulfill such purposes. Users may find specific information regarding the legitimate interests pursued by the Owner within the relevant sections of this document or by contacting the Owner.\n\nThe Owner may be allowed to retain Personal Data for a longer period whenever the User has given consent to such processing, as long as such consent is not withdrawn. Furthermore, the Owner may be obliged to retain Personal Data for a longer period whenever required to do so for the performance of a legal obligation or upon order of an authority.\n\nOnce the retention period expires, Personal Data shall be deleted. Therefore, the right to access, the right to erasure, the right to rectification and the right to data portability cannot be enforced after expiration of the retention period.\n\n### The rights of Users based on the General Data Protection Regulation (GDPR)\n\nUsers may exercise certain rights regarding their Data processed by the Owner.\n\nIn particular, Users have the right to do the following, to the extent permitted by law:\n\n- **Withdraw their consent at any time.** Users have the right to withdraw consent where they have previously given their consent to the processing of their Personal Data.\n- **Object to processing of their Data.** Users have the right to object to the processing of their Data if the processing is carried out on a legal basis other than consent.\n- **Access their Data.** Users have the right to learn if Data is being processed by the Owner, obtain disclosure regarding certain aspects of the processing and obtain a copy of the Data undergoing processing.\n- **Verify and seek rectification.** Users have the right to verify the accuracy of their Data and ask for it to be updated or corrected.\n- **Restrict the processing of their Data.** Users have the right to restrict the processing of their Data. In this case, the Owner will not process their Data for any purpose other than storing it.\n- **Have their Personal Data deleted or otherwise removed.** Users have the right to obtain the erasure of their Data from the Owner or to delete their account from the [Settings](/settings?section=deleteAccount).\n- **Receive their Data and have it transferred to another controller.** Users have the right to receive their Data in a structured, commonly used and machine readable format and, if technically feasible, to have it transmitted to another controller without any hindrance.\n- **Lodge a complaint.** Users have the right to bring a claim before their competent data protection authority.\n\nUsers are also entitled to learn about the legal basis for Data transfers abroad including to any international organization governed by public international law or set up by two or more countries, such as the UN, and about the security measures taken by the Owner to safeguard their Data.\n\n### Details about the right to object to processing\n\nWhere Personal Data is processed for a public interest, in the exercise of an official authority vested in the Owner or for the purposes of the legitimate interests pursued by the Owner, Users may object to such processing by providing a ground related to their particular situation to justify the objection.\n\nUsers must know that, however, should their Personal Data be processed for direct marketing purposes, they can object to that processing at any time, free of charge and without providing any justification. Where the User objects to processing for direct marketing purposes, the Personal Data will no longer be processed for such purposes. To learn whether the Owner is processing Personal Data for direct marketing purposes, Users may refer to the relevant sections of this document.\n\n### How to exercise these rights\n\nAny requests to exercise User rights can be directed to the Owner through the [contact details provided in this document](mailto:contact@astrogods.it). Such requests are free of charge and will be answered by the Owner as early as possible and always within one month, providing Users with the information required by law. Any rectification or erasure of Personal Data or restriction of processing will be communicated by the Owner to each recipient, if any, to whom the Personal Data has been disclosed unless this proves impossible or involves disproportionate effort. At the Users\' request, the Owner will inform Users about those recipients.',
			'legal.euInfoContent' => 'This section applies to all users of the European Union, in accordance with the General Data Protection Regulation (the "GDPR") and, for such Users, supersedes any other information that may be divergent or conflicting contained in the privacy policy.\n\nAdditional details relating to the categories of Data processed, the purposes of processing, the categories of recipients of personal data, if any, and additional information on personal data are available in the section "Details on Personal Data processing" within this document.',
			'legal.euInfoSection' => 'Additional information for EU Users',
			'legal.euInfoTitle' => 'Additional information for European Union users',
			'legal.europeanConsumerException' => 'The above does not apply to Users acting as European Consumers or Consumers located in the United Kingdom, Switzerland, Norway, or Iceland.',
			'legal.europeanConsumerExceptionTitle' => 'Exception for Consumers in Europe',
			'legal.europeanConsumersWithdrawal' => 'Where none of the exceptions listed below apply, Users acting as European Consumers have the legal right to withdraw from contracts concluded online (distance contracts) within the time period specified below for any reason and without justification.',
			'legal.europeanDefinition' => 'Applies when the User, regardless of nationality, is located in the European Union.',
			'legal.europeanDefinitionTitle' => 'European (or Europe)',
			'legal.europeanSeverability' => 'Should a provision of these Terms be or become null, invalid, or ineffective, the parties will endeavor to identify amicably a valid and effective provision to replace the null, invalid, or ineffective one. In case of failure to reach agreement as described above, if permitted or provided by applicable law, the null, invalid, or ineffective provision will be replaced by the applicable legal provisions.',
			'legal.europeanUnion' => 'European Union',
			'legal.europeanUsersTitle' => 'European Users',
			'legal.exclusiveJurisdiction' => 'Exclusive jurisdiction to hear any dispute arising from or in connection with the Terms belongs to the court of the place where the Owner is established, as indicated in the relevant section of this document.',
			'legal.exerciseOfWithdrawalRight' => 'Exercise of the right of withdrawal',
			'legal.externalResources' => 'Access to External Resources',
			'legal.externalResourcesDisclaimer' => 'Through AstroGods, Users may have access to resources provided by third parties. Users acknowledge and accept that the Owner has no control over such resources.',
			'legal.fixedTermSubscriptionEnd' => 'Once the subscription duration has ended, the Product will no longer be accessible.',
			'legal.fixedTermSubscriptionText' => 'Paid fixed-term subscriptions start from the day the Owner receives payment and remain active for the duration of the subscription chosen by the User.',
			'legal.fixedTermSubscriptions' => 'Fixed-term Subscriptions',
			'legal.forceMAjeureExclusion' => 'damages or losses arising from interruptions or malfunctions of AstroGods due to force majeure or unforeseen and unforeseeable events and, in any case, independent of the will and beyond the control of the Owner, such as, by way of example only, failures or interruptions of telephone or electrical lines, Internet connection and/or other means of transmission, inaccessibility of websites, strikes, natural disasters, viruses and computer attacks, interruptions in the supply of third-party products, services or applications;',
			'legal.forceMAjeureUnavailability' => 'Additionally, the Service may not be available for reasons beyond the reasonable control of the Owner, such as force majeure (e.g., infrastructure malfunctions, blackouts, etc.).',
			'legal.genderOptional' => 'Gender (optional)',
			'legal.generalLiabilityExclusion' => 'Unless otherwise specified and subject to applicable legal provisions, any claim for damages against the Owner (or any natural or legal person acting on its behalf) is excluded.',
			'legal.generalSeverability' => 'Should any provision of these Terms be or become null or ineffective under applicable law, the nullity or ineffectiveness of such provision does not cause the ineffectiveness of the remaining provisions, which therefore remain valid and effective.',
			'legal.germany' => 'Germany',
			'legal.googleMapsDescription' => 'Google Maps Platform is a maps and place search service provided by Google Ireland Limited.',
			'legal.googleOAuthDescription' => 'Google OAuth is an authentication service provided by Google Inc.',
			'legal.governingLaw' => 'The Terms are governed by the law of the place where the Owner is established, as indicated in the relevant section of this document, regardless of conflict of law rules.',
			'legal.hetznerDescription' => 'Hetzner is a hosting service provided by Hetzner Online GmbH.',
			'legal.hostingAndBackend' => 'Hosting and backend infrastructure',
			'legal.hostingBackendDescription' => 'This type of service has the function of hosting Data and files that allow AstroGods to function, enable its distribution and provide ready-to-use infrastructure to deliver specific AstroGods functionalities.\n\nSome services among those listed below, if present, may work on geographically distributed servers, making it difficult to determine the actual location where Personal Data is stored.',
			'legal.hostingBackendTitle' => 'Hosting and backend infrastructure',
			'legal.howWeUseThem' => 'How we use them',
			'legal.inCaseOfProblems' => 'In case of problems',
			'legal.indemnification' => 'Indemnification',
			'legal.indemnificationText' => 'The User agrees to indemnify and hold harmless the Owner and its subordinates, affiliates, officers, agents, co-trademark holders, partners and employees to the extent permitted by law from any claim or demand - including, without limitation, legal fees and costs - advanced by third parties due to or in connection with behaviors in violation of these Terms, third party rights or law, implemented in connection with the use of the Service and attributable to the User, its affiliates, officers, agents, co-trademark holders, partners and employees, on the basis of fault.',
			'legal.indirectLossExclusion' => 'any lost profits or other losses, including indirect ones, that the User may have suffered (such as, by way of example only, commercial losses, loss of revenue, profits or anticipated savings, loss of contractual or commercial relationships, loss of goodwill or damage to reputation, etc.);',
			'legal.injuryToThirdPartyRights' => 'injury to third party rights;',
			'legal.ionosDescription' => 'IONOS is a hosting service provided by IONOS SE.',
			'legal.ipAddress' => 'IP address',
			'legal.ireland' => 'Ireland',
			'legal.italy' => 'Italy',
			'legal.judicialRightsPreservation' => 'Without prejudice to the Users\' right to bring legal action, in case of disputes concerning the use of AstroGods or the Service, Users are requested to contact the Owner at the [contact details indicated in this document](mailto:contact@astrogods.it).',
			'legal.lastModified' => 'Last modified: October 20, 2026',
			'legal.lastModifiedTerms' => 'Last modified: October 19, 2026',
			'legal.legalRelationship' => 'any other Agreement or legal relationship with the Owner',
			'legal.liabilityAndIndemnification' => 'Liability and Indemnification',
			'legal.liabilityExceptions' => 'The foregoing does not limit the Owner\'s liability for death, personal injury or damage to physical or mental integrity, damages arising from breach of essential contractual obligations, such as obligations strictly necessary to achieve the purpose of the contract, and/or damages caused intentionally or through gross negligence, provided that the User\'s use of AstroGods has been appropriate and correct.',
			'legal.liabilitySection' => 'Liability and Indemnification',
			'legal.limitedLiabilityScope' => 'Unless the damages were caused intentionally or through gross negligence or affect life and/or personal, physical or mental integrity, the Owner is only liable to the extent of damage typical for the type of contract and foreseeable at the time of conclusion.',
			'legal.managingCookiesContent' => 'You have control over the cookies we use. You can manage your preferences through your browser settings or by using the controls we provide. Please note that disabling certain cookies may affect the functionality of our website.',
			'legal.managingCookiesSection' => 'Managing cookies',
			'legal.mobileApplicationsDescription' => 'applications for mobile devices (iOS and Android), tablets, desktop (Linux, Windows, macOS) or similar platforms;',
			'legal.modificationsEffectiveDate' => 'The changes will take effect in relation to the User only from the moment communicated to the User.',
			'legal.nationalLawPrevails' => 'If the law of the User\'s country provides a higher level of consumer protection, that higher level of protection prevails.',
			'legal.nationalLawPrevalence' => 'National Law Prevalence',
			'legal.necessaryCookiesDescription' => 'These cookies are essential for the website to function properly. They enable core functionality such as security, network management, and accessibility.',
			'legal.necessaryCookiesTitle' => 'Necessary cookies',
			'legal.noCompensationForSuspension' => 'Account suspension or cancellation does not entitle the User to any compensation, refund or indemnification.',
			'legal.noImplicitWaiver' => 'The Owner\'s failure to exercise legal rights or claims arising from these Terms does not constitute a waiver thereof. No waiver may be considered final in relation to a specific right or any other right.',
			'legal.noResponsibilityIntro' => 'In particular, within the limits set out above, the Owner assumes no responsibility regarding:',
			'legal.noWaiverImplied' => 'No Waiver Implied',
			'legal.nonDirectLossExclusion' => 'any losses that are not a direct consequence of a breach of the Terms by the Owner;',
			'legal.nonEuropeanUsersNoRights' => 'Users who do not meet these requirements do not have the rights described in this section. The Consumer will be liable to the Seller only for any diminished value of the goods resulting from handling of the goods other than what is necessary to establish the nature, characteristics and functioning of the goods.',
			'legal.notOnProhibitedList' => 'User is not listed on any US government list of prohibited contractors',
			'legal.notUnderEmbargo' => 'User is not located in a country subject to a US government embargo or listed as a terrorist-sponsoring country',
			'legal.offensesToOwnerOrThird' => 'offenses to the Owner or a third party.',
			'legal.oneAccountPerUser' => 'Unless otherwise specified, each User may create only one account.',
			'legal.openRouterDescription' => 'OpenRouter is a service by OpenRouter, Inc. that forwards the requests of AstroGods to the Anthropic API.',
			'legal.orderConfirmation' => 'Once the order is submitted, Users will receive an order receipt confirmation.',
			'legal.orderConfirmationEmail' => 'Once the order is submitted, Users will receive an order receipt confirmation.',
			'legal.orderSubmission' => 'Order Submission',
			'legal.orderSubmissionConsequences' => 'Order submission entails the following:',
			'legal.orderSubmissionRequirement' => 'To submit the order, Users are required to accept these Terms and use the respective button or mechanism on AstroGods, thereby committing to pay the agreed price.',
			'legal.ownerDefinition' => 'Indicates the natural or legal person who provides AstroGods and/or offers the Service to Users.',
			'legal.ownerDefinitionTitle' => 'Owner (or We)',
			'legal.ownerEmail' => 'Owner\'s email address:',
			'legal.ownerName' => 'Arcangelo Massari - Bologna (Italy)',
			'legal.ownerProtectiveRights' => 'Therefore, the Owner reserves the right to adopt any suitable measure to protect their legitimate interests, and in particular to deny the User access to AstroGods or the Service, terminate contracts, report any objectionable activity carried out through AstroGods or the Service to competent authorities - e.g. judicial or administrative authority - whenever the User implements or there is suspicion that they implement:',
			'legal.ownershipReservation' => 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire ownership of the ordered Products.',
			'legal.ownershipReservationTitle' => 'Ownership reservation',
			'legal.paidProducts' => 'Paid Products',
			'legal.paidSubscriptionSuspension' => 'However, the closure of the User account will be suspended until the expiry of any paid subscription services purchased by the User.',
			'legal.passwordSecurity' => 'It is the Users\' responsibility to keep their access credentials secure and confidential. To this end, Users must choose a password that corresponds to the highest level of security available on AstroGods.',
			'legal.paymentFailed' => 'Payment Failed',
			'legal.paymentFailedDescription' => 'Your subscription payment could not be processed. Please update your payment method to continue using our services.',
			'legal.paymentFailureConsequences' => 'In the event that payment made with one of the available methods fails or is rejected by the payment service provider, the Owner is not obligated to execute the order. In the event that payment is not successful, the Owner reserves the right to request the User to reimburse any related expenses or damages.',
			'legal.paymentInformation' => 'Payment information',
			'legal.paymentManagement' => 'Payment management',
			'legal.paymentManagementDescription' => 'Unless otherwise specified, AstroGods processes all payments with credit card, bank transfer or other means through external payment service providers. In general, and unless otherwise indicated, Users are requested to provide payment details and personal information directly to such payment service providers.\nAstroGods is not involved in the collection and processing of such information: it will instead only receive a notification from the relevant payment service provider about the payment made.',
			'legal.paymentManagementTitle' => 'Payment management',
			'legal.paymentMethods' => 'Payment Methods',
			'legal.paymentMethodsConditions' => 'Stripe Technology Europe Ltd handles payments made through Stripe, while Apple handles those made through the App Store. AstroGods does not store or have access to your payment card details.',
			'legal.paymentMethodsInfo' => 'On the website and in the Android, Windows and Linux apps, AstroGods processes payments through Stripe, a PCI DSS certified payment processor. Accepted payment methods include major credit and debit cards (Visa, Mastercard, American Express), digital wallets (Apple Pay, Google Pay), and other methods available through Stripe in your region. In the iPhone, iPad and Mac apps, subscriptions are purchased through Apple\'s App Store, as described in the section on subscriptions managed through Apple Account.',
			'legal.paymentObligationRemains' => 'The suspension or cancellation of an account for causes attributable to the User does not exempt the User from payment of fees or prices that may be applicable.',
			'legal.paymentProcessingError' => 'Payment processing error occurred',
			'legal.paymentThirdPartyHandling' => 'All payments are handled independently by third-party services. Therefore, AstroGods does not collect payment-related data – such as credit card numbers – but receives a notification once the payment has been successful. For further information on the processing of personal data and related rights, the User can refer to the [AstroGods privacy policy](/privacy-policy).',
			'legal.permittedUse' => 'Permitted Use',
			'legal.permittedUseText' => 'AstroGods and the Service may only be used for the purposes for which they are offered, according to these Terms and applicable law.',
			'legal.phoneNumber' => 'Phone number',
			'legal.placeSearchDescription' => 'When the User searches for a birthplace, the AstroGods servers send the typed text to Google Maps Platform to suggest places and find their coordinates. Google receives the request from the AstroGods servers, so it does not receive the User\'s IP address or account data.',
			'legal.placeSearchTitle' => 'Place search',
			'legal.planetaryPositions' => 'Planetary positions',
			'legal.previousVersionValidity' => 'The previous version continues to govern the relationship until acceptance of the changes by the User. This version may be requested from the Owner.',
			'legal.pricing' => 'Pricing',
			'legal.pricingPolicy' => 'Prices on AstroGods include all applicable fees, taxes and costs.',
			'legal.pricingTransparency' => 'During the purchase procedure and before order submission, Users are duly informed of all fees, taxes and costs (including any shipping charges) that will be charged to them.',
			'legal.privacyPolicy' => 'Privacy Policy',
			'legal.privacyPolicyReference' => 'Privacy Policy',
			'legal.privacyPolicyReferenceContent' => 'For detailed information about how we collect, use, and protect your personal data, please refer to our complete Privacy Policy.',
			'legal.privacyPolicySection' => 'Privacy policy',
			'legal.privacyPolicyTitle' => 'AstroGods Privacy Policy',
			'legal.privacyPolicyWelcomeText' => 'Welcome to AstroGods privacy policy. This policy will help you understand what data we collect, why we collect it, and what your rights are regarding it.',
			'legal.problemsDescription' => 'Although we strive to create a positive user experience, we know that problems can occasionally occur between us and our users.',
			'legal.processingDetailsSection' => 'Processing details',
			'legal.processingMethodsContent' => '### Processing methods\n\nThe Owner processes the Personal Data of Users by adopting appropriate security measures aimed at preventing unauthorized access, disclosure, modification or destruction of Personal Data.\n\nProcessing is carried out using computer and/or telematic tools, with organizational methods and logics strictly related to the indicated purposes. In addition to the Owner, in some cases, other subjects involved in the organization of AstroGods (administrative, commercial, marketing, legal personnel, system administrators) or external subjects (such as third-party technical service providers, postal couriers, hosting providers, IT companies, communication agencies) may have access to the Data, also appointed, if necessary, as Data Processors by the Owner. The updated list of Processors can always be requested from the Data Controller.\n\n### Location\n\nData is processed at the Owner\'s operating offices and in any other place where the parties involved in the processing are located.\n\nFor further information, contact the Owner.\n\nThe User\'s Personal Data may be transferred to a country other than the one where the User is located. To obtain further information on the place of processing, the User can refer to the section relating to details on Personal Data processing.\n\n### Retention time\n\nUnless otherwise specified in this document, Personal Data is processed and stored for the time required by the purposes for which it was collected and may be stored for a longer period due to any legal obligations or based on the consent of Users.',
			'legal.processingMethodsSection' => 'Methods and place of processing',
			'legal.processingMethodsTitle' => 'Methods and place of processing of collected Data',
			'legal.productCharacteristicsSpecified' => 'The characteristics of the selected Product will be specified during the purchase procedure.',
			'legal.productDefinition' => 'A good or service available through AstroGods, including specifically: astrological interpretations, birth chart analyses, astrological predictions and forecasts, compatibility reports, astrological educational content, and any other astrological service or digital content defined separately in this document.',
			'legal.productDefinitionTitle' => 'Product',
			_ => null,
		} ?? switch (path) {
			'legal.productDescription' => 'Product Description',
			'legal.productDescriptionInfo' => 'Prices, descriptions and availability of astrological Products (including birth chart readings, compatibility analyses, daily and monthly predictions, and relationship insights) are specified in the respective sections of AstroGods and are subject to change without notice.',
			'legal.productRepresentationDisclaimer' => 'Although Products on AstroGods are presented with the maximum technically possible accuracy, the representation on AstroGods through any means (including, as the case may be, graphic materials, images, colors, sounds) is to be understood as a mere reference and does not imply any guarantee regarding the characteristics of the Product purchased.',
			'legal.promotionsAndDiscounts' => 'Promotions and Discounts',
			'legal.promotionsDisclaimer' => 'The Owner may offer discounts or special promotions for the purchase of Products. Such promotions or discounts are always subject to the requirements and terms and conditions provided in the relevant section of AstroGods.',
			'legal.promotionsDiscretion' => 'Promotions and offers are always granted at the sole discretion of the Owner.',
			'legal.promotionsNoRights' => 'Repeated or periodic promotions or discounts do not constitute any claim or right enforceable by Users in the future.',
			'legal.promotionsTimeLimit' => 'Depending on the case, discounts and promotions are valid for a certain period of time or until stocks run out. Unless otherwise specified, the time limitations of promotions and discounts refer to the time zone of the Owner\'s headquarters, as indicated in the contact details in this document.',
			'legal.proprietaryContentStandard' => 'A) Software licensing',
			'legal.proprietaryContentStandardTextAfter' => '. The backend, algorithms, trademarks, user database, and all server-side elements remain the exclusive property of the Owner with all rights reserved.',
			'legal.proprietaryContentStandardTextBefore' => 'The application source code (frontend) is released under the GNU Affero General Public License v3.0 (AGPL-3.0) and is available at ',
			'legal.providedByLabel' => 'Provided by: ',
			'legal.purchaseHistory' => 'Purchase history',
			'legal.purchaseNotifications' => 'All notifications related to the purchase procedure described above will be sent to the email address provided by the User for this purpose.',
			'legal.purchaseProcedure' => 'Purchase Procedure',
			'legal.purchaseProcedureSteps' => 'Each step, from product selection to order submission, is part of the purchase procedure. The purchase procedure includes the following steps:',
			'legal.purchaseRegistrationRequired' => 'To purchase Products, the User is required to register or log in to AstroGods.',
			'legal.purchaseViaAppStore' => 'Purchase via App Store',
			'legal.purposesDetailedInfoText' => 'To obtain detailed information on the purposes of processing and the Personal Data specifically relevant to each purpose, the User can refer to the section "Details on Personal Data processing".',
			'legal.purposesIntroText' => 'User Data is collected to enable the Owner to provide the Service, comply with legal obligations, respond to requests or enforcement actions, protect their rights and interests (or those of Users or third parties), identify any fraudulent or malicious activities, as well as for the following purposes:',
			'legal.purposesSection' => 'Purposes of Processing',
			'legal.refundTimeline' => 'The refund will be made without undue delay and in any case within 14 days from the day on which the Owner was informed of the User\'s decision to withdraw from the contract. Unless otherwise agreed with the User, the refund will be made using the same means of payment used for the initial transaction. The User will not incur any cost as a result of the withdrawal.',
			'legal.registration' => 'Registration',
			'legal.registrationAndAuth' => 'Registration and authentication',
			'legal.registrationRequired' => 'To use the Service, User can open an account by providing all required data and information completely and truthfully. It is not possible to use the Service without opening a User account.',
			'legal.registrationRequirementsText' => 'The registration of a User account on AstroGods is subject to the conditions specified below. By registering an account, the User confirms that they meet these conditions.',
			'legal.registrationSuccessful' => 'Registration successful!',
			'legal.renewalDurationMatch' => 'The renewal has the same duration as the original subscription period.',
			'legal.responseTimeline' => 'The Owner will process the request without undue delay and within 14 days of its receipt.',
			'legal.rightOfWithdrawal' => 'Right of Withdrawal',
			'legal.salesTerms' => 'Sales terms and conditions',
			'legal.salesTermsDetails' => 'The rates, duration and conditions applicable to the sale of such Products are described below and in the respective sections of AstroGods.',
			'legal.salesTermsIntro' => 'Some of the Products offered on AstroGods as part of the service are paid.',
			'legal.salesTermsSection' => 'Sales terms and conditions',
			'legal.serviceDefinition' => 'The service offered through AstroGods as described in the Terms and on AstroGods.',
			'legal.serviceDefinitionTitle' => 'Service',
			'legal.serviceInterruption' => 'Service Interruption',
			'legal.serviceMaintenanceRight' => 'To ensure the best possible level of service, the Owner reserves the right to interrupt the Service for maintenance, system updates, or any other changes, giving appropriate notice to Users.',
			'legal.serviceResale' => 'Service Resale',
			'legal.serviceTerminationRights' => 'Within the limits of the law, the Owner reserves the right to suspend or completely terminate the Service. In case of termination of the Service, the Owner will endeavor to allow Users to extract their personal data and information and will respect Users\' rights relating to continued use of the product and/or compensation, according to legal provisions.',
			'legal.severabilityClause' => 'Severability Clause',
			'legal.severabilityLimitations' => 'Notwithstanding the above, the nullity, invalidity, or ineffectiveness of a specific provision of these Terms does not result in nullity of the entire Agreement, unless the null, invalid, or ineffective provisions within the Agreement are essential or of such importance that the parties would not have concluded the contract if they had known the provision would be invalid, or in cases where the remaining provisions would impose an excessive and unacceptable burden on one of the parties.',
			'legal.signInWithAppleDescription' => 'Sign in with Apple is an authentication service provided by Apple. If the User chooses to hide their email, AstroGods receives a forwarding address created by Apple.',
			'legal.stripeBillingAddress' => 'Within the Stripe checkout area, Users may also be asked to specify their billing and shipping address.',
			'legal.stripeCheckoutAccess' => 'By clicking the checkout button, Users access the Stripe checkout area where they will be asked to provide their contact details and a payment method of their choice.',
			'legal.stripeCustomerPortal' => 'Users can access the Stripe Customer Portal to view billing history, download invoices, update payment methods, and manage subscription settings. This portal is provided directly by Stripe and ensures secure access to payment and billing information.',
			'legal.stripeDescription' => 'Stripe is a payment service provided by Stripe Technology Europe Ltd.',
			'legal.stripeExpressCheckout' => 'Within the Stripe checkout area, Users will have the possibility to choose express checkout. Express checkout allows Users to complete the purchase directly, using payment information and contact details stored by the most common online payment management services (such as "ApplePay", "Google Pay", "Microsoft Pay").',
			'legal.stripePaymentStorage' => 'Users who have not yet done so, can request Stripe to store their payment information for future purchases on AstroGods or on other sites that use Stripe as a payment gateway. For information on the processing of personal data and related rights, the User can consult the [privacy policy of Stripe](https://stripe.com/privacy) and that of [AstroGods](/privacy-policy).',
			'legal.stripeRecurringPayments' => 'For subscriptions purchased through Stripe, Stripe securely stores payment method information to process recurring payments automatically. Users can manage, update, or cancel their payment methods and subscriptions through the customer portal accessible from their account settings.',
			'legal.subscriptionContinuousProduct' => 'Through subscription, the User receives a Product continuously or periodically. Details regarding the type of subscription and termination are described below.',
			'legal.subscriptionTermination' => 'Subscriptions can be canceled: (1) for purchases through Stripe, from the Stripe Customer Portal accessible from the [account settings](/settings?section=subscriptions); (2) for purchases through the App Store, from the [Apple Account settings](https://apps.apple.com/account/subscriptions); (3) by sending a clear cancellation notice to the Owner using the [contact details provided in this document](mailto:contact@astrogods.it).',
			'legal.subscriptions' => 'Subscriptions',
			'legal.subscriptionsTitle' => 'Subscriptions',
			'legal.summary' => 'Summary',
			'legal.summarySection' => 'Summary',
			'legal.termsAcceptanceRequired' => 'Please read this document carefully.',
			'legal.termsAndConditions' => 'Terms and Conditions',
			'legal.termsAndConditionsTitle' => 'Terms and Conditions of AstroGods',
			'legal.termsDefinition' => 'All conditions applicable to the use of AstroGods and/or the provision of the Service as described in this document as well as in any other document or agreement related to it, in the most updated version respectively.',
			'legal.termsDefinitionTitle' => 'Terms',
			'legal.termsGovernText' => 'These Terms govern',
			'legal.termsIntroduction' => 'Introduction',
			'legal.termsIntroductionSection' => 'Introduction',
			'legal.termsModification' => 'Terms Modification',
			'legal.termsModificationAcceptance' => 'Continued use of the Service implies User acceptance of the updated Terms. If the User does not wish to accept the changes, they must cease using the Service and may withdraw from the Agreement.',
			'legal.termsModificationRight' => 'The Owner reserves the right to modify the Terms at any time. In such case, the Owner will give appropriate notice of the changes to Users.',
			'legal.termsOfUse' => 'Terms of Use',
			'legal.termsOfUseGeneralValidity' => 'Unless otherwise specified, the terms of use of AstroGods set out in this section have general validity.',
			'legal.termsOfUseSection' => 'Terms of Use',
			'legal.termsTableOfContents' => 'Table of Contents',
			'legal.thirdPartyResourcesDisclaimer' => 'The conditions applicable to resources provided by third parties, including those applicable to any grants of rights on content, are determined by the same third parties and governed by their respective terms and conditions or, in their absence, by law.',
			'legal.thisSiteDescription' => 'this website, accessible via browser, including related subdomains and any other site through which the Owner offers the Service;',
			'legal.trackingToolsIntro' => 'AstroGods does not use tracking tools for statistics or advertising. It only uses the cookies and browser storage needed for it to work, for example to keep you signed in.',
			'legal.trackingToolsSection' => 'No tracking',
			'legal.trialAutoConversion' => 'Upon expiration, the trial period will automatically convert to the equivalent paid Product unless the User cancels the purchase before the trial period expires.',
			'legal.trialPeriod' => 'Trial Period',
			'legal.trialPeriodAvailability' => 'Users have the opportunity to try AstroGods or individual Products free of charge for a 7-day, non-renewable trial period. Some functions or features of AstroGods may not be available during the trial period. Additional conditions applicable to the trial period will be specified on AstroGods.',
			'legal.trustedThirdParties' => 'Trusted third parties that help us process them',
			'legal.typesOfCookiesSection' => 'Types of cookies we use',
			'legal.unauthorizedResale' => 'Users are not authorized to reproduce, duplicate, copy, sell, resell, or exploit AstroGods or the Service in whole or in part without the Owner\'s prior written consent, expressed directly or through a legitimate resale program.',
			'legal.unitedStates' => 'United States',
			'legal.usageData' => 'Usage data',
			'legal.usageRightsReservation' => 'Until receipt of payment of the full purchase price by the Owner, the User does not acquire the usage rights of the ordered Products.',
			'legal.usageRightsReservationTitle' => 'Usage rights reservation',
			'legal.useOfService' => 'the use of AstroGods and',
			'legal.userActivityLiabilityLimitation' => 'Limitation of liability for User activities on AstroGods',
			'legal.userAssignmentRestriction' => 'The User is not authorized to assign or transfer their rights and obligations under the Terms without the written consent of the Owner.',
			'legal.userCollaborationObligation' => 'In the event that the purchased Product requires action by the User, such as the provision of information or personal data, specifications or particular requests, order submission also constitutes the User\'s obligation to collaborate accordingly.',
			'legal.userExclusiveResponsibility' => 'It is the User\'s exclusive responsibility to ensure that the use of AstroGods and/or the Service does not violate the law, regulations or the rights of third parties.',
			'legal.userRights' => 'User Rights',
			'legal.userRightsSection' => 'User Rights',
			'legal.usingAccountClosureTools' => 'Using the [account closure tools](/settings?section=deleteAccount) available on AstroGods.',
			'legal.usingAstroGodsUserDeclares' => 'By using AstroGods the User declares to meet the following requirements:',
			'legal.viewCookiePolicy' => 'View Cookie Policy',
			'legal.viewPrivacyPolicy' => 'View Privacy Policy',
			'legal.violationsOfLaw' => 'violations of law, regulations and/or the Terms;',
			'legal.voucherDefinition' => 'Any digital or paper code or voucher that allows the User to purchase the Product at a discounted price.',
			'legal.voucherDefinitionTitle' => 'Voucher',
			'legal.voucherExpiration' => 'The Voucher must be used within the specified validity period. Once the period expires, the Voucher will be automatically canceled. Any possibility of claiming rights, including refund of the Voucher value, is excluded;',
			'legal.voucherFullRedemption' => 'The Voucher can only be redeemed in full at the time of purchase – partial use is not permitted;',
			'legal.voucherNoCredit' => 'The User is not entitled to any credit/refund/compensation in case there is a difference between the Voucher value and the redeemed value;',
			'legal.voucherNonCommercialUse' => 'The Voucher is to be understood exclusively for non-commercial use. The reproduction, counterfeiting and commercialization of the Voucher are strictly prohibited, as well as any illegal activity connected to the purchase and/or use of the Voucher.',
			'legal.voucherSingleUse' => 'Unless otherwise specified, single-use Vouchers can be redeemed only once per purchase and can therefore be redeemed only once even in the case of installment purchases;',
			'legal.voucherValidityRule' => 'Each Voucher is valid only if used according to the methods and within the time period specified on the website and/or on the Voucher;',
			'legal.vouchers' => 'Vouchers',
			'legal.vouchersAdditionalProvisions' => 'Any additional or divergent provisions applicable to the use of Vouchers reported in the relevant information page or on the Voucher itself prevail in any case, regardless of the provisions that follow.',
			'legal.vouchersNotCumulative' => 'Vouchers are not cumulative;',
			'legal.vouchersPromoForm' => 'Promotions and discounts may be offered in the form of Vouchers.',
			'legal.vouchersRules' => 'Unless otherwise specified, the following rules apply to the use of Vouchers:',
			'legal.vouchersViolationConsequences' => 'In case of violation of the conditions applicable to Vouchers, the Owner may legitimately refuse to fulfill their contractual obligations and expressly reserves the right to take action in appropriate venues, including judicial ones, in order to protect their rights and interests.',
			'legal.whatAreCookiesContent' => 'Cookies are small data files that are placed on your computer or mobile device when you visit a website. They are widely used to make websites work more efficiently, provide better user experience, and to provide reporting information.',
			'legal.whatAreCookiesSection' => 'What are cookies?',
			'legal.whoHasWithdrawalRights' => 'Who has the right of withdrawal',
			'legal.withdrawalDeadlineQuestion' => 'When does the withdrawal deadline expire?',
			'legal.withdrawalEffects' => 'The Owner will refund all payments received, including delivery costs if any, to Users who have correctly exercised the right of withdrawal.',
			'legal.withdrawalExercise' => 'To exercise the right of withdrawal, the User must send the Owner an unequivocal communication of their intention to withdraw from the contract.',
			'legal.withdrawalFormAddress' => 'Arcangelo Massari - Bologna (Italy)\ncontact@astrogods.it',
			'legal.withdrawalFormConsumerAddress' => 'Address of consumer(s):_____________________________________________',
			'legal.withdrawalFormConsumerName' => 'Name of consumer(s):_____________________________________________',
			'legal.withdrawalFormDate' => 'Date: _____________________________________________',
			'legal.withdrawalFormDescription' => '_____________________________________________ (insert here a description of the goods/services from whose purchase you wish to withdraw)',
			'legal.withdrawalFormHeader' => 'Addressed to:',
			'legal.withdrawalFormInstructions' => 'For this purpose, the User may use the standard withdrawal form found in the definitions section of this document. However, the User is free to express their intention to withdraw from the contract in any other suitable form. In order to comply with the period within which the right must be exercised, the User must send the withdrawal declaration before the withdrawal deadline expires.',
			'legal.withdrawalFormNotification' => 'I/we hereby notify withdrawal from my/our contract of sale for the following goods/services:',
			'legal.withdrawalFormOrderDate' => 'Ordered on: _____________________________________________ (insert the date)',
			'legal.withdrawalFormReceiveDate' => 'Received on: _____________________________________________ (insert the date)',
			'legal.withdrawalFormSignature' => '(sign only if this form is notified in paper version)',
			'legal.withdrawalFormTitle' => 'Standard withdrawal form',
			'legal.withdrawalRightSummary' => 'Unless an exception applies, the User may enjoy the right to withdraw from the contract within the period specified below (usually 14 days) for any reason and without justification. The User can find more information about the right of withdrawal in this section.',
			'releaseNotes.releaseNotes' => 'Release notes',
			'releaseNotes.releaseNotesTitle' => 'What\'s new',
			'releaseNotes.releaseNotes_2_0_1' => 'Initial release with birth chart readings, synastry analysis for couple compatibility, and daily and monthly transit predictions. PDF export. Full support for English and Italian.',
			'releaseNotes.releaseNotes_2_0_2' => 'Bug fixes and stability improvements.',
			'releaseNotes.releaseNotes_2_0_3' => 'Performance improvements.',
			'releaseNotes.releaseNotes_2_0_4' => 'Bug fixes and stability improvements.',
			'releaseNotes.releaseNotes_2_1_0' => 'Chart-only PDF download for birth chart, synastry, and transits. PDF export for daily and monthly transit readings. House numbers now shown in chart details. Birth charts created before registration are now automatically linked to your account.',
			'releaseNotes.releaseNotes_2_2_0' => 'Faster transit calculations, up to 40% faster for monthly transits. New team member: Corrado Camponeschi.',
			'releaseNotes.releaseNotes_2_2_1' => 'Bug fixes and stability improvements.',
			'releaseNotes.releaseNotes_2_3_0' => 'Enhanced chart visualization with degree markers and planet connector lines. Improved water sign colors for better contrast. Visual refinements to the chart display.',
			'releaseNotes.releaseNotes_2_4_0' => 'Readings can now resume if your connection is interrupted. Improved overall stability.',
			'releaseNotes.releaseNotes_3_0_0' => 'New release notes screen to view version history. The app now checks compatibility and notifies you when an update is available. Improved reading generation stability.',
			'releaseNotes.releaseNotes_4_0_0' => 'High-resolution images in fullscreen view. New aspect grid for synastry and transits. PDF exports now include details and aspect grid pages. Enhanced desktop navigation with arrows, clickable indicators, and keyboard shortcuts. Improved fullscreen zoom for charts and images. Lighter and faster app. Fixed layout issue in landscape mode on mobile.',
			'releaseNotes.releaseNotes_4_0_1' => 'Fixed an issue where the PDF button did not appear after reading generation. Saved charts now refresh correctly when navigating back with the browser.',
			'releaseNotes.releaseNotes_4_10_0' => 'You can now regenerate readings in your preferred language. Saved transits now appear in saved analyses. Fixed authentication workflow bugs.',
			'releaseNotes.releaseNotes_4_10_1' => 'Success screen after subscription. Reorganized navigation in side menu. Clickable links in Codex. Subscription management improvements.',
			'releaseNotes.releaseNotes_4_11_0' => 'If you were born during a clock change, you can now pick which hour you mean. Charts for births before modern time zones are now more accurate. The Codex adds articles on precession and house systems, with interactive diagrams. Tap a citation in the Codex to read the original passage. New floating navigation bar and Google sign in on iPhone.',
			'releaseNotes.releaseNotes_4_11_1' => 'Small fixes to keep the app running smoothly.',
			'releaseNotes.releaseNotes_4_11_2' => 'Subscription checks and payments work properly again. Email horoscope settings and dialogs now fit better on narrow phones. On iOS, pages now start below the top bar, and titles are centered on every device.',
			'releaseNotes.releaseNotes_4_5_1' => 'New app icons. Improved logo quality in the menu. Fixed a validation issue when editing birth charts.',
			'releaseNotes.releaseNotes_4_7_1' => 'Connection error messages now translated.',
			'releaseNotes.releaseNotes_4_7_6' => 'Improved font rendering.',
			'releaseNotes.releaseNotes_4_7_7' => 'Fixed errors in monthly transit calculations. Subscription badges now display only when appropriate.',
			'releaseNotes.releaseNotes_4_8_0' => 'New app icon. Optimized starry night background.',
			'releaseNotes.releaseNotes_4_9_0' => 'Updated terms and conditions and privacy policy. Fixed a registration issue with email and password. Birth chart is now automatically generated after registration.',
			'releaseNotes.releaseNotes_5_0_0' => 'On iPhone and Mac you can sign in with Apple and subscribe through the App Store. Change your email or password from settings, or add a password to a Google or Apple account. Readings follow the gender you choose, or stay neutral if you prefer not to say. Your birth charts are visible only to you, and readings no longer send your names to the AI. Please log in again after updating. Profile pictures and charts created without an account are gone.',
			'releaseNotes.releaseNotes_5_0_1' => 'Small fixes to keep the app running smoothly.',
			'releaseNotes.version' => ({required Object version}) => 'Version ${version}',
			'ui.about' => 'About',
			'ui.account' => 'Account',
			'ui.accountDeleted' => 'Account deleted successfully',
			'ui.activeSubscriptionDeleteWarning' => 'You have an active subscription. To delete your account, your subscription will be cancelled first.\n\nThis action cannot be undone. All your data and saved charts will be permanently deleted.',
			'ui.addEmail' => 'Add email',
			'ui.addNewsletter' => 'Add horoscope by email',
			'ui.allNewsletters' => 'All newsletters',
			'ui.allPremiumFeatures' => 'All Premium features',
			'ui.alreadyHaveAccount' => 'Already have an account?',
			'ui.analyzing' => 'ANALYZING...',
			'ui.annual' => 'Annual',
			'ui.anticipateYourDayWithTransits' => 'Anticipate your day with transit analysis',
			'ui.anticipateYourMonthWithTransits' => 'Anticipate your month with transit analysis',
			'ui.appleAutoRenewNotice' => 'The subscription renews automatically at the price shown unless you cancel it at least 24 hours before the current period ends. Payment is charged to your Apple account. You can manage or cancel it in your App Store account settings.',
			'ui.appleSubscriptionDeleteWarning' => 'Deleting your account does not cancel your App Store subscription. To stop the renewals, cancel it in your App Store account settings.\n\nThis action cannot be undone. All your data and saved charts will be permanently deleted.',
			'ui.appTitle' => 'AstroGods',
			'ui.appVersion' => 'App Version',
			'ui.at' => 'at',
			'ui.authenticationRequired' => 'Authentication required',
			'ui.backToForm' => 'Back to form',
			'ui.backToLogin' => 'Back to login',
			'ui.billedAnnually' => 'Billed annually',
			'ui.billedAnnuallyAt' => ({required Object amount}) => 'billed ${amount}/year',
			'ui.billedMonthly' => 'Billed monthly',
			'ui.billedSemiannually' => 'Billed every 6 months',
			'ui.birthChart' => 'Birth chart',
			'ui.birthChartCreated' => 'Birth chart created successfully',
			'ui.birthChartDescription' => 'The birth chart is the symbolic representation of the positions of celestial bodies at the moment of birth.',
			'ui.birthChartFor' => ({required Object name}) => 'Birth Chart for ${name}',
			'ui.birthChartGraph' => 'Birth chart',
			'ui.birthChartNotFound' => 'Birth chart not found',
			'ui.birthChartOf' => ({required Object name}) => 'Birth chart of ${name}',
			'ui.birthChartPreview' => 'Birth chart preview',
			'ui.birthChartReading' => 'Birth Chart Reading',
			'ui.birthChartReadings' => 'Birth chart readings',
			'ui.birthChartUpdated' => 'Birth chart updated successfully',
			'ui.birthChartsCountPlural' => ({required Object count}) => '${count} saved birth charts',
			'ui.birthChartsCountSingular' => '1 saved birth chart',
			'ui.birthChartsFilter' => 'Birth charts',
			'ui.birthChartsMustBeDifferent' => 'The two birth charts must be different',
			'ui.birthDate' => 'Birth date',
			'ui.birthInfo' => 'Birth Information',
			'ui.birthInformation' => 'Birth Information',
			'ui.birthPlace' => 'Birth place',
			'ui.birthTime' => 'Birth time',
			'ui.birthTimeRequired' => 'Enter time or check unknown time',
			'ui.cancel' => 'Cancel',
			'ui.cancelSubscriptionAndDelete' => 'Cancel subscription and delete account',
			'ui.cancellingSubscription' => 'Cancelling subscription...',
			'ui.changePassword' => 'Change password',
			'ui.changePlan' => 'Change plan',
			'ui.chartNotAvailable' => 'Chart not available.',
			'ui.chartOnlyMode' => 'Chart only, without reading',
			'ui.chartRemovedFromPersonal' => 'Chart removed from personal',
			'ui.chartRemovedFromSaved' => 'Chart removed from saved',
			'ui.chartSetAsPersonal' => 'Chart set as personal',
			'ui.chartsCountPlural' => ({required Object count}) => '${count} saved analyses',
			'ui.chartsCountSingular' => '1 saved analysis',
			'ui.checkSpamFolder' => 'Please also check your spam or junk folder',
			'ui.checkYourEmail' => 'Check your email',
			'ui.checkoutCancelledMessage' => 'You can close this window and return to the app',
			'ui.checkoutCancelledTitle' => 'Checkout cancelled',
			'ui.compatibilityAnalysis' => 'Compatibility Analysis',
			'ui.confirmNewPassword' => 'Confirm new password',
			'ui.confirmPassword' => 'Confirm Password',
			'ui.confirmingSubscription' => 'Confirming your subscription...',
			'ui.connectionError' => 'Connection failed. Check your network and try again.',
			'ui.connectionTimeout' => 'The request took too long. Please try again.',
			'ui.continueWithApple' => 'Continue with Apple',
			'ui.continueWithGoogle' => 'Continue with Google',
			'ui.couplesChartReadings' => 'Couple\'s chart readings',
			'ui.create' => 'Create',
			'ui.createAccount' => 'Create your account',
			'ui.createBirthChart' => 'Create birth chart',
			'ui.createFirstChart' => 'Create first chart',
			'ui.createSecondChart' => 'Create second chart',
			'ui.createSynastry' => 'Create synastry',
			'ui.creating' => 'Creating...',
			'ui.currentLocation' => 'Current location',
			'ui.currentPassword' => 'Current password',
			'ui.currentPlan' => 'Current plan',
			'ui.daily' => 'Daily',
			'ui.dailyMonthlyTransits' => 'Daily and monthly transits',
			'ui.dailyPredictions' => 'Daily predictions',
			'ui.dailyPredictionsContent' => 'Your daily astrological predictions.',
			'ui.dailyPredictionsTitle' => 'Daily Predictions',
			'ui.dailySkyOf' => 'Sky of the day',
			'ui.dailyTransitGraph' => 'Daily transit chart',
			'ui.dailyTransitOf' => ({required Object name}) => 'Daily transit of ${name}',
			'ui.dailyTransitsCountPlural' => ({required Object count}) => '${count} saved daily transits',
			'ui.dailyTransitsCountSingular' => '1 saved daily transit',
			'ui.dailyTransitsFilter' => 'Daily transits',
			'ui.darkMode' => 'Dark',
			'ui.dateOfBirth' => 'Date of Birth',
			'ui.dayCount' => ({required Object day}) => 'Day ${day}',
			'ui.dayNumber' => ({required Object number}) => 'day ${number}',
			'ui.delete' => 'Delete',
			'ui.deleteAccount' => 'Delete Account',
			'ui.deleteAccountConfirmation' => 'Are you absolutely sure you want to delete your account?',
			'ui.deleteAccountTitle' => 'Delete Account',
			'ui.deleteAccountWarning' => 'This action cannot be undone. All your data and saved charts will be permanently deleted.',
			'ui.deleteConfirmationWord' => 'DELETE',
			'ui.deleteFreeReadingTitle' => 'Delete your only reading?',
			'ui.deleteFreeReadingWarning' => 'This is your only saved reading. An active subscription is required to generate new readings.',
			'ui.didntReceiveEmail' => 'Didn\'t receive the email?',
			'ui.discoverHeartOfRelationship' => 'Discover the heart of a relationship through its synastry',
			'ui.dontHaveAccount' => 'Don\'t have an account?',
			'ui.dontKnowBirthTime' => 'I don\'t know the birth time',
			'ui.emailAddressCopied' => ({required Object email}) => 'No email app available. Address copied to the clipboard: ${email}',
			'ui.noPurchasesToRestore' => 'No App Store subscription to restore',
			'ui.passwordChanged' => 'Password changed',
			'ui.passwordSetupLinkSent' => ({required Object email}) => 'Link sent to ${email}',
			'ui.repeatedTimeFirst' => 'The first time, during daylight saving time',
			'ui.repeatedTimeSecond' => 'The second time, during standard time',
			'ui.downgrade' => 'Downgrade to Standard',
			'ui.downloadPdf' => 'Download PDF',
			'ui.edit' => 'Edit',
			'ui.editBirthChart' => 'Edit Birth Chart',
			'ui.editDaily' => 'Edit daily newsletter',
			'ui.editMonthly' => 'Edit monthly newsletter',
			'ui.email' => 'Email',
			'ui.emailAlreadyExists' => 'This email address is already registered',
			'ui.emailNotifications' => 'Horoscope by email',
			'ui.emailSentSuccessfully' => 'Email sent successfully',
			'ui.english' => 'English',
			'ui.enterNewPassword' => 'Enter new password',
			'ui.errorCreatingBirthChart' => ({required Object error}) => 'Error creating birth chart: ${error}',
			'ui.errorLoadingChart' => ({required Object error}) => 'Error loading chart: ${error}',
			'ui.errorLoadingSavedCharts' => 'Error loading saved charts',
			'ui.errorMessageCopied' => 'Error message copied to clipboard',
			'ui.errorOpeningUrl' => 'Error opening URL',
			'ui.errorTitle' => 'Error',
			'ui.exploreOtherPlans' => 'Explore other plans',
			'ui.failedToLoadSubscriptions' => 'Failed to load subscriptions',
			'ui.familyNameRequired' => 'Last name is required',
			'ui.finish' => 'Finish',
			'ui.firstName' => 'First name',
			'ui.firstQuarter' => 'First quarter',
			'ui.forSearchTerm' => ({required Object term}) => 'for "${term}"',
			'ui.forgotPassword' => 'Forgot Password?',
			'ui.fourMonthsFree' => '4 months FREE',
			'ui.fullMoon' => 'Full moon',
			'ui.gender' => 'Gender',
			'ui.genderMan' => 'Man',
			'ui.genderNonBinary' => 'Non-binary',
			'ui.genderPreferNotToSay' => 'Prefer not to say',
			'ui.genderWoman' => 'Woman',
			'ui.generateAnalysis' => 'Generate Analysis',
			'ui.generateDailyTransit' => 'Generate Daily Transit',
			'ui.generateDetailedCompatibilityAnalysis' => ({required Object relationshipTitle}) => 'Generate a detailed compatibility analysis between ${relationshipTitle}',
			'ui.generateMonthlyTransit' => 'Generate Monthly Transit',
			'ui.generateReading' => 'Generate reading',
			'ui.generateReadingAction' => 'Generate reading',
			'ui.generating' => 'Generating...',
			'ui.generatingPdf' => 'Generating PDF...',
			'ui.generatingReading' => 'Generating reading...',
			'ui.generatingTopic' => ({required Object topic}) => 'Generating: ${topic}...',
			'ui.getFullReading' => 'Get full reading',
			'ui.getStarted' => 'GET STARTED',
			'ui.givenNameRequired' => 'First name is required',
			'ui.goHome' => 'Go to Home',
			'ui.goToHome' => 'Go to Home',
			'ui.goToLogin' => 'Login',
			'ui.appleSignInError' => ({required Object error}) => 'Apple Sign-In error: ${error}',
			'ui.appleSignUpError' => ({required Object error}) => 'Apple Sign-Up error: ${error}',
			'ui.changeEmail' => 'Change email',
			'ui.confirmingEmail' => 'Confirming your email',
			'ui.emailChangeConfirmed' => 'Email updated',
			'ui.emailChangeLinkSent' => ({required Object email}) => 'We\'ve sent a confirmation link to ${email}. Open it to finish the change',
			'ui.googleSignInError' => ({required Object error}) => 'Google Sign-In error: ${error}',
			'ui.googleSignInSuccessful' => 'Successfully signed in with Google',
			'ui.googleSignUpError' => ({required Object error}) => 'Google Sign-Up error: ${error}',
			'ui.googleSignUpSuccessful' => 'Successfully signed up with Google',
			'ui.hideOtherPlans' => 'Hide other plans',
			'ui.homeTitle' => 'Home',
			'ui.horoscopeNewsletter' => 'Daily and monthly horoscope newsletter',
			'ui.invalidEmail' => 'Please enter a valid email address',
			'ui.invalidResetToken' => 'Invalid or expired reset token',
			'ui.italian' => 'Italian',
			'ui.language' => 'Language',
			'ui.languageEnglish' => 'English',
			'ui.languageItalian' => 'Italian',
			'ui.lastName' => 'Last name',
			'ui.lastQuarter' => 'Last quarter',
			'ui.lightMode' => 'Light',
			'ui.loadingImage' => 'Loading image...',
			'ui.loadingSubscriptions' => 'Loading subscriptions...',
			'ui.login' => 'Login',
			'ui.loginRequiredForFullReading' => 'Please login to get your complete reading',
			'ui.loginRequiredForSubscription' => 'Sign in or create an account to subscribe',
			'ui.loginSuccessful' => 'Login successful!',
			'ui.loginToAccount' => 'Login to your account',
			'ui.logout' => 'Logout',
			'ui.logoutSuccessful' => 'Logout successful',
			'ui.lunarPhase' => 'Lunar phase',
			'ui.manageSubscription' => 'Manage subscription',
			'ui.moneyBackGuarantee' => '30-day money-back guarantee',
			'ui.monthPeriod' => 'month',
			'ui.monthly' => 'Monthly',
			'ui.monthlyPredictions' => 'Monthly predictions',
			'ui.monthlyPredictionsContent' => 'Your monthly astrological predictions.',
			'ui.monthlyPredictionsTitle' => 'Monthly Predictions',
			'ui.monthlySkyOf' => 'Sky of the month',
			'ui.monthlyTransitGraph' => 'Monthly transit chart',
			'ui.monthlyTransitOf' => ({required Object name}) => 'Monthly transit of ${name}',
			'ui.monthlyTransitsCountPlural' => ({required Object count}) => '${count} saved monthly transits',
			'ui.monthlyTransitsCountSingular' => '1 saved monthly transit',
			'ui.monthlyTransitsFilter' => 'Monthly transits',
			'ui.name' => 'Name',
			'ui.needBirthChartForPredictions' => 'You need a birth chart first for predictions',
			'ui.needTwoBirthChartsForSynastry' => 'To create a synastry you need at least two saved birth charts.',
			'ui.networkErrorOccurred' => 'Network error occurred',
			'ui.newEmail' => 'New email',
			'ui.newsletterNeedsEmail' => 'Add an email to your profile to receive the horoscope by email.',
			'ui.newImprovedVersion' => 'New improved version',
			'ui.newMoon' => 'New moon',
			'ui.newPassword' => 'New password',
			'ui.newsletterType' => 'Newsletter type',
			'ui.next' => 'Next',
			'ui.nextRenewal' => 'Next renewal',
			'ui.noActiveSubscription' => 'No subscription',
			'ui.noNewsletterSubscriptions' => 'No active horoscope by email',
			'ui.noResultsFound' => 'No results found',
			'ui.noSavedAnalyses' => 'No saved analyses',
			'ui.noSavedAnalysesDescription' => 'Analyses you save will appear here.',
			'ui.noSavedBirthCharts' => 'No saved birth charts',
			'ui.noSavedBirthChartsDescription' => 'Birth charts you save will appear here.',
			'ui.noSavedCharts' => 'No saved charts',
			'ui.noSavedChartsDescription' => 'Birth charts you save will appear here.',
			'ui.noSavedDailyTransits' => 'No saved daily transits',
			'ui.noSavedDailyTransitsDescription' => 'Daily transits you generate will appear here.',
			'ui.noSavedMonthlyTransits' => 'No saved monthly transits',
			'ui.noSavedMonthlyTransitsDescription' => 'Monthly transits you generate will appear here.',
			'ui.noSavedSynastries' => 'No saved synastries',
			'ui.noSavedSynastriesDescription' => 'Synastries you create will appear here.',
			'ui.notProvided' => 'Not provided',
			'ui.oneMonthFree' => '1 month FREE',
			'ui.oneMoreChartNeeded' => 'You have one chart. Create a second for synastry',
			'ui.or' => 'OR',
			'ui.password' => 'Password',
			'ui.passwordResetSuccessful' => 'Password reset successful',
			'ui.passwordTooShort' => 'Password must be at least 8 characters long',
			'ui.passwordsDoNotMatch' => 'Passwords do not match',
			'ui.pdfDownloadedSuccessfully' => 'PDF downloaded successfully',
			'ui.pdfGenerationError' => ({required Object error}) => 'Error generating PDF: ${error}',
			'ui.person' => 'Person',
			'ui.personA' => 'Person A',
			'ui.personB' => 'Person B',
			'ui.personal' => 'Personal',
			'ui.personalInfo' => 'Personal Information',
			'ui.personalityTitle' => 'Personality',
			'ui.place' => ({required Object place}) => 'Place: ${place}',
			'ui.placeOfBirth' => 'Place of Birth',
			'ui.pleaseEnterFirstName' => 'Please enter first name',
			'ui.pleaseEnterLastName' => 'Please enter last name',
			'ui.pleaseFillAllFields' => 'Please fill all required fields',
			'ui.pleaseLoginToSaveCharts' => 'Please login to save birth charts to your account. Without login, charts cannot be saved for future use.',
			'ui.pleaseSelectBirthChart' => 'Please select a birth chart',
			'ui.pleaseSelectBirthDate' => 'Please select a birth date',
			'ui.pleaseSelectBirthPlace' => 'Please select a birth place',
			'ui.pleaseSelectBirthTime' => 'Please select birth time',
			'ui.pleaseSelectDate' => 'Please select a date',
			'ui.pleaseSelectLocation' => 'Please select a location',
			'ui.portalReturnMessage' => 'You can close this window and return to the app.',
			'ui.portalReturnTitle' => 'Done',
			'ui.predictionsTitle' => 'Forecast',
			'ui.preferences' => 'Preferences',
			'ui.premiumAnnual' => 'Premium - annual',
			'ui.premiumMonthly' => 'Premium - monthly',
			'ui.premiumRequiredForDailyTransit' => 'Premium subscription required to generate daily transit readings',
			'ui.premiumRequiredForMonthlyTransit' => 'Premium subscription required to generate monthly transit readings',
			'ui.premiumRequiredForRegeneration' => 'To regenerate this reading in another language you need a premium subscription',
			'ui.premiumRequiredForSynastry' => 'Premium subscription required to create couple compatibility analyses',
			'ui.premiumSemiannual' => 'Premium - semiannual',
			'ui.preparingReading' => 'Preparing reading...',
			'ui.previewDescription' => 'Sign in or create an account to access your complete reading',
			'ui.previewTitle' => 'Your birth chart awaits',
			'ui.previous' => 'Previous',
			'ui.processingUnsubscribeRequest' => 'Processing unsubscribe request...',
			'ui.profile' => 'Profile',
			'ui.profileTitle' => 'Profile',
			'ui.profileUpdatedSuccessfully' => 'Profile updated successfully',
			'ui.reactivateSubscription' => 'Reactivate',
			'ui.read' => 'Read',
			'ui.readingAvailable' => 'Reading available',
			'ui.readingGeneratedIn' => ({required Object language}) => 'This reading was generated in ${language}',
			'ui.readingGeneratedSuccessfully' => 'Reading generated successfully!',
			'ui.recommendedPlan' => 'BEST VALUE',
			'ui.regenerateInLanguage' => ({required Object language}) => 'Regenerate in ${language}',
			'ui.regenerateReading' => 'Regenerate reading',
			'ui.register' => 'Register',
			'ui.relationshipsTitle' => 'Relationships',
			'ui.remove' => 'Remove',
			'ui.removeChart' => 'Remove chart',
			'ui.removeChartConfirmation' => ({required Object name}) => 'Are you sure you want to remove "${name}" from saved charts?',
			'ui.removeFromPersonal' => 'Not my theme',
			'ui.removeFromSaved' => 'Remove from saved',
			'ui.resendEmail' => 'Resend email',
			'ui.resetLinkSent' => ({required Object email}) => 'We\'ve sent a password reset link to ${email}',
			'ui.resetPassword' => 'Reset password',
			'ui.resetPasswordTitle' => 'Reset your password',
			'ui.restorePurchases' => 'Restore purchases',
			'ui.retry' => 'Retry',
			'ui.save' => 'Save',
			'ui.save20Percent' => 'Save 20%',
			'ui.save33Percent' => 'Save 33%',
			'ui.save40Percent' => 'Save 40%',
			'ui.saveAmount' => ({required Object amount}) => 'SAVE ${amount}/YEAR',
			'ui.saveChanges' => 'Save changes',
			'ui.savePassword' => 'Save password',
			'ui.savePdfDialogTitle' => 'Save PDF',
			'ui.savedChartsTitle' => 'Saved analyses',
			'ui.searchBirthCharts' => 'Search birth charts...',
			'ui.searchByNameOrPlace' => 'Search by name or place',
			'ui.searchCharts' => 'Search charts...',
			'ui.searchDailyTransits' => 'Search daily transits...',
			'ui.searchInProgress' => 'Search in progress...',
			'ui.searchMonthlyTransits' => 'Search monthly transits...',
			'ui.searchSynastries' => 'Search synastries...',
			'ui.selectChart' => 'Select chart',
			'ui.selectDate' => 'Select Date',
			'ui.selectLocation' => 'Select location',
			'ui.selectMonth' => 'Select Month',
			'ui.semiannual' => 'Semiannual',
			'ui.sendConfirmationLink' => 'Send confirmation link',
			'ui.sendLink' => 'Send link',
			'ui.sendResetLink' => 'Send reset link',
			'ui.serverUnavailable' => 'We\'re making some improvements. Back in a moment!',
			'ui.setAsPersonal' => 'This is my theme',
			'ui.setPassword' => 'Set password',
			'ui.setPasswordDescription' => ({required Object email}) => 'We will send a link to ${email} to choose a password. Then you can also sign in with your email.',
			'ui.setPasswordNeedsEmail' => 'Add an email to your account first, so we can send you the link to choose a password.',
			'ui.settingsTitle' => 'Settings',
			'ui.sevenDaysFreeTrial' => '7 days of free trial',
			'ui.sharePdf' => 'Share PDF',
			'ui.signIn' => 'Sign in',
			'ui.signUp' => 'Sign up',
			'ui.sixMonthsPeriod' => '6 months',
			'ui.standardAnnual' => 'Standard - annual',
			'ui.standardMonthly' => 'Standard - monthly',
			'ui.standardSemiannual' => 'Standard - semiannual',
			'ui.startFreeSevenDays' => 'START FREE - 7 DAYS',
			'ui.startNow' => 'Start now',
			'ui.subscribeSuccess' => 'Successfully subscribed to newsletter',
			'ui.subscribeToDaily' => 'Subscribe to daily horoscope',
			'ui.subscribeToMonthly' => 'Subscribe to monthly horoscope',
			'ui.subscriptionActivated' => 'Subscription activated successfully!',
			'ui.subscriptionActive' => 'Active',
			'ui.subscriptionAmount' => 'Amount',
			'ui.subscriptionCancelledSuccessfully' => 'Subscription cancelled successfully',
			'ui.subscriptionCancelsOn' => 'Ends on',
			'ui.subscriptionConfirmationFailed' => 'Failed to confirm subscription. Please contact support',
			'ui.subscriptionEndDate' => 'Renews on',
			'ui.subscriptionIncomplete' => 'Payment Incomplete',
			_ => null,
		} ?? switch (path) {
			'ui.subscriptionManagedElsewhere' => 'This subscription was purchased outside the App Store: you can manage it on the website',
			'ui.subscriptionPastDue' => 'Payment Overdue',
			'ui.subscriptionPurchasedOnAndroid' => 'This subscription was purchased in the Android app: you can manage it there or on the website',
			'ui.subscriptionPurchasedOnLinux' => 'This subscription was purchased in the Linux app: you can manage it there or on the website',
			'ui.subscriptionPurchasedOnWeb' => 'This subscription was purchased on the website: you can manage it there',
			'ui.subscriptionPurchasedOnWindows' => 'This subscription was purchased in the Windows app: you can manage it there or on the website',
			'ui.subscriptionRequiredForRegeneration' => 'To regenerate this reading in another language you need a subscription (standard is enough)',
			'ui.subscriptionStartDate' => 'Started on',
			'ui.subscriptionSuccessGoHome' => 'Go to home',
			'ui.subscriptionSuccessMessagePremium' => 'Thank you for your support. You now have access to all features.',
			'ui.subscriptionSuccessMessageStandard' => 'Thank you for your support. You can now read unlimited birth charts.',
			'ui.subscriptionSuccessTitle' => 'Welcome to AstroGods!',
			'ui.subscriptionSuccessTrialInfo' => 'Your 7-day trial has started',
			'ui.subscriptionTrialing' => 'Trial',
			'ui.subscriptionUnpaid' => 'Payment Failed',
			'ui.subtitlePart1' => 'Align',
			'ui.subtitlePart2' => 'with your',
			'ui.subtitlePart3' => 'sky',
			'ui.surname' => 'Surname',
			'ui.swipeToView' => 'Swipe to view',
			'ui.synastriesCountPlural' => ({required Object count}) => '${count} saved synastries',
			'ui.synastriesCountSingular' => '1 saved synastry',
			'ui.synastriesFilter' => 'Synastries',
			'ui.synastry' => 'Synastry',
			'ui.synastryBetween' => ({required Object person1, required Object person2}) => 'Synastry between ${person1} and ${person2}',
			'ui.synastryDescription' => 'Synastry is the art of comparing two birth charts to understand the dynamics of a relationship.',
			'ui.synastryGraph' => 'Synastry chart',
			'ui.synastryNotFound' => 'Synastry not found',
			'ui.synastryRemovedFromSaved' => 'Synastry removed from saved',
			'ui.systemMode' => 'System',
			'ui.termsOfService' => 'Terms of Service',
			'ui.theme' => 'Theme',
			'ui.thenPrice' => ({required Object price, required Object period}) => 'Then ${price}/${period}',
			'ui.timeOfBirth' => 'Time of Birth',
			'ui.transitDate' => 'Transit date',
			'ui.transitDescription' => 'Transits are the movements of planets that, passing over natal sky positions, activate temporary astrological influences.',
			'ui.transitFor' => 'Transit for',
			'ui.transitInformation' => 'Transit information',
			'ui.transitLocation' => 'Transit location',
			'ui.transitPeriod' => 'Transit period',
			'ui.transitRemovedFromSaved' => 'Transit removed from saved',
			'ui.tryAgain' => 'Try again',
			'ui.typeDeleteToConfirm' => 'Type DELETE to confirm',
			'ui.unknown' => 'Unknown',
			'ui.unknownErrorOccurred' => 'Unknown error occurred',
			'ui.unknownTime' => 'Unknown',
			'ui.unsubscribe' => 'Unsubscribe',
			'ui.unsubscribeError' => 'Failed to unsubscribe',
			'ui.unsubscribeSuccess' => 'Successfully unsubscribed from newsletter',
			'ui.unsubscribeSuccessMessage' => 'You will no longer receive these emails. You can resubscribe anytime from your account settings.',
			'ui.unveilHeart' => 'Unveil the heart of a person through their birth chart',
			'ui.updateNow' => 'Update',
			'ui.updatePaymentMethod' => 'Update Payment Method',
			'ui.updateRequired' => 'Just a moment!',
			'ui.updateSuccess' => 'Newsletter updated successfully',
			'ui.upgrade' => 'Upgrade to Premium',
			'ui.userDefinition' => 'Indicates any natural person who uses AstroGods.',
			'ui.userDefinitionTitle' => 'User (or You)',
			'ui.userNotFound' => 'User not found',
			'ui.viewChart' => 'View chart',
			'ui.viewPlans' => 'View plans',
			'ui.viewReading' => 'View reading',
			'ui.visitSource' => 'Visit source',
			'ui.waningCrescent' => 'Waning crescent',
			'ui.waningGibbous' => 'Waning gibbous',
			'ui.waxingCrescent' => 'Waxing crescent',
			'ui.waxingGibbous' => 'Waxing gibbous',
			'ui.welcomeBack' => 'Welcome back!',
			'ui.withoutBirthTimeWarning' => 'Without the time of birth the reading will not take the Ascendant into account',
			'ui.yearPeriod' => 'year',
			_ => null,
		};
	}
}
