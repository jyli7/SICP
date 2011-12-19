#lang planet neil/sicp

(define (union-set t1 t2)
  (list->tree (union-set (tree->list t1)
                         (tree->list t2))))

(define (intersection-set t1 t2)
  (list->tree (intersection-set (tree->list t1)
                         (tree->list t2))))

