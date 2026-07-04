;-------------------------------------------------
; Sort declarations
(declare-sort Ship 0)
(declare-sort Location 0)

;-------------------------------------------------
; Function (predicate) declarations
(declare-fun preserved (Ship Location) Bool)   ; ship is well‑preserved at location
(declare-fun cold (Location) Bool)            ; location is cold
(declare-fun deep (Location) Bool)            ; location is deep
(declare-fun low_oxygen (Location) Bool)      ; location has low dissolved oxygen

;-------------------------------------------------
; Constant (object) declarations
(declare-const titanic Ship)
(declare-const atlantic Location)
(declare-const gulf_of_finland Location)

;-------------------------------------------------
; Knowledge base

; General rule: a ship is well‑preserved if the place is cold, deep and low‑oxygen
(assert (forall ((s Ship) (l Location))
        (=> (and (cold l) (deep l) (low_oxygen l))
            (preserved s l))))

; Facts about the actual Titanic site (Atlantic)
(assert (cold atlantic))
(assert (deep atlantic))
(assert (low_oxygen atlantic))
; (The rule already makes the Titanic preserved here, but we assert it explicitly)
(assert (preserved titanic atlantic))

; Facts about the Gulf of Finland
(assert (cold gulf_of_finland))               ; it is cold
(assert (not (deep gulf_of_finland)))         ; it is not deep enough
(assert (not (low_oxygen gulf_of_finland)))   ; oxygen levels are relatively high

;-------------------------------------------------
; Test the question:
; "Would the Titanic be well preserved at the bottom of the Gulf of Finland?"
(assert (preserved titanic gulf_of_finland))

;-------------------------------------------------
; Verification
(check-sat)   ; expected result: unsat (the statement cannot be true)
(get-model)   ; optional: show a model if the solver were to find one