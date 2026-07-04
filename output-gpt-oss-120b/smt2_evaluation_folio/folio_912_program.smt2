; -------------------------------------------------
;  Sort declaration
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
;  Predicate declarations (all return Bool)
; -------------------------------------------------
(declare-fun Kid (Person) Bool)
(declare-fun Young (Person) Bool)
(declare-fun Toddler (Person) Bool)
(declare-fun Elderly (Person) Bool)
(declare-fun Pirate (Person) Bool)
(declare-fun Seafarer (Person) Bool)

; -------------------------------------------------
;  Constant for the individual Nancy
; -------------------------------------------------
(declare-const nancy Person)

; -------------------------------------------------
;  Knowledge base (the premises)
; -------------------------------------------------
; 1. All kids are young.
(assert (forall ((x Person)) (=> (Kid x) (Young x))))

; 2. All toddlers are kids.
(assert (forall ((x Person)) (=> (Toddler x) (Kid x))))

; 3. If someone is young, then they are not elderly.
(assert (forall ((x Person)) (=> (Young x) (not (Elderly x)))))

; 4. All pirates are seafarers.
(assert (forall ((x Person)) (=> (Pirate x) (Seafarer x))))

; 5. If Nancy is not a pirate, then Nancy is young.
(assert (=> (not (Pirate nancy)) (Young nancy)))

; 6. If Nancy is not a toddler, then Nancy is a seafarer.
(assert (=> (not (Toddler nancy)) (Seafarer nancy)))

; -------------------------------------------------
;  Test the statement:
;  Antecedent: Nancy is neither a pirate nor a toddler.
;  Consequent (negated): NOT (young AND kid)  i.e. (not young) OR (not kid)
; -------------------------------------------------
(assert (not (Pirate nancy)))          ; ¬Pirate(Nancy)
(assert (not (Toddler nancy)))         ; ¬Toddler(Nancy)

; Negate the desired consequent:
; we assert that at least one of Young(Nancy) or Kid(Nancy) fails.
(assert (or (not (Young nancy)) (not (Kid nancy))))

; -------------------------------------------------
;  Check whether this situation can occur.
; -------------------------------------------------
(check-sat)
(get-model)