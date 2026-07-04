; Declare the domain of all objects
(declare-sort Entity 0)

; Predicates (functions returning Bool)
(declare-fun visits (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun sees   (Entity Entity) Bool)
(declare-fun red    (Entity)       Bool)
(declare-fun green  (Entity)       Bool)
(declare-fun kind   (Entity)       Bool)

; Constants for the individuals mentioned
(declare-const bald_eagle Entity)
(declare-const cow         Entity)
(declare-const rabbit      Entity)
(declare-const tiger       Entity)

; ---------- Knowledge base (facts) ----------
(assert (red bald_eagle))          ; The bald eagle is red
(assert (green cow))               ; The cow is green
(assert (likes cow bald_eagle))    ; The cow likes the bald eagle
(assert (likes cow rabbit))        ; The cow likes the rabbit
(assert (visits cow bald_eagle))   ; The cow visits the bald eagle
(assert (visits cow rabbit))       ; The cow visits the rabbit
(assert (likes rabbit cow))        ; The rabbit likes the cow
(assert (sees rabbit tiger))       ; The rabbit sees the tiger
(assert (visits rabbit tiger))     ; The rabbit visits the tiger
(assert (red tiger))               ; The tiger is red
(assert (visits tiger cow))        ; The tiger visits the cow
(assert (visits tiger rabbit))     ; The tiger visits the rabbit

; ---------- Rules ----------
; 1. If something visits the rabbit then it is red.
(assert (forall ((x Entity))
  (=> (visits x rabbit) (red x))))

; 2. If something sees the bald eagle and the bald eagle visits the cow then it sees the cow.
(assert (forall ((x Entity))
  (=> (and (sees x bald_eagle) (visits bald_eagle cow))
      (sees x cow))))

; 3. If something is red then it is kind.
(assert (forall ((x Entity))
  (=> (red x) (kind x))))

; 4. If the cow sees the tiger and the tiger sees the rabbit then the cow is green.
(assert (=> (and (sees cow tiger) (sees tiger rabbit))
            (green cow)))

; 5. If something is kind then it sees the bald eagle.
(assert (forall ((x Entity))
  (=> (kind x) (sees x bald_eagle))))

; 6. If the rabbit is green then the rabbit is red.
(assert (=> (green rabbit) (red rabbit)))

; 7. If something is red then it sees the rabbit.
(assert (forall ((x Entity))
  (=> (red x) (sees x rabbit))))

; 8. If something likes the cow and it likes the bald eagle then the cow sees the rabbit.
(assert (forall ((x Entity))
  (=> (and (likes x cow) (likes x bald_eagle))
      (sees cow rabbit))))

; ---------- Query ----------
; The question: "The cow does not visit the bald eagle."
; We test the negation of the fact that the cow visits the bald eagle.
(assert (not (visits cow bald_eagle)))

; Check consistency: if the knowledge base implies the cow visits the bald eagle,
; the above assertion will make the set unsatisfiable.
(check-sat)
(get-model)