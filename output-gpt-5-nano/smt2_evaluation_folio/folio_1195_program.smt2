; Sort
(declare-sort Person 0)

; Constants
(declare-const Lily Person)

; Predicates (relations)
(declare-fun InJamesFamily (Person) Bool)
(declare-fun SubscribesAMCList (Person) Bool)
(declare-fun SubscribesHBO (Person) Bool)
(declare-fun GoesToCinemaEveryWeek (Person) Bool)
(declare-fun ThreeMoviesWeeklyNoFees (Person) Bool)
(declare-fun WatchesTVSeriesInCinemas (Person) Bool)
(declare-fun PrefersTVOverMovies (Person) Bool)

; Premises (Knowledge Base)

; 1. All James' family who subscribe to AMC A-List are eligible to watch three movies weekly without fees.
(assert (forall ((p Person))
  (=> (InJamesFamily p)
      (=> (SubscribesAMCList p)
          (ThreeMoviesWeeklyNoFees p)))))

; 2. Some of the customers in James' family go to the cinema every week.
(assert (exists ((p Person))
  (and (InJamesFamily p)
       (GoesToCinemaEveryWeek p))))

; 3. Customers in James' family subscribe to AMC A-List or HBO service.
(assert (forall ((p Person))
  (=> (InJamesFamily p)
      (or (SubscribesAMCList p) (SubscribesHBO p)))))

; 4. Customers in James' family who prefer TV series will not watch TV series in cinemas.
(assert (forall ((p Person))
  (=> (InJamesFamily p)
      (=> (PrefersTVOverMovies p)
          (not (WatchesTVSeriesInCinemas p))))))

; 5. All customers in James' family who subscribe to HBO services prefer TV series to movies.
(assert (forall ((p Person))
  (=> (InJamesFamily p)
      (=> (SubscribesHBO p)
          (PrefersTVOverMovies p)))))

; 6. Lily is in James' family; she watches TV series in cinemas.
(assert (InJamesFamily Lily))
(assert (WatchesTVSeriesIn Cinemas Lily))  ; Note: a typo fix; correct form below:
; Correct predicate usage:
(assert (WatchesTVSeriesInCinemas Lily))

; Additional constraint to ensure the antecedent of the target statement is true:
; not (Lily goes to cinema weekly AND Lily subscribes to HBO)
(assert (not (and (GoesToCinemaEveryWeek Lily)
                  (SubscribesHBO Lily))))

; Negation of the consequent to test the statement (we test KB ∧ antecedent ∧ NOT consequent)
; consequent is: (ThreeMoviesWeeklyNoFees Lily) OR (PrefersTVOverMovies Lily)
; NOT consequent -> (NOT ThreeMoviesWeeklyNoFees Lily) AND (NOT PrefersTVOverMovies Lily)
(assert (and (not (ThreeMoviesWeeklyNoFees Lily))
             (not (PrefersTVOverMovies Lily))))

; Verification: check satisfiability of KB ∧ antecedent ∧ NOT consequent
(check-sat)