; SMT-LIB 2.0 Program for Theorem Proving
; Question: Is the statement "Ho is an investor or is not an ardent communist" true?

; 1. Declare Sorts
(declare-sort Person 0)

; 2. Declare Functions (Predicates)
(declare-fun at-conference (Person) Bool)
(declare-fun investor (Person) Bool)
(declare-fun entrepreneur (Person) Bool)
(declare-fun enjoy-startup (Person) Bool)
(declare-fun prefer-planned (Person) Bool)
; Note: "enjoys state ownership" and "prefers state ownership" are modeled as the same predicate
; to maintain logical connectivity implied by the problem context.
(declare-fun state-ownership (Person) Bool)
(declare-fun ardent-communist (Person) Bool)

; 3. Declare Constants
(declare-const Ho Person)

; 4. Assert Knowledge Base (Premises)

; Premise 1: Everyone at the business conference is either an investor or an entrepreneur.
(assert (forall ((x Person))
  (=> (at-conference x)
      (or (investor x) (entrepreneur x)))))

; Premise 2: None of those at the business conference who enjoy the opportunity of starting a business prefer a planned economy.
(assert (forall ((x Person))
  (=> (and (at-conference x) (enjoy-startup x))
      (not (prefer-planned x)))))

; Premise 3: All entrepreneurs at the business conference enjoy the opportunity of starting a business.
(assert (forall ((x Person))
  (=> (and (at-conference x) (entrepreneur x))
      (enjoy-startup x))))

; Premise 4: Everyone at the business conference who enjoys state ownership of means of production prefers a planned economy.
(assert (forall ((x Person))
  (=> (and (at-conference x) (state-ownership x))
      (prefer-planned x))))

; Premise 5: Everyone at the business conference who is an ardent communist prefers state ownership of the means of production.
(assert (forall ((x Person))
  (=> (and (at-conference x) (ardent-communist x))
      (state-ownership x))))

; Premise 6: Ho is at the business conference and prefers state ownership of the means of production.
(assert (and (at-conference Ho) (state-ownership Ho)))

; 5. Assert the Statement to Verify
; Statement: Ho is an investor or is not an ardent communist.
(assert (or (investor Ho) (not (ardent-communist Ho))))

; 6. Check Satisfiability
; sat = True (Statement is consistent with premises/entailed)
; unsat = False (Statement contradicts premises)
(check-sat)
(get-model)