#lang planet neil/sicp

;This function...
(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items nil))
;...produces the answer list in the reverse order because it cons the next item in the list onto the answer (which is being built).

;This solution...
(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items nil))
;...fails too because 

(cons nil 4)