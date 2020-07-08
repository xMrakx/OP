PROGRAM Encryption(INPUT, OUTPUT);
{Переводит символы из INPUT в код согласно Chiper 
  и печатает новые символы в OUTPUT}
CONST
  Len = 20;
TYPE
  Str = ARRAY [1 .. Len] OF 'A' .. 'Z';
  Chiper = ARRAY [CHAR] OF CHAR;
  Length = 0 .. Len;
VAR
  Msg: Str;
  Code: Chiper;
  I: Length;
  ChiperFile: TEXT;
 
PROCEDURE Initialize(VAR Code: Chiper; VAR ChiperFile: TEXT);
{Присвоить Code шифр замены}
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
          IF (Ch IN ['A' .. 'Z', ' '])
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
 
PROCEDURE Encode(VAR S: Str; I: Length);
{Выводит символы из Code, соответствующие символам из S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO I
  DO
    IF S[Index] IN ['A' .. 'Z', ' ']
    THEN
      WRITE(Code[S[Index]])
    ELSE
      WRITE(S[Index]);
  WRITELN
END;  {Encode}
 
BEGIN {Encryption}
  ASSIGN(ChiperFile, 'ChiperFile.txt');
  {Инициализировать Code}
  Initialize(Code, ChiperFile);
  WHILE NOT EOF
  DO
    BEGIN
      {читать строку в Msg и распечатать ее}
      I := 0;
      WHILE NOT EOLN AND (I < Len)
      DO
        BEGIN
          I := I + 1;
          READ(Msg[I]);
          WRITE(Msg[I])
        END;
      READLN;
      WRITELN;
     {распечатать кодированное сообщение}
      Encode(Msg, I)
    END
END.  {Encryption}

