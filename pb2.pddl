(define (problem pb2)
    (:domain Zhora)
    (:objects
    Zhora - robot
    house street   - position
    door1 - door
    car - car
    l1 l2 l3 l4 l5  - location
    )

    (:init
    (in l1 house)
    (in l2 house)
    (in l2 street)
    (in l4 street)
    (in l5 street)
    (in l3 street)
    (at door1 l2)
    (at Zhora l1)
    (at car l4)
    (havekey)
    (closedcar)
    )
(:goal  (and(at Zhora l3)(finishthetrip)(closedcar) (havekey) )
)


)
