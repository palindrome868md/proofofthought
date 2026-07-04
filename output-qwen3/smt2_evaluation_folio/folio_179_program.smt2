; ==============================================================================
; REASONING STEPS
; ==============================================================================
; 1. Analyze the Problem:
;    - We need to determine if the statement "Tower B is located in New Haven" 
;      is True or False based on the given premises.
;
; 2. Translate Premises to Logic:
;    - P1: All buildings in New Haven are not high.
;          (forall (b), InNewHaven(b) => NOT High(b))
;    - P2: All buildings managed by Yale Housing are located in New Haven.
;          (forall (b), ManagedByYale(b) => InNewHaven(b))
;    - P3: All buildings in Manhattans are high.
;          (forall (b), InManhattan(b) => High(b))
;    - P4: All buildings owned by Bloomberg are located in Manhattans.
;          (forall (b), OwnedByBloomberg(b) => InManhattan(b))
;    - P5: All buildings with the Bloomberg logo are owned by Bloomberg.
;          (forall (b), HasBloombergLogo(b) => OwnedByBloomberg(b))
;    - P6: Tower A is managed by Yale Housing.
;          ManagedByYale(TowerA)
;    - P7: Tower B is with the Bloomberg logo.
;          HasBloombergLogo(TowerB)
;
; 3. Logical Deduction for Tower B:
;    - From P7 & P5: Tower B is Owned by Bloomberg.
;    - From P4: Tower B is In Manhattan.
;    - From P3: Tower B is High.
;    - From P1 (Contrapositive): If High(b) => NOT InNewHaven(b).
;    - Therefore: Tower B is NOT In New Haven.
;
; 4. Verification Strategy:
;    - To test the statement "Tower B is located in New Haven":
;    - Assert all Premises (Knowledge Base).
;    - Assert the Statement: InNewHaven(TowerB).
;    - Check Satisfiability (check-sat).
;    - If 'unsat': The statement contradicts the KB (Statement is False).
;    - If 'sat': The statement is consistent (Statement could be True).
;
; 5. Expected Outcome:
;    - Based on deduction, asserting InNewHaven(TowerB) creates a contradiction
;      with High(TowerB) and the rule (InNewHaven => NOT High).
;    - Expected result: unsat.
;    - Conclusion: The statement is False.
; ==============================================================================

; 1. Declare Sorts
(declare-sort Building 0)

; 2. Declare Functions (Predicates)
(declare-fun InNewHaven (Building) Bool)
(declare-fun High (Building) Bool)
(declare-fun ManagedByYale (Building) Bool)
(declare-fun InManhattan (Building) Bool)
(declare-fun OwnedByBloomberg (Building) Bool)
(declare-fun HasBloombergLogo (Building) Bool)

; 3. Declare Constants
(declare-const TowerA Building)
(declare-const TowerB Building)

; 4. Assert Knowledge Base (Premises)

; P1: All buildings in New Haven are not high.
(assert (forall ((b Building))
  (=> (InNewHaven b) (not (High b)))))

; P2: All buildings managed by Yale Housing are located in New Haven.
(assert (forall ((b Building))
  (=> (ManagedByYale b) (InNewHaven b))))

; P3: All buildings in Manhattans are high.
(assert (forall ((b Building))
  (=> (InManhattan b) (High b))))

; P4: All buildings owned by Bloomberg are located in Manhattans.
(assert (forall ((b Building))
  (=> (OwnedByBloomberg b) (InManhattan b))))

; P5: All buildings with the Bloomberg logo are owned by Bloomberg.
(assert (forall ((b Building))
  (=> (HasBloombergLogo b) (OwnedByBloomberg b))))

; P6: Tower A is managed by Yale Housing.
(assert (ManagedByYale TowerA))

; P7: Tower B is with the Bloomberg logo.
(assert (HasBloombergLogo TowerB))

; 5. Test Statement: Tower B is located in New Haven.
;    We assert this to check for contradiction.
(assert (InNewHaven TowerB))

; 6. Check Satisfiability
(check-sat)

; 7. Get Model (if sat, shows example; if unsat, confirms contradiction)
(get-model)