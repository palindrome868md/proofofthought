; SMT-LIB 2.0 Program: Child Maintenance Enforcement for Army Parent Abroad
; Question: Can an absent parent in the army be made to pay child maintenance while abroad?

; 1. Declare Sorts
(declare-sort Person 0)
(declare-sort Country 0)
(declare-sort Organization 0)
(declare-sort MaintenanceAgreement 0)

; 2. Declare Functions
(declare-fun has-primary-care (Person Person) Bool)           ; parent has primary care of child
(declare-fun lives-in (Person Country) Bool)                  ; person lives in country
(declare-fun works-for (Person Organization) Bool)            ; person works for organization
(declare-fun is-army-member (Person) Bool)                    ; person is in armed forces
(declare-fun is-british-organization (Organization) Bool)     ; organization is British
(declare-fun has-maintenance-agreement (Person Person) Bool)  ; paying parent has agreement with receiving parent
(declare-fun is-defaulting (Person) Bool)                     ; person is defaulting on payments
(declare-fun can-enforce (Person Person) Bool)                ; can enforce payment from parent1 to parent2
(declare-fun can-make-new-claim (Person Person) Bool)         ; can make new maintenance claim
(declare-fun is-remo-country (Country) Bool)                  ; country has REMO agreement with UK

; 3. Declare Constants
(declare-const ex-husband Person)
(declare-const mother Person)
(declare-const daughter Person)
(declare-const germany Country)
(declare-const uk Country)
(declare-const armed-forces Organization)

; 4. Assert Knowledge Base (from document)

; Scenario facts
(assert (has-primary-care mother daughter))
(assert (lives-in ex-husband germany))
(assert (lives-in mother uk))
(assert (lives-in daughter uk))
(assert (works-for ex-husband armed-forces))
(assert (is-army-member ex-husband))
(assert (is-british-organization armed-forces))
(assert (has-maintenance-agreement ex-husband mother))
(assert (is-defaulting ex-husband))

; Rule 1: If parent works abroad for British organization (including Armed Forces),
; you can make a new child maintenance claim
(assert (forall ((p Person) (o Organization) (c Country) (r Person))
  (=> (and (works-for p o)
           (lives-in p c)
           (not (= c uk))
           (is-british-organization o)
           (has-primary-care r daughter))
      (can-make-new-claim r p))))

; Rule 2: You can ask court for enforcement if parent doesn't pay
(assert (forall ((p Person) (r Person))
  (=> (and (has-maintenance-agreement p r)
           (is-defaulting p))
      (can-enforce r p))))

; Rule 3: Armed forces members abroad can be subject to maintenance claims
(assert (forall ((p Person))
  (=> (is-army-member p)
      (can-make-new-claim mother p))))

; Rule 4: REMO countries allow enforcement (Germany is typically a REMO country)
(assert (is-remo-country germany))

; Rule 5: If paying parent lives in REMO country, enforcement is possible
(assert (forall ((p Person) (c Country) (r Person))
  (=> (and (lives-in p c)
           (is-remo-country c)
           (has-maintenance-agreement p r))
      (can-enforce r p))))

; 5. Test Question: Can an absent parent in the army be made to pay child maintenance while abroad?
; We test if enforcement OR new claim is possible
(assert (or (can-enforce mother ex-husband)
            (can-make-new-claim mother ex-husband)))

; 6. Check Satisfiability
(check-sat)
(get-model)

; Expected: sat (TRUE)
; Reason: Document states parents working abroad for British organizations
; (including Armed Forces) can be subject to new maintenance claims,
; and enforcement is possible through REMO or court action