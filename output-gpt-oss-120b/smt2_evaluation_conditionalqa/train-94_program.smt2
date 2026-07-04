; -------------------------------------------------
; Declaration of sorts and enumerated rate types
; -------------------------------------------------
(declare-sort Child 0)

(declare-datatypes () ((CareRate lowest middle highest)))
(declare-datatypes () ((MobRate lower higher)))

; -------------------------------------------------
; Functions describing the child’s attributes
; -------------------------------------------------
(declare-fun age (Child) Int)
(declare-fun walking_difficulty (Child) Bool)
(declare-fun needs_extra_looking (Child) Bool)
(declare-fun terminally_ill (Child) Bool)

; Rates that will be awarded
(declare-fun care_rate (Child) CareRate)
(declare-fun mob_rate (Child) MobRate)

; Predicate that is true exactly when the child receives the
; maximum DLA (highest care + higher mobility)
(declare-fun qualifies_max (Child) Bool)

; -------------------------------------------------
; Logical definition of “maximum DLA”
; -------------------------------------------------
(assert (forall ((c Child))
  (= (qualifies_max c)
     (and (= (care_rate c) highest)
          (= (mob_rate c) higher)))))

; -------------------------------------------------
; Scenario: the user’s 13‑year‑old child
; -------------------------------------------------
(declare-const my_child Child)

; Age requirement (under 16)
(assert (= (age my_child) 13))

; Walking difficulty (uses wheelchair)
(assert (walking_difficulty my_child))

; Needs a lot of extra support
(assert (needs_extra_looking my_child))

; Not terminally ill (the rule for “highest” care does not require this)
(assert (not (terminally_ill my_child)))

; According to the facts the child qualifies for the highest care rate
(assert (= (care_rate my_child) highest))

; And for the higher mobility rate (cannot walk unaided)
(assert (= (mob_rate my_child) higher))

; -------------------------------------------------
; Test: does the child qualify for the maximum DLA?
; -------------------------------------------------
(assert (qualifies_max my_child))

; -------------------------------------------------
; Decision procedure
; -------------------------------------------------
(check-sat)   ; Expected result: sat  (i.e., “yes, you qualify for the maximum DLA”)
(get-model)