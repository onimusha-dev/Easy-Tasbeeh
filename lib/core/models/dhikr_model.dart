class DhikrReference {
  final String text;
  final String source;

  const DhikrReference({required this.text, required this.source});
}

abstract class DhikrItem {
  String get id;
  String get arabic;
  String get transliteration;
  String get translation;
  String? get category;
  String? get benefit;
  String? get explanation;
  List<DhikrReference>? get references;

  const DhikrItem();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DhikrItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

class BaseDhikrItem extends DhikrItem {
  @override
  final String id;
  @override
  final String arabic;
  @override
  final String transliteration;
  @override
  final String translation;
  @override
  final String? category;
  @override
  final String? benefit;
  @override
  final String? explanation;
  @override
  final List<DhikrReference>? references;

  const BaseDhikrItem({
    required this.id,
    required this.arabic,
    required this.transliteration,
    required this.translation,
    this.category,
    this.benefit,
    this.explanation,
    this.references,
  });
}

const List<DhikrItem> dhikrList = [
  // ── Common & Daily Adhkar ───────────────────────────────────────────
  BaseDhikrItem(
    id: 'subhanallah',
    arabic: 'سُبْحَانَ اللَّهِ',
    transliteration: 'SubhanAllah',
    translation: 'Glory be to Allah',
    category: 'Praise',
    benefit: 'Cleanses the record of deeds and plants trees in Paradise.',
    explanation: 'Declaring Allah is free from any imperfection.',
    references: [
      DhikrReference(
        text: 'Whoever says it 100 times, 1000 good deeds are recorded.',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'alhamdulillah',
    arabic: 'الْحَمْدُ لِلَّهِ',
    transliteration: 'Alhamdulillah',
    translation: 'All praise is due to Allah',
    category: 'Gratitude',
    benefit: 'Fills the scales of good deeds.',
    explanation: 'Expression of gratitude and recognition of Allah\'s favors.',
    references: [
      DhikrReference(
        text: 'Alhamdulillah fills the scales.',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahu_akbar',
    arabic: 'اللَّهُ أَكْبَرُ',
    transliteration: 'Allahu Akbar',
    translation: 'Allah is the Greatest',
    category: 'Praise',
    benefit: 'Great reward and declaration of Allah\'s supremacy.',
    explanation: 'Affirming that Allah is greater than everything else.',
  ),

  BaseDhikrItem(
    id: 'la_ilaha_illallah',
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ',
    transliteration: 'La ilaha illallah',
    translation: 'There is no god but Allah',
    category: 'Tawheed',
    benefit: 'The best form of remembrance and key to Paradise.',
    explanation: 'The fundamental declaration of monotheism in Islam.',
    references: [
      DhikrReference(
        text: 'The best remembrance is La ilaha illallah.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'astaghfirullah',
    arabic: 'أَسْتَغْفِرُ اللَّهَ',
    transliteration: 'Astaghfirullah',
    translation: 'I seek Allah\'s forgiveness',
    category: 'Forgiveness',
    benefit: 'Opens doors to mercy, provision, and relief from stress.',
    explanation: 'Constantly seeking forgiveness is a sunnah of the Prophet ﷺ.',
    references: [
      DhikrReference(
        text: 'The Prophet ﷺ sought forgiveness more than 70 times a day.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'subhanallahi_wa_bihamdihi_azeem',
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ، سُبْحَانَ اللَّهِ الْعَظِيمِ',
    transliteration: 'SubhanAllahi wa bihamdihi, SubhanAllahil Azeem',
    translation: 'Glory and praise be to Allah, Glory be to Allah the Almighty',
    category: 'Praise',
    benefit: 'Light on the tongue, heavy on the scales.',
    explanation: 'Two phrases that are beloved to the Most Merciful.',
    references: [
      DhikrReference(
        text: 'Beloved to the Merciful, light on tongue, heavy on scales.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'la_hawla_wa_la_quwwata',
    arabic: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللَّهِ',
    transliteration: 'La hawla wa la quwwata illa billah',
    translation: 'There is no power or might except with Allah',
    category: 'Reliance',
    benefit: 'A treasure from the treasures of Paradise.',
    explanation: 'Admitting our complete dependence on Allah\'s power.',
    references: [
      DhikrReference(
        text: 'It is a treasure from the treasures of Paradise.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'hasbunallahu_wa_nimal_wakeel',
    arabic: 'حَسْبُنَا اللَّهُ وَنِعْمَ الْوَكِيلُ',
    transliteration: 'Hasbunallahu wa ni\'mal wakeel',
    translation:
        'Allah is sufficient for us, and He is the best Disposer of affairs',
    category: 'Reliance',
    benefit: 'Brings peace and protection in times of fear or distress.',
    explanation: 'Said by Ibrahim (AS) when thrown into the fire.',
    references: [
      DhikrReference(
        text: 'Allah is sufficient for us.',
        source: 'Quran 3:173',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'salawat',
    arabic: 'اللَّهُمَّ صَلِّ عَلَى مُحَمَّدٍ وَعَلَى آلِ مُحَمَّدٍ',
    transliteration: 'Allahumma salli ala Muhammadin wa ala ali Muhammad',
    translation:
        'O Allah, send blessings upon Muhammad and the family of Muhammad',
    category: 'Salawat',
    benefit: 'Allah sends ten blessings for every one salawat.',
    explanation: 'A way to show love and respect for the Prophet ﷺ.',
    references: [
      DhikrReference(
        text: 'Whoever sends one blessing, Allah sends ten.',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'la_ilaha_illallahu_wahdahu',
    arabic:
        'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    transliteration:
        'La ilaha illallahu wahdahu la sharika lah, lahul mulku wa lahul hamdu wa huwa ala kulli shayin qadeer',
    translation:
        'None has the right to be worshipped but Allah alone, He has no partner...',
    category: 'Tawheed',
    benefit: 'Immense reward, equivalent to freeing 10 slaves.',
    explanation: 'Reciting 100 times daily protects from Shaytan.',
    references: [
      DhikrReference(
        text: 'Whoever says it 100 times gets the reward of freeing 10 slaves.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  // ── Advanced & Specialized Adhkar ────────────────────────────────────
  BaseDhikrItem(
    id: 'sayyidul_istighfar',
    arabic:
        'اللَّهُمَّ أَنْتَ رَبِّي لَا إِلَهَ إِلَّا أَنْتَ خَلَقْتَنِي وَأَنَا عَبْدُكَ وَأَنَا عَلَى عَهْدِكَ وَوَعْدِكَ مَا اسْتَطَعْتُ أَعُوذُ بِكَ مِنْ شَرِّ مَا صَنَعْتُ أَبُوءُ لَكَ بِنِعْمَتِكَ عَلَيَّ وَأَبُوءُ لَكَ بِذَنْبِي فَاغْفِرْ لِي فَإِنَّهُ لَا يَغْفِرُ الذُّنُوبَ إِلَّا أَنْتَ',
    transliteration:
        'Allahumma anta rabbi la ilaha illa anta khalaqtani wa ana abduka wa ana ala ahdika wa wa’dika ma-stata’tu, a’udhu bika min sharri ma sana’tu, abu’u laka bi ni’matika alayya wa abu’u laka bi dhanbi faghfir li fa-innahu la yaghfiru-dh-dhunuba illa ant',
    translation:
        'O Allah, You are my Lord, none has the right to be worshipped except You...',
    category: 'Forgiveness',
    benefit: 'Guarantee of Paradise if said with sincerity.',
    explanation: 'The master supplication for seeking forgiveness.',
    references: [
      DhikrReference(
        text:
            'Whoever says it during the day/night and dies, will be from Paradise.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'juwayriyah_dhikr',
    arabic:
        'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ عَدَدَ خَلْقِهِ وَرِضَا نَفْسِهِ وَزِنَةَ عَرْشِهِ وَمِدَادَ كَلِمَاتِهِ',
    transliteration:
        'SubhanAllahi wa bihamdihi adada khalqihi wa rida nafsihi wa zinata arshihi wa midada kalimatihi',
    translation:
        'Glory and praise be to Allah, as much as the number of His creation...',
    category: 'Praise',
    benefit: 'Reward equal to many hours of dhikr.',
    explanation: 'Taught by the Prophet ﷺ to his wife Juwayriyah (RA).',
    references: [
      DhikrReference(
        text: 'I said four words after I left you...',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'ya_hayyu_ya_qayyum',
    arabic: 'يَا حَيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ',
    transliteration: 'Ya Hayyu Ya Qayyum bi rahmatika astagheeth',
    translation: 'O Ever-Living, O Self-Sustaining, by Your mercy I seek help',
    category: 'Relief',
    benefit: 'Relief from distress and anxiety.',
    explanation: 'A powerful call using Allah\'s greatest names.',
    references: [
      DhikrReference(
        text: 'The Prophet ﷺ used to say this when distressed.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'hasbiyallahu_7x',
    arabic:
        'حَسْبِيَ اللَّهُ لَا إِلَهَ إِلَّا هُوَ عَلَيْهِ تَوَكَّلْتُ وَهُوَ رَبُّ الْعَرْشِ الْعَظِيمِ',
    transliteration:
        'Hasbiyallahu la ilaha illa huwa alayhi tawakkaltu wa huwa rabbul arshil azeem',
    translation: 'Allah is sufficient for me, there is no god but Him...',
    category: 'Reliance',
    benefit: 'Allah will suffice your worries of this world and the next.',
    explanation: 'Recommended to be said 7 times in morning and evening.',
    references: [
      DhikrReference(
        text: 'Whoever says it 7 times morning/evening...',
        source: 'Abu Dawud',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'rabbana_atina',
    arabic:
        'رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً وَقِنَا عَذَابَ النَّارِ',
    transliteration:
        'Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan wa qina adhaban-nar',
    translation:
        'Our Lord, give us in this world that which is good and in the Hereafter...',
    category: 'Quranic Dua',
    benefit: 'The most comprehensive dua for all goodness.',
    explanation:
        'Commonly recited during Tawaaf and at the end of many prayers.',
    references: [
      DhikrReference(
        text: 'The most frequent dua of the Prophet ﷺ.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'dua_yunus',
    arabic:
        'لَا إِلَهَ إِلَّا أَنْتَ سُبْحَانَكَ إِنِّي كُنْتُ مِنَ الظَّالِمِينَ',
    transliteration: 'La ilaha illa anta subhanaka inni kuntu minadh-dhalimin',
    translation:
        'There is no god but You, Glory be to You, I have been of the wrongdoers',
    category: 'Forgiveness',
    benefit: 'Allah answers the prayer of whoever makes this dua.',
    explanation: 'The dua of Prophet Yunus (AS) inside the whale.',
    references: [
      DhikrReference(
        text: 'No Muslim ever prays with these words but Allah answers him.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'bismillahilladhi',
    arabic:
        'بِسْمِ اللَّهِ الَّذِي لَا يَضُرُّ مَعَ اسْمِهِ شَيْءٌ فِي الْأَرْضِ وَلَا فِي السَّمَاءِ وَهُوَ السَّمِيعُ الْعَلِيمُ',
    transliteration:
        'Bismillahilladhi la yadurru ma\'as-mihi shay\'un fil-ardi wa la fis-samai wa huwas-sami’ul-aleem',
    translation: 'In the name of Allah, with whose name nothing can harm...',
    category: 'Protection',
    benefit: 'Protection from all harm throughout the day or night.',
    explanation: 'Sunnah to recite 3 times in morning and evening.',
    references: [
      DhikrReference(
        text: 'Nothing will harm him until the morning/evening.',
        source: 'Abu Dawud',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'raditu_billah',
    arabic:
        'رَضِيتُ بِاللَّهِ رَبًّا وَبِالْإِسْلَامِ دِينًا وَبِمُحَمَّدٍ نَبِيًّا',
    transliteration:
        'Raditu billahi rabba wa bil-islami deena wa bi Muhammadin nabiya',
    translation:
        'I am pleased with Allah as Lord, Islam as religion, and Muhammad ﷺ as Prophet',
    category: 'Faith',
    benefit: 'Guarantees the pleasure of Allah on the Day of Judgment.',
    explanation: 'Recommended 3 times in morning and evening.',
    references: [
      DhikrReference(
        text: 'Allah will surely please him on the Day of Resurrection.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'ya_muqallibal_qulub',
    arabic: 'يَا مُقَلِّبَ الْقُلُوبِ ثَبِّتْ قَلْبِي عَلَى دِينِكَ',
    transliteration: 'Ya Muqallibal qulub, thabbit qalbi ala deenik',
    translation: 'O Turner of hearts, keep my heart firm on Your religion',
    category: 'Steadfastness',
    benefit: 'Protection of faith and heart.',
    explanation: 'A very frequent dua of the Prophet ﷺ.',
    references: [
      DhikrReference(
        text: 'The Prophet ﷺ used to say this very often.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_ajirni_minan_nar',
    arabic: 'اللَّهُمَّ أَجِرْنِي مِنَ النَّارِ',
    transliteration: 'Allahumma ajirni minan-nar',
    translation: 'O Allah, protect me from the Fire',
    category: 'Protection',
    benefit: 'Protection from Hellfire.',
    explanation: 'Recommended 7 times after Fajr and Maghrib.',
    references: [
      DhikrReference(
        text:
            'If you say it 7 times and die that night/day, you are protected.',
        source: 'Abu Dawud',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_antas_salam',
    arabic:
        'اللَّهُمَّ أَنْتَ السَّلَامُ وَمِنْكَ السَّلَامُ، تَبَارَكْتَ ذَا الْجَلَالِ وَالْإِكْرَامِ',
    transliteration:
        'Allahumma antas-salamu wa minkas-salamu, tabarakta dhal-jalali wal-ikram',
    translation: 'O Allah, You are Peace and from You comes peace...',
    category: 'After Prayer',
    benefit: 'Sunnah dhikr after every obligatory prayer.',
    explanation: 'Acknowledging Allah as the source of all peace.',
    references: [
      DhikrReference(
        text: 'The Prophet ﷺ would say this after finishing prayer.',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahummaghfir_li_dhanbi',
    arabic:
        'اللَّهُمَّ اغْفِرْ لِي ذَنْبِي كُلَّهُ، دِقَّهُ وَجِلَّهُ، وَأَوَّلَهُ وَآخِرَهُ وَعَلَانِيَتَهُ وَسِرَّهُ',
    transliteration:
        'Allahummagh-fir li dhanbi kullahu, diqqahu wa jillahu, wa awwalahu wa akhirahu wa alaniyatahu wa sirrah',
    translation:
        'O Allah, forgive me all my sins, small and great, first and last...',
    category: 'Forgiveness',
    benefit: 'Comprehensive seeking of forgiveness.',
    explanation: 'A beautiful dua for total forgiveness.',
    references: [
      DhikrReference(
        text: 'Prophet ﷺ used to say this in prostration (Sajdah).',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_inni_asaluka_afwa',
    arabic:
        'اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ فِي الدُّنْيَا وَالْآخِرَةِ',
    transliteration:
        'Allahumma inni as\'alukal-afwa wal-afiyah fid-dunya wal-akhirah',
    translation:
        'O Allah, I ask You for forgiveness and well-being in this world and the next',
    category: 'Well-being',
    benefit: 'Comprehensive protection and health.',
    explanation: 'The Prophet ﷺ never failed to say this morning and evening.',
    references: [
      DhikrReference(
        text: 'Ask Allah for forgiveness and health.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'market_dua',
    arabic:
        'لَا إِلَهَ إِلَّا اللَّهُ وَحْدَهُ لَا شَرِيكَ لَهُ، لَهُ الْمُلْكُ وَلَهُ الْحَمْدُ، يُحْيِي وَيُمِيتُ، وَهُوَ حَيٌّ لَا يَمُوتُ، بِيَدِهِ الْخَيْرُ، وَهُوَ عَلَى كُلِّ شَيْءٍ قَدِيرٌ',
    transliteration:
        'La ilaha illallahu wahdahu la sharika lah, lahul mulku wa lahul hamdu, yuhyi wa yumeetu, wa huwa hayyun la yamootu, biyadihil khayru, wa huwa ala kulli shayin qadeer',
    translation:
        'None has the right to be worshipped but Allah alone... He gives life and causes death...',
    category: 'Market',
    benefit: 'One million good deeds, one million sins wiped, rank raised.',
    explanation: 'Recite when entering a marketplace or busy area.',
    references: [
      DhikrReference(
        text: 'Whoever enters the market and says this...',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'rabbi_inny_lima_anzalta',
    arabic: 'رَبِّ إِنِّي لِمَا أَنْزَلْتَ إِلَيَّ مِنْ خَيْرٍ فَقِيرٌ',
    transliteration: 'Rabbi inni lima anzalta ilayya min khayrin faqir',
    translation:
        'My Lord, indeed I am, for whatever good You would send down to me, in need',
    category: 'Quranic Dua',
    benefit: 'A powerful dua for provision and assistance.',
    explanation: 'The dua of Prophet Musa (AS) when he was in need.',
    references: [
      DhikrReference(
        text: 'Dua of Musa (AS) in Surah Al-Qasas.',
        source: 'Quran 28:24',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_bika_asbahna',
    arabic:
        'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ، وَإِلَيْكَ النُّشُورُ',
    transliteration:
        'Allahumma bika asbahna, wa bika amsayna, wa bika nahya, wa bika namootu, wa ilaykan-nushoor',
    translation:
        'O Allah, by You we enter the morning and by You we enter the evening...',
    category: 'Morning',
    benefit: 'Sunnah morning remembrance.',
    explanation: 'Acknowledging Allah\'s control over our life and death.',
    references: [
      DhikrReference(
        text: 'Prophet ﷺ used to teach his companions to say this.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'rabbi_ghfir_li_watub',
    arabic:
        'رَبِّ اغْفِرْ لِي وَتُبْ عَلَيَّ إِنَّكَ أَنْتَ التَّوَّابُ الرَّحِيمُ',
    transliteration:
        'Rabbigh-fir li wa tub alayya innaka antat-tawwabur-raheem',
    translation: 'My Lord, forgive me and accept my repentance...',
    category: 'Forgiveness',
    benefit: 'Sincere repentance using the Prophet\'s words.',
    explanation: 'Prophet ﷺ would say this 100 times in one sitting.',
    references: [
      DhikrReference(
        text: 'We counted him saying this 100 times in one sitting.',
        source: 'Abu Dawud',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahummaghfir_muminin',
    arabic:
        'اللَّهُمَّ اغْفِرْ لِلْمُؤْمِنِينَ وَالْمُؤْمِنَاتِ، وَالْمُسْلِمِينَ وَالْمُسْلِمَاتِ',
    transliteration:
        'Allahummagh-fir lil-mu’minina wal-mu’minat, wal-muslimina wal-muslimat',
    translation:
        'O Allah, forgive the believing men and women, and the Muslim men and women',
    category: 'Intercession',
    benefit: 'A good deed for every single believer ever lived.',
    explanation: 'A way to gain billions of good deeds in seconds.',
    references: [
      DhikrReference(
        text: 'Whoever seeks forgiveness for the believers...',
        source: 'Tabarani',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_ikfini_bihalalika',
    arabic:
        'اللَّهُمَّ اكْفِنِي بِحَلَالِكَ عَنْ حَرَامِكَ، وَأَغْنِنِي بِفَضْلِكَ عَمَّنْ سِوَاكَ',
    transliteration:
        'Allahumma ikfini bihalalika an haramika, wa aghnini bifadlika amman siwak',
    translation:
        'O Allah, suffice me with what is lawful and make me independent of all others...',
    category: 'Provision',
    benefit: 'Relief from debt and financial hardship.',
    explanation: 'Powerful dua for paying off debts.',
    references: [
      DhikrReference(
        text: 'Even if your debt is like a mountain, Allah will pay it.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'astaghfirullah_azeem_alladhi',
    arabic:
        'أَسْتَغْفِرُ اللَّهَ الْعَظِيمَ الَّذِي لَا إِلَهَ إِلَّا هُوَ الْحَيَّ الْقَيُّومَ وَأَتُوبُ إِلَيْهِ',
    transliteration:
        'Astaghfirullahal-azeem alladhi la ilaha illa huwal-hayyul-qayyumu wa atoobu ilayh',
    translation:
        'I seek forgiveness from Allah the Almighty, whom there is no god but Him...',
    category: 'Forgiveness',
    benefit: 'Sins are forgiven even if one fled from battle.',
    explanation: 'A very powerful form of istighfar.',
    references: [
      DhikrReference(
        text: 'Whoever says it, his sins will be forgiven.',
        source: 'Abu Dawud',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'subhanallahi_walhamdulillah',
    arabic:
        'سُبْحَانَ اللَّهِ، وَالْحَمْدُ لِلَّهِ، وَلَا إِلَهَ إِلَّا اللَّهُ، وَاللَّهُ أَكْبَرُ',
    transliteration:
        'SubhanAllahi wal-hamdu lillahi wa la ilaha illallahu wallahu akbar',
    translation: 'Glory be to Allah, all praise is due to Allah...',
    category: 'Praise',
    benefit: 'The most beloved words to Allah.',
    explanation: 'The four words that encompass all praise.',
    references: [
      DhikrReference(
        text: 'The most beloved words to Allah are four.',
        source: 'Sahih Muslim',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'ayah_kursi',
    arabic:
        'اللَّهُ لَا إِلَهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ...',
    transliteration: 'Allahu la ilaha illa huwa al hayyul qayyum...',
    translation: 'Allah — there is no deity except Him, the Ever-Living...',
    category: 'Protection',
    benefit: 'Protection from Shaytan and entry into Paradise.',
    explanation: 'Recited after every prayer and before sleeping.',
    references: [
      DhikrReference(
        text:
            'Whoever recites it after each prayer, nothing prevents him from Jannah but death.',
        source: 'Nasai',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'amanar_rasulu',
    arabic:
        'آمَنَ الرَّسُولُ بِمَا أُنْزِلَ إِلَيْهِ مِنْ رَبِّهِ وَالْمُؤْمِنُونَ...',
    transliteration:
        'Amanar-rasulu bima unzila ilayhi mir-rabbihi wal-muminun...',
    translation: 'The Messenger has believed in what was revealed to him...',
    category: 'Quranic',
    benefit: 'Suffices for the entire night.',
    explanation: 'The last two verses of Surah Al-Baqarah.',
    references: [
      DhikrReference(
        text: 'Whoever recites them at night, they will suffice him.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'last_hashr',
    arabic:
        'هُوَ اللَّهُ الَّذِي لَا إِلَهَ إِلَّا هُوَ عَالِمُ الْغَيْبِ وَالشَّهَادَةِ هُوَ الرَّحْمَنُ الرَّحِيمُ',
    transliteration:
        'Huwa-allahul-ladhi la ilaha illa huwa alimul-ghaybi wash-shahadati huwar-rahmanur-raheem',
    translation:
        'He is Allah, other than whom there is no deity, Knower of the unseen...',
    category: 'Quranic',
    benefit: '70,000 angels pray for you until evening/morning.',
    explanation: 'The last three verses of Surah Al-Hashr.',
    references: [
      DhikrReference(
        text: 'Allah sends 70,000 angels to send blessings upon him.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'three_quls',
    arabic:
        'قُلْ هُوَ اللَّهُ أَحَدٌ ... قُلْ أَعُوذُ بِرَبِّ الْفَلَقِ ... قُلْ أَعُوذُ بِرَبِّ النَّاسِ',
    transliteration:
        'Qul huwallahu ahad... Qul a’oodhu bi rabbil-falaq... Qul a’oodhu bi rabbin-nas',
    translation:
        'Say: He is Allah, the One... Say: I seek refuge in the Lord of the daybreak...',
    category: 'Protection',
    benefit: 'Suffices you against everything.',
    explanation: 'Recite 3 times morning and evening.',
    references: [
      DhikrReference(
        text: 'Recite them 3 times, they will suffice you.',
        source: 'Tirmidhi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'bismillah',
    arabic: 'بِسْمِ اللَّهِ',
    transliteration: 'Bismillah',
    translation: 'In the name of Allah',
    category: 'Daily',
    benefit: 'Barakah (blessing) in every action.',
    explanation: 'Starting every task with the name of Allah.',
    references: [
      DhikrReference(
        text:
            'Every important matter not started with Bismillah is devoid of blessings.',
        source: 'Ahmad',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'allahumma_inni_audhu_hazan',
    arabic:
        'اللَّهُمَّ إِنِّي أَعُوذُ بِكَ مِنَ الْهَمِّ وَالْحَزَنِ، وَالْعَجْزِ وَالْكَسَلِ، وَالْبُخْلِ وَالْجُبْنِ، وَضَلَعِ الدَّيْنِ وَغَلَبَةِ الرِّجَالِ',
    transliteration:
        'Allahumma inni a’udhu bika minal-hammi wal-hazan, wal-ajzi wal-kasal...',
    translation: 'O Allah, I seek refuge in You from anxiety and sorrow...',
    category: 'Relief',
    benefit: 'Freedom from debt and laziness.',
    explanation: 'A comprehensive dua for mental and physical strength.',
    references: [
      DhikrReference(
        text: 'The Prophet ﷺ used to say this often.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'subhanallah_bihamdihi_100',
    arabic: 'سُبْحَانَ اللَّهِ وَبِحَمْدِهِ',
    transliteration: 'SubhanAllahi wa bihamdihi',
    translation: 'Glory and praise be to Allah',
    category: 'Praise',
    benefit: 'Forgiveness of sins even if like the foam of the sea.',
    explanation: 'Recite 100 times daily.',
    references: [
      DhikrReference(
        text: 'Whoever says it 100 times, his sins are forgiven.',
        source: 'Sahih Bukhari',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'la_ilaha_illa_allah_malik',
    arabic: 'لَا إِلَهَ إِلَّا اللَّهُ الْمَلِكُ الْحَقُّ الْمُبِينُ',
    transliteration: 'La ilaha illa-allahul malikul haqqul mubeen',
    translation:
        'There is no god but Allah, the Sovereign, the Truth, the Manifest',
    category: 'Tawheed',
    benefit: 'Safety from poverty and loneliness of the grave.',
    explanation: 'A traditional dhikr for provision.',
    references: [
      DhikrReference(
        text:
            'Whoever says it 100 times, it will be safety for him from poverty.',
        source: 'Khatib Baghdadi',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'rabbi_ghfirli_walidayya',
    arabic: 'رَبِّ اغْفِرْ لِي وَلِوَالِدَيَّ',
    transliteration: 'Rabbigh-fir li wali-walidayya',
    translation: 'My Lord, forgive me and my parents',
    category: 'Parents',
    benefit: 'A way to fulfill the rights of parents.',
    explanation: 'Seeking forgiveness for those who raised us.',
    references: [
      DhikrReference(
        text:
            'A man’s status is raised in Jannah, and he asks: "How is this for me?"...',
        source: 'Ibn Majah',
      ),
    ],
  ),

  BaseDhikrItem(
    id: 'subhanallahi_azeem_wa_bihamdihi',
    arabic: 'سُبْحَانَ اللَّهِ الْعَظِيمِ وَبِحَمْدِهِ',
    transliteration: 'SubhanAllahil-azeemi wa bihamdihi',
    translation: 'Glory be to Allah the Almighty and praise be to Him',
    category: 'Praise',
    benefit: 'A palm tree is planted in Paradise.',
    explanation: 'Simple phrase with a high reward.',
    references: [
      DhikrReference(
        text: 'Whoever says this, a palm tree is planted for him in Jannah.',
        source: 'Tirmidhi',
      ),
    ],
  ),
];
