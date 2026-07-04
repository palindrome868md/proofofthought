; Question: Would a Monoamine Oxidase candy bar cheer up a depressed friend?
; Reasoning: MAO is an enzyme that breaks down mood neurotransmitters.
; MAO Inhibitors (MAOIs) treat depression, NOT MAO itself.
; Therefore, a candy bar containing MAO would NOT cheer up a depressed friend.

; Declare sorts
(declare-sort Substance 0)
(declare-sort Person 0)

; Declare functions
(declare-fun contains-MAO (Substance) Bool)
(declare-fun is-MAO-inhibitor (Substance) Bool)
(declare-fun treats-depression (Substance) Bool)
(declare-fun would-cheer-up (Substance Person) Bool)
(declare-fun is-depressed (Person) Bool)

; Declare constants
(declare-const mao-candy-bar Substance)
(declare-const friend Person)

; Knowledge base: MAO candy bar contains MAO enzyme
(assert (contains-MAO mao-candy-bar))

; Knowledge base: MAO is NOT an MAO inhibitor (it's the enzyme itself)
(assert (not (is-MAO-inhibitor mao-candy-bar)))

; Knowledge base: Only MAO inhibitors treat depression
(assert (forall ((s Substance))
  (=> (treats-depression s)
      (is-MAO-inhibitor s))))

; Knowledge base: Friend is depressed
(assert (is-depressed friend))

; Rule: To cheer up a depressed person, substance must treat depression
(assert (forall ((s Substance) (p Person))
  (=> (and (is-depressed p) (would-cheer-up s p))
      (treats-depression s))))

; Test: Would MAO candy bar cheer up depressed friend?
(assert (would-cheer-up mao-candy-bar friend))

; Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (false)
; Explanation: The MAO candy bar is not an MAO inhibitor,
; only MAO inhibitors treat depression, and only substances
; that treat depression can cheer up a depressed person.
; Therefore, the MAO candy bar would NOT cheer up the friend.