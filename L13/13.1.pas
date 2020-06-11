PROGRAM BubbleSort(INPUT, OUTPUT);
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;
PROCEDURE Copy(VAR F1, F2: TEXT);
VAR
  Ch: CHAR;
BEGIN {Copy}
  REWRITE(F2);
  RESET(F1);
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch);
    END;
    WRITELN(F2)
END; {Copy}    
BEGIN {BubbleSort}
  { Копируем INPUT в F1 }
  Copy(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      { Копируем F1 в F2,проверяя отсортированность
      и переставляя первые соседние символы по порядку}
      Sorted := 'Y';
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1,Ch1);
          WHILE NOT EOLN(F1)
          DO 
            BEGIN
              READ(F1, Ch2);
              IF Ch1 <= Ch2
              THEN
                BEGIN
                  WRITE(F2, Ch1);
                  Ch1 := Ch2
                END
              ELSE
                BEGIN
                  WRITE(F2, Ch2);
                  Sorted := 'N'
                END
            END;
          WRITELN(F2, Ch1) { Выводим последний символ в F2 }
        END;
      { Копируем F2 в F1 }
      Copy(F2, F1);
    END;
  { Копируем F1 в OUTPUT }
  Copy(F1, OUTPUT)
END. {BubbleSort}
