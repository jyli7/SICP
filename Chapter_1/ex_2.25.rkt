#lang planet neil/sicp

;The lesson of this problem is that cdr always returns a list. 

;(1 3 (5 7) 9)
(display (list 1 3 (list 5 7) 9))
(newline)
(display (car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9)))))))

(newline)

;((7))
(display (list (list 7 )))
(newline)
(display (car (car (list (list 7 )))))

(newline)

;(1 (2 (3 (4 (5 (6 7))))))
(display (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(newline)
(define long-list
  (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))
(display long-list)
(newline)
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr long-list))))))))))))