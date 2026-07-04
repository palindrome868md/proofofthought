;--- Sort declarations -------------------------------------------------
(declare-sort Community 0)
(declare-sort County 0)

;--- Function (predicate) declarations ---------------------------------
(declare-fun unincorporated (Community) Bool)
(declare-fun located_in     (Community County) Bool)

;--- Constant declarations ---------------------------------------------
(declare-const ordinary Community)   ; the community "Ordinary"
(declare-const elliot   County)      ; the county "Elliot County"

;--- Premises ----------------------------------------------------------
; Ordinary is an unincorporated community.
(assert (unincorporated ordinary))

; Ordinary is located within Elliot County.
(assert (located_in ordinary elliot))

; (The premise about being northwest of Sandy Hook is omitted – it does not affect the query.)

;--- Statement to verify -----------------------------------------------
; There exists an unincorporated community located in Elliot County.
(assert (exists ((c Community))
                (and (unincorporated c)
                     (located_in c elliot))))

;--- Solve -------------------------------------------------------------
(check-sat)
(get-model)