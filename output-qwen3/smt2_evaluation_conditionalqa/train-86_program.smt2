; SMT-LIB 2.0 Program: Death Certificate Eligibility Verification
; Question: Can I get a death certificate for my missing father although my sister does not want to?

; ========== 1. DECLARE SORTS ==========
(declare-sort Person 0)

; ========== 2. DECLARE FUNCTIONS ==========
(declare-fun missing-years (Person) Int)
(declare-fun is-from-england (Person) Bool)
(declare-fun is-child-of (Person Person) Bool)
(declare-fun is-sibling-of (Person Person) Bool)
(declare-fun believes-deceased (Person Person) Bool)
(declare-fun objects-to-declaration (Person Person) Bool)
(declare-fun eligible-claimant (Person Person) Bool)
(declare-fun meets-legal-requirements (Person Person) Bool)
(declare-fun court-can-grant-declaration (Person Person) Bool)
(declare-fun can-obtain-death-certificate (Person Person) Bool)

; ========== 3. DECLARE CONSTANTS ==========
(declare-const user Person)
(declare-const father Person)
(declare-const sister Person)

; ========== 4. ASSERT KNOWLEDGE BASE (Facts from Scenario) ==========
; Father has been missing for 5 years
(assert (= (missing-years father) 5))

; Father is from Kent, England
(assert (is-from-england father))

; User is the child of the missing father
(assert (is-child-of user father))

; Sister is a sibling of the missing father
(assert (is-sibling-of sister father))

; User believes father is deceased (wants death certificate)
(assert (believes-deceased user father))

; Sister objects to the death certificate
(assert (objects-to-declaration sister father))

; ========== 5. ASSERT RULES (From Document) ==========

; Rule 1: Eligible claimants include children and siblings of missing person
(assert (forall ((c Person) (m Person))
  (=> (or (is-child-of c m) (is-sibling-of c m))
      (eligible-claimant c m))))

; Rule 2: Legal requirements met if:
;   - Missing 7+ years, OR
;   - Missing <7 years AND claimant believes they died (e.g., circumstances suggest death)
;   - AND missing person was from England/Wales (domicile requirement)
(assert (forall ((c Person) (m Person))
  (=> (and (or (>= (missing-years m) 7)
               (and (< (missing-years m) 7) (believes-deceased c m)))
           (is-from-england m))
      (meets-legal-requirements c m))))

; Rule 3: Court can grant declaration if claimant is eligible AND meets requirements
;   CRITICAL: Sister's objection does NOT prevent court from granting declaration
(assert (forall ((c Person) (m Person) (o Person))
  (=> (and (eligible-claimant c m)
           (meets-legal-requirements c m))
      (court-can-grant-declaration c m))))

; Rule 4: Can obtain death certificate after court grants declaration
;   (Sister's consent is not required per document)
(assert (forall ((c Person) (m Person))
  (=> (court-can-grant-declaration c m)
      (can-obtain-death-certificate c m))))

; ========== 6. VERIFICATION TEST ==========
; Question: Can user obtain death certificate despite sister's objection?
; We assert the positive case and check if it's satisfiable

(assert (can-obtain-death-certificate user father))

; ========== 7. CHECK SATISFIABILITY ==========
(check-sat)
(get-model)

; ========== EXPECTED RESULT ==========
; SAT = True (User CAN obtain death certificate)
; Reasoning:
;   - User is child of missing person (eligible claimant)
;   - Father from England (meets domicile requirement)
;   - User believes father deceased (meets <7 years exception)
;   - Sister's objection does NOT block court decision (per document)
;   - Court declaration enables death certificate