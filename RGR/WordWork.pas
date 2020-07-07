UNIT WordWork;
INTERFACE
VAR
  Letter: SET OF CHAR;
  PROCEDURE SearchWord(VAR F: TEXT; VAR Word: STRING); {ищет слово в входном фаиле}
  PROCEDURE ChangeRegister(VAR Ch: CHAR); {изменяет регистр символа с заглавногого на строчный}

IMPLEMENTATION
  PROCEDURE SearchWord(VAR F: TEXT; VAR Word: STRING);
  VAR
    Ch: CHAR;
    Finde: BOOLEAN;
  BEGIN {SearchWord}
    Finde := FALSE;
    WHILE (NOT Finde)
    DO
      IF (NOT EOLN(F))
       THEN
         BEGIN
           READ(F, Ch);
           Finde := (Ch IN Letter)
         END
       ELSE
         READLN(F);
    WHILE (Finde)
    DO
      BEGIN
        ChangeRegister(Ch);
        Word := Word + Ch;
        IF NOT EOLN(F)
        THEN
          READ(F, Ch)
        ELSE
          Ch := ' ';  
        Finde := (Ch IN Letter);
      END;
  END;  {SearchWord}

  PROCEDURE ChangeRegister(VAR Ch: CHAR);
  BEGIN {ChangeRegister}
    IF (Ch IN ['A' .. 'Z'])
    THEN
      CASE Ch OF
        'A': Ch := 'a';
        'B': Ch := 'b';
        'C': Ch := 'c';
        'D': Ch := 'd';
        'E': Ch := 'e';
        'F': Ch := 'f';
        'G': Ch := 'g';
        'H': Ch := 'h';
        'I': Ch := 'i';
        'J': Ch := 'j';
        'K': Ch := 'k';
        'L': Ch := 'l';
        'M': Ch := 'm';
        'N': Ch := 'n';
        'O': Ch := 'o';
        'P': Ch := 'p';
        'Q': Ch := 'q';
        'R': Ch := 'r';
        'S': Ch := 's';
        'T': Ch := 't';
        'U': Ch := 'u';
        'V': Ch := 'v';
        'W': Ch := 'w';
        'X': Ch := 'x';
        'Y': Ch := 'y';
        'Z': Ch := 'z'
      END;
    IF (Ch IN ['А' .. 'Я'])
    THEN
      CASE Ch OF
        'А': Ch := 'а';
        'Б': Ch := 'б';
        'В': Ch := 'в';
        'Г': Ch := 'г';
        'Д': Ch := 'д';
        'Е': Ch := 'е';
        'Ж': Ch := 'ж';
        'З': Ch := 'з';
        'И': Ch := 'и';
        'Й': Ch := 'й';
        'К': Ch := 'к';
        'Л': Ch := 'л';
        'М': Ch := 'м';
        'Н': Ch := 'н';
        'О': Ch := 'о';
        'П': Ch := 'п';
        'Р': Ch := 'р';
        'С': Ch := 'с';
        'Т': Ch := 'т';
        'У': Ch := 'у';
        'Ф': Ch := 'ф';
        'Х': Ch := 'х';
        'Ц': Ch := 'ц';
        'Ч': Ch := 'ч';
        'Ш': Ch := 'ш';
        'Щ': Ch := 'щ';
        'Ъ': Ch := 'ъ';
        'Ы': Ch := 'ы';
        'Ь': Ch := 'ь';
        'Э': Ch := 'э';
        'Ю': Ch := 'ю';
        'Я': Ch := 'я'
      END;
    IF ((Ch = 'Ё') OR (Ch = 'ё'))
    THEN
      Ch := 'е'
  END;  {ChangeRegister}


BEGIN {WordWork}
  Letter := ['A' .. 'z', 'А' .. 'я', 'Ё', 'ё']
END.  {WordWork}
