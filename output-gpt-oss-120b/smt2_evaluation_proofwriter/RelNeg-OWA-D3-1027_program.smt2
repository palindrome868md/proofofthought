; -------------------------------------------------
; 1. Sort declaration
; -------------------------------------------------
(declare-sort Entity 0)

; -------------------------------------------------
; 2. Predicate (function) declarations
; -------------------------------------------------
(declare-fun chases (Entity Entity) Bool)
(declare-fun likes  (Entity Entity) Bool)
(declare-fun sees   (Entity Entity) Bool)

(declare-fun isBlue   (Entity) Bool)
(declare-fun isCold   (Entity) Bool)
(declare-fun isRed    (Entity) Bool)
(declare-fun isRound  (Entity) Bool)
(declare-fun isYoung  (Entity) Bool)

; -------------------------------------------------
; 3. Constant declarations
; -------------------------------------------------
(declare-const bald_eagle Entity)
(declare-const dog        Entity)
(declare-const tiger      Entity)

; -------------------------------------------------
; 4. Facts from the story
; -------------------------------------------------
; Chasing facts
(assert (chases bald_eagle dog))
(assert (chases bald_eagle tiger))
(assert (chases dog bald_eagle))
(assert (chases tiger dog))

; Dog properties
(assert (isBlue  dog))
(assert (isCold  dog))
(assert (isRed   dog))
(assert (isRound dog))
(assert (isYoung dog))

; Tiger properties and relations
(assert (isRound tiger))
(assert (likes tiger bald_eagle))
(assert (sees  tiger bald_eagle))

; -------------------------------------------------
; 5. Inference rules (as universally quantified implications)
; -------------------------------------------------
; Rule 1: If someone chases the bald eagle and they chase the tiger then they see the bald eagle.
(assert (forall ((x Entity))
  (=> (and (chases x bald_eagle) (chases x tiger))
      (sees x bald_eagle))))

; Rule 2: If the bald eagle sees the tiger and the tiger is young then the bald eagle chases the tiger.
(assert (forall ()
  (=> (and (sees bald_eagle tiger) (isYoung tiger))
      (chases bald_eagle tiger))))

; Rule 3: If the tiger likes the dog and the dog is cold then the dog sees the bald eagle.
(assert (forall ()
  (=> (and (likes tiger dog) (isCold dog))
      (sees dog bald_eagle))))

; Rule 4: If the dog is red and the dog sees the bald eagle then the bald eagle does not like the tiger.
(assert (forall ()
  (=> (and (isRed dog) (sees dog bald_eagle))
      (not (likes bald_eagle tiger)))))

; Rule 5: If someone is blue then they chase the tiger.
(assert (forall ((x Entity))
  (=> (isBlue x) (chases x tiger))))

; Rule 6: If the dog chases the tiger and the dog sees the tiger then the tiger does not like the bald eagle.
(assert (forall ()
  (=> (and (chases dog tiger) (sees dog tiger))
      (not (likes tiger bald_eagle)))))

; Rule 7: If someone chases the bald eagle and they do not like the tiger then the tiger is red.
(assert (forall ((x Entity))
  (=> (and (chases x bald_eagle) (not (likes x tiger)))
      (isRed tiger))))

; Rule 8: If someone is round and they do not see the bald eagle then the bald eagle sees the dog.
(assert (forall ((x Entity))
  (=> (and (isRound x) (not (sees x bald_eagle)))
      (sees bald_eagle dog))))

; -------------------------------------------------
; 6. Query we want to verify: "The bald eagle chases the dog."
; -------------------------------------------------
(assert (chases bald_eagle dog))

; -------------------------------------------------
; 7. Check satisfiability (sat = true, unsat = false)
; -------------------------------------------------
(check-sat)
(get-model)