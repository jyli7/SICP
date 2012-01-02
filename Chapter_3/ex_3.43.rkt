;Yes. One troublesome scenario:
;1) Paul accesses balance.
;2) Peter withdraws some amount (and sets x to a new value)
;3) Balance is returned to Paul (but is the newly set value)
;This is anomalous in that it does not give the value of the balance at the time it was requested. It gives the value
;of the balance *after* Peter completes his transaction.



