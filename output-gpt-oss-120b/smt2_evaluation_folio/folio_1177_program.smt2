;--- Sort declaration -------------------------------------------------
(declare-sort Monitor 0)

;--- Predicate (function) declarations ---------------------------------
(declare-fun MadeByLG (Monitor) Bool)
(declare-fun HasTypeC (Monitor) Bool)
(declare-fun MadeBefore2010 (Monitor) Bool)
(declare-fun InLibrary (Monitor) Bool)

;--- Individual monitors ------------------------------------------------
(declare-const L2021 Monitor)   ; the monitor in question
(declare-const m1 Monitor)      ; witness for premise 1 (some LG monitor with type‑C)

;--- Premise 1: some LG monitor has a type‑C port ----------------------
(assert (MadeByLG m1))
(assert (HasTypeC m1))

;--- Premise 2: type‑C ⇒ not made before 2010 -------------------------
(assert (forall ((x Monitor))
        (=> (HasTypeC x) (not (MadeBefore2010 x)))))

;--- Premise 3: library monitors were made before 2010 ----------------
(assert (forall ((x Monitor))
        (=> (InLibrary x) (MadeBefore2010 x))))

;--- Premise 4: L2021 is either in the library or has a type‑C port ---
(assert (or (InLibrary L2021) (HasTypeC L2021)))

;--- Premise 5: L2021 is (both LG & before 2010) or (neither) -------
(assert (or (and (MadeByLG L2021) (MadeBefore2010 L2021))
            (and (not (MadeByLG L2021)) (not (MadeBefore2010 L2021)))))

;--- Negation of the statement to be verified -------------------------
; antecedent ∧ ¬consequent
(assert (and
          ; antecedent: (LG ∧ Before) ∨ (¬LG ∧ ¬Before)
          (or (and (MadeByLG L2021) (MadeBefore2010 L2021))
              (and (not (MadeByLG L2021)) (not (MadeBefore2010 L2021))))
          ; ¬consequent: ¬(InLibrary ∨ LG)
          (not (or (InLibrary L2021) (MadeByLG L2021)))))

;--- Check whether the premises can coexist with the negated statement
(check-sat)     ; Expected result: sat  → the original implication is false
(get-model)     ; Shows a concrete model (witness)