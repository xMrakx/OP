PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 100;
  Min = 2;
TYPE
  TSieve = SET OF Min .. Max;
VAR
  Sieve: TSieve;

PROCEDURE Sift(VAR Sieve: TSieve);
VAR
  CurrentNum, DeleteNum: INTEGER;
BEGIN {Sift}
  CurrentNum := Min;
  WHILE (CurrentNum * CurrentNum <= Max)
  DO
    BEGIN
      DeleteNum := CurrentNum;
      IF (DeleteNum IN Sieve)
      THEN
        WHILE (DeleteNum <= Max)
        DO
          BEGIN
            DeleteNum := DeleteNum + CurrentNum;
            Sieve := Sieve - [DeleteNum]
          END;
      CurrentNum := CurrentNum + 1      
    END;
END;  {Sift}

PROCEDURE PrintSieve(Sieve: TSieve; VAR FileOut: TEXT);
VAR
  Num: INTEGER;
BEGIN {PrintSieve}
  Num := Min;
  WHILE Num <= MAX
  DO
    BEGIN
      IF Num IN Sieve
      THEN
        WRITE(FileOut, ' ', Num);
      Num := Num + 1
    END
END; {PrintSieve}

BEGIN {Prime}
  Sieve := [Min .. Max];
  Sift(Sieve);
  WRITE('Simple -');
  PrintSieve(Sieve, OUTPUT);
  WRITELN;
END. {Prime}
