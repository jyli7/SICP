#lang planet neil/sicp

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (scale-tree tree factor)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (scale-tree sub-tree factor)
             (* sub-tree factor)))
       tree))

(define (square x)
  (* x x))

;direct definition
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (square tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))

(display (square-tree (list (list 1 2) (list 3 4))))

;using map
(define (square-tree-map tree)
  (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (square sub-tree)
             (square-tree-map sub-tree)))
       tree))

(display (square-tree-map (list (list 1 2) (list 3 4))))