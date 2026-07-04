; -------------------------------------------------
; 1. Sort declarations
; -------------------------------------------------
(declare-sort Person 0)        ; individuals
(declare-sort Organization 0) ; groups such as Swiss Guard
(declare-sort Position 0)      ; political chairs/seats
(declare-sort Country 0)       ; nations
(declare-sort State 0)         ; US states

; -------------------------------------------------
; 2. Function & predicate declarations
; -------------------------------------------------
; Membership of a person in an organization
(declare-fun member-of (Person Organization) Bool)

; Whether a person holds a political position
(declare-fun holds (Person Position) Bool)

; Citizenship of a person in a given country
(declare-fun citizen-of (Person Country) Bool)

; Whether a person is a member of a foreign (non‑US) military
(declare-fun foreign-military (Person) Bool)

; -------------------------------------------------
; 3. Constant symbols (the objects we discuss)
; -------------------------------------------------
(declare-const swiss-guard Organization)
(declare-const virginia-general-assembly Organization)
(declare-const assembly-chair Position)   ; a chair in the VA General Assembly
(declare-const usa Country)
(declare-const switzerland Country)
(declare-const vatican Country)
(declare-const virginia State)

; -------------------------------------------------
; 4. Knowledge base (facts + general rules)
; -------------------------------------------------

; Fact: The Swiss Guard is a foreign (Vatican) military organization.
; Anyone who is a member of the Swiss Guard is a citizen of Switzerland
; and belongs to a foreign military.
(assert (forall ((p Person))
  (=> (member-of p swiss-guard)
      (and (citizen-of p switzerland)
           (foreign-military p)))))

; Rule: A person who belongs to a foreign military cannot hold any
; position in the Virginia General Assembly.
(assert (forall ((p Person) (pos Position))
  (=> (and (holds p pos) (foreign-military p))
      false)))   ; i.e. the antecedent is impossible

; (Optionally) a chair in the VA General Assembly is indeed a position
; that is part of the Virginia General Assembly organization.
; (Not needed for the SAT check, but kept for completeness.)
(assert (forall ((p Person))
  (=> (holds p assembly-chair)
      true)))   ; placeholder – no further constraints needed here

; -------------------------------------------------
; 5. Test the question: "Can the Swiss Guard fill the Virginia General Assembly chairs?"
; -------------------------------------------------
; Introduce a witness person who is both a Swiss Guard member
; and holds an Assembly chair.
(declare-const witness Person)
(assert (member-of witness swiss-guard))
(assert (holds witness assembly-chair))

; -------------------------------------------------
; 6. Solve
; -------------------------------------------------
(check-sat)    ; Expected result: unsat (the scenario cannot occur)
(get-model)   ; Optional: shows the (empty) model when unsat