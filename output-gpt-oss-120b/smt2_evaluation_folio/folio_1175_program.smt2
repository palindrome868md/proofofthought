; -------------------------------------------------
; Declarations
; -------------------------------------------------
(declare-sort Monitor 0)

(declare-fun MadeByLG      (Monitor) Bool)   ; monitor is made by LG
(declare-fun HasTypeC      (Monitor) Bool)   ; monitor has a type‑c port
(declare-fun MadeBefore2010(Monitor) Bool)   ; monitor was produced before 2010
(declare-fun InLibrary     (Monitor) Bool)   ; monitor is in the library

; Constants
(declare-const L2021 Monitor)   ; the L‑2021 monitor
(declare-const exM   Monitor)   ; witness for premise 1

; -------------------------------------------------
; Premises
; -------------------------------------------------
; 1. Some monitors made by LG have a type‑c port.
(assert (MadeByLG exM))
(assert (HasTypeC exM))

; 2. Monitors that have a type‑c port were not made before 2010.
(assert (forall ((m Monitor))
  (=> (HasTypeC m) (not (MadeBefore2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor))
  (=> (InLibrary m) (MadeBefore2010 m))))

; 4. L‑2021 is either used in the library or has a type‑c port.
(assert (or (InLibrary L2021) (HasTypeC L2021)))

; 5. L‑2021 is either both produced before 2010 and made by LG, or neither is true.
(assert (or (and (MadeBefore2010 L2021) (MadeByLG L2021))
            (and (not (MadeBefore2010 L2021)) (not (MadeByLG L2021)))))

; -------------------------------------------------
; Negation of the statement to be verified
; -------------------------------------------------
; Statement: (HasTypeC L2021) ∨ (MadeByLG L2021)
; Negate it:
(assert (and (not (HasTypeC L2021))
             (not (MadeByLG L2021))))

; -------------------------------------------------
; Query
; -------------------------------------------------
(check-sat)   ; unsat → the statement is logically true
(get-model)