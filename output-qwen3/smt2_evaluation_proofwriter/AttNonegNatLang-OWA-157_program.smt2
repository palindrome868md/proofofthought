; SMT-LIB 2.0 Program to verify: "Fred is not young"
; Based on the given knowledge base about people and their properties

; Declare sorts
(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun rough (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun trusted (Person) Bool)
(declare-fun aged (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun green (Person) Bool)

; Declare constants (people)
(declare-const Alan Person)
(declare-const Dave Person)
(declare-const Fred Person)

; ============================================
; Knowledge Base - Assert all given facts
; ============================================

; 1. Alan is rough
(assert (rough Alan))

; 2. Alan is kind, cold, blue and very young
(assert (kind Alan))
(assert (cold Alan))
(assert (blue Alan))
(assert (young Alan))

; 3. Dave is cold and nice
(assert (cold Dave))
(assert (nice Dave))

; 4. Fred is round and kind
(assert (round Fred))
(assert (kind Fred))

; 5. Round young people, red with loveliness, are very cold towards others
(assert (forall ((p Person))
  (=> (and (round p) (young p) (red p))
      (cold p))))

; 6. Nice people with blue and rough skin are very young and cannot be trusted
(assert (forall ((p Person))
  (=> (and (nice p) (blue p) (rough p))
      (and (young p) (not (trusted p))))))

; 7. Most young kind people tend to be red too
(assert (forall ((p Person))
  (=> (and (young p) (kind p))
      (red p))))

; 8. Someone that is cold rough and red is also considered to be kind
(assert (forall ((p Person))
  (=> (and (cold p) (rough p) (red p))
      (kind p))))

; 9. A young aged and big blue person will definitely be cold
(assert (forall ((p Person))
  (=> (and (young p) (aged p) (big p) (blue p))
      (cold p))))

; 10. Anyone who is round and kind is also pretty young
(assert (forall ((p Person))
  (=> (and (round p) (kind p))
      (young p))))

; 11. If a person acts cold yet nice and green, they will be kind
(assert (forall ((p Person))
  (=> (and (cold p) (nice p) (green p))
      (kind p))))

; ============================================
; Verification: Test "Fred is not young"
; ============================================
; From fact 4: Fred is round AND kind
; From rule 10: round AND kind => young
; Therefore: Fred MUST be young
; Testing the negation should return UNSAT

(assert (not (young Fred)))

; Check satisfiability
(check-sat)
(get-model)