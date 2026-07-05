; Sort
(declare-sort Animal 0)

; Functions (predicates)
(declare-fun chases (Animal Animal) Bool)
(declare-fun blue (Animal) Bool)
(declare-fun cold (Animal) Bool)
(declare-fun red (Animal) Bool)
(declare-fun round (Animal) Bool)
(declare-fun young (Animal) Bool)
(declare-fun likes (Animal Animal) Bool)
(declare-fun sees (Animal Animal) Bool)

; Constants
(declare-const bald_eagle Animal)
(declare-const dog Animal)
(declare-const tiger Animal)

; Facts (Knowledge Base)
(assert (chases bald_eagle dog))
(assert (chases bald_eagle tiger))
(assert (chases dog bald_eagle))
(assert (blue dog))
(assert (cold dog))
(assert (red dog))
(assert (round dog))
(assert (young dog))
(assert (chases tiger dog))
(assert (round tiger))
(assert (likes tiger bald_eagle))
(assert (sees tiger bald_eagle))

; Rules
; 1. If someone chases the bald eagle and they chase the tiger then they see the bald eagle.
(assert (forall ((x Animal))
  (=> (and (chases x bald_eagle) (chases x tiger))
      (sees x bald_eagle))))
; 2. If the bald eagle sees the tiger and the tiger is young then the bald eagle chases the tiger.
(assert (=> (and (sees bald_eagle tiger) (young tiger))
            (chases bald_eagle tiger)))
; 3. If the tiger likes the dog and the dog is cold then the dog sees the bald eagle.
(assert (=> (and (likes tiger dog) (cold dog))
            (sees dog bald_eagle)))
; 4. If the dog is red and the dog sees the bald eagle then the bald eagle does not like the tiger.
(assert (=> (and (red dog) (sees dog bald_eagle))
            (not (likes bald_eagle tiger))))
; 5. If someone is blue then they chase the tiger.
(assert (forall ((x Animal))
  (=> (blue x) (chases x tiger))))
; 6. If the dog chases the tiger and the dog sees the tiger then the tiger does not like the bald eagle.
(assert (=> (and (chases dog tiger) (sees dog tiger))
            (not (likes tiger bald_eagle))))
; 7. If someone chases the bald eagle and they do not like the tiger then the tiger is red.
(assert (forall ((x Animal))
  (=> (and (chases x bald_eagle) (not (likes x tiger)))
      (red tiger))))
; 8. If someone is round and they do not see the bald eagle then the bald eagle sees the dog.
(assert (forall ((x Animal))
  (=> (and (round x) (not (sees x bald_eagle)))
      (sees bald_eagle dog))))

; Test: Question - does the bald eagle chase the dog?
(assert (chases bald_eagle dog))

; Check satisfiability and provide a model
(check-sat)
(get-model)