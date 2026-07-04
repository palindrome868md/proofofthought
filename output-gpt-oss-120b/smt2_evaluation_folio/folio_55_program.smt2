;--- 1. Sorts ----------------------------------------------------
(declare-sort Person 0)

; Enumerated datatype for football positions
(declare-datatypes () ((Position (halfback) (inside_left))))

;--- 2. Constants ------------------------------------------------
(declare-const thomas_barber Person)

;--- 3. Predicate -------------------------------------------------
(declare-fun played_as (Person Position) Bool)

;--- 4. Knowledge base (premises) --------------------------------
; Thomas Barber was an English professional footballer.
; (the profession is not needed for the current query, so we omit it)

; He played in the Football League for Aston Villa – also irrelevant for the query.

; He played as a halfback and inside left.
(assert (played_as thomas_barber halfback))
(assert (played_as thomas_barber inside_left))

; He scored the winning goal in the 1913 FA Cup Final – irrelevant for the query.

;--- 5. Test the statement ----------------------------------------
; Statement: Thomas Barber played as an inside left.
(assert (played_as thomas_barber inside_left))

;--- 6. Ask Z3 ----------------------------------------------------
(check-sat)        ; Expected result: sat (the statement can be true)
(get-model)        ; Optional: shows a model confirming the facts