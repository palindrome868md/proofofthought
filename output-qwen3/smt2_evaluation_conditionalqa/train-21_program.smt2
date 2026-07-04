; SMT-LIB 2.0 Program to Verify Annulment Petition Eligibility
; Question: Can I file an annulment petition?

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun years-lived-in-england-wales (Person) Int)
(declare-fun has-permanent-home-england-wales (Person) Bool)
(declare-fun months-with-permanent-home (Person) Int)
(declare-fun are-closely-related (Person Person) Bool)
(declare-fun is-under-16 (Person) Bool)
(declare-fun already-married-or-partnered (Person) Bool)
(declare-fun marriage-is-void (Person Person) Bool)
(declare-fun meets-residency-requirement (Person) Bool)
(declare-fun can-file-annulment-petition (Person) Bool)

; 3. Declare constants
(declare-const petitioner Person)
(declare-const husband Person)

; 4. Assert knowledge base (rules from document)

; Residency requirement: lived in England/Wales for at least 1 year OR permanent home for 6 months
(assert (forall ((p Person))
  (=> (or (>= (years-lived-in-england-wales p) 1)
          (and (has-permanent-home-england-wales p)
               (>= (months-with-permanent-home p) 6)))
      (meets-residency-requirement p))))

; Void marriage condition 1: closely related (e.g., cousins)
(assert (forall ((p1 Person) (p2 Person))
  (=> (are-closely-related p1 p2)
      (marriage-is-void p1 p2))))

; Void marriage condition 2: one or both under 16
(assert (forall ((p1 Person) (p2 Person))
  (=> (or (is-under-16 p1) (is-under-16 p2))
      (marriage-is-void p1 p2))))

; Void marriage condition 3: one already married or in civil partnership
(assert (forall ((p1 Person) (p2 Person))
  (=> (or (already-married-or-partnered p1) (already-married-or-partnered p2))
      (marriage-is-void p1 p2))))

; Can file annulment petition if marriage is void AND meets residency requirement
(assert (forall ((p Person) (spouse Person))
  (=> (and (marriage-is-void p spouse)
           (meets-residency-requirement p))
      (can-file-annulment-petition p))))

; 5. Assert facts from scenario

; Petitioner lived in UK for 2 years (assuming England/Wales based on document context)
(assert (= (years-lived-in-england-wales petitioner) 2))

; Petitioner is 24 years old (not under 16)
(assert (not (is-under-16 petitioner)))

; Husband's age not specified, assume not under 16 for this case
(assert (not (is-under-16 husband)))

; Neither was previously married (not stated in scenario)
(assert (not (already-married-or-partnered petitioner)))
(assert (not (already-married-or-partnered husband)))

; Petitioner discovered husband is their cousin (closely related)
(assert (are-closely-related petitioner husband))

; 6. Test the question: Can petitioner file an annulment petition?
(assert (can-file-annulment-petition petitioner))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: 
; - Marriage is VOID because spouses are closely related (cousins)
; - Residency requirement MET (2 years in England/Wales >= 1 year required)
; - Therefore, petitioner CAN file an annulment petition