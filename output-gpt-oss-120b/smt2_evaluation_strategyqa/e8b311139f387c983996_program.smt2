;--- 1. Declare sorts -------------------------------------------------
(declare-sort Person 0)
(declare-sort Animal 0)
(declare-sort Location 0)

;--- 2. Declare functions/predicates ------------------------------------
; Predicate: take-photo(Person, Animal, Location)  -> Bool
(declare-fun take-photo (Person Animal Location) Bool)

; Predicate: lives-in(Animal, Location) -> Bool
(declare-fun lives-in (Animal Location) Bool)

;--- 3. Declare constants -----------------------------------------------
(declare-const you Person)
(declare-const saltwater-croc Animal)
(declare-const memphis Location)

;--- 4. Background rule: you can only photograph an animal where it lives
(assert
  (forall ((p Person) (a Animal) (l Location))
    (=> (take-photo p a l)
        (lives-in a l))))

;--- 5. Domain knowledge: a Saltwater crocodile does NOT live in Memphis
(assert (not (lives-in saltwater-croc memphis)))

;--- 6. Test scenario: you take a photo of a Saltwater crocodile in Memphis
(assert (take-photo you saltwater-croc memphis))

;--- 7. Check satisfiability --------------------------------------------
(check-sat)
(get-model)