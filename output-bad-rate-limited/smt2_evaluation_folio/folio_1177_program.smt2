; Sorts
(declare-sort Monitor 0)

; Predicates on Monitors
(declare-fun produced-by-LG (Monitor) Bool)
(declare-fun before-2010 (Monitor) Bool)
(declare-fun in-library (Monitor) Bool)
(declare-fun type-c-port (Monitor) Bool)

; Constant monitor for the question
(declare-const l-2021 Monitor)

; 1. Some monitors made by LG have a type-c port.
(assert (exists ((m Monitor)) (and (produced-by-LG m) (type-c-port m))))

; 2. Monitors that have a type-c port were not made before 2010.
(assert (forall ((m Monitor)) (=> (type-c-port m) (before-2010 m))))

; 3. All monitors in the library are made before 2010.
(assert (forall ((m Monitor)) (=> (in-library m) (before-2010 m))))

; 4. The L-2021 monitor is either used in the library or has a type-c port.
(assert (or (in-library l-2021) (type-c-port l-2021)))

; 5. The L-2021 monitor is either both produced before 2010 and made by LG, or neither is true.
; Equivalent to: produced-by-LG(l-2021) == before-2010(l-2021)
(assert (= (produced-by-LG l-2021) (before-2010 l-2021)))

; Test the statement:
; If the monitor L-2021 is either produced by LG and produced before 2010 or
; neither produced by LG nor produced before 2010, then L-2021 is either in the library or produced by LG.
; We test by negating the implication and checking for satisfiability.
(assert (not
  (=> (or (and (produced-by-LG l-2021) (before-2010 l-2021))
           (and (not (produced-by-LG l-2021)) (not (before-2010 l-2021))))
      (or (in-library l-2021) (produced-by-LG l-2021))
  )
))

(check-sat)