#lang racket

(define (cbrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (cbrt-iter (improve guess x)
                 x)))

 (define (good-enough? guess x) 
  (< (abs (- (improve guess x) guess)) 
     (abs (* guess .001)))) 
  
(define (improve guess x)
  (/ (+ (/ x (square guess))
        (* 2 guess)
     )
     3
  )
)

(define (average x y)
  (/ (+ x y)
     2
     )
  )
  

(define (square x)
  (* x x)
  )

(define (cbrt x)
  (cbrt-iter 1.0 x))
 
;;testing
 (cbrt 1) 
 (cbrt -8) 
 (cbrt 27) 
 (cbrt -1000) 
 (cbrt 1e-30) 
 (cbrt 1e60)