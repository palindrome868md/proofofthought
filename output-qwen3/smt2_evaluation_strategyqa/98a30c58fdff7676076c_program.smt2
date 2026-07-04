; Question: Does Biochemistry study gluons?
; This is a factual question - we test if the claim "biochemistry studies gluons" is consistent with our knowledge base

; 1. Declare sorts
(declare-sort FieldOfStudy 0)
(declare-sort Subject 0)

; 2. Declare functions
(declare-fun studies (FieldOfStudy Subject) Bool)
(declare-fun is-biochemistry (FieldOfStudy) Bool)
(declare-fun is-particle-physics (FieldOfStudy) Bool)
(declare-fun is-gluon (Subject) Bool)
(declare-fun is-biological-molecule (Subject) Bool)
(declare-fun is-elementary-particle (Subject) Bool)

; 3. Declare constants
(declare-const biochemistry FieldOfStudy)
(declare-const particle-physics FieldOfStudy)
(declare-const gluon Subject)
(declare-const protein Subject)
(declare-const dna Subject)

; 4. Assert knowledge base (facts about fields and subjects)
(assert (is-biochemistry biochemistry))
(assert (is-particle-physics particle-physics))
(assert (is-gluon gluon))
(assert (is-elementary-particle gluon))
(assert (is-biological-molecule protein))
(assert (is-biological-molecule dna))

; Rule 1: Biochemistry studies biological molecules
(assert (forall ((f FieldOfStudy) (s Subject))
  (=> (and (is-biochemistry f) (studies f s))
      (is-biological-molecule s))))

; Rule 2: Gluons are elementary particles, not biological molecules
(assert (forall ((s Subject))
  (=> (is-gluon s)
      (is-elementary-particle s))))

; Rule 3: Elementary particles are not biological molecules (different domains)
(assert (forall ((s Subject))
  (=> (is-elementary-particle s)
      (not (is-biological-molecule s)))))

; Rule 4: Particle physics studies gluons (not biochemistry)
(assert (forall ((f FieldOfStudy) (s Subject))
  (=> (and (is-particle-physics f) (is-gluon s))
      (studies f s))))

; 5. Test: Does biochemistry study gluons?
; We assert the claim and check if it's satisfiable with our knowledge base
(assert (studies biochemistry gluon))

; 6. Check satisfiability
; If unsat: biochemistry does NOT study gluons (answer: No/False)
; If sat: biochemistry DOES study gluons (answer: Yes/True)
(check-sat)
(get-model)