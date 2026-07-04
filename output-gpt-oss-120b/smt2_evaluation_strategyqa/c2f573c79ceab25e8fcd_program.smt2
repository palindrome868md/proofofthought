;-------------------------------------------------
; 1. Declare the sort for all living organisms
;-------------------------------------------------
(declare-sort Organism 0)

;-------------------------------------------------
; 2. Declare predicates (functions returning Bool)
;-------------------------------------------------
(declare-fun is-animal (Organism) Bool)          ; true if the organism is an animal
(declare-fun is-plant (Organism) Bool)           ; true if the organism is a plant
(declare-fun can-get-worms (Organism) Bool)      ; true if the organism can be infected by worms

;-------------------------------------------------
; 3. Declare the concrete individuals
;-------------------------------------------------
(declare-const dog Organism)
(declare-const strawberry Organism)

;-------------------------------------------------
; 4. Knowledge base (general rules and facts)
;-------------------------------------------------
; Rule: All animals can get worms
(assert (forall ((x Organism))
        (=> (is-animal x) (can-get-worms x))))

; Rule: No plant can get worms
(assert (forall ((x Organism))
        (=> (is-plant x) (not (can-get-worms x)))))

; Fact: Dog is an animal
(assert (is-animal dog))

; Fact: Strawberry is a plant
(assert (is-plant strawberry))

;-------------------------------------------------
; 5. Test the statement: "Can a strawberry get worms?"
;-------------------------------------------------
(assert (can-get-worms strawberry))

;-------------------------------------------------
; 6. Check satisfiability (single check)
;-------------------------------------------------
(check-sat)
(get-model)