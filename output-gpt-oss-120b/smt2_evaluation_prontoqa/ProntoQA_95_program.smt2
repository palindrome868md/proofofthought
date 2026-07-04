; ---------- Sort ----------
(declare-sort Entity 0)

; ---------- Predicates (unary) ----------
(declare-fun Impus   (Entity) Bool)
(declare-fun Jompus  (Entity) Bool)
(declare-fun Dull    (Entity) Bool)
(declare-fun Vumpus  (Entity) Bool)
(declare-fun Bitter   (Entity) Bool)
(declare-fun Dumpus  (Entity) Bool)
(declare-fun Rompus  (Entity) Bool)
(declare-fun Metallic (Entity) Bool)
(declare-fun Wumpus  (Entity) Bool)
(declare-fun Blue    (Entity) Bool)
(declare-fun Zumpus  (Entity) Bool)
(declare-fun Feisty  (Entity) Bool)
(declare-fun Numpus  (Entity) Bool)
(declare-fun Yumpus  (Entity) Bool)
(declare-fun Floral  (Entity) Bool)
(declare-fun Tumpus  (Entity) Bool)

; ---------- Constant ----------
(declare-const Stella Entity)

; ---------- Knowledge base ----------
; (irrelevant facts are omitted for brevity)
(assert (Vumpus Stella))

; Impus → Jompus
(assert (forall ((x Entity))
  (=> (Impus x) (Jompus x))))
; Jompus → Dull
(assert (forall ((x Entity))
  (=> (Jompus x) (Dull x))))
; Jompus → Vumpus
(assert (forall ((x Entity))
  (=> (Jompus x) (Vumpus x))))
; Vumpus → Bitter
(assert (forall ((x Entity))
  (=> (Vumpus x) (Bitter x))))
; Vumpus → Dumpus
(assert (forall ((x Entity))
  (=> (Vumpus x) (Dumpus x))))
; Dumpus → Kind (omitted, not needed)
; Dumpus → Rompus
(assert (forall ((x Entity))
  (=> (Dumpus x) (Rompus x))))
; Rompus → Metallic
(assert (forall ((x Entity))
  (=> (Rompus x) (Metallic x))))
; Rompus → Wumpus
(assert (forall ((x Entity))
  (=> (Rompus x) (Wumpus x))))
; Wumpus → Blue
(assert (forall ((x Entity))
  (=> (Wumpus x) (Blue x))))
; Wumpus → Zumpus
(assert (forall ((x Entity))
  (=> (Wumpus x) (Zumpus x))))
; Numpus → Feisty
(assert (forall ((x Entity))
  (=> (Numpus x) (Feisty x))))
; Zumpus → not Feisty
(assert (forall ((x Entity))
  (=> (Zumpus x) (not (Feisty x)))))
; Zumpus → Yumpus
(assert (forall ((x Entity))
  (=> (Zumpus x) (Yumpus x))))
; Yumpus → Floral
(assert (forall ((x Entity))
  (=> (Yumpus x) (Floral x))))
; Yumpus → Tumpus
(assert (forall ((x Entity))
  (=> (Yumpus x) (Tumpus x))))

; ---------- Test the statement ----------
; "Stella is feisty"
(assert (Feisty Stella))

; ---------- Check ----------
(check-sat)   ; expected: unsat (the statement is false)
(get-model)