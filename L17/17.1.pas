PROGRAM Sum(INPUT, OUTPUT);
PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  READ(F, Ch);
  IF Ch = '0' THEN D := 0 ELSE
  IF Ch = '1' THEN D := 1 ELSE
  IF Ch = '2' THEN D := 2 ELSE
  IF Ch = '3' THEN D := 3 ELSE
  IF Ch = '4' THEN D := 4 ELSE
  IF Ch = '5' THEN D := 5 ELSE
  IF Ch = '6' THEN D := 6 ELSE
  IF Ch = '7' THEN D := 7 ELSE
  IF Ch = '8' THEN D := 8 ELSE
  IF Ch = '9' THEN D := 9
  ELSE
    D := -1
END;  {ReadDigit}
VAR
  D, Sm: INTEGER;
  F: BOOLEAN;
BEGIN {Sum}
  Sm := 0;
  D := 0;
  F := NOT EOLN;
  WHILE F
  DO
    BEGIN
      ReadDigit(INPUT, D);
      F := NOT EOLN;
      IF D <> -1
      THEN
        Sm := Sm + D
      ELSE
        F := FALSE
    END;
  WRITELN('Сумма цифр равна ', Sm:2) 
END. {Sum}
