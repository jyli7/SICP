#lang planet neil/sicp

;Exercise 2.76. As a large system with generic operations evolves, new types of data objects or new
;operations may be needed. For each of the three strategies -- generic operations with explicit dispatch, datadirected
;style, and message-passing-style -- describe the changes that must be made to a system in order to
;add new types or new operations. Which organization would be most appropriate for a system in which
;new types must often be added? Which would be most appropriate for a system in which new operations
;must often be added?

;Changes you'd need to make to each...
;1) If new types, need to make each operation respond to each type. If new operations, need to make that operation understand
;all types. 
;2) If new types, need to add to table. If new operations, need to add to table. 
;3) If new operations, need to make each type know how to respond to each operation. If new type, need to make that type
;understand all existing operations. 

;Data-directed style is better for both. 