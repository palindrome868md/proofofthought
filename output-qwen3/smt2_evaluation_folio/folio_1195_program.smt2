; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions (Predicates)
(declare-fun InFamily (Person) Bool)
(declare-fun SubscribeAMC (Person) Bool)
(declare-fun SubscribeHBO (Person) Bool)
(declare-fun GoCinemaWeekly (Person) Bool)
(declare-fun Eligible3Movies (Person) Bool)
(declare-fun PreferTV (Person) Bool)
(declare-fun WatchTVInCinema (Person) Bool)

; 3. Declare constants
(declare-const Lily Person)
(declare-const SomeMember Person)

; 4. Assert knowledge base (Premises)

; Premise 1: All customers in James' family who subscribe to AMC A-List are eligible...
(assert (forall ((x Person))
  (=> (and (InFamily x) (SubscribeAMC x))
      (Eligible3Movies x))))

; Premise 2: Some of the customers in James' family go to the cinema every week.
(assert (and (InFamily SomeMember) (GoCinemaWeekly SomeMember)))

; Premise 3: Customers in James' family subscribe to AMC A-List or HBO service.
(assert (forall ((x Person))
  (=> (InFamily x)
      (or (SubscribeAMC x) (SubscribeHBO x)))))

; Premise 4: Customers in James' family who prefer TV series will not watch TV series in cinemas.
(assert (forall ((x Person))
  (=> (and (InFamily x) (PreferTV x))
      (not (WatchTVInCinema x)))))

; Premise 5: All customers in James' family who subscribe to HBO services prefer TV series to movies.
(assert (forall ((x Person))
  (=> (and (InFamily x) (SubscribeHBO x))
      (PreferTV x))))

; Premise 6: Lily is in James' family; she watches TV series in cinemas.
(assert (InFamily Lily))
(assert (WatchTVInCinema Lily))

; 5. Assert the statement to verify
; Statement: If Lily does not both go to cinemas every week and subscribe to HBO service, 
; then Lily is either available to watch 3 movies every week without any additional fees or she prefers TV more.
(assert (=> (not (and (GoCinemaWeekly Lily) (SubscribeHBO Lily)))
            (or (Eligible3Movies Lily) (PreferTV Lily))))

; 6. Check satisfiability
; sat = True (Statement is consistent/entailed)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)