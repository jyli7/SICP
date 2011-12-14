#lang planet neil/sicp

;a queen's position will be given by (row column)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

;positions are like ((2 1) (4 2) (5 3)), (row col)
;a new column's placement is safe if it's placed in an empty row. 

(define (make-position row col)
  (cons row col))

(define (get-row position)
  (car position))

(define (get-col position)
  (cdr position))

(define (adjoin-position row col positions)
  (append positions (list (make-position row col))))

(define (empty-board)
  null)

(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (safe? col positions)
  (let ((kth-queen (list-ref positions (- col 1)))
        (other-queens (filter (lambda (position)
                                (not (= col (get-col position))))
                              positions)))
    (define (attacks? q1 q2)
      (or (= (get-row q1) (get-row q2))
          (= (abs (- (get-row q1) (get-row q2)))
             (abs (- (get-col q1) (get-col q2))))))
    (define (iter q board)
      (or (null? board)
          (and (not (attacks? q (car board)))
               (iter q (cdr board)))))
    (iter kth-queen other-queens)))
    
    
    
    
   
        