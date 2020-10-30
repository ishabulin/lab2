
(define (domain Zhora) 

  
  (:requirements
    :strips                 
    :negative-preconditions 
    :equality              
    :typing               
  )
  
  (:types
  
  location
  position
  robot
  car
  trainer
  door
  animals
  )

  (:predicates
    (at ?x ?loc)      
    (in ?loc - location ?position - position)
    (weak)
    (havemoney)
    (havekey)
    (insidecar)
    (finishthetrip)
    (closedcar)
    (sad)
    
    
  )

 (:action go
 :parameters(?Zhora - robot ?from - location ?to - location ?position - position)
 :precondition(and (at ?Zhora ?from) (not(= ?from ?to)) (in ?from ?position)(in ?to ?position))
 :effect (and (not(at ?Zhora ?from)) (at ?Zhora ?to))
 )
 
   (:action workout
 :parameters(?Zhora - robot ?loc - location ?trainer - trainer ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?trainer ?loc) (weak)(havemoney) (in ?loc ?position))
 :effect (and (at ?Zhora ?loc) (not(weak)) (not(havemoney)))
 )
 
   (:action opencar
 :parameters(?Zhora - robot ?loc - location  ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (havekey)(closedcar) (in ?loc ?position))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(havekey)(not(closedcar)) )
 )
 
 (:action closecar
 :parameters(?Zhora - robot ?loc - location  ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (havekey)(not(closedcar)) (finishthetrip)(not(insidecar))(in ?loc ?position))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(havekey)(closedcar)(finishthetrip) )
 )
 
 (:action getoncar
 :parameters(?Zhora - robot ?loc - location ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (in ?loc ?position)(not(closedcar))(havekey)(not(insidecar)))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc) (insidecar)(havekey)(not(closed)))
 )
 
 (:action getoffcar
 :parameters(?Zhora - robot ?loc - location ?car - car ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?car ?loc) (in ?loc ?position)(finishthetrip)(havekey)(insidecar))
 :effect (and (at ?Zhora ?loc)(at ?car ?loc)(not (insidecar))(not(closedcar))(havekey))
 )
 
 
 (:action drive
    :parameters (?Zhora - robot ?car - car ?from - location ?to - location ?position - position)
    :precondition (and (insidecar) (not(closedcar))(at ?Zhora ?from) (at ?car ?from) (not(= ?from ?to))
            (in ?from ?position) (in ?to ?position) (havekey) (not(finishthetrip)))
    :effect (and (not (at ?Zhora ?from)) (not (at ?car ?from))
            (at ?Zhora ?to) (at ?car ?to) (finishthetrip)(not(closedcar))(insidecar)(havekey))
    )

(:action havefunny
 :parameters(?Zhora - robot ?animals - animals ?loc - location ?position - position)
 :precondition(and (at ?Zhora ?loc) (at ?animals ?loc) (sad)(in ?loc ?position))
 :effect (and (at ?Zhora ?loc) (at ?animals ?loc) (not(sad)) )
 )
 
)




































