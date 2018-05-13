;
; Test composition of function with diagonal operator (coproduct)
; This triggers the alpha-conversion code path; its almost just
; a variable renaming, together with an eta conversion at the end,
; so that the vaialbe $Z becomes bound, instead of being free.
;
(define put-1
(Put
  (Lambda (Inheritance (Variable "$X") (Variable "$Y")))
  (List (Variable "$Z") (Variable "$Z"))))

(define expected-1
(LambdaLink
  (VariableNode "$Z")
  (InheritanceLink
    (VariableNode "$Z")
    (VariableNode "$Z"))))

; -----------------------------------------------------
; Similar to above, but with free variables, instead of bound vars.
; That is, both variables $X and $Y are free. The beta-substitution
; keeps them free, and does not bind them (no eta-conversion).
;
(define put-2
(Put
  (Inheritance (Variable "$X") (Variable "$Y"))
  (List (Variable "$Z") (Variable "$Z"))))

(define expected-2
  (InheritanceLink
    (VariableNode "$Z")
    (VariableNode "$Z")))

; -----------------------------------------------------
; Simple alpha conversion.
; All three expected results are alpha-equivalent; any one will do.
; All three should equal the result of evaluating the put.

(define put-3
(Put
  (Lambda
    (Inheritance (Variable "$X") (Variable "$Y")))
    (List (Variable "$Z") (Variable "$W"))))

(define expected-3
(LambdaLink
  (InheritanceLink
    (VariableNode "$X")
    (VariableNode "$Y"))))

(define expected-3-alt
(LambdaLink
  (InheritanceLink
    (VariableNode "$Z")
    (VariableNode "$W"))))

(define expected-3-alt-b
(LambdaLink
  (InheritanceLink
    (VariableNode "$foo")
    (VariableNode "$bar"))))

; -----------------------------------------------------
(define put-4
(Put
  (Inheritance (Variable "$X") (Variable "$Y"))
  (List (Variable "$Z") (Variable "$W"))))

(define expected-4
(InheritanceLink
  (VariableNode "$X")
  (VariableNode "$Y")))

(define put-5
(Put
  (List
    (Variable "$spe-arg-0")
    (Concept "D"))
  (Lambda
    (VariableList
      (Variable "$sha-arg-0")
      (Variable "$sha-arg-1"))
    (Inheritance
      (Variable "$sha-arg-0")
      (Variable "$sha-arg-1")))))

(define expected-5
(Lambda
  (VariableList
    (Variable "$sha-arg-0")
    (Variable "$sha-arg-1"))
  (List
    (Inheritance
      (Variable "$sha-arg-0")
      (Variable "$sha-arg-1"))
    (Concept "D"))))
