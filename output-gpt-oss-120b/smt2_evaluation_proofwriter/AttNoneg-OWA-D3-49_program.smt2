;--- 1. Sort declaration
(declare-sort Person 0)

;--- 2. Predicate declarations (unary properties)
(declare-fun big (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun young (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun rough (Person) Bool)

;--- 3. Individual constants
(declare-const bob Person)
(declare-const fiona Person)
(declare-const gary Person)
(declare-const harry Person)

;--- 4. Facts
(assert (big bob))
(assert (kind bob))
(assert (red bob))

(assert (big fiona))
(assert (cold fiona))
(assert (kind fiona))
(assert (red fiona))
(assert (young fiona))

(assert (blue gary))
(assert (cold gary))
(assert (kind gary))
(assert (red gary))
(assert (rough gary))
(assert (young gary))

(assert (blue harry))

;--- 5. Universal rules
; All red people are blue.
(assert (forall ((p Person))
  (=> (red p) (blue p))))
; If someone is blue then they are young.
(assert (forall ((p Person))
  (=> (blue p) (young p))))
; Red, young people are cold.
(assert (forall ((p Person))
  (=> (and (red p) (young p)) (cold p))))

;--- 6. Query: "Harry is not young"
(assert (not (young harry)))

;--- 7. Check the consistency of the knowledge base with the query
(check-sat)
(get-model)