;--- Sorts -------------------------------------------------
(declare-sort Person 0)

;--- Predicates -------------------------------------------
(declare-fun Investor (Person) Bool)                 ; Investor(x)
(declare-fun Entrepreneur (Person) Bool)             ; Entrepreneur(x)
(declare-fun EnjoyOpportunity (Person) Bool)         ; enjoys starting a business
(declare-fun PreferPlanned (Person) Bool)            ; prefers planned economy
(declare-fun EnjoyStateOwnership (Person) Bool)      ; enjoys state ownership
(declare-fun PrefersStateOwnership (Person) Bool)    ; prefers state ownership
(declare-fun ArdCom (Person) Bool)                   ; ardent communist

;--- Constant ---------------------------------------------
(declare-const ho Person)

;--- Premises ---------------------------------------------
; 1. Everyone is an investor or an entrepreneur
(assert (forall ((p Person)) (or (Investor p) (Entrepreneur p))))

; 2. No one who enjoys the opportunity prefers a planned economy
(assert (forall ((p Person))
        (=> (EnjoyOpportunity p) (not (PreferPlanned p)))))

; 3. All entrepreneurs enjoy the opportunity of starting a business
(assert (forall ((p Person))
        (=> (Entrepreneur p) (EnjoyOpportunity p))))

; 4. Everyone who enjoys state ownership prefers a planned economy
(assert (forall ((p Person))
        (=> (EnjoyStateOwnership p) (PreferPlanned p))))

; 5. Everyone who is an ardent communist prefers state ownership
(assert (forall ((p Person))
        (=> (ArdCom p) (PrefersStateOwnership p))))

;--- Fact -------------------------------------------------
; Ho prefers state ownership of the means of production
(assert (PrefersStateOwnership ho))

;--- Negation of the statement we are testing -------------
; Negation of: (Investor ho) OR (not (ArdCom ho))
; becomes: (not (Investor ho)) AND (ArdCom ho)
(assert (not (Investor ho)))
(assert (ArdCom ho))

;--- Check satisfiability ---------------------------------
(check-sat)
(get-model)