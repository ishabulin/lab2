(define (problem pb1)
    (:domain Zhora)
    (:objects
    Zhora - robot
    house street gym  - position
    door1 door2  - door
    trainer - trainer
    l1 l2 l3 l4 l5  - location
    )

    (:init
    (in l1 house)
    (in l2 house)
    (in l2 street)
    (in l3 street)
    (in l4 street)
    (in l4 gym)
    (in l5 gym)
    (at door1 l2)
    (at door2 l4)
    (at Zhora l1)
    (at trainer l5)
    (weak)
    (havemoney)
    )
(:goal  (and(at Zhora l1) (not(weak)) (not(havemoney)))
)


)
