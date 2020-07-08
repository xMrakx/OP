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
  WRITE('Simple- ');
  WHILE (I <= Max)
  DO
    BEGIN
      D := I;
      IF (D IN Sieve)
      THEN
        BEGIN
          WRITE( D, ' ');
          WHILE (D <= Max)
          DO
            BEGIN
              Sieve := Sieve - [D];
              D := D + I
            END;
        END;
      I := I + 1      
    END;
  WRITELN       
END. {Prime}  
  
