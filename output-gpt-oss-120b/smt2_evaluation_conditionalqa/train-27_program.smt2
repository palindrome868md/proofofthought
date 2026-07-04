;-------------------------------------------------
;  Declarations
;-------------------------------------------------
(declare-sort Person 0)                ; uninterpreted sort for people

; Functions / predicates
(declare-fun age          (Person) Int)          ; age of a person
(declare-fun sound_mind   (Person) Bool)         ; mental capacity
(declare-fun is_witness   (Person) Bool)         ; is a will witness
(declare-fun married_to   (Person Person) Bool) ; marital relation
(declare-fun included_in_will (Person) Bool)    ; beneficiary status

; Constants (the relevant individuals)
(declare-const me       Person)   ; the will‑maker
(declare-const partner  Person)   ; the new spouse / partner
(declare-const witness1 Person)   ; a possible witness (used only for rule illustration)

;-------------------------------------------------
;  Knowledge base – validity conditions for a will
;-------------------------------------------------
; The maker must be at least 18 years old and of sound mind
(assert (>= (age me) 18))
(assert (sound_mind me))

; No witness (or the witness's married partner) may be a beneficiary
(assert (forall ((p Person))
  (=> (is_witness p) (not (included_in_will p)))))               ; witnesses excluded
(assert (forall ((p Person) (q Person))
  (=> (and (is_witness p) (married_to p q)) (not (included_in_will q))))) ; their spouses excluded

;-------------------------------------------------
;  Scenario-specific facts
;-------------------------------------------------
; The partner is not a witness and is not married to any witness
(assert (not (is_witness partner)))
(assert (forall ((w Person)) (=> (is_witness w) (not (married_to w partner)))))

; The maker wishes to include the partner in the will
(assert (included_in_will partner))

;-------------------------------------------------
;  Check whether the scenario is consistent (i.e., allowed)
;-------------------------------------------------
(check-sat)   ; Expected: sat  → the partner can legally be included
(get-model)   ; Optional: shows a concrete model satisfying the constraints