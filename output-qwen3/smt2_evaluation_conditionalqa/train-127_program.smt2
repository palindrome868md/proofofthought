; SMT-LIB 2.0 Program for Child Maintenance Court Order Question
; Question: Is there a court order which can be obtained to make my husband pay child maintenance?

; Declare sorts
(declare-sort Person 0)
(declare-sort Country 0)
(declare-sort Court 0)
(declare-sort Organisation 0)

; Declare functions/predicates
(declare-fun is-british (Person) Bool)
(declare-fun lives-in (Person Country) Bool)
(declare-fun is-married (Person Person) Bool)
(declare-fun is-parent-of (Person Person) Bool)
(declare-fun is-husband (Person Person) Bool)
(declare-fun has-existing-agreement (Person Person) Bool)
(declare-fun works-for-british-org (Person Organisation) Bool)
(declare-fun is-uk-court (Court) Bool)
(declare-fun can-make-maintenance-decision (Court Person Person) Bool)
(declare-fun can-enforce-decision (Court Country) Bool)
(declare-fun is-rema-country (Country) Bool)
(declare-fun can-obtain-court-order (Person Person) Bool)

; Declare constants
(declare-const wife Person)
(declare-const husband Person)
(declare-const child Person)
(declare-const uk Country)
(declare-const ghana Country)
(declare-const uk-court Court)

; Knowledge Base - Facts from the scenario
(assert (is-british husband))
(assert (lives-in husband uk))
(assert (lives-in wife ghana))
(assert (lives-in child ghana))
(assert (is-married wife husband))
(assert (is-husband husband wife))
(assert (is-parent-of husband child))
(assert (is-parent-of wife child))
(assert (not (has-existing-agreement husband wife)))

; Knowledge Base - Rules from the document
; Rule 1: Cannot make NEW application to Child Maintenance Service if child and carer live abroad
; (This is about CMS, not courts - courts are different)

; Rule 2: You CAN ask a court to make a new child maintenance decision
(assert (forall ((c Court) (p1 Person) (p2 Person))
  (=> (and (is-uk-court c)
           (lives-in p2 uk)
           (is-parent-of p2 child))
      (can-make-maintenance-decision c p1 p2))))

; Rule 3: UK courts can make decisions when paying parent lives in UK
(assert (is-uk-court uk-court))

; Rule 4: If paying parent lives in UK, court order can be obtained
(assert (forall ((p1 Person) (p2 Person))
  (=> (and (lives-in p2 uk)
           (is-parent-of p2 child)
           (not (has-existing-agreement p2 p1)))
      (can-obtain-court-order p1 p2))))

; Rule 5: REMO countries can enforce UK court decisions (UK is a REMO country for itself)
(assert (is-rema-country uk))

; Rule 6: Court can enforce decision in REMO country
(assert (forall ((c Court) (country Country))
  (=> (and (is-uk-court c)
           (is-rema-country country))
      (can-enforce-decision c country))))

; Test Question: Can wife obtain a court order against husband for child maintenance?
; We assert that a court order CAN be obtained and check satisfiability
(assert (can-obtain-court-order wife husband))

; Check satisfiability
(check-sat)
(get-model)