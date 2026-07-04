;------------------------------------------------------------
; 1. Sort declaration
;------------------------------------------------------------
(declare-sort Person 0)

;------------------------------------------------------------
; 2. Predicate (function) declarations
;------------------------------------------------------------
(declare-fun choral-conductor (Person) Bool)
(declare-fun musician (Person) Bool)
(declare-fun specialized-renaissance (Person) Bool)
(declare-fun specialized-baroque (Person) Bool)
(declare-fun loves-music (Person) Bool)

;------------------------------------------------------------
; 3. Constant declarations (individuals)
;------------------------------------------------------------
(declare-const miroslav Person)          ; Miroslav Venhoda
(declare-const witness-musician Person)  ; witness for “some musicians love music”

;------------------------------------------------------------
; 4. Premises
;------------------------------------------------------------
; Premise 1: Miroslav is a choral conductor who specializes in Renaissance and Baroque
(assert (choral-conductor miroslav))
(assert (specialized-renaissance miroslav))
(assert (specialized-baroque miroslav))

; Premise 2: Every choral conductor is a musician
(assert (forall ((p Person))
          (=> (choral-conductor p) (musician p))))

; Premise 3: Some musicians love music
;   (we instantiate the existential with the constant witness-musician)
(assert (musician witness-musician))
(assert (loves-music witness-musician))

; (Premise 4 about the book is irrelevant for the queried statement,
;  so it is omitted.)

;------------------------------------------------------------
; 5. Statement to be tested:
;    “No choral conductor specialized in the performance of Renaissance.”
;    ⇔  ∀x. choral-conductor(x) → ¬specialized-renaissance(x)
;------------------------------------------------------------
(assert (forall ((p Person))
          (=> (choral-conductor p) (not (specialized-renaissance p)))))

;------------------------------------------------------------
; 6. Verification
;------------------------------------------------------------
(check-sat)   ; Expected: unsat (the statement is false under the premises)
(get-model)  ; Optional: shows a model if the check were sat