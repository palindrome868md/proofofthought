; Sorts
(declare-sort Lip 0)

; Predicates / Functions
(declare-fun in_rouge_dior_lny (Lip) Bool)
(declare-fun velvet_finish (Lip) Bool)
(declare-fun satin_finish (Lip) Bool)
(declare-fun official_has_rosewood (Lip) Bool)
(declare-fun refillable (Lip) Bool)

; Constants
(declare-const lip-999 Lip)

; Knowledge base
(assert (in_rouge_dior_lny lip-999))

; Rule: All velvet-finish lipsticks in the Rouge Dior set are refillable
(assert (forall ((l Lip))
  (=> (in_rouge_dior_lny l)
      (=> (velvet_finish l)
          (refillable l)))))

; Rule: Lipsticks in the Rouge Dior set have either a velvet-finish or a satin-finish
(assert (forall ((l Lip))
  (=> (in_rouge_dior_lny l)
      (or (velvet_finish l) (satin_finish l)))))

; Rule: No satin-finish lipsticks in the set do not have "rosewood" in their official description
(assert (forall ((l Lip))
  (=> (in_rouge_dior_lny l)
      (=> (satin_finish l)
          (official_has_rosewood l)))))

; Rule: Tautology about rosewood presence (either does not have rosewood or has rosewood)
(assert (forall ((l Lip))
  (=> (in_rouge_dior_lny l)
      (or (not (official_has_rosewood l))
          (official_has_rosewood l)))))

; Premise: lip-999 is in the Rouge Dior set and it either has rosewood or velvet finish
(assert (in_rouge_dior_lny lip-999))
(assert (or (official_has_rosewood lip-999) (velvet_finish lip-999)))

; Test case: Does lip-999 have satin finish and has rosewood?
(assert (and (satin_finish lip-999) (official_has_rosewood lip-999)))

; Check satisfiability and produce a model
(check-sat)
(get-model)