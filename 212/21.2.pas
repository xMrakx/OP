PROGRAM Encryption(INPUT, OUTPUT);
{��������� ������� �� INPUT � ��� �������� Chiper 
 � �������� ����� ������� � OUTPUT}
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
{��������� Code ���� ������}
VAR
  Ch, Symbol: CHAR;
  Data: BOOLEAN;
BEGIN {Initialize}
  RESET(ChiperFile);
  Data := NOT EOF(ChiperFile);
  WHILE Data
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
              READ(ChiperFile, Ch);
              READ(ChiperFile, Ch);
              Code[Symbol] := Ch
            END 
          ELSE
            Data := FALSE;
          READLN(ChiperFile)    
        END  
      ELSE
        Data := FALSE;
      IF (NOT Data) AND (NOT EOF)
      THEN
        WRITELN(OUTPUT, 'Initialization error')    
    END;
END;  {Initialize}
 
PROCEDURE Encode(VAR S: Str);
{������� ������� �� Code, ��������������� �������� �� S}
VAR
  Index: 1 .. Len;
BEGIN {Encode}
  FOR Index := 1 TO I
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
  {���������������� Code}
  Initialize(Code, ChiperFile);
  WHILE NOT EOF
  DO
    BEGIN
      {������ ������ � Msg � ����������� ��}
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
      {����������� ������������ ���������}
      Encode(Msg)
    END
END.  {Encryption}

