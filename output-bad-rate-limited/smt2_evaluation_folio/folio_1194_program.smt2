(declare-sort Person 0)

(declare-const lily Person)

; Predicates
(declare-fun AMC_AList (Person) Bool)
(declare-fun HBO (Person) Bool)
(declare-fun goes_weekly (Person) Bool)
(declare-fun watch_TV_series_in_cinema (Person) Bool)
(declare-fun three_movies_free_week (Person) Bool)
(declare-fun prefers_TV_series (Person) Bool)

; Knowledge base

; All customers subscribe to AMC A-List or HBO service
(assert (forall ((p Person)) (or (AMC_AList p) (HBO p))))

; HBO subscribers prefer TV series to movies
(assert (forall ((p Person)) (=> (HBO p) (prefers_TV_series p))))

; Customers who prefer TV series will not watch TV series in cinemas
(assert (forall ((p Person)) (=> (prefers_TV_series p) (not (watch_TV_series_in_cinema p)))))

; AMC A-List subscribers are eligible to watch three movies per week without additional fees
(assert (forall ((p Person)) (=> (AMC_AList p) (three_movies_free_week p))))

; Lily is in James' family and watches TV series in cinemas
(assert (watch_TV_series_in_cinema lily))

; Some customer goes to cinema every week
(assert (goes_weekly lily))

; Lily is an AMC A-List subscriber (to satisfy the universal)
(assert (AMC_AList lily))

; Test statement: "Lily goes to cinemas every week or watches 3 movies every week without any additional fees."
(assert (or (goes_weekly lily) (three_movies_free_week lily)))

(check-sat)