#lang planet neil/sicp

(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        ((< x (car set)) false)
        (else (element-of-set? x (cdr set)))))

;Union-set

;look at (car set 1) -- call it x1 --  and compare to (car set 2) -- call it x2.
;If x1 < x2, then cons x1 to the union of cdr set 1 and set 2
;If x1 = x2, then cons x1 to the union of cdr set 1 and cdr set 2
;If x1 > x2, then cons x2 to the union of set 1 and cdr set 2
;If one set is null, then return teh other set

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((x1 (car set1)) (x2 (car set2)))
           (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                 ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                 ((> x1 x2) (cons x2 (union-set set1 (cdr set2)))))))))

(display (union-set (list 3 5 9) (list 1 4 6)))
          
        