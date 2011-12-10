#lang planet neil/sicp

;The goal here is to show that there is yet another way of representing pairs and these basic procedures. 

(define (to-power base exp)
  (if (= exp 0)
      1
      (* base (to-power base (- exp 1)))))

(to-power 4 2)

(define (cons a b)
  (* (to-power 2 a)
     (to-power 3 b)))

;its turtles (or rather - factors - all the way down!)
(define (all-way-down number factor)
   (cond ((= number factor) #t)
         ((= (remainder number factor) 0) (all-way-down (/ number factor) factor))
         (else #f)))

;car def (iterative)
(define (car prod)
   (define (car-iter prod test count)
    (if (all-way-down (/ prod test) 3) 
        count
        (car-iter prod (* test 2) (+ count 1))))
  (car-iter prod 2 1))

;cdr def (iterative)
(define (cdr prod)
  ;its turtles (or rather - factors - all the way down!)
  (define (cdr-iter prod test count)
    (if (all-way-down (/ prod test) 2)
        count
        (cdr-iter prod (* test 3) (+ count 1))))
  (cdr-iter prod 3 1))


(cons 2 3)
(car (cons 2 3))
(cdr (cons 2 3))        