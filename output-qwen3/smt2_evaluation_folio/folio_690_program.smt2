; 1. Declare sorts
(declare-sort Person 0)
(declare-sort Language 0)

; 2. Declare functions
(declare-fun is-universal (Language) Bool)
(declare-fun knows (Person Language) Bool)
(declare-fun can-communicate (Person Person) Bool)

; 3. Declare constants
(declare-const Katya Person)
(declare-const Danil Person)
(declare-const LanguageA Language)

; 4. Assert knowledge base (premises)

; Premise 1: LanguageA is a universal language
(assert (is-universal LanguageA))

; Premise 2: If a universal language exists, then for every two people 
; if they both know the same universal language they can communicate.
; Since Premise 1 asserts LanguageA is universal, the condition "If a universal language exists" 
; is satisfied. Therefore, the communication rule must hold.
(assert (forall ((p1 Person) (p2 Person) (l Language))
  (=> (and (is-universal l) (knows p1 l) (knows p2 l))
      (can-communicate p1 p2))))

; Premise 3: Katya cannot communicate with Danil
(assert (not (can-communicate Katya Danil)))

; Premise 4: Katya knows LanguageA
(assert (knows Katya LanguageA))

; 5. Test Statement: Danil knows LanguageA
; We assert the statement to check if it is consistent with the Knowledge Base.
; According to instructions: 
; - 'sat' means the statement is True (consistent).
; - 'unsat' means the statement is False (contradicts KB).
(assert (knows Danil LanguageA))

; 6. Check satisfiability
(check-sat)
(get-model)