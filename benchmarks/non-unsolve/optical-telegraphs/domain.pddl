
(define (domain optical-telegraph-ae)
  (:requirements :strips :typing)

  (:types station queue)

  (:predicates
   ;; topology: how stations connect to queues
   (station-read-queue ?s - station ?q - queue)
   (station-write-queue ?s - station ?q - queue)
   (station-ctl-queue ?s - station ?q - queue)

   ;; station has priority to send
   ;; note: only one of two stations "facing" each other may
   ;; have priority (otherwise it won't work)
   (has-priority ?s - station)
   (not-has-priority ?s - station)

   ;; station states
   (station-state-2 ?s - station)
   (station-state-3 ?s - station)
   (station-state-5 ?s - station)
   (station-state-8 ?s - station)
   (station-state-11 ?s - station)
   (station-state-12 ?s - station)
   (station-state-14 ?s - station)
   (station-state-15 ?s - station)
   (station-state-17 ?s - station)
   (station-state-20 ?s - station)
   (station-state-23 ?s - station)
   (station-state-24 ?s - station)
   (station-state-25 ?s - station)

   ;; queue states
   ;; note: all queues have length 1, so the state of
   ;; a queue equals simply the type of the single message
   ;; in it (or empty)
   (queue-state-empty ?q - queue)
   (queue-state-ctl ?q - queue)
   (queue-state-att ?q - queue)
   (queue-state-data ?q - queue)
   (queue-state-start ?q - queue)
   (queue-state-stop ?q - queue)

   (not-queue-state-empty ?q - queue)
   (not-queue-state-ctl ?q - queue)
   (not-queue-state-att ?q - queue)
   (not-queue-state-data ?q - queue)
   (not-queue-state-start ?q - queue)
   (not-queue-state-stop ?q - queue)

   ;; conditional blockage
   (blocked ?s - station)
   (may-push-ctl ?q - queue)
   (may-push-att ?q - queue)
   (may-push-data ?q - queue)
   (may-push-start ?q - queue)
   (may-push-stop ?q - queue)
   (may-pop ?q - queue)
   )

  ;; state transition actions

  (:action transition-25-2
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-25 ?s)
		      (queue-state-start ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-25 ?s))
		(station-state-2 ?s)
		(not (queue-state-start ?q))
		(queue-state-empty ?q)
		(not-queue-state-start ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-2-3
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-2 ?s)
		      (queue-state-empty ?q)
		      (may-push-ctl ?q))
   :effect (and (not (station-state-2 ?s))
		(station-state-3 ?s)
		(not (queue-state-empty ?q))
		(queue-state-ctl ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-ctl ?q)))
   )

  (:action transition-3-8
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-3 ?s)
		      (queue-state-empty ?q)
		      (may-push-att ?q))
   :effect (and (not (station-state-3 ?s))
		(station-state-8 ?s)
		(not (queue-state-empty ?q))
		(queue-state-att ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-att ?q)))
   )

;;   (:action transition-8-5
;;    :parameters (?s - station ?q - queue)
;;    :precondition (and (station-write-queue ?s ?q)
;; 		      (station-state-8 ?s)
;; 		      (queue-state-empty ?q)
;; 		      (may-push-data ?q))
;;    :effect (and (not (station-state-8 ?s))
;; 		(station-state-5 ?s)
;; 		(not (queue-state-empty ?q))
;; 		(queue-state-data ?q))
;;    )

;;   (:action transition-5-8
;;    :parameters (?s - station ?q - queue)
;;    :precondition (and (station-read-queue ?s ?q)
;; 		      (station-state-5 ?s)
;; 		      (queue-state-data ?q)
;; 		      (may-pop ?q))
;;    :effect (and (not (station-state-5 ?s))
;; 		(station-state-8 ?s)
;; 		(not (queue-state-data ?q))
;; 		(queue-state-empty ?q))
;;    )

  (:action transition-8-5
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-8 ?s)
		      (queue-state-data ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-8 ?s))
		(station-state-5 ?s)
		(not (queue-state-data ?q))
		(queue-state-empty ?q)
		(not-queue-state-data ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-5-8
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-5 ?s)
		      (queue-state-empty ?q)
		      (may-push-data ?q))
   :effect (and (not (station-state-5 ?s))
		(station-state-8 ?s)
		(not (queue-state-empty ?q))
		(queue-state-data ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-data ?q)))
   )

  (:action transition-8-11
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-8 ?s)
		      (queue-state-stop ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-8 ?s))
		(station-state-11 ?s)
		(not (queue-state-stop ?q))
		(queue-state-empty ?q)
		(not-queue-state-stop ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-11-12
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-11 ?s)
		      (queue-state-empty ?q)
		      (may-push-stop ?q))
   :effect (and (not (station-state-11 ?s))
		(station-state-12 ?s)
		(not (queue-state-empty ?q))
		(queue-state-stop ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-stop ?q)))
   )

  (:action transition-12-25
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-12 ?s)
		      (queue-state-ctl ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-12 ?s))
		(station-state-25 ?s)
		(not (queue-state-ctl ?q))
		(queue-state-empty ?q)
		(not-queue-state-ctl ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-25-14
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-25 ?s)
		      (queue-state-empty ?q)
		      (may-push-ctl ?q))
   :effect (and (not (station-state-25 ?s))
		(station-state-14 ?s)
		(not (queue-state-empty ?q))
		(queue-state-ctl ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-ctl ?q)))
   )

  (:action transition-14-15
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-14 ?s)
		      (queue-state-empty ?q)
		      (may-push-start ?q))
   :effect (and (not (station-state-14 ?s))
		(station-state-15 ?s)
		(not (queue-state-empty ?q))
		(queue-state-start ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-start ?q)))
   )

  (:action transition-15-20
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-15 ?s)
		      (queue-state-att ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-15 ?s))
		(station-state-20 ?s)
		(not (queue-state-att ?q))
		(queue-state-empty ?q)
		(not-queue-state-att ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-20-17
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-20 ?s)
		      (queue-state-empty ?q)
		      (may-push-data ?q))
   :effect (and (not (station-state-20 ?s))
		(station-state-17 ?s)
		(not (queue-state-empty ?q))
		(queue-state-data ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-data ?q)))
   )

  (:action transition-17-20
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-17 ?s)
		      (queue-state-data ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-17 ?s))
		(station-state-20 ?s)
		(not (queue-state-data ?q))
		(queue-state-empty ?q)
		(not-queue-state-data ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-20-23
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-20 ?s)
		      (queue-state-empty ?q)
		      (may-push-stop ?q))
   :effect (and (not (station-state-20 ?s))
		(station-state-23 ?s)
		(not (queue-state-empty ?q))
		(queue-state-stop ?q)
		(not-queue-state-empty ?q)
		(not (not-queue-state-stop ?q)))
   )

  (:action transition-23-24
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-23 ?s)
		      (queue-state-stop ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-23 ?s))
		(station-state-24 ?s)
		(not (queue-state-stop ?q))
		(queue-state-empty ?q)
		(not-queue-state-stop ?q)
		(not (not-queue-state-empty ?q)))
   )

  (:action transition-24-25
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-24 ?s)
		      (queue-state-ctl ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-24 ?s))
		(station-state-25 ?s)
		(not (queue-state-ctl ?q))
		(queue-state-empty ?q)
		(not-queue-state-ctl ?q)
		(not (not-queue-state-empty ?q)))
   )

  ;; special transitons to fix bug in original promela spec:

  ;; if station has priority, it may consume a start message on
  ;; the read queue while remaining in state 15
  (:action transition-15-15-prio
   :parameters (?s - station ?q - queue)
   :precondition (and (has-priority ?s)
		      (station-read-queue ?s ?q)
		      (station-state-15 ?s)
		      (queue-state-start ?q)
		      (may-pop ?q))
   :effect (and (not (queue-state-start ?q))
		(queue-state-empty ?q)
		(not-queue-state-start ?q)
		(not (not-queue-state-empty ?q)))
   )

  ;; if station does not have priority, it may consume a start
  ;; message on the read queue and transit to state 3 (ready to
  ;; signal ready to receive) when in state 15
  (:action transition-15-3-non-prio
   :parameters (?s - station ?q - queue)
   :precondition (and (not-has-priority ?s)
		      (station-read-queue ?s ?q)
		      (station-state-15 ?s)
		      (queue-state-start ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-15 ?s))
		(station-state-3 ?s)
		(not (queue-state-start ?q))
		(queue-state-empty ?q)
		(not-queue-state-start ?q)
		(not (not-queue-state-empty ?q)))
   )

  ;; blocking actions - states with two outgoing transitions

  (:action block-25
   :parameters (?s - station ?qc - queue ?qr - queue)
   :precondition (and (station-ctl-queue ?s ?qc)
		      (station-read-queue ?s ?qr)
		      (station-state-25 ?s)
		      (not-queue-state-empty ?qc)
		      (may-push-ctl ?qc)
		      (not-queue-state-start ?qr)
		      (may-pop ?qr))
   :effect (and (not (station-state-25 ?s))
		(blocked ?s)
		(not (may-pop ?qc))
		(not (may-push-start ?qr)))
   )

  (:action block-8
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-8 ?s)
		      (not-queue-state-data ?q)
		      (not-queue-state-stop ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-8 ?s))
		(blocked ?s)
		(not (may-push-data ?q))
		(not (may-push-stop ?q)))
   )

  (:action block-20
   :parameters (?s - station ?qw - queue)
   :precondition (and (station-write-queue ?s ?qw)
		      (station-state-20 ?s)
		      (not-queue-state-empty ?qw)
		      (may-push-stop ?qw)
		      (may-push-data ?qw))
   :effect (and (not (station-state-20 ?s))
		(blocked ?s)
		(not (may-pop ?qw)))
   )

  ;; note: condition for blocking at state 15 is the same whether
  ;; station has priority or not

  (:action block-15
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-15 ?s)
		      (not-queue-state-att ?q)
		      (not-queue-state-start ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-15 ?s))
		(blocked ?s)
		(not (may-push-att ?q))
		(not (may-push-start ?q)))
   )

  ;; blocking actions - states with one outgoing transition

  (:action block-2
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-2 ?s)
		      (not-queue-state-empty ?q)
		      (may-push-ctl ?q))
   :effect (and (not (station-state-2 ?s))
		(blocked ?s)
		(not (may-pop ?q)))
   )

  (:action block-3
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-3 ?s)
		      (not-queue-state-empty ?q)
		      (may-push-att ?q))
   :effect (and (not (station-state-3 ?s))
		(blocked ?s)
		(not (may-pop ?q)))
   )

  (:action block-5
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-5 ?s)
		      (not-queue-state-empty ?q)
		      (may-push-data ?q))
   :effect (and (not (station-state-5 ?s))
		(blocked ?s)
		(not (may-pop ?q)))
   )

  (:action block-11
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-11 ?s)
		      (not-queue-state-empty ?q)
		      (may-push-stop ?q))
   :effect (and (not (station-state-11 ?s))
		(blocked ?s)
		(not (may-pop ?q)))
   )

  (:action block-12
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-12 ?s)
		      (not-queue-state-ctl ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-12 ?s))
		(blocked ?s)
		(not (may-push-ctl ?q)))
   )

  (:action block-14
   :parameters (?s - station ?q - queue)
   :precondition (and (station-write-queue ?s ?q)
		      (station-state-14 ?s)
		      (not-queue-state-empty ?q)
		      (may-push-start ?q))
   :effect (and (not (station-state-14 ?s))
		(blocked ?s)
		(not (may-pop ?q)))
   )

  (:action block-17
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-17 ?s)
		      (not-queue-state-data ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-17 ?s))
		(blocked ?s)
		(not (may-push-data ?q)))
   )

  (:action block-23
   :parameters (?s - station ?q - queue)
   :precondition (and (station-read-queue ?s ?q)
		      (station-state-23 ?s)
		      (not-queue-state-stop ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-23 ?s))
		(blocked ?s)
		(not (may-push-stop ?q)))
   )

  (:action block-24
   :parameters (?s - station ?q - queue)
   :precondition (and (station-ctl-queue ?s ?q)
		      (station-state-24 ?s)
		      (not-queue-state-ctl ?q)
		      (may-pop ?q))
   :effect (and (not (station-state-24 ?s))
		(blocked ?s)
		(not (may-push-ctl ?q)))
   )

  ;; end domain
  )
