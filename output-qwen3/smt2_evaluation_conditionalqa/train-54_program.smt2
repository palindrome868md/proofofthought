; National Concessionary Fuel Scheme - Eligibility Verification
; Question: Is the mother eligible for the allowance after the father's death?

; 1. Declare sorts
(declare-sort Person 0)

; 2. Declare functions
(declare-fun is-ex-employee (Person) Bool)
(declare-fun qualified-for-ncfs (Person) Bool)
(declare-fun is-widow (Person Person) Bool)
(declare-fun is-deceased (Person) Bool)
(declare-fun eligible-for-allowance (Person) Bool)
(declare-fun receiving-fuel-through-scheme (Person) Bool)

; 3. Declare constants
(declare-const father Person)
(declare-const mother Person)

; 4. Assert knowledge base (rules from the document)

; Rule 1: Ex-employees of NCB/BCC who qualified for NCFS are eligible
(assert (forall ((p Person))
  (=> (and (is-ex-employee p) (qualified-for-ncfs p))
      (eligible-for-allowance p))))

; Rule 2: Widows/widowers of ex-employees who qualified for NCFS are eligible
(assert (forall ((w Person) (e Person)))
  (=> (and (is-widow w e) (qualified-for-ncfs e) (is-deceased e))
      (eligible-for-allowance w))))

; Rule 3: You can only get cash allowance if already getting fuel through the scheme
(assert (forall ((p Person))
  (=> (qualified-for-ncfs p)
      (receiving-fuel-through-scheme p))))

; 5. Assert facts from the scenario

; Father was getting fuel through the National Concessionary Fuel Scheme
(assert (receiving-fuel-through-scheme father))

; Father qualified for NCFS (since he was receiving fuel through the scheme)
(assert (qualified-for-ncfs father))

; Father passed away (deceased)
(assert (is-deceased father))

; Mother is the widow of the father
(assert (is-widow mother father))

; 6. Test: Is mother eligible for the allowance?
; We assert she IS eligible and check if this is satisfiable with the knowledge base
(assert (eligible-for-allowance mother))

; 7. Check satisfiability
(check-sat)
(get-model)

; Expected result: sat (true)
; Reasoning: According to the document, widows/widowers of ex-employees who 
; qualified for NCFS are eligible for the allowance. Since the father qualified 
; for NCFS (was receiving fuel through the scheme) and is now deceased, and the 
; mother is his widow, she should be eligible.