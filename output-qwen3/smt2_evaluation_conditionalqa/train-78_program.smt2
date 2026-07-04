; Disabled Facilities Grant Eligibility Check
; Question: Can a couple in England with £5,000 savings apply for a DFG 
; when the wife is paraplegic and they own their home?

; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Property 0)
(declare-sort Country 0)

; 2. Declare functions
(declare-fun is-disabled (Person) Bool)
(declare-fun owns-property (Person Property) Bool)
(declare-fun lives-in (Person Property) Bool)
(declare-fun household-savings () Int)
(declare-fun country-location () Country)
(declare-fun is-england (Country) Bool)
(declare-fun grant-available-in-country (Country) Bool)
(declare-fun savings-under-threshold () Bool)
(declare-fun can-apply-for-grant () Bool)

; 3. Declare constants
(declare-const wife Person)
(declare-const husband Person)
(declare-const home Property)
(declare-const england Country)

; 4. Assert knowledge base (eligibility rules from document)

; Rule: England has Disabled Facilities Grants available (up to £30,000)
(assert (is-england england))
(assert (=> (is-england england) (grant-available-in-country england)))

; Rule: Scotland does NOT have DFG (for contrast)
(assert (let ((scotland Country)) 
  (and (not (is-england scotland)) 
       (not (grant-available-in-country scotland)))))

; Rule: Savings threshold is £6,000 - under this means no negative impact
(assert (=> (< (household-savings) 6000) savings-under-threshold))

; Rule: To be eligible to apply, ALL of these must be true:
; - Someone in property must be disabled
; - Owner or tenant status
; - Intend to live there during grant period
; - Country has grant available
(assert (=> (and 
              (or (is-disabled wife) (is-disabled husband))
              (or (owns-property husband home) (owns-property wife home))
              (lives-in wife home)
              (lives-in husband home)
              (grant-available-in-country (country-location))
              savings-under-threshold)
            can-apply-for-grant))

; Link country location to england
(assert (= (country-location) england))

; 5. Assert scenario facts

; Wife is paraplegic (disabled) from traffic accident
(assert (is-disabled wife))

; Husband owns the accommodation
(assert (owns-property husband home))

; Both live in the property
(assert (lives-in wife home))
(assert (lives-in husband home))

; Household savings are £5,000 (under £6,000 threshold)
(assert (= (household-savings) 5000))

; They live in England
(assert (is-england england))

; 6. Test: Can they apply for the grant?
(assert can-apply-for-grant)

; 7. Check satisfiability
; sat = YES they can apply
; unsat = NO they cannot apply
(check-sat)
(get-model)