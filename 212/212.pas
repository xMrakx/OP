PROGRAM Encryption(INPUT, OUTPUT);
{Ïåðåâîäèò ñèìâîëû èç INPUT â êîä ñîãëàñíî Chiper 
 è ïå÷àòàåò íîâûå ñèìâîëû â OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY ['A' .. 'Z'] OF CHAR;
  Length = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: Length;
  ChiperFile: TEXT;
 
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT);
{Ïðèñâîèòü Code øèôð çàìåíû}
VAR
  Ch, Symbol: CHAR;
  Error: BOOLEAN;
BEGIN {Initialize}
  RESET(ChiperFile);
  Error := EOF(ChiperFile);
  WHILE NOT EOF(ChiperFile) AND NOT Error
  DO
    BEGIN
      IF (NOT EOLN(ChiperFile))
      THEN
        BEGIN
          READ(ChiperFile, Ch);
          IF (Ch IN ['A' .. 'Z'])
          THEN
            BEGIN
              Symbol := Ch;
              IF NOT EOLN(ChiperFile)
              THEN
                READ(ChiperFile, Ch)
              ELSE
                Error := TRUE;  
              IF NOT EOLN(ChiperFile)
              THEN  
                READ(ChiperFile, Ch)
              ELSE
                Error := TRUE;  
              Code[Symbol] := Ch
            END 
          ELSE
            Error := FALSE;
          READLN(ChiperFile)    
        END  
      ELSE
        READLN(ChiperFile);
      IF Error
      THEN
        WRITELN(OUTPUT, 'Initialization error')    
    END;
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str);
{Âûâîäèò ñèìâîëû èç Code, ñîîòâåòñòâóþùèå ñèìâîëàì èç S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO Len
  DO
    IF S[Index] IN ['A' .. 'Z']
    THEN
      WRITE(OUTPUT, Code[S[Index]])
    ELSE
      IF S[Index] = ' '
      THEN
        WRITE(OUTPUT, '0')
      ELSE
        WRITE(OUTPUT, S[Index]);
  WRITELN(OUTPUT)
END;  {Encode}
 
BEGIN {Encryption}
  ASSIGN(ChiperFile, 'ChiperFile.txt');
  {Èíèöèàëèçèðîâàòü Code}
  Initialize(Code, ChiperFile);
  WHILE NOT EOF
  DO
    BEGIN
      {÷èòàòü ñòðîêó â Msg è ðàñïå÷àòàòü åå}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(INPUT, Msg[I]);
          WRITE(OUTPUT, Msg[I])
        END;
      READLN(INPUT);
      WRITELN(OUTPUT);
      {ðàñïå÷àòàòü êîäèðîâàííîå ñîîáùåíèå}
      Encode(Msg)
    END
END.  {Encryption}

