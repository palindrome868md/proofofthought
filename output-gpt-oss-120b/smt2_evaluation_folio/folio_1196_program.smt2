; -------------------------------------------------
; Sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Service 0)

; -------------------------------------------------
; Service constants
; -------------------------------------------------
(declare-const AMC_AList Service)
(declare-const HBO Service)

; -------------------------------------------------
; Predicate symbols (return Bool)
; -------------------------------------------------
(declare-fun subscribe (Person Service) Bool)
(declare-fun eligible_3movies (Person) Bool)
(declare-fun goes_cinema_weekly (Person) Bool)
(declare-fun prefer_tv_series (Person) Bool)
(declare-fun watch_tv_series_in_cinema (Person) Bool)

; -------------------------------------------------
; Individual constants
; -------------------------------------------------
(declare-const Lily Person)
(declare-const witness Person)   ; for the existential premise

; -------------------------------------------------
; Premises
; -------------------------------------------------
; 1. AMC A‑List subscribers are eligible for 3 movies each week
(assert (forall ((p Person))
  (=> (subscribe p AMC_AList)
      (eligible_3movies p))))

; 2. Some family member goes to the cinema every week
(assert (goes_cinema_weekly witness))

; 3. Every family member subscribes to AMC A‑List or HBO (or both)
(assert (forall ((p Person))
  (or (subscribe p AMC_AList) (subscribe p HBO))))

; 4. Persons who prefer TV series will NOT watch TV series in cinemas
(assert (forall ((p Person))
  (=> (prefer_tv_series p)
      (not (watch_tv_series_in_cinema p)))))

; 5. HBO subscribers prefer TV series to movies
(assert (forall ((p Person))
  (=> (subscribe p HBO)
      (prefer_tv_series p))))

; 6. Lily watches TV series in cinemas
(assert (watch_tv_series_in_cinema Lily))

; -------------------------------------------------
; Test the statement:
;   If Lily is eligible for 3 movies each week AND she watches TV series
;   THEN she goes to cinema weekly AND she prefers TV series.
; -------------------------------------------------
; Antecedent (assumed true for the test)
(assert (eligible_3movies Lily))   ; she is eligible for 3 movies

; Negation of the consequent
;   ¬(goes_cinema_weekly(Lily) ∧ prefer_tv_series(Lily))
;   ↔  (¬goes_cinema_weekly(Lily)) ∨ (¬prefer_tv_series(Lily))
(assert (or (not (goes_cinema_weekly Lily))
            (not (prefer_tv_series Lily))))

; -------------------------------------------------
; Check whether the constraints are consistent
; -------------------------------------------------
(check-sat)
(get-model)