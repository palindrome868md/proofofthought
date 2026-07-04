;-------------------------------------------------
; 1. Declare uninterpreted sorts
;-------------------------------------------------
(declare-sort Person 0)
(declare-sort Marriage 0)

;-------------------------------------------------
; 2. Declare functions (predicates and accessors)
;-------------------------------------------------
; Accessors for a marriage
(declare-fun husband (Marriage) Person)
(declare-fun wife    (Marriage) Person)

; Relevant properties
(declare-fun is_uk_citizen               (Person) Bool)
(declare-fun resident_all_life           (Person) Bool)
(declare-fun pregnant_by_other_at_marriage (Marriage) Bool)

; Derived concepts
(declare-fun voidable (Marriage) Bool)   ; marriage meets a voidable ground
(declare-fun can_annul (Marriage) Bool)  ; marriage can be annulled

;-------------------------------------------------
; 3. Declare the concrete individuals
;-------------------------------------------------
(declare-const m Marriage)   ; the marriage in question
(declare-const h Person)     ; husband
(declare-const w Person)     ; wife

;-------------------------------------------------
; 4. Knowledge base (facts about the case)
;-------------------------------------------------
; Identify the spouses of the marriage
(assert (= (husband m) h))
(assert (= (wife    m) w))

; Both are UK citizens and have lived in the UK all their lives
(assert (is_uk_citizen h))
(assert (resident_all_life h))
(assert (is_uk_citizen w))
(assert (resident_all_life w))

; At the time of the marriage the wife was pregnant by another person
(assert (pregnant_by_other_at_marriage m))

;-------------------------------------------------
; 5. Legal rules (from the document)
;-------------------------------------------------
; Rule 1: pregnancy by another at the time of marriage makes the marriage voidable
(assert (forall ((mar Marriage))
  (=> (pregnant_by_other_at_marriage mar)
      (voidable mar))))

; Rule 2: any voidable marriage can be annulled
(assert (forall ((mar Marriage))
  (=> (voidable mar)
      (can_annul mar))))

;-------------------------------------------------
; 6. Query: can the marriage be annulled?
;-------------------------------------------------
(assert (can_annul m))

;-------------------------------------------------
; 7. Solve
;-------------------------------------------------
(check-sat)
(get-model)