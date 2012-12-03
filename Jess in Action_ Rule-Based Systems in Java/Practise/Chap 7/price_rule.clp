(clear)
(watch all)
(reset)
(deftemplate item (slot price) (slot name))
(defrule twice-price-rule
	(item (name ?n1) (price ?x))
	;(item (name ?n2) (price ?y&:(eq ?y (* ?x 2))))
	(item (name ?n2) (price =(* ?x 2)))
	=>
	(printout t ?n2 "\'s price is twice as " ?n1 crlf)
)
(assert (item (name Apple) (price 4)))
(assert (item (name Pair) (price 2)))
(assert (item (name Banana) (price 1)))
(assert (item (name Orange) (price 3)))
(assert (item (name Grape) (price 8)))
(run)

; Output
; Grape's price is twice as Apple
; FIRE 2 MAIN::twice-price-rule f-3, f-2
; Pair's price is twice as Banana
; FIRE 3 MAIN::twice-price-rule f-2, f-1
; Apple's price is twice as Pair
;  <== Focus MAIN
; 3

