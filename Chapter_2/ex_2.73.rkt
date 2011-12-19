#lang planet neil/sicp

;Original program

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        <more rules can be added here>
        (else (error "unknown expression type -- DERIV" exp))))

;New data-directed version:

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        (else ((get 'deriv (operator exp)) (operands exp)
                                           var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;a. Explain what was done above. Why can't we assimilate the predicates number? and samevariable?
;into the data-directed dispatch?

;Instead of directly calling the appropriate procedure (make-sum or make-product) in the function itself, the function
;references a table for the function. 
;Number? and samevariable? are not assimilated because they don't have corresponding op and type values. 

;b. 

(define (deriv-sum exp var)
  (make-sum (deriv (addend exp) var)
            (deriv (augend exp) var)))

(define (deriv-product exp var)
  (make-sum 
   (make-product (multiplier exp)
                 (deriv (multiplicand exp) var))
   (make-product (deriv (multiplier exp) var)
                 (multipicant exp))))

(put 'deriv '+ deriv-sum)
(put 'deriv '* deriv-product)
(put 'deriv '^ (lambda (exp var)
                 (make-product (cadr exp)
                               (make-power (car exp) (- (cadr exp) 1)))))

;d. none
