;1,000,000 --> P1 sets, then P2 sets. Or vice versa.
;100,000 --> P2 accesses once, P1 sets, P2 sets (10 * 100 * 100)
;10,000 --> P2 accesses twice, P1 sets, P2 sets (10 * 10 * 100)
;1000 --> P2 accesses X, P1 sets x, P2 sets x. 
;100 --> P1 accesses X, P2 sets x, P1 sets x

;if you use serialized procedures, 1,000,000 would still remain

