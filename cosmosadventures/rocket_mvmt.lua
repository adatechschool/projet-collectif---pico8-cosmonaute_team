-----animation-Rocket-Fire-----

function create_rocket_fire()
    rocket_fire={sprite = 17,
                 x = 2,
                 y = 7}
    rocket_fire_anim_time = 0
    rocket_fire_anim_wait = 0.08
end 
    
function update_rocket_fire()
    if (time() - rocket_fire_anim_time > rocket_fire_anim_wait) then
        rocket_fire.sprite +=2
        rocket_fire_anim_time=time()
        
        if (rocket_fire.sprite > 26) then 
            rocket_fire.sprite=17
        end
    end      
end
    
function draw_rocket_fire()
    spr(rocket_fire.sprite,rocket_fire.x*8,rocket_fire.y*8,2,2)
end


