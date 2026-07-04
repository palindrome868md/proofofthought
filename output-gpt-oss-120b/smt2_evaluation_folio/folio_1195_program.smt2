; -------------------------------------------------
; Sort declaration
; -------------------------------------------------
(declare-sort Person 0)

; -------------------------------------------------
; Predicate (function) declarations
; -------------------------------------------------
(declare-fun subscribeAMC (Person) Bool)
(declare-fun subscribeHBO (Person) Bool)
(declare-fun eligible3Movies (Person) Bool)
(declare-fun goCinemaWeekly (Person) Bool)
(declare-fun preferTVSeries (Person) Bool)
(declare-fun watchTVInCinema (Person) Bool)

; -------------------------------------------------
; Constant declarations
; -------------------------------------------------
(declare-const Lily Person)
(declare-const witness Person)   ; witness for “some family member goes weekly”

; -------------------------------------------------
; Knowledge base (premises)
; -------------------------------------------------
; 1. AMC subscribers are eligible for three movies a week
(assert (forall ((p Person))
        (=> (subscribeAMC p) (eligible3Movies p))))

; 2. Some family member goes to the cinema every week
(assert (goCinemaWeekly witness))

; 3. Every family member subscribes to AMC or HBO (or both)
(assert (forall ((p Person))
        (or (subscribeAMC p) (subscribeHBO p))))

; 4. People who prefer TV series do NOT watch TV series in cinemas
(assert (forall ((p Person))
        (=> (preferTVSeries p) (not (watchTVInCinema p)))))

; 5. HBO subscribers prefer TV series to movies
(assert (forall ((p Person))
        (=> (subscribeHBO p) (preferTVSeries p))))

; 6. Lily watches TV series in cinemas
(assert (watchTVInCinema Lily))

; -------------------------------------------------
; Negation of the statement to be tested
; -------------------------------------------------
; Statement:  (not (and (goCinemaWeekly Lily) (subscribeHBO Lily)))
;             -> (or (eligible3Movies Lily) (preferTVSeries Lily))
; Negation:   (and (not (and ...)) (not (or ...)))
; i.e.,  (not (and (goCinemaWeekly Lily) (subscribeHBO Lily)))
;       (not (eligible3Movies Lily))
;       (not (preferTVSeries Lily))

(assert (not (and (goCinemaWeekly Lily) (subscribeHBO Lily)))) ; A is true
(assert (not (eligible3Movies Lily)))                         ; ¬eligible
(assert (not (preferTVSeries Lily)))                         ; ¬prefer

; -------------------------------------------------
; Check entailment
; -------------------------------------------------
(check-sat)   ; expected: unsat → the original implication is true
(get-model)