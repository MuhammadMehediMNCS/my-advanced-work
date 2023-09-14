
class Question {
  final String text;
  final List <Option> Options;
  bool isLocked;
  Option? selectedOption;

  Question ({
    required this.text,
    required this.Options,
    this.isLocked = false,
    this.selectedOption
  });
}

class Option {
  final String text;
  final bool isCorrect;

  const Option ({
    required this.text,
    required this.isCorrect
  });
}

final questions = [
  Question(
    text: "তোমার দেশের সরকারি নাম কী ?",
    Options: [
      const Option(text: 'বাংলাদেশ', isCorrect: false),
      const Option(text: 'গণপ্রজাতন্ত্রী বাংলাদেশ', isCorrect: true),
      const Option(text: 'ভারতবর্ষ', isCorrect: false),
      const Option(text: 'পাকিস্তান', isCorrect: false)
    ]
    ),
  Question(
  text: "বাংলাদেশের রাজধানীর নাম কী ?", 
  Options: [
    const Option(text: 'রাজশাহী', isCorrect: false),
    const Option(text: 'বান্দরবান', isCorrect: false),
    const Option(text: 'ঢাকা', isCorrect: true),
    const Option(text: 'চট্টগ্রাম', isCorrect: false)
  ]
  ),
  Question(
    text: "‘সোয়াচ অব নো গ্রাউন্ড’ খাদটি কোথায় অবস্থিত ?",
    Options: [
      const Option(text: 'উত্তর মহাসাগরে', isCorrect: false),
      const Option(text: 'প্রশান্ত মগাসাগরে', isCorrect: false),
      const Option(text: 'ভারত মগাসাগরে', isCorrect: false),
      const Option(text: 'বঙ্গোপসাগরে', isCorrect: true)
    ]
    ),
  Question(
    text: "বাংলাদেশের সবচেয়ে পূর্ব এর জেলার নাম কী ?",
    Options: [
      const Option(text: 'বান্দরবান', isCorrect: true),
      const Option(text: 'ফেনী', isCorrect: false),
      const Option(text: 'রাঙ্গামাটি', isCorrect: false),
      const Option(text: 'কক্সবাজার', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের সবচেয়ে পশ্চিমের জেলার নাম কী ?",
    Options: [
      const Option(text: 'নওগা', isCorrect: false),
      const Option(text: 'মেহেরপুর', isCorrect: false),
      const Option(text: 'কুষ্টিয়া', isCorrect: false),
      const Option(text: 'চাপায় নবাবগঞ্জ', isCorrect: true)
    ]
    ),
  Question(
    text: "বাংলাদেশের আয়তনে বড় জেলা কোনটি ?",
    Options: [
      const Option(text: 'খুলনা', isCorrect: false),
      const Option(text: 'ঢাকা', isCorrect: false),
      const Option(text: 'রাঙ্গামাটি', isCorrect: true),
      const Option(text: 'চট্টগ্রাম', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের আয়তনে ছোট জেলা কোনটি ?",
    Options: [
      const Option(text: 'কক্সবাজার', isCorrect: false),
      const Option(text: 'মেহেরপুর', isCorrect: true),
      const Option(text: 'কুষ্টিয়া', isCorrect: false),
      const Option(text: 'নওগা', isCorrect: false)
    ]
    ),
  Question(
    text: "জনসংখ্যায় বাংলাদেশের বড় জেলা কোনটি  ?",
    Options: [
      const Option(text: 'খুলনা', isCorrect: false),
      const Option(text: 'রাঙ্গামাটি', isCorrect: false),
      const Option(text: 'ঢাকা', isCorrect: true),
      const Option(text: 'চট্টগ্রাম', isCorrect: false)
    ]
    ),
  Question(
    text: "জনসংখ্যায় বাংলাদেশের ছোট জেলা কোনটি ?",
    Options: [
      const Option(text: 'বান্দরবান', isCorrect: true),
      const Option(text: 'খাগড়াছড়ি', isCorrect: false),
      const Option(text: 'কুষ্টিয়া', isCorrect: false),
      const Option(text: 'পটুয়াখালী', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের সাথে কয়টি দেশের সীমান্ত রয়েছে ?",
    Options: [
      const Option(text: '২টি', isCorrect: true),
      const Option(text: '৩টি', isCorrect: false),
      const Option(text: '৫টি', isCorrect: false),
      const Option(text: '৪টি', isCorrect: false)
    ]
    ),
  Question(
    text: "পরিবেশের ভারসাম্য রক্ষার জন্য প্রয়োজনীয় বনভূমি রয়েছে কয়টি জেলায় ?",
    Options: [
      const Option(text: '১৫টি', isCorrect: false),
      const Option(text: '২৭টি', isCorrect: false),
      const Option(text: '৭টি', isCorrect: true),
      const Option(text: '১২টি', isCorrect: false)
    ]
    ),
  Question(
    text: "পেন্সিল তৈরি হয় কোন কাঠ থেকে ?",
    Options: [
      const Option(text: 'বাবলা', isCorrect: false),
      const Option(text: 'কেওড়া', isCorrect: false),
      const Option(text: 'সুন্দরী', isCorrect: false),
      const Option(text: 'ধুন্দল', isCorrect: true)
    ]
    ),
  Question(
    text: "বক্স ও দিয়াশলায় এর কাঠি প্রস্তুত হয় কোন কাঠ থেকে ?",
    Options: [
      const Option(text: 'গেওয়া', isCorrect: true),
      const Option(text: 'ধুন্দল', isCorrect: false),
      const Option(text: 'গরান', isCorrect: false),
      const Option(text: 'সুন্দরী', isCorrect: false)
    ]
    ),
  Question(
    text: "কোন গাছের ছাল থেকে রং প্রস্তুত করা হয় ?",
    Options: [
      const Option(text: 'ধুন্দল', isCorrect: false),
      const Option(text: 'গরান', isCorrect: true),
      const Option(text: 'গেওয়া', isCorrect: false),
      const Option(text: 'শাল', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের কোথায় কোথায় রাবার বাগান আছে ?",
    Options: [
      const Option(text: 'রাবনা, মধুপুর, খুলনা', isCorrect: false),
      const Option(text: 'সাতক্ষীরা, বাগেরহাট, আমতলী', isCorrect: false),
      const Option(text: 'ঝিনায়দহ, রামু', isCorrect: false),
      const Option(text: 'রামু, মধুপুর, রাউজানে', isCorrect: true)
    ]
    ),
  Question(
    text: "বাংলাদেশের প্রসস্ত নদী কোনটি ?",
    Options: [
      const Option(text: 'যমুনা', isCorrect: true),
      const Option(text: 'মেঘনা', isCorrect: false),
      const Option(text: 'সুরমা', isCorrect: false),
      const Option(text: 'পদ্মা', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের দীর্ঘতম নদী কোনটি ?",
    Options: [
      const Option(text: 'সুরমা', isCorrect: true),
      const Option(text: 'মেঘনা', isCorrect: false),
      const Option(text: 'যমুনা', isCorrect: false),
      const Option(text: 'পদ্মা', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশের দ্বিতীয় দীর্ঘতম নদী কোনটি ?",
    Options: [
      const Option(text: 'মেঘনা', isCorrect: false),
      const Option(text: 'যমুনা', isCorrect: false),
      const Option(text: 'সুরমা', isCorrect: false),
      const Option(text: 'পদ্মা', isCorrect: true)
    ]
    ),
  Question(
    text: "বাংলাদেশের দীর্ঘতম নদ কোনটি ?",
    Options: [
      const Option(text: 'পদ্মা', isCorrect: false),
      const Option(text: 'মেঘনা', isCorrect: false),
      const Option(text: 'ব্রহ্মপুত্র', isCorrect: true),
      const Option(text: 'যমুনা', isCorrect: false)
    ]
    ),
  Question(
    text: "উৎপত্তিস্থলে মেঘনার নাম কী ?",
    Options: [
      const Option(text: 'কুশিয়ারা', isCorrect: false),
      const Option(text: 'সুরমা', isCorrect: false),
      const Option(text: 'বরাক', isCorrect: true),
      const Option(text: 'পদ্মা', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশ ও ভারতকে বিভক্তকারী নদী কোনটি ?",
    Options: [
      const Option(text: 'হাড়িয়াভাঙ্গা', isCorrect: true),
      const Option(text: 'কালনি', isCorrect: false),
      const Option(text: 'বরাক', isCorrect: false),
      const Option(text: 'পদ্মা', isCorrect: false)
    ]
    ),
  Question(
    text: "বাংলাদেশ ও মায়ানমারকে বিভক্তকারী নদী কোনটি ?",
    Options: [
      const Option(text: 'হাড়িয়াভাঙ্গা', isCorrect: false),
      const Option(text: 'কালনি', isCorrect: false),
      const Option(text: 'বরাক', isCorrect: false),
      const Option(text: 'নাফ', isCorrect: true)
    ]
    ),
  Question(
    text: "পৃথিবীর বৃহত্তম ব-দ্বীপ কোনটি ?",
    Options: [
      const Option(text: 'চীন', isCorrect: false),
      const Option(text: 'বাংলাদেশ', isCorrect: true),
      const Option(text: 'ভারত', isCorrect: false),
      const Option(text: 'পাকিস্তান', isCorrect: false)
    ]
    ),
  Question(
    text: "বেনাপোল স্থলবন্দর কোন জেলায় অবস্থিত ?",
    Options: [
      const Option(text: 'যশোর', isCorrect: true),
      const Option(text: 'সাতক্ষীরা', isCorrect: false),
      const Option(text: 'দিনাজপুর', isCorrect: false),
      const Option(text: 'লালমনির হাট', isCorrect: false)
    ]
    ),
  Question(
    text: "হিলি স্থলবন্দর কোন জেলায় অবস্থিত ?",
    Options: [
      const Option(text: 'সাতক্ষীরা', isCorrect: false),
      const Option(text: 'যশোর', isCorrect: false),
      const Option(text: 'দিনাজপুর', isCorrect: true),
      const Option(text: 'বুড়িমারি', isCorrect: false)
    ]
    ),
];