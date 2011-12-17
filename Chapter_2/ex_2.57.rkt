#lang planet neil/sicp

;building blocks

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (=number? exp num)
  (and (number? exp) (= exp num)))



;Extend the basic operator to handle exponents
;a new clause to the deriv program and defining appropriate procedures exponentiation?,
;base, exponent, and make-exponentiation. (You may use the symbol ** to denote
;exponentiation.) Build in the rules that anything raised to the power 0 is 1 and anything raised to the power
;1 is the thing itself.

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product (exponent exp)
                       (make-exponentiation (base exp) (- (exponent exp) 1))))
        (else
         (error "unknown expression type -- DERIV" exp))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base p) (cadr p))

(define (exponent p) (caddr p))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))


(define (sum? x)
  (and (list? x) (eq? (car x) '+)))

 (define (make-sum-list l) 
   (if (= (length l) 2) 
       (list '+ (car l) (cadr l)) 
       (make-sum (car l) (make-sum-list (cdr l))))) 
 
 (define (make-sum a1 a2) 
   (cond ((=number? a1 0) a2) 
         ((=number? a2 0) a1) 
         ((and (number? a1) (number? a2)) (+ a1 a2)) 
         (else (make-sum-list (list a1 a2))))) 

(define (addend s) (cadr s))

(define (augend s) 
  (let (a (cddr s))
    (if (= (length a) 1)
        (car a)
        (make-sum-list a))))

 (define (make-product-list l)
   (if (= (length l) 2)
       (list '* (car l) (cdr l))
       (make-product (car l) (make-product-list (cdr l)))))
   
 (define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (make-product-list (list m1 m2)))))

 (define (multiplicand p)
   (let (m (cddr p))
     (if (= (length m) 1)
         (car m)
         (make-product-list m))))
         