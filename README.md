(define (domain Zhora) 

  
  (:requirements
    :strips                 
    :negative-preconditions 
    :equality              
    :typing               
  )
  
  (:types
  
  Location – точка в пространстве
  Position – место, локация с точками
  Robot- робот
  car-машина
  trainer-тренажер
  door- дверь
  animals- животные
  )

  (:predicates
    (at ?x ?loc)      - что-то находится в этой точке
    (in ?loc - location ?position - position) – точка находится в этой локации
    (weak) – робот слабый (не занимался на тренажере)
    (havemoney) – у робота есть деньги
    (havekey) – у робота есть ключ от машины
    (insidecar) – робот сидит в машине
    (finishthetrip) – робот приехал в конечную точку
    (closedcar) – машина закрыта (на сигнализации)
    (sad) – робот грустный
    
    
  )

 (:action go – робот просто перемещается из одной точки в другую
 :parameters(?Zhora - robot ?from - location ?to - location ?position - position)
 :precondition(and (at ?Zhora ?from) (not(= ?from ?to)) (in ?from ?position)(in ?to ?position))
 :effect (and (not(at ?Zhora ?from)) (at ?Zhora ?to))
 )
 
   (:action workout – робот занимается на тренажере
 :parameters(?Zhora - robot ?loc - location ?trainer - trainer ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?trainer ?loc) (weak)(havemoney) (in ?loc ?position))
 :effect (and (at ?Zhora ?loc) (not(weak)) (not(havemoney)))
 )
 
   (:action opencar – робот открывает машину
 :parameters(?Zhora - robot ?loc - location  ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (havekey)(closedcar) (in ?loc ?position))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(havekey)(not(closedcar)) )
 )
 
 (:action closecar – робот закрывает машину
 :parameters(?Zhora - robot ?loc - location  ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (havekey)(not(closedcar)) (finishthetrip)(not(insidecar))(in ?loc ?position))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(havekey)(closedcar)(finishthetrip) )
 )
 
 (:action getoncar – садится в машину
 :parameters(?Zhora - robot ?loc - location ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (in ?loc ?position)(not(closedcar))(havekey)(not(insidecar)))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc) (insidecar)(havekey)(not(closed)))
 )
 
 (:action getoffcar – выходит из машины
 :parameters(?Zhora - robot ?loc - location ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (in ?loc ?position)(finishthetrip)(havekey)(insidecar))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(not (insidecar))(not(closedcar))(havekey))
 )
 
 
 (:action drive – едет на машине из одной точки в другую
    :parameters (?Zhora - robot ?car - car ?from - location ?to - location ?position - position)
    :precondition (and (insidecar) (not(closedcar))(at ?Zhora ?from) (at ?car ?from) (not(= ?from ?to))
            (in ?from ?position) (in ?to ?position) (havekey) (not(finishthetrip)))
    :effect (and (not (at ?Zhora ?from)) (not (at ?car ?from))
            (at ?Zhora ?to) (at ?car ?to) (finishthetrip)(not(closedcar))(insidecar)(havekey))
    )

(:action havefunny – веселится, если ему грустно – идет в зоопарк
 :parameters(?Zhora - robot ?animals - animals ?loc - location ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?animals ?loc) (sad)(in ?loc ?position))
 :effect (and (at ?Zhora ?loc) (at ?animals ?loc) (not(sad)) )
 )
 
)



PB1 

Робот слабый, поэтому идет в спортзал, там занимается и возвращается домой сильным


PB2

Робот идет из дома  к машине, открывает ее и садится в нее, едет в нужное место, после чего выходит из машины и закрывает ее.


PB3 

 Роботу грустно, поэтому он идет в зоопарк, что бы поднять себе настроение
