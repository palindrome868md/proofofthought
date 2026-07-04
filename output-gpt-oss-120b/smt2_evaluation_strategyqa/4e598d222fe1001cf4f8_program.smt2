;--- Sorts ---------------------------------------------------------
(declare-sort Animal 0)

;--- Functions -----------------------------------------------------
; Size of an animal (in arbitrary units)
(declare-fun size (Animal) Int)

; Pouch capacity of a (kangaroo) animal
(declare-fun pouchCapacity (Animal) Int)

; Predicate: does the first animal fit in the second animal’s pouch?
(declare-fun fitsInPouch (Animal Animal) Bool)

;--- Constants -----------------------------------------------------
(declare-const scooby Animal)     ; Scooby‑Doo
(declare-const kangaroo Animal)  ; a generic kangaroo

;--- Knowledge base ------------------------------------------------
; 1. A kangaroo pouch can hold up to 15 units
(assert (= (pouchCapacity kangaroo) 15))

; 2. Scooby‑Doo is very large (size 100 units)
(assert (= (size scooby) 100))

; 3. Definition of “fits in pouch”: size must not exceed capacity
(assert (forall ((a Animal) (b Animal))
        (= (fitsInPouch a b)
           (<= (size a) (pouchCapacity b)))))

;--- Question: Could Scooby‑Doo fit in a kangaroo pouch? -------------
; We assert that he does fit and ask Z3 whether this can be true.
(assert (fitsInPouch scooby kangaroo))

;--- Check the scenario --------------------------------------------
(check-sat)   ; Expected: unsat (Scooby‑Doo cannot fit)
(get-model)  ; Optional: shows the concrete values we asserted