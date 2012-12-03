(clear)
(watch all)
(reset)

(deftemplate shopping-cart 
	(multislot contents) 
	(slot customer-id))

(defrule any-shopping-cart
	(shopping-cart (contents $?items))
	=>
	(printout t "The cart contains" ?items crlf)
)

(defrule car-containing-milk
	;(shopping-cart (contents $?before "milk" $?after))
	(shopping-cart (contents $? "milk" $?))
	=>
	(printout t "The cart contains milk." crlf)
)

(defrule car-third-is-milk
	(shopping-cart (contents ? ? "milk" $?))
	=>
	(printout t "The third one in this cart is milk." crlf)
)

(defrule small-order
	(shopping-cart 
		(customer-id ?id)
		(contents $?c&:(< (length$ $?c) 5)))
	(checking-out-now ?id)
	=>
	(printout t "Hello, customer (" ?id "), wouldn't you like to buy more?" crlf)
)

(defrule large-order-and-no-dairy
	(shopping-cart 
		(customer-id ?id)
		(contents $?c&
		:(and (> (length$ $?c) 5)
			(not (or (member$ "milk" $?c) (member$ "butter" $?c)))
		))
	)
	(checking-out-now ?id)
	=>
	(printout t "Hello, customer (" ?id "), Don't you need dairy products?" crlf)
)

(assert (shopping-cart 
			(contents "apple" "paper" "pair")
			(customer-id 1)))
(assert (shopping-cart 
			(contents "apple" "egg" "paper" "pair" "book" "pencil")
			(customer-id 2)))
(assert (shopping-cart 
			(contents "pair" "book" "pencil")
			(customer-id 3)))
(assert (shopping-cart 
			(contents "apple" "pen" "milk" "paper" "pair" "book" "pencil")
			(customer-id 4)))

(assert (checking-out-now 1))
(assert (checking-out-now 2))
(assert (checking-out-now 3))
(assert (checking-out-now 4))
(run)
