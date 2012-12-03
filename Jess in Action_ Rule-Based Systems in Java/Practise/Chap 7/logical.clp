(clear)
(watch all)
(defrule water-flows-while-faucet-is-open
	(logical (faucet open))
	=>
	(assert (water flowing))
)
(assert (faucet open))
(run)
(facts);For a total of 2 facts
(retract 0)
(facts);For a total of 0 facts
