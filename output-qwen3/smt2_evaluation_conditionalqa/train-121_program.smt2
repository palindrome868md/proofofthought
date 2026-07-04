; SMT-LIB 2.0 Program: Statutory Will Application Eligibility
; Question: Can the Personal Welfare deputy apply to change the will, 
;           or is this exclusive to the Financial deputy?

; ============================================
; 1. DECLARE SORTS
; ============================================
(declare-sort Person 0)
(declare-sort DeputyType 0)
(declare-sort Court 0)

; ============================================
; 2. DECLARE DATATYPES
; ============================================
(declare-datatypes () ((DeputyType (PersonalWelfare) (Financial))))

; ============================================
; 3. DECLARE CONSTANTS
; ============================================
(declare-const me Person)
(declare-const father Person)
(declare-const court-of-protection Court)

; ============================================
; 4. DECLARE FUNCTIONS
; ============================================
; Deputy relationship
(declare-fun is-deputy-of (Person Person DeputyType) Bool)

; Medical/capacity conditions
(declare-fun has-dementia (Person) Bool)
(declare-fun lacks-capacity-for-will (Person) Bool)

; Application eligibility
(declare-fun can-apply-for-statutory-will (Person) Bool)
(declare-fun application-exclusive-to-financial-deputy () Bool)

; Document requirements
(declare-fun has-required-forms (Person) Bool)
(declare-fun can-prove-incapacity (Person Person) Bool)

; ============================================
; 5. ASSERT KNOWLEDGE BASE (from scenario and document)
; ============================================

; I am the Personal Welfare deputy of my father
(assert (is-deputy-of me father PersonalWelfare))

; Father has dementia (age 75)
(assert (has-dementia father))

; Father lacks capacity to make a will himself (due to dementia)
(assert (lacks-capacity-for-will father))

; Rule from document: Anyone can apply to Court of Protection for statutory will
; It is NOT exclusive to the financial deputy
(assert (not (application-exclusive-to-financial-deputy)))

; Rule: If person is a deputy (any type) AND the subject lacks capacity, 
;       then the deputy can apply for statutory will
(assert (forall ((p Person) (target Person) (dt DeputyType))
  (=> (and (is-deputy-of p target dt)
           (lacks-capacity-for-will target))
      (can-apply-for-statutory-will p))))

; Rule: To apply, one must be able to prove incapacity (via medical assessment COP3)
(assert (forall ((p Person) (target Person))
  (=> (and (is-deputy-of p target PersonalWelfare)
           (has-dementia target))
      (can-prove-incapacity p target))))

; Rule: If deputy can prove incapacity and person lacks capacity, they can apply
(assert (forall ((p Person) (target Person))
  (=> (and (can-prove-incapacity p target)
           (lacks-capacity-for-will target))
      (can-apply-for-statutory-will p))))

; ============================================
; 6. VERIFICATION TEST
; ============================================
; Question: Can I (Personal Welfare deputy) apply to change father's will?
; We assert that I CAN apply and check if this is satisfiable with the knowledge base

(assert (can-apply-for-statutory-will me))

; ============================================
; 7. CHECK SATISFIABILITY
; ============================================
; sat = TRUE (Yes, Personal Welfare deputy CAN apply)
; unsat = FALSE (No, Personal Welfare deputy cannot apply)

(check-sat)
(get-model)