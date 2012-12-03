(clear)
(watch all)
(deftemplate used-car (slot price) (slot mileage))
(deftemplate new-car (slot price) (slot warrantyPeriod))
(defrule might-buy-car
	?candidate <- (or (used-car (mileage ?m&:(< ?m 50000)))
					  (new-car (price ?p&:(< ?p 20000))))
	=>
	(assert (candidate ?candidate))
)
(assert (new-car (price 18000)))
(assert (used-car (mileage 18000)))
(run)


