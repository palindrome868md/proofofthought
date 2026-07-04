; -------------------------------------------------
; 1. Declare sorts
; -------------------------------------------------
(declare-sort Person 0)
(declare-sort Country 0)

; -------------------------------------------------
; 2. Declare functions / predicates
; -------------------------------------------------
; Residency: number of years a person has lived in a country
(declare-fun years-lived (Person Country) Int)

; Marriage between two persons
(declare-fun marriage (Person Person) Bool)

; Close‑relation (cousins) between two persons
(declare-fun is-cousin (Person Person) Bool)

; Derived predicate: person satisfies the residency condition
(declare-fun eligible-residency (Person) Bool)

; Predicate: person can file an annulment (nullity) petition against spouse
(declare-fun can-file-annulment (Person Person) Bool)

; -------------------------------------------------
; 3. Declare constants (the people and the country)
; -------------------------------------------------
(declare-const me Person)
(declare-const husband Person)
(declare-const england-wales Country)

; -------------------------------------------------
; 4. Knowledge base (facts from the scenario & law)
; -------------------------------------------------
; – The petitioner has lived in England/Wales for 2 years
(assert (= (years-lived me england-wales) 2))

; – Residency rule: at least 1 year makes a person eligible
(assert (forall ((p Person) (c Country))
        (=> (>= (years-lived p c) 1)
            (eligible-residency p))))

; – The marriage exists
(assert (marriage me husband))

; – They are cousins (a “closely related” ground that makes the marriage void)
(assert (is-cousin me husband))

; – Rule: if a marriage is void because the spouses are closely related
;   and the petitioner meets the residency condition, they can file an annulment
(assert (forall ((p Person) (sp Person))
        (=> (and (marriage p sp)
                 (is-cousin p sp)
                 (eligible-residency p))
            (can-file-annulment p sp))))

; -------------------------------------------------
; 5. Test the question: "Can I file an annulment petition?"
; -------------------------------------------------
(assert (can-file-annulment me husband))

; -------------------------------------------------
; 6. Check satisfiability (sat = Yes, unsat = No)
; -------------------------------------------------
(check-sat)
(get-model)