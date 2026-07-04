; Reasoning Steps:
; 1. Identify Sorts: We need 'Person' for Tom and Daniel, and 'Neighborhood' for Lawton Park.
; 2. Identify Functions: 'is-citizen-of' links Person to Neighborhood. 'zip-code' maps Person to Int.
; 3. Identify Constants: 'tom', 'daniel' (Person), 'lawton-park' (Neighborhood).
; 4. Encode Premises:
;    - Tom is a citizen of Lawton Park.
;    - All citizens of Lawton Park use zip code 98199.
;    - Daniel uses zip code 98199.
;    - (Note: "Lawton Park is in Seattle" is context not required for the specific deduction about Tom's zip code).
; 5. Encode Verification Statement:
;    - Assert "Tom uses the zip code 98199".
;    - If 'sat', the statement is consistent/True given the premises.
;    - If 'unsat', the statement contradicts the premises/False.
; 6. Logic Check: Since Tom is a citizen of Lawton Park, and all citizens use 98199, Tom must use 98199. Expect 'sat'.

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Neighborhood 0)

; 2. Declare functions
(declare-fun is-citizen-of (Person Neighborhood) Bool)
(declare-fun zip-code (Person) Int)

; 3. Declare constants
(declare-const tom Person)
(declare-const daniel Person)
(declare-const lawton-park Neighborhood)

; 4. Assert knowledge base (premises)
; Premise: Tom is a citizen of Lawton Park
(assert (is-citizen-of tom lawton-park))

; Premise: All citizens of Lawton Park use the zip code 98199
(assert (forall ((p Person))
  (=> (is-citizen-of p lawton-park)
      (= (zip-code p) 98199))))

; Premise: Daniel uses the zip code 98199
(assert (= (zip-code daniel) 98199))

; 5. Verify Statement: Tom uses the zip code 98199
(assert (= (zip-code tom) 98199))

; 6. Check satisfiability
(check-sat)
(get-model)