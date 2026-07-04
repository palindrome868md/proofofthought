;--- Sorts ----------------------------------------------------
(declare-sort Monitor 0)

;--- Predicates (as Boolean‑valued functions) -----------------
(declare-fun MadeByLG (Monitor) Bool)
(declare-fun HasTypeC (Monitor) Bool)
(declare-fun MadeBefore2010 (Monitor) Bool)
(declare-fun InLibrary (Monitor) Bool)

;--- Constants ------------------------------------------------
(declare-const L2021 Monitor)   ; the monitor in question
(declare-const w1 Monitor)      ; witness for “some LG monitor has a type‑C port”

;--- Knowledge base -------------------------------------------

; 1. Some monitor made by LG has a type‑C port
(assert (MadeByLG w1))
(assert (HasTypeC w1))

; 2. Monitors with a type‑C port were not made before 2010
(assert (forall ((m Monitor))
  (=> (HasTypeC m) (not (MadeBefore2010 m)))))

; 3. All monitors in the library are made before 2010
(assert (forall ((m Monitor))
  (=> (InLibrary m) (MadeBefore2010 m))))

; 4. L‑2021 is either in the library or has a type‑C port
(assert (or (InLibrary L2021) (HasTypeC L2021)))

; 5. L‑2021 is either (both made before 2010 and made by LG) or (neither)
(assert (or (and (MadeBefore2010 L2021) (MadeByLG L2021))
            (and (not (MadeBefore2010 L2021)) (not (MadeByLG L2021)))))

;--- Test the statement ---------------------------------------
; Negation of: (InLibrary L2021) ∨ (MadeByLG L2021)
(assert (and (not (InLibrary L2021)) (not (MadeByLG L2021))))

;--- Solve ----------------------------------------------------
(check-sat)
(get-model)