(define (problem pb3)
    (:domain Zhora)
    (:objects
    Zhora - robot
    house street zoo  - position
    door1 door2- door
    l1 l2 l3 l4 l5  - location
    animals - animals
    )

    (:init
    (in l1 house)
    (in l2 house)
    (in l2 street)
    (in l3 street)
    (in l4 street)
    (in l4 zoo)
    (in l5 zoo)
    (at door1 l2)
    (at door2 l4)
    (at Zhora l1) 
    (at animals l5)
    (sad)
    )
(:goal  (and(at Zhora l5)(not(sad)) )
)


)
