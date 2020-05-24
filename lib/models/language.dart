

class Language{
  int id;
  String name;
  Language(this.id,this.name);
  static List<Language> getlanguage(){
    return <Language>[
        Language(1,'Chinese'),
      Language(2,'English'),
      Language(3,'Spanish'),
      Language(4,'German'),
      Language(5,'Hindi'),
      Language(6,'Russian'),
      Language(7,'French'),
    ];
  }


}