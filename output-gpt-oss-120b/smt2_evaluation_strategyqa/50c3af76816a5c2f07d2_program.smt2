;--- 1. Declare sorts -------------------------------------------------
(declare-sort Company 0)
(declare-sort Character 0)

;--- 2. Declare constants -----------------------------------------------
(declare-const Disney Company)
(declare-const Elsa Character)

;--- 3. Declare predicates ------------------------------------------------
(declare-fun has-character (Company Character) Bool)
(declare-fun is-princess (Character) Bool)
(declare-fun is-ice-affiliated (Character) Bool)

;--- 4. Define "ice princess" as a conjunction ---------------------------
(define-fun ice-princess ((c Character)) Bool
  (and (is-princess c) (is-ice-affiliated c))
)

;--- 5. Knowledge base ---------------------------------------------------
; Disney created Elsa
(assert (has-character Disney Elsa))

; Elsa is a princess
(assert (is-princess Elsa))

; Elsa is ice‑affiliated (her powers are ice magic)
(assert (is-ice-affiliated Elsa))

;--- 6. Test the query: Does Disney have an ice princess? ---------------
; Use Elsa as the witness for an ice‑princess belonging to Disney
(assert (has-character Disney Elsa))
(assert (ice-princess Elsa))

;--- 7. Check the result -------------------------------------------------
(check-sat)          ; Expected: sat  (the statement is true)
(get-model)         ; Optional: shows a model witnessing the facts