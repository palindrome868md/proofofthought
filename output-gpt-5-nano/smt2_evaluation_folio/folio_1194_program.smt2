; Sorts
(declare-sort Person 0)

; Constants
(declare-const lily Person)

; Predicates
(declare-fun AMC_AList (Person) Bool)
(declare-fun HBO (Person) Bool)
(declare-fun eligible3 (Person) Bool)
(declare-fun goes (Person) Bool)
(declare-fun watchesTVSeriesInCinema (Person) Bool)
(declare-fun prefersTVSeries (Person) Bool)

; Knowledge base

; 1) All AMC A-List subscribers are eligible to watch three movies per week
(assert (forall ((p Person))
  (=> (AMC_AList p)
      (eligible3 p))))

; 2) Some customers go to the cinema every week
(assert (exists ((p Person)) (goes p)))

; 3) Each customer subscribes to AMC A-List or HBO
(assert (forall ((p Person))
  (or (AMC_AList p) (HBO p))))

; 4) If a customer prefers TV series, they will not watch TV series in cinemas
(assert (forall ((p Person))
  (=> (prefersTVSeries p)
      (not (watchesTVSeriesInCinema p)))))

; 5) HBO subscribers prefer TV series to movies
(assert (forall ((p Person))
  (=> (HBO p)
      (prefersTVSeries p))))

; 6) Lily watches TV series in cinemas
(assert (watchesTVSeriesInCinema lily))

; Test scenario: "Lily goes to cinemas every week or watches 3 movies every week without any additional fees"
; Model the statement as: goes(lily) OR eligible3(lily)
(assert (or (goes lily) (eligible3 lily)))

; Check satisfiability and provide a model
(check-sat)
(get-model)