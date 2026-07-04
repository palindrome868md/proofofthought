; Declare sorts
(declare-sort Person 0)

; Declare constants
(declare-const lily Person)

; Declare predicates / relations
(declare-fun in_james_family (Person) Bool)
(declare-fun subscribes_amc_alist (Person) Bool)
(declare-fun subscribes_hbo (Person) Bool)
(declare-fun eligible_three_movies (Person) Bool)
(declare-fun goes_to_cinema_week (Person) Bool)
(declare-fun watches_tv_series_in_cinema (Person) Bool)
(declare-fun prefers_tv_series (Person) Bool)
(declare-fun prefers_tv_series_to_movies (Person) Bool)

; Premises

; 1. All customers in James' family who subscribe to AMC A-List are eligible to watch three movies every week without any additional fees.
(assert (forall ((p Person))
  (=> (and (in_james_family p) (subscribes_amc_alist p))
      (eligible_three_movies p))))

; 2. Some of the customers in James' family go to the cinema every week.
(assert (exists ((p Person))
  (and (in_james_family p) (goes_to_cinema_week p))))

; 3. Customers in James' family subscribe to AMC A-List or HBO service.
(assert (forall ((p Person))
  (=> (in_james_family p)
      (or (subscribes_amc_alist p) (subscribes_hbo p)))))

; 4. Customers in James' family who prefer TV series will not watch TV series in cinemas.
(assert (forall ((p Person))
  (=> (and (in_james_family p) (prefers_tv_series p))
      (not (watches_tv_series_in_cinema p)))))

; 5. All customers in James' family who subscribe to HBO services prefer TV series to movies.
(assert (forall ((p Person))
  (=> (in_james_family p)
      (=> (subscribes_hbo p) (prefers_tv_series_to_movies p)))))

; 6. Lily is in James' family; she watches TV series in cinemas.
(assert (in_james_family lily))
(assert (watches_tv_series_in_cinema lily))

; Test scenario (antecedent of the statement)
; Lily is available to watch 3 movies every week
(assert (eligible_three_movies lily))

; Negation of the conclusion to test entailment
; Conclusion: Lily goes to cinemas every week and Lily prefers TV series to movies
; We test the negation: not (goes_to_cinema_week lily AND prefers_tv_series_to_movies lily)
(assert (not (and (goes_to_cinema_week lily) (prefers_tv_series_to_movies lily))))

; Check satisfiability to determine truth of the statement
(check-sat)