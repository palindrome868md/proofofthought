; Question: Can you buy Casio products at Petco?
; This tests whether it's possible to purchase Casio brand products at Petco store

; 1. Declare sorts
(declare-sort Store 0)
(declare-sort Product 0)
(declare-sort Brand 0)
(declare-sort Category 0)

; 2. Declare functions
(declare-fun sells (Store Product) Bool)
(declare-fun is-brand (Product Brand) Bool)
(declare-fun store-type (Store) Category)
(declare-fun product-type (Product) Category)

; 3. Declare constants
(declare-const petco Store)
(declare-const casio Brand)
(declare-const pet-supplies Category)
(declare-const electronics Category)
(declare-const test-product Product)

; 4. Assert knowledge base (facts about stores and products)

; Petco is a pet supply store
(assert (= (store-type petco) pet-supplies))

; Petco only sells pet-related products
(assert (forall ((s Store) (p Product))
  (=> (and (= s petco) (sells s p))
      (= (product-type p) pet-supplies))))

; Casio is an electronics brand (watches, calculators, etc.)
(assert (forall ((p Product))
  (=> (is-brand p casio)
      (= (product-type p) electronics))))

; Pet supplies and electronics are different categories
(assert (distinct pet-supplies electronics))

; 5. Test: Can you buy Casio products at Petco?
; We assert that there exists a Casio product sold at Petco
; If unsat, it means you CANNOT buy Casio at Petco
; If sat, it means you CAN buy Casio at Petco

(assert (sells petco test-product))
(assert (is-brand test-product casio))

; 6. Check satisfiability
(check-sat)
(get-model)

; Expected result: unsat (false)
; Reason: Casio products are electronics, Petco only sells pet supplies,
; and these categories are distinct. Therefore you cannot buy Casio at Petco.