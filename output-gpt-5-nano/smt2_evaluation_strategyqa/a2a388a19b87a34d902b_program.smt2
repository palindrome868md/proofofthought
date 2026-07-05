; Sorts
(declare-sort Kingdom 0)
(declare-sort Person 0)

; Constants
(declare-const hungary Kingdom)

; Predicates
(declare-fun land_owners_elect_ruler (Kingdom) Bool)

; Knowledge base: In the Kingdom of Hungary, land owners elect rulers
(assert (land_owners_elect_ruler hungary))

; Test: Did land owners elect their rulers?
(assert (land_owners_elect_ruler hungary))

; Verification
(check-sat)
(get-model)