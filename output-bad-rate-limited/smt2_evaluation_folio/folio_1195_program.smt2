; Sorts
(declare-sort Person 0)

; Predicates / Relations
(declare-fun subscribesAMCList (Person) Bool)
(declare-fun subscribesHBO (Person) Bool)
(declare-fun weeklyCinema (Person) Bool)
(declare-fun watchTVSeriesInCinema (Person) Bool)
(declare-fun eligible3Movies (Person) Bool)
(declare-fun prefersTVSeries (Person) Bool)

; Constants / Individuals
(declare-const lily Person)
(declare-const some-p Person)  ; witness for existential in premises

; Premises (Knowledge Base)

; 1. All customers who subscribe to AMC A-List are eligible to watch three movies per week
(assert (forall ((p Person))
  (=> (subscribesAMCList p)
      (eligible3Movies p))))

; 2. Some customers go to the cinema every week
(assert (weeklyCinema some-p))

; 3. Customers subscribe to AMC A-List or HBO service
(assert (forall ((p Person))
  (or (subscribesAMCList p) (subscribesHBO p))))

; 4. Those who prefer TV series will not watch TV series in cinemas
(assert (forall ((p Person))
  (=> (prefersTVSeries p)
      (not (watchTVSeriesInCinema p)))))

; 5. HBO subscribers prefer TV series to movies
(assert (forall ((p Person))
  (=> (subscribesHBO p)
      (prefersTVSeries p))))

; 6. Lily watches TV series in cinemas
(assert (watchTVSeriesInCinema lily))

; Statement to test:
; If Lily does not both go to cinemas every week and subscribe to HBO service,
; then Lily is either available to watch 3 movies every week without any additional fees
; or she prefers TV more.
;
; We test the negation of the statement: A ∧ ¬B, where
; A = "not (weeklyCinema(lily) and subscribesHBO(lily))"
; B = "eligible3Movies(lily) or prefersTVSeries(lily)"

(assert (and
  ; A: not (weeklyCinema(lily) and subscribesHBO(lily))
  (or (not (weeklyCinema lily)) (not (subscribesHBO lily)))
  ; ¬B: not (eligible3Movies(lily) or prefersTVSeries(lily))
  (and (not (eligible3Movies lily)) (not (prefersTVSeries lily)))
))

; Check satisfiability to determine truth of the statement
(check-sat)
(get-model)