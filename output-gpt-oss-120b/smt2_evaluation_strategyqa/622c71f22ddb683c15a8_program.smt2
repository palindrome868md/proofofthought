;------------------------------
; Declarations
;------------------------------

; Uninterpreted sorts
(declare-sort Store   0)
(declare-sort Brand   0)
(declare-sort Category 0)
(declare-sort Product 0)

; Functions / predicates
(declare-fun store-type      (Store Category) Bool)   ; store belongs to a category
(declare-fun product-brand   (Product Brand)   Bool)   ; product is made by a brand
(declare-fun product-category (Product Category) Bool) ; product belongs to a category
(declare-fun sells           (Store Product)   Bool)   ; store sells the product

; Constants (the particular entities we talk about)
(declare-const petco        Store)
(declare-const casio        Brand)
(declare-const electronics  Category)
(declare-const pet-supplies Category)
(declare-const casio-watch  Product)

;------------------------------
; Knowledge base
;------------------------------

; Petco is a pet‑supplies retailer
(assert (store-type petco pet-supplies))

; The Casio watch is made by Casio and is an electronic product
(assert (product-brand   casio-watch casio))
(assert (product-category casio-watch electronics))

; General rule: a pet‑supplies store does NOT sell electronic products
(assert (forall ((s Store) (p Product))
        (=> (and (store-type s pet-supplies)
                 (product-category p electronics))
            (not (sells s p)))))

;------------------------------
; Test the question:
; "Can you buy Casio products at Petco?"
;-------------------------------------------------
; We ask whether Petco could sell the Casio watch.
(assert (sells petco casio-watch))

;------------------------------
; Solver query
;------------------------------
(check-sat)   ; Expected result: unsat  (i.e., cannot buy it)
(get-model)   ; Optional: shows a model for the rest of the symbols