; The Sort
(declare-sort Person 0)

; Predicates / Functions
(declare-fun is-in-james-family (Person) Bool)
(declare-fun AList (Person) Bool)
(declare-fun HBO (Person) Bool)
(declare-fun free-movies-per-week (Person) Int)
(declare-fun weekly-cinema (Person) Bool)
(declare-fun watch-tv-series-cinema (Person) Bool)
(declare-fun prefers-tv-series (Person) Bool)

; Constants
(declare-const lily Person)

; Premises (Knowledge Base)

; 1. All James' family members who subscribe to AMC A-List are eligible to watch three movies every week without any additional fees.
(assert
  (forall ((p Person))
    (=> (is-in-james-family p)
        (=> (AList p)
            (= (free-movies-per-week p) 3)))))

; 2. Some of the customers in James' family go to the cinema every week.
(declare-const bob Person)
(assert (is-in-james-family bob))
(assert (weekly-cinema bob))

; 3. James' family members subscribe to AMC A-List or HBO service.
(assert
  (forall ((p Person))
    (=> (is-in-james-family p)
        (or (AList p) (HBO p)))))

; 4. James' family members who prefer TV series will not watch TV series in cinemas.
(assert
  (forall ((p Person))
    (=> (is-in-james-family p)
        (=> (prefers-tv-series p)
            (not (watch-tv-series-cinema p)))))))

; 5. HBO subscribers in James' family prefer TV series to movies.
(assert
  (forall ((p Person))
    (=> (is-in-james-family p)
        (=> (HBO p)
            (prefers-tv-series p)))))

; 6. Lily is in James' family; she watches TV series in cinemas.
(assert (is-in-james-family lily))
(assert (watch-tv-series-cinema lily))

; Additional scenario data to satisfy premise 2 with a concrete witness
; (bob) is in James' family and goes to cinema weekly (already asserted)

; Premise about Lily's availability to watch 3 movies per week without fees
(assert (= (free-movies-per-week lily) 3))

; Question/Test: If Lily is available to watch 3 movies every week and she watches TV-series in cinemas,
; then she goes to cinemas every week and prefers TV-series.
; To test entailment of (weekly-cinema lily) and (prefers-tv-series lily) from the antecedent,
; we negate the conclusion and check satisfiability.
(assert (not (and weekly-cinema lily (prefers-tv-series lily))))

; Check for satisfiability
(check-sat)
(get-model)

; Result interpretation (embedded as a comment in the SMT2 file):
; If the solver returns SAT, the negation is satisfiable, hence the implication A∧B ⇒ (C∧D) is not entailed.
; In this knowledge base, the premises force Lily to be an AList subscriber (to satisfy KB consistency),
; and from 4 we obtain not (watch-tv-series-cinema lily) when (prefers-tv-series lily) holds; since Lily watches
; TV-series in cinemas (B), this yields a contradiction unless Lily does not prefer TV-series.
; Consequently, the statement is not entailed by the premises (i.e., it is false under the given KB), so the
; expected answer is SAT for the negation (as modeled above).