PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
VAR
  I, D: INTEGER;
  IsPrime: BOOLEAN;
  Sieve: SET OF 0 .. Max;
BEGIN {Prime}
  Sieve := [Min .. Max];
  I := Min;
  WRITE('Simple- ');
  WHILE (I * I <= Max)
  DO
    BEGIN
      D := I;
      IF (D IN Sieve)
      THEN
        WHILE (D <= Max)
        DO
          BEGIN
            D := D + I;
            Sieve := Sieve - [D]
          END;
      I := I + 1      
    END;
  I := Min;
  WHILE I <= MAX
  DO
    BEGIN
      IF I IN Sieve
      THEN
        WRITE(' ', I);
      I := I + 1
    END;
  WRITELN;
END. {Prime}
