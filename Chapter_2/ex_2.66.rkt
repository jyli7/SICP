#lang planet neil/sicp

(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))
(define (make-tree entry left right)
  (list entry left right))

(define (lookup given-key set)
  (cond ((null? set) false)
        ((= x (key (entry set))) (entry set))
        ((< x (key (entry set))
         (lookup x (left-branch set))))
        ((> x (key (entry set))
         (lookup x (right-branch set))))))
