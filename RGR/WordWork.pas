UNIT WordWork;
INTERFACE
VAR
  Letter: SET OF CHAR;
  PROCEDURE SearchWord(VAR F: TEXT; VAR Word: STRING); {��� ᫮�� � �室��� 䠨��}
  PROCEDURE ChangeRegister(VAR Ch: CHAR); {������� ॣ���� ᨬ���� � ������������ �� �����}

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
    IF (Ch IN ['�' .. '�'])
    THEN
      Ch := CHR(ORD(Ch) + 32);
     IF (Ch IN ['�' .. '�'])
    THEN
      Ch := CHR(ORD(Ch) + 80);
    IF ((Ch = '�') OR (Ch = '�'))
    THEN
      Ch := '�'
  END;  {ChangeRegister}


BEGIN {WordWork}
  Letter := ['A' .. 'z', '�' .. '�', '�' .. '�', '�', '�']
END.  {WordWork}
