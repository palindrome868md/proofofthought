;-------------------------------------------------
;  1. Sort declarations
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Item   0)
(declare-sort Hobby  0)

;-------------------------------------------------
;  2. Function / predicate declarations
;-------------------------------------------------
(declare-fun is-actor      (Person) Bool)
(declare-fun co-star       (Person Person) Bool)
(declare-fun has-reference (Person Person) Bool)
(declare-fun fan-of        (Person Hobby) Bool)
(declare-fun owns          (Person Item) Bool)

;-------------------------------------------------
;  3. Constant declarations (the individuals)
;-------------------------------------------------
(declare-const adam-sandler Person)
(declare-const cole-spouse  Person)

(declare-const scuba-man-doll Item)
(declare-const scuba          Hobby)

;-------------------------------------------------
;  4. Knowledge base (facts)
;-------------------------------------------------
; Both are actors
(assert (is-actor adam-sandler))
(assert (is-actor cole-spouse))

; They co‑starred together
(assert (co-star adam-sandler cole-spouse))

; Adam Sandler likes scuba
(assert (fan-of adam-sandler scuba))

;-------------------------------------------------
;  5. Logical rules (universally quantified)
;-------------------------------------------------
; Rule 1 – Co‑stars get references to each other
(assert
  (forall ((p Person) (q Person))
    (=> (and (is-actor p) (is-actor q) (co-star p q))
        (has-reference p q))))

; Rule 2 – Scuba‑fans own the specific scuba‑man doll
(assert
  (forall ((p Person) (i Item))
    (=> (and (fan-of p scuba) (= i scuba-man-doll))
        (owns p i))))

;-------------------------------------------------
;  6. Test the question:
;     "Would Adam Sandler get a reference to Cole Spouse and a scuba man doll?"
;-------------------------------------------------
(assert (has-reference adam-sandler cole-spouse))
(assert (owns adam-sandler scuba-man-doll))

;-------------------------------------------------
;  7. Check satisfiability (the single required check)
;-------------------------------------------------
(check-sat)
(get-model)