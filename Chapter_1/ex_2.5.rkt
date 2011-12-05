#lang planet neil/sicp

;The goal here is to show that there is yet another way of representing pairs and these basic procedures. 

(define (to-power base exp)
  (if (= exp 0)
      1
      (* base (to-power base (- exp 1)))))

(to-power 4 2)

