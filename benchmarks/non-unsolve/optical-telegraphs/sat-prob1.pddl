(define (problem opt-cycle-2)
  (:domain optical-telegraph-ae)
    (:objects
   stn-1-dn - station
   stn-1-dn-recv - queue
   stn-1-ctl - queue
   stn-2-dn - station
   stn-2-dn-recv - queue
   stn-2-ctl - queue
   stn-1-up - station
   stn-1-up-recv - queue
   stn-2-up - station
   stn-2-up-recv - queue
   )
  (:init
   (station-ctl-queue   stn-1-dn stn-1-ctl)
   (station-read-queue  stn-1-dn stn-1-dn-recv)
   (station-write-queue stn-1-dn stn-2-up-recv)
   (station-ctl-queue   stn-2-up stn-2-ctl)
   (station-read-queue  stn-2-up stn-2-up-recv)
   (station-write-queue stn-2-up stn-1-dn-recv)
   (station-ctl-queue   stn-2-dn stn-2-ctl)
   (station-read-queue  stn-2-dn stn-2-dn-recv)
   (station-write-queue stn-2-dn stn-1-up-recv)
   (station-ctl-queue   stn-1-up stn-1-ctl)
   (station-read-queue  stn-1-up stn-1-up-recv)
   (station-write-queue stn-1-up stn-2-dn-recv)
   (has-priority stn-1-dn)
   (station-state-25 stn-1-dn)
   (queue-state-empty stn-1-dn-recv)
   (not-queue-state-ctl stn-1-dn-recv)
   (not-queue-state-att stn-1-dn-recv)
   (not-queue-state-data stn-1-dn-recv)
   (not-queue-state-start stn-1-dn-recv)
   (not-queue-state-stop stn-1-dn-recv)
   (may-push-ctl      stn-1-dn-recv)
   (may-push-att      stn-1-dn-recv)
   (may-push-data     stn-1-dn-recv)
   (may-push-start    stn-1-dn-recv)
   (may-push-stop     stn-1-dn-recv)
   (may-pop           stn-1-dn-recv)
   (has-priority stn-2-dn)
   (station-state-25 stn-2-dn)
   (queue-state-empty stn-2-dn-recv)
   (not-queue-state-ctl stn-2-dn-recv)
   (not-queue-state-att stn-2-dn-recv)
   (not-queue-state-data stn-2-dn-recv)
   (not-queue-state-start stn-2-dn-recv)
   (not-queue-state-stop stn-2-dn-recv)
   (may-push-ctl      stn-2-dn-recv)
   (may-push-att      stn-2-dn-recv)
   (may-push-data     stn-2-dn-recv)
   (may-push-start    stn-2-dn-recv)
   (may-push-stop     stn-2-dn-recv)
   (may-pop           stn-2-dn-recv)
   (not-has-priority stn-1-up)
   (station-state-25 stn-1-up)
   (queue-state-empty stn-1-up-recv)
   (not-queue-state-ctl stn-1-up-recv)
   (not-queue-state-att stn-1-up-recv)
   (not-queue-state-data stn-1-up-recv)
   (not-queue-state-start stn-1-up-recv)
   (not-queue-state-stop stn-1-up-recv)
   (may-push-ctl      stn-1-up-recv)
   (may-push-att      stn-1-up-recv)
   (may-push-data     stn-1-up-recv)
   (may-push-start    stn-1-up-recv)
   (may-push-stop     stn-1-up-recv)
   (may-pop           stn-1-up-recv)
   (not-has-priority stn-2-up)
   (station-state-25 stn-2-up)
   (queue-state-empty stn-2-up-recv)
   (not-queue-state-ctl stn-2-up-recv)
   (not-queue-state-att stn-2-up-recv)
   (not-queue-state-data stn-2-up-recv)
   (not-queue-state-start stn-2-up-recv)
   (not-queue-state-stop stn-2-up-recv)
   (may-push-ctl      stn-2-up-recv)
   (may-push-att      stn-2-up-recv)
   (may-push-data     stn-2-up-recv)
   (may-push-start    stn-2-up-recv)
   (may-push-stop     stn-2-up-recv)
   (may-pop           stn-2-up-recv)
   (queue-state-empty stn-1-ctl)
   (not-queue-state-ctl stn-1-ctl)
   (not-queue-state-att stn-1-ctl)
   (not-queue-state-data stn-1-ctl)
   (not-queue-state-start stn-1-ctl)
   (not-queue-state-stop stn-1-ctl)
   (may-push-ctl      stn-1-ctl)
   (may-push-att      stn-1-ctl)
   (may-push-data     stn-1-ctl)
   (may-push-start    stn-1-ctl)
   (may-push-stop     stn-1-ctl)
   (may-pop           stn-1-ctl)
   (queue-state-empty stn-2-ctl)
   (not-queue-state-ctl stn-2-ctl)
   (not-queue-state-att stn-2-ctl)
   (not-queue-state-data stn-2-ctl)
   (not-queue-state-start stn-2-ctl)
   (not-queue-state-stop stn-2-ctl)
   (may-push-ctl      stn-2-ctl)
   (may-push-att      stn-2-ctl)
   (may-push-data     stn-2-ctl)
   (may-push-start    stn-2-ctl)
   (may-push-stop     stn-2-ctl)
   (may-pop           stn-2-ctl)
   )
  (:goal (and
 (blocked stn-1-dn) (blocked stn-2-dn) (blocked stn-1-up) (blocked stn-2-up)))
 )
