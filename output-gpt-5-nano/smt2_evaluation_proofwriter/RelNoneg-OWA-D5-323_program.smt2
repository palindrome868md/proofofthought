; Declare sorts
(declare-sort Person 0)

; Declare predicates
(declare-fun sees (Person Person) Bool)
(declare-fun likes (Person Person) Bool)
(declare-fun needs (Person Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun kind (Person) Bool)

; Declare constants
(declare-const bear Person)
(declare-const rabbit Person)
(declare-const cow Person)
(declare-const dog Person)

; Facts (Knowledge Base)
(assert (sees bear rabbit))
(assert (likes cow rabbit))
(assert (needs cow rabbit))
(assert (sees cow rabbit))
(assert (green dog))
(assert (red dog))
(assert (likes dog cow))
(assert (likes dog rabbit))
(assert (needs dog bear))
(assert (sees dog cow))
(assert (sees dog rabbit))
(assert (blue rabbit))
(assert (cold rabbit))
(assert (needs rabbit bear))
(assert (needs rabbit cow))
(assert (sees rabbit dog))

; Rules
; 1. If the bear is cold then the bear is red
(assert (forall ((x Person)) (=> (cold x) (red x))))
; 2. If someone likes the rabbit and they are red then the rabbit likes the dog
(assert (forall ((x Person)) (=> (and (likes x rabbit) (red x)) (likes rabbit dog))))
; 3. If someone sees the dog and they need the bear then they are red
(assert (forall ((x Person)) (=> (and (sees x dog) (needs x bear)) (red x))))
; 4. Green people are red
(assert (forall ((x Person)) (=> (green x) (red x))))
; 5. If someone is red then they need the cow
(assert (forall ((x Person)) (=> (red x) (needs x cow))))
; 6. If someone sees the cow and they need the cow then they like the bear
(assert (forall ((x Person)) (=> (and (sees x cow) (needs x cow)) (likes x bear))))
; 7. All cold, kind people are green
(assert (forall ((x Person)) (=> (and (cold x) (kind x)) (green x))))
; 8. If someone sees the bear and the bear is cold then the bear needs the rabbit
(assert (forall ((x Person)) (=> (and (sees x bear) (cold bear)) (needs bear rabbit))))
; 9. If someone sees the dog and the dog likes the bear then the bear is cold
(assert (forall ((x Person)) (=> (and (sees x dog) (likes dog bear)) (cold bear))))

; Test: Is "bear not cold" satisfiable?
(assert (not (cold bear)))
(check-sat)
(get-model)