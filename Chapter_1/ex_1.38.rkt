#lang planet neil/sicp

;a. Use your cont-frac procedure to approximate e.
(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))

(define (d i)
  (if (= (remainder (+ i 1) 3) 0)
      (* 2 (/ (+ i 1) 3) )
      1))

(define e
  (+ 2 (cont-frac (lambda (i) 1.0)
                  d
                  10)))

e

           