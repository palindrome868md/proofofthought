; Declare sorts
(declare-sort Lipstick 0)
(declare-datatypes () ((Finish velvet satin)))

; Declare predicates and functions
(declare-fun finish (Lipstick) Finish)
(declare-fun inRougeDiorNYLE (Lipstick) Bool)
(declare-fun has-rosewood (Lipstick) Bool)
(declare-fun refillable (Lipstick) Bool)

; Declare constants
(declare-const ROUGE999 Lipstick)

; Axioms / Knowledge base (premises)

; P5: ROUGE999 is in the set and its description/finish is either rosewood or velvet
(assert (or (has-rosewood ROUGE999) (= (finish ROUGE999) velvet)))
(assert (inRougeDiorNYLE ROUGE999))

; P1: All velvet-finish lipsticks in the Rouge Dior NYLE are refillable
(assert
  (forall ((l Lipstick))
    (=> (and (= (finish l) velvet)
             (inRougeDiorNYLE l))
        (refillable l))))

; P2: Lipsticks in the Rouge Dior NYLE have either velvet or satin finish
(assert
  (forall ((l Lipstick))
    (=> (inRougeDiorNYLE l)
        (or (= (finish l) velvet)
            (= (finish l) satin)))))

; P3: No satin-finish lipsticks in the set do not have "rosewood"
; (i.e., satin -> has-rosewood) for lipsticks in the set
(assert
  (forall ((l Lipstick))
    (=> (and (inRougeDiorNYLE l)
             (= (finish l) satin))
        (has-rosewood l))))

; P4: Tautology (no effect on constraints)
(assert
  (forall ((l Lipstick))
    (or (not (has-rosewood l)) (has-rosewood l))))

; Premise that ROUGE999 either has rosewood or velvet (already included above, but explicit)
; (already included: (or (has-rosewood ROUGE999) (= (finish ROUGE999) velvet)))

; Test query for the statement:
; A: (not rosewood OR refillable) for ROUGE999
; B: has-rosewood ROUGE999
(assert (or (not (has-rosewood ROUGE999)) (refillable ROUGE999)))
(assert (not (has-rosewood ROUGE999)))
(check-sat)
(get-model)