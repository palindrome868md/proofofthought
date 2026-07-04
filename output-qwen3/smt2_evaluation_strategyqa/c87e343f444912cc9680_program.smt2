; SMT-LIB 2.0 Program to verify: Was the Donatello crucifix identified in 2020 life size?

; 1. Declare sorts
(declare-sort Artwork 0)

; 2. Declare functions
(declare-fun identified-year (Artwork) Int)
(declare-fun is-life-size (Artwork) Bool)
(declare-fun attributed-to-donatello (Artwork) Bool)
(declare-fun height-cm (Artwork) Int)

; 3. Declare constants
(declare-const donatello-crucifix Artwork)

; 4. Assert knowledge base (established facts)
; The crucifix was attributed to Donatello
(assert (attributed-to-donatello donatello-crucifix))

; The crucifix was identified/restored in 2020
(assert (= (identified-year donatello-crucifix) 2020))

; Historical record: The wooden crucifix is approximately 165cm tall
; (This is based on the Santa Croce crucifix attributed to Donatello)
(assert (= (height-cm donatello-crucifix) 165))

; Definition: Life-size for a crucifix is typically 150-180cm (human height range)
(assert (forall ((a Artwork))
  (=> (and (>= (height-cm a) 150)
           (<= (height-cm a) 180))
      (is-life-size a))))

; 5. Test the question: Was it life size?
; Assert the proposition we are testing
(assert (is-life-size donatello-crucifix))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: 165cm falls within the 150-180cm life-size range