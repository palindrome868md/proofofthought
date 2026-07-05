; Declare sorts
(declare-sort Person 0)

; Declare constants (the individuals in this scenario)
(declare-const survivor Person)
(declare-const deceased Person)

; Declare predicates / relations
(declare-fun spouse (Person Person) Bool)
(declare-fun leaves-to-spouse (Person Person) Bool)
(declare-fun iht-required (Person) Bool)

; Declare values
(declare-const estate-value Int)
(declare-const threshold Int)

; Knowledge base / scenario setup
(assert (spouse survivor deceased))           ; survivor is spouse of the deceased
(assert (= threshold 325000))                   ; threshold for IHT
(assert (= estate-value 300000))                ; estate value (the home is £300,000)
(assert (leaves-to-spouse deceased survivor))  ; deceased left estate to spouse

; Inheritance Tax rules (simplified for this scenario)
; If estate value <= threshold => no IHT
(assert (=> (<= estate-value threshold) (not (iht-required deceased))))

; If estate is left to a spouse => no IHT
(assert (=> (leaves-to-spouse deceased survivor) (not (iht-required deceased))))

; If estate > threshold and not left to spouse => IHT required
(assert (=> (and (> estate-value threshold) (not (leaves-to-spouse deceased survivor)))
            (iht-required deceased)))

; Test: Is IHT required for the deceased's estate?
(assert (iht-required deceased))

; Check satisfiability
(check-sat)