; Personal Independence Payment (PIP) Eligibility Verification
; Question: Is a 16-year-old with long-term physical disability eligible for PIP?

; Declare sorts
(declare-sort Person 0)

; Declare functions
(declare-fun age (Person) Int)
(declare-fun has-long-term-disability (Person) Bool)
(declare-fun disability-affects-mobility (Person) Bool)
(declare-fun lived-in-uk-years (Person) Int)
(declare-fun difficulties-duration-months (Person) Int)
(declare-fun expected-continue-months (Person) Int)
(declare-fun eligible-for-pip (Person) Bool)

; Declare constants
(declare-const kid Person)

; Knowledge Base - PIP Eligibility Rules (from document)

; Rule 1: Age requirement (16 or over, under State Pension age ~66)
(assert (forall ((p Person))
  (=> (eligible-for-pip p)
      (and (>= (age p) 16) (< (age p) 66)))))

; Rule 2: Must have physical or mental health condition/disability
(assert (forall ((p Person))
  (=> (eligible-for-pip p)
      (has-long-term-disability p))))

; Rule 3: Difficulties must have lasted 3 months
(assert (forall ((p Person))
  (=> (eligible-for-pip p)
      (>= (difficulties-duration-months p) 3))))

; Rule 4: Difficulties expected to continue 9 months
(assert (forall ((p Person))
  (=> (eligible-for-pip p)
      (>= (expected-continue-months p) 9))))

; Rule 5: Residence requirement (2 of last 3 years in England/Scotland/Wales)
(assert (forall ((p Person))
  (=> (eligible-for-pip p)
      (>= (lived-in-uk-years p) 2))))

; Scenario Facts (from the question)
; Kid is 16 years old
(assert (= (age kid) 16))

; Kid has long-term physical disability
(assert (has-long-term-disability kid))

; Disability affects mobility (getting about)
(assert (disability-affects-mobility kid))

; Lived in England since birth (16 years)
(assert (= (lived-in-uk-years kid) 16))

; Long-term disability implies difficulties for at least 3 months
(assert (>= (difficulties-duration-months kid) 3))

; Long-term disability implies expected to continue at least 9 months
(assert (>= (expected-continue-months kid) 9))

; Test: Is the kid eligible for PIP?
(assert (eligible-for-pip kid))

; Check satisfiability
(check-sat)
(get-model)