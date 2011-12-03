#lang planet neil/sicp

(define (double f)
  (define (iter f n)
    (if (= n 0)
        f
        (f (iter f (- n 1)))))
  (iter f 1))

((double inc) 2)
;(((double (double double)) inc) 5)