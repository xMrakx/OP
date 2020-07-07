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
    IF (Ch IN ['�' .. '�'])
    THEN
      CASE Ch OF
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�'
      END;
    IF ((Ch = '�') OR (Ch = '�'))
    THEN
      Ch := '�'
  END;  {ChangeRegister}


BEGIN {WordWork}
  Letter := ['A' .. 'z', '�' .. '�', '�', '�']
END.  {WordWork}
