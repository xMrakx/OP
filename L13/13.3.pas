PROGRAM Split(INPUT,OUTPUT); {Копирует INPUT в OUTPUT,сначала нечетные, а затем четные элементы}
VAR
  Ch, Next: CHAR;
  Odds, Evens: TEXT;
PROCEDURE CopyOut(VAR F1: TEXT; VAR Ch: CHAR);
BEGIN  {CopyOut}
  RESET(F1);
  WHILE NOT EOF(F1)
  DO
    BEGIN
      WHILE NOT EOLN(F1)
      DO
        BEGIN
          READ(F1, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITELN(OUTPUT);
      READLN(F1)  
    END;    
END; {CopyOut}
BEGIN {Split}
  {Разделяет INPUT в Odds и Evens}
  REWRITE(Odds);
  REWRITE(Evens);
  Next := 'O';
  WHILE NOT EOF(INPUT)
  DO
    BEGIN
      WHILE NOT EOLN(INPUT)
      DO
        {Прочитать Ch, записать в файл, выбранный через   Next, переключить Next}
        BEGIN
          READ(INPUT, Ch);
          IF Next = 'O'
          THEN
            BEGIN
              WRITE(Odds, Ch);
              Next := 'E'
            END  
          ELSE
            BEGIN
              WRITE(Evens, Ch);
              Next := 'O'
            END;  
        END;
      Next := 'O';
      READLN(INPUT);  
      WRITELN(Odds);
      WRITELN(Evens)
    END;
  CopyOut(Odds,Ch);
  CopyOut(Evens,Ch);
  WRITELN(OUTPUT)
END. {Split}
