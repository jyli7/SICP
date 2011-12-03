#lang planet neil/sicp

;a. Recursive process:
(define (cont-frac n d k)
  (define (frac i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (frac (+ i 1))))))
  (frac 1))
  
;test
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)

;To achieve accuracy to four decimal places, k must be > [FILL IN HERE]

;b. Iterative process
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-iter (lambda (i) 1.0)
(lambda (i) 1.0)
100)
      