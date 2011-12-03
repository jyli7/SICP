#lang planet neil/sicp

(define (square x) (* x x)) 
  
 (define (smallest-divisor n) 
   (find-divisor n 2)) 
  
 (define (find-divisor n test-divisor) 
   (cond ((> (square test-divisor) n) n) 
         ((divides? test-divisor n) test-divisor) 
         (else (find-divisor n (+ test-divisor 1))))) 
  
 (define (divides? a b) 
   (= (remainder b a) 0)) 
  
 (define (prime? n) 
   (= n (smallest-divisor n))) 
  
 (define (timed-prime-test n) 
   (start-prime-test n (runtime))) 
 
 (define (start-prime-test n start-time) 
   (if (fast-prime? n 5) 
       (report-prime n (- (runtime) start-time)))) 
 
 (define (fermat-test n)
(define (try-it a)
(= (expmod a n n) a))
(try-it (+ 1 (random (- n 1)))))
 
 (define (expmod base exp m)
(cond ((= exp 0) 1)
((even? exp)
(remainder (square (expmod base (/ exp 2) m))
m))
(else
(remainder (* base (expmod base (- exp 1) m))
m))))
 
 (define (fast-prime? n times)
   (cond ((= times 0) true)
         ((fermat-test n) (fast-prime? n (- times 1)))
         (else false)))
 
  
 (define (report-prime n elapsed-time) 
   (newline)
   (display n) 
   (display " *** ") 
   (display elapsed-time))
 
 (define (search-for-primes first last)
   (define (search-iter cur last)
     (if (<= cur last) (timed-prime-test cur))
     (if (<= cur last) (search-iter (+ 2 cur) last))
     )
   (search-iter (if (even? first) (+ first 1) first)
                (if (even? last) (- last 1) last)))
 
 (search-for-primes 1000 1019)       ; 1e3 
 (search-for-primes 1000000 1000037)     ; 1e4
 (search-for-primes 1000000000 1000000037)     ; 1e4