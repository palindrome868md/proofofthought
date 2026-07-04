;--- 1. Sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Brand 0)

;--- 2. Constants (brands) ------------------------------------
(declare-const DolceGabbana Brand)

;--- 3. Functions / Predicates --------------------------------
; Person wears a brand
(declare-fun wears (Person Brand) Bool)
; Person is Amish
(declare-fun is_amish (Person) Bool)
; Cousin relationship (symmetric for our purposes)
(declare-fun cousin (Person Person) Bool)
; Shunning relation
(declare-fun shuns (Person Person) Bool)

;--- 4. Knowledge base -----------------------------------------
; Cultural rule: Amish cousins shun relatives who wear Dolce & Gabbana
(assert (forall ((p Person) (c Person))
  (=> (and (wears p DolceGabbana)
           (cousin p c)
           (is_amish c))
      (shuns c p))))

; Concrete individuals
(declare-const wearer Person)
(declare-const cousin Person)

; Facts about the individuals
(assert (wears wearer DolceGabbana))   ; the wearer dons a D&G suit
(assert (cousin wearer cousin))       ; they are cousins
(assert (is_amish cousin))            ; the cousin follows Amish customs

;--- 5. Test scenario -----------------------------------------
; Would the Amish cousin shun the Dolce & Gabbana suit wearer?
(assert (shuns cousin wearer))

;--- 6. Check the question -------------------------------------
(check-sat)
(get-model)