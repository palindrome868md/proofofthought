;--- 1. Declare the uninterpreted sort for animals
(declare-sort Animal 0)

;--- 2. Declare the specific animal constant
(declare-const northern-fur-seal Animal)

;--- 3. Declare the predicate: is this animal a good pet for a child of a given age?
(declare-fun good-pet-for (Animal Int) Bool)

;--- 4. Knowledge base: a Northern fur seal is NOT a good pet for a six‑year‑old child
(assert (not (good-pet-for northern-fur-seal 6)))

;--- 5. Test the question: "Does Northern fur seal make good pet for six year old?"
(assert (good-pet-for northern-fur-seal 6))

;--- 6. Check satisfiability
(check-sat)
(get-model)