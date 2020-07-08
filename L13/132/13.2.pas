PROGRAM Lex(INPUT, OUTPUT);
VAR
  Result, Ch, Number: CHAR; {Number - ����� ����� �� �������, ��� ������ � F1 � F2}
  F1, F2: TEXT;
PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 ���� ������������������ ������� F1 =, <, > ��� F2       
��������������. ����������� ���������, ��������������� F1 � F2,
������ ���� ����������}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 ��� F1 ������ F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 ��� F2 ������ F1}
          Result := '2'
    END; {WHILE}
  IF (Result = '0') AND (EOLN(F1)) AND (NOT EOLN(F2))
  THEN
    Result := '1';
  IF (Result = '0') AND (NOT EOLN(F1)) AND (EOLN(F2))
  THEN
    Result := '2'    
END; {Lexico}

BEGIN
  ASSIGN(F1, 'F1.TXT');
  ASSIGN(F2, 'F2.TXT'); 
  Lexico(F1, F2, Result);
  WRITELN(OUTPUT, Result)      
END.
