; 1. Declare sorts
(declare-sort Animal 0)

; 2. Declare functions (Properties)
(declare-fun is-green (Animal) Bool)
(declare-fun is-red (Animal) Bool)
(declare-fun is-blue (Animal) Bool)
(declare-fun is-cold (Animal) Bool)
(declare-fun is-kind (Animal) Bool)

; 3. Declare functions (Relations)
(declare-fun sees (Animal Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun needs (Animal Animal) Bool)

; 4. Declare constants
(declare-const bear Animal)
(declare-const cow Animal)
(declare-const dog Animal)
(declare-const rabbit Animal)

; 5. Assert Knowledge Base (Facts)
(assert (sees bear rabbit))
(assert (likes cow rabbit))
(assert (needs cow rabbit))
(assert (sees cow rabbit))
(assert (is-green dog))
(assert (is-red dog))
(assert (likes dog cow))
(assert (likes dog rabbit))
(assert (needs dog bear))
(assert (sees dog cow))
(assert (sees dog rabbit))
(assert (is-blue rabbit))
(assert (is-cold rabbit))
(assert (needs rabbit bear))
(assert (needs rabbit cow))
(assert (sees rabbit dog))

; 6. Assert Knowledge Base (Rules)
; If the bear is cold then the bear is red.
(assert (=> (is-cold bear) (is-red bear)))

; If someone likes the rabbit and they are red then the rabbit likes the dog.
(assert (forall ((x Animal))
  (=> (and (likes x rabbit) (is-red x))
      (likes rabbit dog))))

; If someone sees the dog and they need the bear then they are red.
(assert (forall ((x Animal))
  (=> (and (sees x dog) (needs x bear))
      (is-red x))))

; Green people are red.
(assert (forall ((x Animal))
  (=> (is-green x) (is-red x))))

; If someone is red then they need the cow.
(assert (forall ((x Animal))
  (=> (is-red x) (needs x cow))))

; If someone sees the cow and they need the cow then they like the bear.
(assert (forall ((x Animal))
  (=> (and (sees x cow) (needs x cow))
      (likes x bear))))

; All cold, kind people are green.
(assert (forall ((x Animal))
  (=> (and (is-cold x) (is-kind x))
      (is-green x))))

; If someone sees the bear and the bear is cold then the bear needs the rabbit.
(assert (forall ((x Animal))
  (=> (and (sees x bear) (is-cold bear))
      (needs bear rabbit))))

; If someone sees the dog and the dog likes the bear then the bear is cold.
(assert (forall ((x Animal))
  (=> (and (sees x dog) (likes dog bear))
      (is-cold bear))))

; 7. Verification
; Question: The bear is not cold.
; We assert the statement to check if it is consistent with the KB.
(assert (not (is-cold bear)))

; 8. Check satisfiability
(check-sat)
(get-model)