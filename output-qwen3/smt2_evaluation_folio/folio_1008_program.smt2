; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Constants
(declare-const Carol Person)

; 3. Declare Functions (Predicates)
(declare-fun attends_wedding (Person) Bool)
(declare-fun getting_married (Person) Bool)
(declare-fun knows_people_getting_married (Person) Bool)
(declare-fun is_preteen_or_young_child (Person) Bool)
(declare-fun enjoys_celebrating (Person) Bool)
(declare-fun fond_large_group (Person) Bool)
(declare-fun outgoing_spirited (Person) Bool)

; 4. Assert Knowledge Base (Premises)

; Premise 1: All people who attend weddings are getting married or know the people who are getting married.
(assert (forall ((x Person))
  (=> (attends_wedding x)
      (or (getting_married x) (knows_people_getting_married x)))))

; Premise 2: No preteens or young children are getting married or know the people who are getting married.
(assert (forall ((x Person))
  (=> (is_preteen_or_young_child x)
      (not (or (getting_married x) (knows_people_getting_married x))))))

; Premise 3: People who enjoy celebrating life milestone events with other people attend weddings.
(assert (forall ((x Person))
  (=> (enjoys_celebrating x)
      (attends_wedding x))))

; Premise 4: People who are fond of large group functions enjoy celebrating life milestone events with other people.
(assert (forall ((x Person))
  (=> (fond_large_group x)
      (enjoys_celebrating x))))

; Premise 5: All people who are outgoing and spirited are fond of large group functions.
(assert (forall ((x Person))
  (=> (outgoing_spirited x)
      (fond_large_group x))))

; Premise 6: If Carol is not both a pre-teen or young child and attends a wedding, 
; then Carol is not getting married or knows the people who are getting married.
; Interpreted as: NOT (Preteen AND Wedding) => NOT (Married OR Knows)
(assert (=> (not (and (is_preteen_or_young_child Carol) (attends_wedding Carol)))
      (not (or (getting_married Carol) (knows_people_getting_married Carol)))))

; 5. Verify Statement
; Statement: Carol is outgoing and very spirited.
; We assert this statement to check if it is consistent with the premises.
; If unsat, the statement is False (contradicts premises).
; If sat, the statement is True (consistent with premises).
(assert (outgoing_spirited Carol))

; 6. Check Satisfiability
(check-sat)
(get-model)