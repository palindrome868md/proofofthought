; Sorts
(declare-sort Person 0)

; Constants representing the individuals
(declare-const me Person)
(declare-const wife Person)

; Predicates representing the scenario
; married(x, y): x is married to y
(declare-fun married (Person Person) Bool)

; pregnancy-by-else-at-marriage(x, y): x's spouse (y) was pregnant by someone else at the time of marriage
(declare-fun pregnancy-by-else-at-marriage (Person Person) Bool)

; voidable-marriage(x, y): the marriage between x and y is voidable (annullable)
(declare-fun voidable-marriage (Person Person) Bool)

; Knowledge base: the couple is married
(assert (married me wife))

; Knowledge base: at the time of marriage, the wife was pregnant by someone else
(assert (pregnancy-by-else-at-marriage me wife))

; Rule: if married(p, q) and pregnancy-by-else-at-marriage(p, q), then the marriage is voidable
(assert (forall ((p Person) (q Person))
  (=> (and (married p q)
           (pregnancy-by-else-at-marriage p q))
      (voidable-marriage p q))))

; Question: Can I have the marriage voided on this evidence?
; Test whether the marriage is voidable for (me, wife)
(assert (voidable-marriage me wife))

; Check satisfiability and provide a model if possible
(check-sat)
(get-model)