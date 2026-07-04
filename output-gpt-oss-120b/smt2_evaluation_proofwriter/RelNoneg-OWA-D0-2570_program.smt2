; Declare the domain of individuals
(declare-sort Entity 0)

; Declare constants
(declare-const bald_eagle Entity)
(declare-const squirrel Entity)

; Declare predicates
(declare-fun round (Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun kind (Entity) Bool)

(declare-fun likes (Entity Entity) Bool)
(declare-fun eats  (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)

; ---------- Knowledge base (facts) ----------
(assert (round bald_eagle))                       ; The bald eagle is round.
(assert (likes bald_eagle squirrel))              ; The bald eagle likes the squirrel.
(assert (eats squirrel bald_eagle))               ; The squirrel eats the bald eagle.
(assert (blue squirrel))                          ; The squirrel is blue.
(assert (kind squirrel))                          ; The squirrel is kind.
(assert (likes squirrel bald_eagle))              ; The squirrel likes the bald eagle.
(assert (visits squirrel bald_eagle))             ; The squirrel visits the bald eagle.

; ---------- Rules ----------
; If something is kind then it visits the squirrel.
(assert
  (forall ((x Entity))
    (=> (kind x) (visits x squirrel))))

; If something eats the bald eagle and it is blue then the bald eagle likes the squirrel.
(assert
  (forall ((x Entity))
    (=> (and (eats x bald_eagle) (blue x))
        (likes bald_eagle squirrel))))

; All round, blue things are kind.
(assert
  (forall ((x Entity))
    (=> (and (round x) (blue x))
        (kind x))))

; If something visits the squirrel then the squirrel visits the bald eagle.
(assert
  (forall ((x Entity))
    (=> (visits x squirrel)
        (visits squirrel bald_eagle))))

; If the squirrel is blue then the squirrel likes the bald eagle.
(assert
  (=> (blue squirrel)
      (likes squirrel bald_eagle)))

; If something is round then it eats the bald eagle.
(assert
  (forall ((x Entity))
    (=> (round x)
        (eats x bald_eagle))))

; ---------- Claim to verify ----------
; The claim: "The bald eagle does not like the squirrel."
(assert (not (likes bald_eagle squirrel)))

; Check consistency of the knowledge base with the claim
(check-sat)
(get-model)