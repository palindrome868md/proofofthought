;--- 1. Declare sorts -------------------------------------------------
(declare-sort Boat 0)
(declare-sort Tunnel 0)

;--- 2. Declare functions ----------------------------------------------
; Predicate that tells whether a given boat is a cruise boat
(declare-fun is-cruise-boat (Boat) Bool)

; Traversal relation: does a boat traverse a tunnel?
(declare-fun traverses (Boat Tunnel) Bool)

;--- 3. Declare constants (the specific objects) -----------------------
(declare-const oasis Boat)          ; the Oasis cruise boat
(declare-const lincoln-tunnel Tunnel) ; the Lincoln Tunnel

;--- 4. Knowledge base -------------------------------------------------
; Oasis is a cruise boat
(assert (is-cruise-boat oasis))

; Universal rule: any boat cannot traverse any tunnel
(assert (forall ((b Boat) (t Tunnel))
        (=> (is-cruise-boat b) (not (traverses b t)))))

;--- 5. Test the question -----------------------------------------------
; Would Oasis traverse the Lincoln Tunnel?
(assert (traverses oasis lincoln-tunnel))

;--- 6. Check the result ------------------------------------------------
(check-sat)
(get-model)