#lang planet neil/sicp

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))


;a. Write selectors

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

;b. write total weight

(define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))

(define (total-weight mobile)  
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

(define x
  (make-mobile (list 1 2) (list 3 (make-mobile (list 4 5) (list 1 2)))))

(total-weight x)

;c. write balanced? 

(define (balanced? mobile)
  (define (torque branch)
    (* (branch-weight branch) (branch-length branch)))
  (cond ((not (= (torque (left-branch mobile)) (torque (right-branch mobile)))) #f)
        ((pair? (branch-structure (left-branch mobile))) (balanced? (branch-structure (left-branch mobile))))
        ((pair? (branch-structure (right-branch mobile))) (balanced? (branch-structure (right-branch mobile))))
        (else #t)))

(balanced? (make-mobile (list 2 (make-mobile (list 2 4) (list 3 4))) (list 4 4)))

;d. If we change mobile definition, you only need to change the (right-branch) and (branch-structure) definitions. Namely, no need for car. 

(define (make-mobile-mod left right)
  (cons left right))
(define (make-branch-mod length structure)
  (cons length structure))

(define (right-branch-mod mobile)
  (cdr mobile))

(define (branch-structure-mod branch)
  (cdr branch))
