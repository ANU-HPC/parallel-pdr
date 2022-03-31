(define (problem opt-cycle-10)
  (:domain optical-telegraph-ae)
    (:objects
   stn-1-dn - station
   stn-1-dn-recv - queue
   stn-1-ctl - queue
   stn-2-dn - station
   stn-2-dn-recv - queue
   stn-2-ctl - queue
   stn-3-dn - station
   stn-3-dn-recv - queue
   stn-3-ctl - queue
   stn-4-dn - station
   stn-4-dn-recv - queue
   stn-4-ctl - queue
   stn-5-dn - station
   stn-5-dn-recv - queue
   stn-5-ctl - queue
   stn-6-dn - station
   stn-6-dn-recv - queue
   stn-6-ctl - queue
   stn-7-dn - station
   stn-7-dn-recv - queue
   stn-7-ctl - queue
   stn-8-dn - station
   stn-8-dn-recv - queue
   stn-8-ctl - queue
   stn-9-dn - station
   stn-9-dn-recv - queue
   stn-9-ctl - queue
   stn-10-dn - station
   stn-10-dn-recv - queue
   stn-10-ctl - queue
   stn-1-up - station
   stn-1-up-recv - queue
   stn-2-up - station
   stn-2-up-recv - queue
   stn-3-up - station
   stn-3-up-recv - queue
   stn-4-up - station
   stn-4-up-recv - queue
   stn-5-up - station
   stn-5-up-recv - queue
   stn-6-up - station
   stn-6-up-recv - queue
   stn-7-up - station
   stn-7-up-recv - queue
   stn-8-up - station
   stn-8-up-recv - queue
   stn-9-up - station
   stn-9-up-recv - queue
   stn-10-up - station
   stn-10-up-recv - queue
   )
  (:init
   (station-ctl-queue   stn-1-dn stn-1-ctl)
   (station-read-queue  stn-1-dn stn-1-dn-recv)
   (station-write-queue stn-1-dn stn-2-up-recv)
   (station-ctl-queue   stn-2-dn stn-2-ctl)
   (station-read-queue  stn-2-dn stn-2-dn-recv)
   (station-write-queue stn-2-dn stn-3-up-recv)
   (station-ctl-queue   stn-3-dn stn-3-ctl)
   (station-read-queue  stn-3-dn stn-3-dn-recv)
   (station-write-queue stn-3-dn stn-4-up-recv)
   (station-ctl-queue   stn-4-dn stn-4-ctl)
   (station-read-queue  stn-4-dn stn-4-dn-recv)
   (station-write-queue stn-4-dn stn-5-up-recv)
   (station-ctl-queue   stn-5-dn stn-5-ctl)
   (station-read-queue  stn-5-dn stn-5-dn-recv)
   (station-write-queue stn-5-dn stn-6-up-recv)
   (station-ctl-queue   stn-6-dn stn-6-ctl)
   (station-read-queue  stn-6-dn stn-6-dn-recv)
   (station-write-queue stn-6-dn stn-7-up-recv)
   (station-ctl-queue   stn-7-dn stn-7-ctl)
   (station-read-queue  stn-7-dn stn-7-dn-recv)
   (station-write-queue stn-7-dn stn-8-up-recv)
   (station-ctl-queue   stn-8-dn stn-8-ctl)
   (station-read-queue  stn-8-dn stn-8-dn-recv)
   (station-write-queue stn-8-dn stn-9-up-recv)
   (station-ctl-queue   stn-9-dn stn-9-ctl)
   (station-read-queue  stn-9-dn stn-9-dn-recv)
   (station-write-queue stn-9-dn stn-10-up-recv)
   (station-ctl-queue   stn-2-up stn-2-ctl)
   (station-read-queue  stn-2-up stn-2-up-recv)
   (station-write-queue stn-2-up stn-1-dn-recv)
   (station-ctl-queue   stn-3-up stn-3-ctl)
   (station-read-queue  stn-3-up stn-3-up-recv)
   (station-write-queue stn-3-up stn-2-dn-recv)
   (station-ctl-queue   stn-4-up stn-4-ctl)
   (station-read-queue  stn-4-up stn-4-up-recv)
   (station-write-queue stn-4-up stn-3-dn-recv)
   (station-ctl-queue   stn-5-up stn-5-ctl)
   (station-read-queue  stn-5-up stn-5-up-recv)
   (station-write-queue stn-5-up stn-4-dn-recv)
   (station-ctl-queue   stn-6-up stn-6-ctl)
   (station-read-queue  stn-6-up stn-6-up-recv)
   (station-write-queue stn-6-up stn-5-dn-recv)
   (station-ctl-queue   stn-7-up stn-7-ctl)
   (station-read-queue  stn-7-up stn-7-up-recv)
   (station-write-queue stn-7-up stn-6-dn-recv)
   (station-ctl-queue   stn-8-up stn-8-ctl)
   (station-read-queue  stn-8-up stn-8-up-recv)
   (station-write-queue stn-8-up stn-7-dn-recv)
   (station-ctl-queue   stn-9-up stn-9-ctl)
   (station-read-queue  stn-9-up stn-9-up-recv)
   (station-write-queue stn-9-up stn-8-dn-recv)
   (station-ctl-queue   stn-10-up stn-10-ctl)
   (station-read-queue  stn-10-up stn-10-up-recv)
   (station-write-queue stn-10-up stn-9-dn-recv)
   (station-ctl-queue   stn-10-dn stn-10-ctl)
   (station-read-queue  stn-10-dn stn-10-dn-recv)
   (station-write-queue stn-10-dn stn-1-up-recv)
   (station-ctl-queue   stn-1-up stn-1-ctl)
   (station-read-queue  stn-1-up stn-1-up-recv)
   (station-write-queue stn-1-up stn-10-dn-recv)
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
   (has-priority stn-3-dn)
   (station-state-25 stn-3-dn)
   (queue-state-empty stn-3-dn-recv)
   (not-queue-state-ctl stn-3-dn-recv)
   (not-queue-state-att stn-3-dn-recv)
   (not-queue-state-data stn-3-dn-recv)
   (not-queue-state-start stn-3-dn-recv)
   (not-queue-state-stop stn-3-dn-recv)
   (may-push-ctl      stn-3-dn-recv)
   (may-push-att      stn-3-dn-recv)
   (may-push-data     stn-3-dn-recv)
   (may-push-start    stn-3-dn-recv)
   (may-push-stop     stn-3-dn-recv)
   (may-pop           stn-3-dn-recv)
   (has-priority stn-4-dn)
   (station-state-25 stn-4-dn)
   (queue-state-empty stn-4-dn-recv)
   (not-queue-state-ctl stn-4-dn-recv)
   (not-queue-state-att stn-4-dn-recv)
   (not-queue-state-data stn-4-dn-recv)
   (not-queue-state-start stn-4-dn-recv)
   (not-queue-state-stop stn-4-dn-recv)
   (may-push-ctl      stn-4-dn-recv)
   (may-push-att      stn-4-dn-recv)
   (may-push-data     stn-4-dn-recv)
   (may-push-start    stn-4-dn-recv)
   (may-push-stop     stn-4-dn-recv)
   (may-pop           stn-4-dn-recv)
   (has-priority stn-5-dn)
   (station-state-25 stn-5-dn)
   (queue-state-empty stn-5-dn-recv)
   (not-queue-state-ctl stn-5-dn-recv)
   (not-queue-state-att stn-5-dn-recv)
   (not-queue-state-data stn-5-dn-recv)
   (not-queue-state-start stn-5-dn-recv)
   (not-queue-state-stop stn-5-dn-recv)
   (may-push-ctl      stn-5-dn-recv)
   (may-push-att      stn-5-dn-recv)
   (may-push-data     stn-5-dn-recv)
   (may-push-start    stn-5-dn-recv)
   (may-push-stop     stn-5-dn-recv)
   (may-pop           stn-5-dn-recv)
   (has-priority stn-6-dn)
   (station-state-25 stn-6-dn)
   (queue-state-empty stn-6-dn-recv)
   (not-queue-state-ctl stn-6-dn-recv)
   (not-queue-state-att stn-6-dn-recv)
   (not-queue-state-data stn-6-dn-recv)
   (not-queue-state-start stn-6-dn-recv)
   (not-queue-state-stop stn-6-dn-recv)
   (may-push-ctl      stn-6-dn-recv)
   (may-push-att      stn-6-dn-recv)
   (may-push-data     stn-6-dn-recv)
   (may-push-start    stn-6-dn-recv)
   (may-push-stop     stn-6-dn-recv)
   (may-pop           stn-6-dn-recv)
   (has-priority stn-7-dn)
   (station-state-25 stn-7-dn)
   (queue-state-empty stn-7-dn-recv)
   (not-queue-state-ctl stn-7-dn-recv)
   (not-queue-state-att stn-7-dn-recv)
   (not-queue-state-data stn-7-dn-recv)
   (not-queue-state-start stn-7-dn-recv)
   (not-queue-state-stop stn-7-dn-recv)
   (may-push-ctl      stn-7-dn-recv)
   (may-push-att      stn-7-dn-recv)
   (may-push-data     stn-7-dn-recv)
   (may-push-start    stn-7-dn-recv)
   (may-push-stop     stn-7-dn-recv)
   (may-pop           stn-7-dn-recv)
   (has-priority stn-8-dn)
   (station-state-25 stn-8-dn)
   (queue-state-empty stn-8-dn-recv)
   (not-queue-state-ctl stn-8-dn-recv)
   (not-queue-state-att stn-8-dn-recv)
   (not-queue-state-data stn-8-dn-recv)
   (not-queue-state-start stn-8-dn-recv)
   (not-queue-state-stop stn-8-dn-recv)
   (may-push-ctl      stn-8-dn-recv)
   (may-push-att      stn-8-dn-recv)
   (may-push-data     stn-8-dn-recv)
   (may-push-start    stn-8-dn-recv)
   (may-push-stop     stn-8-dn-recv)
   (may-pop           stn-8-dn-recv)
   (has-priority stn-9-dn)
   (station-state-25 stn-9-dn)
   (queue-state-empty stn-9-dn-recv)
   (not-queue-state-ctl stn-9-dn-recv)
   (not-queue-state-att stn-9-dn-recv)
   (not-queue-state-data stn-9-dn-recv)
   (not-queue-state-start stn-9-dn-recv)
   (not-queue-state-stop stn-9-dn-recv)
   (may-push-ctl      stn-9-dn-recv)
   (may-push-att      stn-9-dn-recv)
   (may-push-data     stn-9-dn-recv)
   (may-push-start    stn-9-dn-recv)
   (may-push-stop     stn-9-dn-recv)
   (may-pop           stn-9-dn-recv)
   (has-priority stn-10-dn)
   (station-state-25 stn-10-dn)
   (queue-state-empty stn-10-dn-recv)
   (not-queue-state-ctl stn-10-dn-recv)
   (not-queue-state-att stn-10-dn-recv)
   (not-queue-state-data stn-10-dn-recv)
   (not-queue-state-start stn-10-dn-recv)
   (not-queue-state-stop stn-10-dn-recv)
   (may-push-ctl      stn-10-dn-recv)
   (may-push-att      stn-10-dn-recv)
   (may-push-data     stn-10-dn-recv)
   (may-push-start    stn-10-dn-recv)
   (may-push-stop     stn-10-dn-recv)
   (may-pop           stn-10-dn-recv)
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
   (not-has-priority stn-3-up)
   (station-state-25 stn-3-up)
   (queue-state-empty stn-3-up-recv)
   (not-queue-state-ctl stn-3-up-recv)
   (not-queue-state-att stn-3-up-recv)
   (not-queue-state-data stn-3-up-recv)
   (not-queue-state-start stn-3-up-recv)
   (not-queue-state-stop stn-3-up-recv)
   (may-push-ctl      stn-3-up-recv)
   (may-push-att      stn-3-up-recv)
   (may-push-data     stn-3-up-recv)
   (may-push-start    stn-3-up-recv)
   (may-push-stop     stn-3-up-recv)
   (may-pop           stn-3-up-recv)
   (not-has-priority stn-4-up)
   (station-state-25 stn-4-up)
   (queue-state-empty stn-4-up-recv)
   (not-queue-state-ctl stn-4-up-recv)
   (not-queue-state-att stn-4-up-recv)
   (not-queue-state-data stn-4-up-recv)
   (not-queue-state-start stn-4-up-recv)
   (not-queue-state-stop stn-4-up-recv)
   (may-push-ctl      stn-4-up-recv)
   (may-push-att      stn-4-up-recv)
   (may-push-data     stn-4-up-recv)
   (may-push-start    stn-4-up-recv)
   (may-push-stop     stn-4-up-recv)
   (may-pop           stn-4-up-recv)
   (not-has-priority stn-5-up)
   (station-state-25 stn-5-up)
   (queue-state-empty stn-5-up-recv)
   (not-queue-state-ctl stn-5-up-recv)
   (not-queue-state-att stn-5-up-recv)
   (not-queue-state-data stn-5-up-recv)
   (not-queue-state-start stn-5-up-recv)
   (not-queue-state-stop stn-5-up-recv)
   (may-push-ctl      stn-5-up-recv)
   (may-push-att      stn-5-up-recv)
   (may-push-data     stn-5-up-recv)
   (may-push-start    stn-5-up-recv)
   (may-push-stop     stn-5-up-recv)
   (may-pop           stn-5-up-recv)
   (not-has-priority stn-6-up)
   (station-state-25 stn-6-up)
   (queue-state-empty stn-6-up-recv)
   (not-queue-state-ctl stn-6-up-recv)
   (not-queue-state-att stn-6-up-recv)
   (not-queue-state-data stn-6-up-recv)
   (not-queue-state-start stn-6-up-recv)
   (not-queue-state-stop stn-6-up-recv)
   (may-push-ctl      stn-6-up-recv)
   (may-push-att      stn-6-up-recv)
   (may-push-data     stn-6-up-recv)
   (may-push-start    stn-6-up-recv)
   (may-push-stop     stn-6-up-recv)
   (may-pop           stn-6-up-recv)
   (not-has-priority stn-7-up)
   (station-state-25 stn-7-up)
   (queue-state-empty stn-7-up-recv)
   (not-queue-state-ctl stn-7-up-recv)
   (not-queue-state-att stn-7-up-recv)
   (not-queue-state-data stn-7-up-recv)
   (not-queue-state-start stn-7-up-recv)
   (not-queue-state-stop stn-7-up-recv)
   (may-push-ctl      stn-7-up-recv)
   (may-push-att      stn-7-up-recv)
   (may-push-data     stn-7-up-recv)
   (may-push-start    stn-7-up-recv)
   (may-push-stop     stn-7-up-recv)
   (may-pop           stn-7-up-recv)
   (not-has-priority stn-8-up)
   (station-state-25 stn-8-up)
   (queue-state-empty stn-8-up-recv)
   (not-queue-state-ctl stn-8-up-recv)
   (not-queue-state-att stn-8-up-recv)
   (not-queue-state-data stn-8-up-recv)
   (not-queue-state-start stn-8-up-recv)
   (not-queue-state-stop stn-8-up-recv)
   (may-push-ctl      stn-8-up-recv)
   (may-push-att      stn-8-up-recv)
   (may-push-data     stn-8-up-recv)
   (may-push-start    stn-8-up-recv)
   (may-push-stop     stn-8-up-recv)
   (may-pop           stn-8-up-recv)
   (not-has-priority stn-9-up)
   (station-state-25 stn-9-up)
   (queue-state-empty stn-9-up-recv)
   (not-queue-state-ctl stn-9-up-recv)
   (not-queue-state-att stn-9-up-recv)
   (not-queue-state-data stn-9-up-recv)
   (not-queue-state-start stn-9-up-recv)
   (not-queue-state-stop stn-9-up-recv)
   (may-push-ctl      stn-9-up-recv)
   (may-push-att      stn-9-up-recv)
   (may-push-data     stn-9-up-recv)
   (may-push-start    stn-9-up-recv)
   (may-push-stop     stn-9-up-recv)
   (may-pop           stn-9-up-recv)
   (not-has-priority stn-10-up)
   (station-state-25 stn-10-up)
   (queue-state-empty stn-10-up-recv)
   (not-queue-state-ctl stn-10-up-recv)
   (not-queue-state-att stn-10-up-recv)
   (not-queue-state-data stn-10-up-recv)
   (not-queue-state-start stn-10-up-recv)
   (not-queue-state-stop stn-10-up-recv)
   (may-push-ctl      stn-10-up-recv)
   (may-push-att      stn-10-up-recv)
   (may-push-data     stn-10-up-recv)
   (may-push-start    stn-10-up-recv)
   (may-push-stop     stn-10-up-recv)
   (may-pop           stn-10-up-recv)
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
   (queue-state-empty stn-3-ctl)
   (not-queue-state-ctl stn-3-ctl)
   (not-queue-state-att stn-3-ctl)
   (not-queue-state-data stn-3-ctl)
   (not-queue-state-start stn-3-ctl)
   (not-queue-state-stop stn-3-ctl)
   (may-push-ctl      stn-3-ctl)
   (may-push-att      stn-3-ctl)
   (may-push-data     stn-3-ctl)
   (may-push-start    stn-3-ctl)
   (may-push-stop     stn-3-ctl)
   (may-pop           stn-3-ctl)
   (queue-state-empty stn-4-ctl)
   (not-queue-state-ctl stn-4-ctl)
   (not-queue-state-att stn-4-ctl)
   (not-queue-state-data stn-4-ctl)
   (not-queue-state-start stn-4-ctl)
   (not-queue-state-stop stn-4-ctl)
   (may-push-ctl      stn-4-ctl)
   (may-push-att      stn-4-ctl)
   (may-push-data     stn-4-ctl)
   (may-push-start    stn-4-ctl)
   (may-push-stop     stn-4-ctl)
   (may-pop           stn-4-ctl)
   (queue-state-empty stn-5-ctl)
   (not-queue-state-ctl stn-5-ctl)
   (not-queue-state-att stn-5-ctl)
   (not-queue-state-data stn-5-ctl)
   (not-queue-state-start stn-5-ctl)
   (not-queue-state-stop stn-5-ctl)
   (may-push-ctl      stn-5-ctl)
   (may-push-att      stn-5-ctl)
   (may-push-data     stn-5-ctl)
   (may-push-start    stn-5-ctl)
   (may-push-stop     stn-5-ctl)
   (may-pop           stn-5-ctl)
   (queue-state-empty stn-6-ctl)
   (not-queue-state-ctl stn-6-ctl)
   (not-queue-state-att stn-6-ctl)
   (not-queue-state-data stn-6-ctl)
   (not-queue-state-start stn-6-ctl)
   (not-queue-state-stop stn-6-ctl)
   (may-push-ctl      stn-6-ctl)
   (may-push-att      stn-6-ctl)
   (may-push-data     stn-6-ctl)
   (may-push-start    stn-6-ctl)
   (may-push-stop     stn-6-ctl)
   (may-pop           stn-6-ctl)
   (queue-state-empty stn-7-ctl)
   (not-queue-state-ctl stn-7-ctl)
   (not-queue-state-att stn-7-ctl)
   (not-queue-state-data stn-7-ctl)
   (not-queue-state-start stn-7-ctl)
   (not-queue-state-stop stn-7-ctl)
   (may-push-ctl      stn-7-ctl)
   (may-push-att      stn-7-ctl)
   (may-push-data     stn-7-ctl)
   (may-push-start    stn-7-ctl)
   (may-push-stop     stn-7-ctl)
   (may-pop           stn-7-ctl)
   (queue-state-empty stn-8-ctl)
   (not-queue-state-ctl stn-8-ctl)
   (not-queue-state-att stn-8-ctl)
   (not-queue-state-data stn-8-ctl)
   (not-queue-state-start stn-8-ctl)
   (not-queue-state-stop stn-8-ctl)
   (may-push-ctl      stn-8-ctl)
   (may-push-att      stn-8-ctl)
   (may-push-data     stn-8-ctl)
   (may-push-start    stn-8-ctl)
   (may-push-stop     stn-8-ctl)
   (may-pop           stn-8-ctl)
   (queue-state-empty stn-9-ctl)
   (not-queue-state-ctl stn-9-ctl)
   (not-queue-state-att stn-9-ctl)
   (not-queue-state-data stn-9-ctl)
   (not-queue-state-start stn-9-ctl)
   (not-queue-state-stop stn-9-ctl)
   (may-push-ctl      stn-9-ctl)
   (may-push-att      stn-9-ctl)
   (may-push-data     stn-9-ctl)
   (may-push-start    stn-9-ctl)
   (may-push-stop     stn-9-ctl)
   (may-pop           stn-9-ctl)
   (queue-state-empty stn-10-ctl)
   (not-queue-state-ctl stn-10-ctl)
   (not-queue-state-att stn-10-ctl)
   (not-queue-state-data stn-10-ctl)
   (not-queue-state-start stn-10-ctl)
   (not-queue-state-stop stn-10-ctl)
   (may-push-ctl      stn-10-ctl)
   (may-push-att      stn-10-ctl)
   (may-push-data     stn-10-ctl)
   (may-push-start    stn-10-ctl)
   (may-push-stop     stn-10-ctl)
   (may-pop           stn-10-ctl)
   )
  (:goal (and
 (blocked stn-1-dn) (blocked stn-2-dn) (blocked stn-3-dn) (blocked stn-4-dn) (blocked stn-5-dn) (blocked stn-6-dn) (blocked stn-7-dn) (blocked stn-8-dn) (blocked stn-9-dn) (blocked stn-10-dn) (blocked stn-1-up) (blocked stn-2-up) (blocked stn-3-up) (blocked stn-4-up) (blocked stn-5-up) (blocked stn-6-up) (blocked stn-7-up) (blocked stn-8-up) (blocked stn-9-up) (blocked stn-10-up)))
 )
