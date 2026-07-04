; 1. Declare the sort for individuals
(declare-sort Person 0)

; 2. Declare predicates (functions returning Bool)
(declare-fun cold   (Person) Bool)
(declare-fun white  (Person) Bool)
(declare-fun big    (Person) Bool)
(declare-fun quiet  (Person) Bool)
(declare-fun smart  (Person) Bool)
(declare-fun kind   (Person) Bool)
(declare-fun rough  (Person) Bool)

; 3. Declare the constants (the people)
(declare-const bob   Person)
(declare-const dave  Person)
(declare-const fiona Person)
(declare-const harry Person)

; 4. Assert the factual knowledge base
(assert (cold  bob))
(assert (white bob))

(assert (big   dave))
(assert (cold  dave))
(assert (quiet dave))
(assert (smart dave))

(assert (kind  fiona))
(assert (smart fiona))

(assert (big   harry))
(assert (cold  harry))
(assert (rough harry))
(assert (smart harry))

; 5. Encode the general and specific rules
;   Rule: Big and rough ⇒ white
(assert (forall ((p Person))
          (=> (and (big p) (rough p))
              (white p))))

;   Rule: If Fiona is big and cold then Fiona is kind
(assert (=> (and (big fiona) (cold fiona))
            (kind fiona)))

;   Rule: If Dave is cold then Dave is quiet
(assert (=> (cold dave)
            (quiet dave)))

; 6. Test the query: "Bob is cold."
(assert (cold bob))

; 7. Check satisfiability (sat means the statement is true)
(check-sat)
(get-model)