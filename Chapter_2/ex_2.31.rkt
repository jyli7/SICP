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

;tree-map definition

(define (tree-map func tree)
    (map (lambda (sub-tree)
         (if (not (pair? sub-tree))
             (func sub-tree)
             (tree-map func sub-tree)))
       tree))

(define (square-tree tree)
  (tree-map square tree))

(display (square-tree (list (list 1 2) (list 3 4))))

(display (square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7))))