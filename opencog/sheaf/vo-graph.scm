;
; vo-graph.scm
;
; Vertex-ordered graph.
;
; Copyright (c) 2017 Linas Vepstas
;
; ---------------------------------------------------------------------
; OVERVIEW
; --------
; The functions below provide convenient access to a "weighted
; vertex-ordered graph". A "vertex-ordered graph" is a graph where
; each vertex in the graph is labelled with an ordinal. This ordering
; can be imagined to give the vertexes a left-to-right ordering.
; The graph is weighted if each of the edges is assigned a weight,
; (equivalently, a "cost").
;
; The functions below simply provide an API to access the ordering and
; the weights.
;
; Terminology:
; A "numa" is a NUMbered Atom; it is an ordered vertex. Its an atom,
;    and an integer number indicating it's ordering.
;
; An "overt" is the same thing as a numa, short for Ordered VERTex.
;
; A "wedge" is an edge, consisting of an ordered pair of numa's.
;     Note that ordering of the vertexes in the edge give that
;     edge an implicit directionality. This need NOT correspond
;     to the ordinal numbering of the vertexes. That is, an edge
;     can point from right to left or from left to right!
;
; ---------------------------------------------------------------------
;
(use-modules (opencog))

; ---------------------------------------------------------------------
; The MST parser returns a list of weighted edges, each edge consisting
; of a pair of ordered atoms.
; The functions below unpack each data structure.
;
(define-public (wedge-get-score lnk)
"
  wedge-get-score lnk -- Get the score of the link (aka 'weighted edge').
"
	(cdr lnk))

(define-public (wedge-get-left-overt lnk)
"
  wedge-get-left-overt lnk -- Get the left numbered-atom (numa) in the
  link. The numa is a scheme pair of the form (number . atom)
"
	(car (car lnk)))

(define-public (wedge-get-right-overt lnk)
"
  wedge-get-right-overt lnk -- Get the right numbered-atom (numa) in the
  link. The numa is a scheme pair of the form (number . atom)
"
	(cdr (car lnk)))

(define-public (overt-get-index numa)
"
  overt-get-index numa -- Get the index number out of the numa.
"
	(car numa))

(define-public (overt-get-atom numa)
"
  overt-get-atom numa -- Get the atom from the numa.
"
	(cdr numa))

(define-public (wedge-get-left-atom lnk)
"
  wedge-get-left-atom lnk -- Get the left atom in the weighted link.
"
	(overt-get-atom (wedge-get-left-overt lnk)))

(define-public (wedge-get-right-atom lnk)
"
  wedge-get-right-atom lnk -- Get the right atom in the weighted link.
"
	(overt-get-atom (wedge-get-right-overt lnk)))

(define-public (wedge-get-left-index lnk)
"
  wedge-get-left-index lnk -- Get the index of the left atom in the link.
"
	(overt-get-index (wedge-get-left-overt lnk)))

(define-public (wedge-get-right-index lnk)
"
  wedge-get-right-index lnk -- Get the index of the right word in the link.
"
	(overt-get-index (wedge-get-right-overt lnk)))

; ---------------------------------------------------------------------

(define-public (wedge-cross? wedge-a wedge-b)
"
  wedge-cross? wedge-a wedge-b Do a pair of links cross each other?

  Return true if a pair of weighted edges cross, else return false.
  Usefule for constructing planar graphs.
"
	(define pair-a (car wedge-a)) ; throw away weight
	(define pair-b (car wedge-b)) ; throw away weight
	(define lwa (car pair-a)) ; left  numa of numa-pair
	(define rwa (cdr pair-a)) ; right numa of numa-pair
	(define lwb (car pair-b))
	(define rwb (cdr pair-b))
	(define ila (car lwa))     ; ordinal number of the atom
	(define ira (car rwa))
	(define ilb (car lwb))
	(define irb (car rwb))
	(or
		; All inequalities are strict.
		(and (< ila ilb) (< ilb ira) (< ira irb))
		(and (< ilb ila) (< ila irb) (< irb ira))
	)
)

(define-public (wedge-cross-any? wedge wedge-list)
"
  wedge-cross-any? wedge wedge-list -- does this link cross any others?

  Return true if the wedge crosses over any wedges in the wedge-list.
"
	(any (lambda (pr) (wedge-cross? pr wedge)) wedge-list)
)

; ---------------------------------------------------------------------
