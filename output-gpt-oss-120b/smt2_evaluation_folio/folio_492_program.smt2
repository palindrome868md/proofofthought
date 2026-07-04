;-----------------------------------------------------------------
; 1. Sort declarations
;-----------------------------------------------------------------
(declare-sort Fish 0)
(declare-sort Person 0)

;-----------------------------------------------------------------
; 2. Predicate/function declarations
;-----------------------------------------------------------------
(declare-fun Stings (Fish Person) Bool)      ; fish stings a person
(declare-fun Treated (Person) Bool)          ; person has been treated
(declare-fun Death (Person) Bool)            ; person dies

;-----------------------------------------------------------------
; 3. Constant symbols (witnesses)
;-----------------------------------------------------------------
(declare-const stonefish Fish)          ; the stonefish
(declare-const victim Person)           ; a person who may be stung

; Additional witnesses for the premise “Some fish stings people”
(declare-const fish1 Fish)
(declare-const person1 Person)

;-----------------------------------------------------------------
; 4. Knowledge base (premises)
;-----------------------------------------------------------------
; Premise 1: Some fish stings people
(assert (Stings fish1 person1))

; Premise 2: Stonefish is a fish
;   (already true by giving it sort Fish)

; Premise 3: Stonefish stings when stepped on
(assert (Stings stonefish victim))

; Premise 4: If a stonefish stings someone and they are not treated,
;           it can cause death to them.
(assert (forall ((p Person))
          (=> (and (Stings stonefish p) (not (Treated p)))
              (Death p))))

; (Premise 5 about treatment methods does not affect the truth of the target statement,
;  so it is omitted.)

;-----------------------------------------------------------------
; 5. Statement to be verified:
;    “Stings of some fish can cause death if not treated.”
;    We witness stonefish and victim, assert that the victim is *not* treated
;    and that death occurs.
;-----------------------------------------------------------------
(assert (and (Stings stonefish victim)
             (not (Treated victim))
             (Death victim)))

;-----------------------------------------------------------------
; 6. Check satisfiability (sat ⇒ statement is true under the premises)
;-----------------------------------------------------------------
(check-sat)
(get-model)