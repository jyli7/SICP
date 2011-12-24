#lang planet neil/sicp

(define (f a)
  (let ((result a))
    (cond ((= result 0) 
           (begin (set! result (- result 1))
                  result))
          ((= result 1)
           (begin (set! result (+ result 1))
                  result)))))

(+ (f 0) (f 1))
                  