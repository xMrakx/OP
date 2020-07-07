UNIT TreeWork;
INTERFACE
  TYPE
    Tree = ^Node;
    NODE = RECORD
             Word: STRING;
             Count: INTEGER;
             LLink, RLink: Tree
           END;
VAR
  WordCounter: INTEGER;
  PROCEDURE Insert(VAR Ptr: Tree; Str: STRING); {Помещат строку в дерево, ведя учет количества вхождений}
  PROCEDURE PrintTree(VAR Ptr: Tree; VAR F: TEXT); {заполнят фаил статистики словаими из дерева и очищает древо}

IMPLEMENTATION
  PROCEDURE Insert(VAR Ptr: Tree; Str: STRING);
  VAR
    Ch: CHAR;
  BEGIN {Insert}
    IF Ptr = NIL
    THEN
      BEGIN
        NEW(Ptr);
        Ptr^.Word := Str;
        Ptr^.Count := 1;
        Ptr^.LLink := NIL;
        Ptr^.RLink := NIL;
      END
    ELSE
      BEGIN
        IF (Str < Ptr^.Word)
        THEN
          Insert(Ptr^.LLink, Str);
        IF (Str > Ptr^.Word)
        THEN
          Insert(Ptr^.RLink, Str);
        IF (Str = Ptr^.Word)
        THEN
          Ptr^.Count := Ptr^.Count + 1
      END
  END;  {Insert}

  PROCEDURE PrintTree(VAR Ptr: Tree; VAR F: TEXT);
  BEGIN {PrintTree}
    IF (Ptr <> NIL)
    THEN
      BEGIN
        PrintTree(Ptr^.LLink, F);
        WRITELN(F, Ptr^.Word, ' ', Ptr^.Count);
        PrintTree(Ptr^.RLink, F)
      END
  END;  {PrintTree}

BEGIN {TreeWork}
END.  {TreeWork}
