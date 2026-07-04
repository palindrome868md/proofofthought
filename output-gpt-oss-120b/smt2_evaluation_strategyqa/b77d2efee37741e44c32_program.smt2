; -------------------------------------------------
; 1. Declare uninterpreted sorts
; -------------------------------------------------
(declare-sort Event 0)
(declare-sort Object 0)

; -------------------------------------------------
; 2. Declare predicates / functions
; -------------------------------------------------
; Is an event a competition?
(declare-fun is-competition (Event) Bool)

; Is an object a relay baton?
(declare-fun relay-baton (Object) Bool)

; Did an event use a given object?
(declare-fun used (Event Object) Bool)

; -------------------------------------------------
; 3. Declare constants for the concrete entities
; -------------------------------------------------
(declare-const space-race Event)   ; the historical Space Race
(declare-const baton Object)       ; a generic relay baton

; -------------------------------------------------
; 4. Knowledge base (facts)
; -------------------------------------------------
; The Space Race was a competition
(assert (is-competition space-race))

; The object we are talking about is a relay baton
(assert (relay-baton baton))

; -------------------------------------------------
; 5. General rule: competitions do NOT use relay batons
; -------------------------------------------------
(assert (forall ((e Event) (o Object))
  (=> (and (is-competition e) (relay-baton o))
      (not (used e o)))))

; -------------------------------------------------
; 6. Test the statement: "The Space Race used relay batons"
; -------------------------------------------------
(assert (used space-race baton))

; -------------------------------------------------
; 7. Check the claim
; -------------------------------------------------
(check-sat)   ; Expected result: unsat (the claim is false)
(get-model)   ; Optional: show a model if sat (will not be produced here)