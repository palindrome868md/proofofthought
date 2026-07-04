; Declare sort
(declare-sort Person 0)

; Declare predicates (functions returning Bool)
(declare-fun young (Person) Bool)
(declare-fun kind (Person) Bool)
(declare-fun blue (Person) Bool)
(declare-fun green (Person) Bool)
(declare-fun cold (Person) Bool)
(declare-fun big (Person) Bool)
(declare-fun nice (Person) Bool)
(declare-fun round (Person) Bool)
(declare-fun red (Person) Bool)
(declare-fun rough (Person) Bool)

; Declare constants
(declare-const bob Person)
(declare-const dave Person)
(declare-const fred Person)
(declare-const gary Person)

; Facts about Bob (Young Bob is kind and blue with green and cold traits that show how really big he is)
(assert (young bob))
(assert (kind bob))
(assert (blue bob))
(assert (green bob))
(assert (cold bob))
(assert (big bob))

; Facts about Dave (That guy Dave sure is nice)
(assert (nice dave))

; Facts about Fred (Fred is green and cold too)
(assert (green fred))
(assert (cold fred))

; Facts about Gary (Gary is a kind guy, very round in the belly and green as grass)
(assert (kind gary))
(assert (round gary))
(assert (green gary))

; Rule 5: When a person is nice and round and cold, they look blue
(assert (forall ((p Person))
  (=> (and (nice p) (round p) (cold p))
      (blue p))))

; Rule 6: People that are green and big while also being cold are always nice
(assert (forall ((p Person))
  (=> (and (green p) (big p) (cold p))
      (nice p))))

; Rule 7: A kind young person who is green will be cold
(assert (forall ((p Person))
  (=> (and (kind p) (young p) (green p))
      (cold p))))

; Rule 8: Someone who is young at heart and age are very round
(assert (forall ((p Person))
  (=> (young p)
      (round p))))

; Rule 9: A person that is round and somewhat green while being nice tends to be red as well
(assert (forall ((p Person))
  (=> (and (round p) (green p) (nice p))
      (red p))))

; Rule 10: Any human who is rough, green, and kind, has a blue personality
(assert (forall ((p Person))
  (=> (and (rough p) (green p) (kind p))
      (blue p))))

; Rule 11: People who are round and red tend to be rough
(assert (forall ((p Person))
  (=> (and (round p) (red p))
      (rough p))))

; Test the claim: "Bob is not red"
; We assert (not (red bob)) to check if this is consistent with the knowledge base
; If unsat, the claim is FALSE (Bob must be red)
; If sat, the claim is TRUE/POSSIBLE (Bob can be not red)
(assert (not (red bob)))

; Check satisfiability
(check-sat)
(get-model)