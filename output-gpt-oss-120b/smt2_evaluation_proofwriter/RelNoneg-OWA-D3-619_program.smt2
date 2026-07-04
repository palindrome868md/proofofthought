; ---------- Sort ----------
(declare-sort Entity 0)

; ---------- Constants ----------
(declare-const cat Entity)
(declare-const dog Entity)
(declare-const rabbit Entity)
(declare-const tiger Entity)

; ---------- Predicates ----------
(declare-fun nice (Entity) Bool)
(declare-fun chases (Entity Entity) Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun eats (Entity Entity) Bool)
(declare-fun blue (Entity) Bool)
(declare-fun young (Entity) Bool)
(declare-fun red (Entity) Bool)

; ---------- Facts ----------
(assert (nice cat))                ; The cat is nice.
(assert (chases dog rabbit))       ; The dog chases the rabbit.
(assert (visits rabbit tiger))     ; The rabbit visits the tiger.
(assert (nice tiger))              ; The tiger is nice.

; ---------- Rules ----------
; If the rabbit is blue and the rabbit visits the tiger then the tiger is young.
(assert (forall ((x Entity))
  (=> (and (blue rabbit) (visits rabbit tiger))
      (young tiger))))

; If the rabbit visits the dog and the dog visits the rabbit then the rabbit eats the cat.
(assert (forall ((x Entity))
  (=> (and (visits rabbit dog) (visits dog rabbit))
      (eats rabbit cat))))

; If something eats the rabbit and it is red then the rabbit eats the cat.
(assert (forall ((x Entity))
  (=> (and (eats x rabbit) (red x))
      (eats rabbit cat))))

; If something eats the tiger and it eats the rabbit then it visits the tiger.
(assert (forall ((x Entity))
  (=> (and (eats x tiger) (eats x rabbit))
      (visits x tiger))))

; All young things are blue.
(assert (forall ((x Entity))
  (=> (young x) (blue x))))

; If something chases the rabbit then the rabbit is blue.
(assert (forall ((x Entity))
  (=> (chases x rabbit) (blue rabbit))))

; If something is red and it visits the cat then the cat visits the tiger.
(assert (forall ((x Entity))
  (=> (and (red x) (visits x cat))
      (visits cat tiger))))

; If something eats the tiger and it visits the rabbit then it chases the dog.
(assert (forall ((x Entity))
  (=> (and (eats x tiger) (visits x rabbit))
      (chases x dog))))

; ---------- Query ----------
; Test the statement: "The cat is not nice."
(assert (not (nice cat)))

; ---------- Check ----------
(check-sat)   ; Expected: unsat (the statement is false)
(get-model)