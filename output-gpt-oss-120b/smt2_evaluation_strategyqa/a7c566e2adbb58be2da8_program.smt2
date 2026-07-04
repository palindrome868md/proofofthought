; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Entity 0)   ; all things that could be manufactured
(declare-sort Process 0)  ; manufacturing methods

; -------------------------------------------------
; 2. Declare predicates (as 0‑arity functions returning Bool)
; -------------------------------------------------
(declare-fun virus (Entity) Bool)          ; is a virus?
(declare-fun material (Entity) Bool)       ; is printable material?
(declare-fun able-to-make (Process Entity) Bool) ; can process make entity?

; -------------------------------------------------
; 3. Declare constants
; -------------------------------------------------
(declare-const adenovirus Entity)   ; the specific virus
(declare-const 3d-printer Process) ; the 3‑D‑printing process

; -------------------------------------------------
; 4. Knowledge base (facts and rules)
; -------------------------------------------------
; Adenovirus is a virus
(assert (virus adenovirus))

; 3‑D‑printer is a 3‑D‑printing process (no extra property needed)

; Rule: 3‑D‑printing cannot manufacture viruses
; (forall ((e Entity)) (=> (virus e) (not (able-to-make 3d-printer e))))
(assert
  (forall ((e Entity))
    (=> (virus e)
        (not (able-to-make 3d-printer e)))))

; (Optional) 3‑D‑printing can make ordinary printable materials
; (not required for the query, but included for completeness)
(assert
  (forall ((e Entity))
    (=> (material e)
        (able-to-make 3d-printer e))))

; -------------------------------------------------
; 5. Test the statement: "3D printing is able to make adenovirus"
; -------------------------------------------------
(assert (able-to-make 3d-printer adenovirus))

; -------------------------------------------------
; 6. Check satisfiability (single check)
; -------------------------------------------------
(check-sat)
(get-model)