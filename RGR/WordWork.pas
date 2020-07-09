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
      Ch := CHR(ORD(Ch) + 32);
    IF (Ch IN ['А' .. 'П'])
    THEN
      Ch := CHR(ORD(Ch) + 32);
     IF (Ch IN ['П' .. 'Я'])
    THEN
      Ch := CHR(ORD(Ch) + 80);
    IF ((Ch = 'Ё') OR (Ch = 'ё'))
    THEN
      Ch := 'е'
  END;  {ChangeRegister}


BEGIN {WordWork}
  Letter := ['A' .. 'z', 'А' .. 'п', 'р' .. 'я', 'Ё', 'ё']
END.  {WordWork}
