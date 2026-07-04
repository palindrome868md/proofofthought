; Sorts
(declare-sort Person 0)

; Constants
(declare-const ho Person)

; Predicates
(declare-fun AtConference (Person) Bool)
(declare-fun Investor (Person) Bool)
(declare-fun Entrepreneur (Person) Bool)
(declare-fun EnjoyStartingBusiness (Person) Bool)
(declare-fun PrefersPlannedEconomy (Person) Bool)
(declare-fun EnjoyStateOwnership (Person) Bool)
(declare-fun PrefersStateOwnership (Person) Bool)
(declare-fun ArdentCommunist (Person) Bool)

; Knowledge base (Premises)

; Ho is at the conference and PrefersStateOwnership
(assert (AtConference ho))
(assert (PrefersStateOwnership ho))

; 1. Everyone at the conference is either an investor or an entrepreneur
(assert (forall ((p Person))
  (=> (AtConference p) (or (Investor p) (Entrepreneur p)))))

; 2. None at the conference who enjoy starting a business prefer a planned economy
(assert (forall ((p Person))
  (=> (and (AtConference p) (EnjoyStartingBusiness p))
      (not (PrefersPlannedEconomy p)))))

; 3. All entrepreneurs at the conference enjoy starting a business
(assert (forall ((p Person))
  (=> (and (AtConference p) (Entrepreneur p))
      (EnjoyStartingBusiness p))))

; 4. Everyone at the conference who enjoys state ownership prefers a planned economy
(assert (forall ((p Person))
  (=> (and (AtConference p) (EnjoyStateOwnership p))
      (PrefersPlannedEconomy p))))

; 5. Ardent communist at the conference implies PrefersStateOwnership
(assert (forall ((p Person))
  (=> (and (AtConference p) (ArdentCommunist p))
      (PrefersStateOwnership p))))

; Question: Ho is an investor or is not an ardent communist
(assert (or (Investor ho) (not (ArdentCommunist ho))))

; Single check to determine the truth of the statement
(check-sat)
(get-model)