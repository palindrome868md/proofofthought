; Declare uninterpreted sorts
(declare-sort Person 0)
(declare-sort Condition 0)

; Declare predicates / functions
(declare-fun hasCondition (Person Condition) Bool)   ; person has a given condition
(declare-fun healthCondition (Condition) Bool)      ; marks a condition as a (dis)ability health condition
(declare-fun eligibleForESA (Person) Bool)          ; person is eligible for ESA

; Universal rule from the ESA eligibility description:
; If a person has a condition that is a health condition, they are eligible for ESA.
(assert
  (forall ((p Person) (c Condition))
    (=> (and (hasCondition p c) (healthCondition c))
        (eligibleForESA p))))

; Constants for the scenario
(declare-const mentalHealth Condition)  ; a mental‑health condition
(declare-const alice Person)            ; the person in question

; Knowledge base facts extracted from the document
; Mental‑health is a health condition (disability/health condition)
(assert (healthCondition mentalHealth))

; Alice has a mental‑health condition (the situation described in the question)
(assert (hasCondition alice mentalHealth))

; Test the query: "Are people with mental health problems eligible for ESA?"
; i.e., does Alice qualify?
(assert (eligibleForESA alice))

; Perform the check – SAT means the statement is true under the KB.
(check-sat)
(get-model)