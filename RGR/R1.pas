PROGRAM CountWords(INPUT, OUTPUT);
USES
  WordWork, TreeWork;
CONST
  WordLim = 100;
VAR
  Root: Tree;
  Lim: 0 .. WordLim;
  Cont: STRING;
  FIn, Stats: TEXT;
  Work: BOOLEAN;

BEGIN {CountWords}
  WordCounter := 0;
  ASSIGN(FIn, 'FIn.txt');
  ASSIGN(Stats, 'Stats.txt');
  RESET(FIn);
  Lim := 0;
  Root := NIL;
  Work := NOT EOF(FIn);
  WHILE ((WORK) AND (Lim <> WordLim))
  DO
    BEGIN
      { ©â¨ á«®¢® ¨ ¯®«®¦¨âì ¥£® ¢ Cont}
      SearchWord(FIn, Cont);
      IF (Cont <> '')
      THEN
        BEGIN
          Lim := Lim +1;
          {‚áâ ¢¨âì á®¤¥à¦¨¬®¥ Cont ¢ ¤¥à¥¢®}
          Insert(Root, Cont);
          Cont := '';
          Work := NOT EOF(FIn)
        END
       ELSE
         Work := FALSE
    END;
  {¥çâì ¤¥à¥¢  ¢ ä ¨« áâ â¨áâ¨ª¨, ¨ ®ç¨áâª  ¤à¥¢ }
  REWRITE(Stats);
  PrintTree(Root, Stats);
  CLOSE(FIn);
  CLOSE(Stats)
END. {CountWords}

