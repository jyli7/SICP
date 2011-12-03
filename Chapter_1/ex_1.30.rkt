;Recursive definition:
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))


;3 + 4 + 5 + 6

;my iterative definition:
;;in this definition, result comes after a. 
(define (sum term a next b)
  (define (iter a result)
    (if (= (next a) b)
        (+ result (next a))
        (iter result (+ result (next a)))))
  (iter (term a) (+ (term a) (next a))))

;Bill the Lizard's iterative definition:
;;in this definition, a comes after result
(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) (result)))))
  (iter (term a) 0))
