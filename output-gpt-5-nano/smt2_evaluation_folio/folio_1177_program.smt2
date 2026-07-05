; Sorts
(declare-sort Monitor 0)
(declare-sort Company 0)

; Constants
(declare-const LG Company)
(declare-const L2021 Monitor)

; Predicates / Relations
(declare-fun produced-before-2010 (Monitor) Bool)
(declare-fun has-type-c-port (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)
(declare-fun produced-by (Monitor Company) Bool)

; Knowledge Base

; 1. Some monitors made by LG have a type-c port.
(assert (exists ((m Monitor)) (and (produced-by m LG) (has-type-c-port m))))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) (=> (has-type-c-port m) (not (produced-before-2010 m)))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor)) (=> (in-library m) (produced-before-2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in-library L2021) (has-type-c-port L2021)))

; 5. The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
(assert (or (and (produced-before-2010 L2021) (produced-by L2021 LG))
            (and (not (produced-before-2010 L2021)) (not (produced-by L2021 LG)))))

; Test scenario for the given statement:
; Antecedent A: L2021 is either both before 2010 and LG-produced, or neither.
; (Explicitly restate A to test the implication)
(assert (or (and (produced-before-2010 L2021) (produced-by L2021 LG))
            (and (not (produced-before-2010 L2021)) (not (produced-by L2021 LG)))))

; Consequent C: L2021 is either in the library or produced by LG.
; Not C: negation of C
(assert (not (or (in-library L2021) (produced-by L2021 LG))))

; Check the satisfiability of A ∧ ¬C given the knowledge base
(check-sat)