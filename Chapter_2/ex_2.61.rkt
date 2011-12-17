#lang planet neil/sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

;adjoin set with ordered list

;if x is not in set, add x into the appropriate location
;if x is smaller than (car set), then cons x to the set
;if x is equal to (car set), then return the set
;if x is larger than (car set), cons (car set) with (adjoin-set x (cdr set))

(define (adjoin-set x set)
  (cond ((null? set) (append set (list x)))
        ((< x (car set)) (cons x set))
        ((= x (car set)) set)
        (else (cons (car set) (adjoin-set x (cdr set))))))

(display (adjoin-set 2 (list 3 4 7)))
(display (adjoin-set 3 (list 3 4 7)))
(display (adjoin-set 8 (list 3 4 7)))
(display (adjoin-set 5 (list 3 4 7)))