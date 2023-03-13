-----animation-Toxic-Smoke-----

function create_toxic_smoke(amount)
    for i=1, amount do 
    toxic_smoke={
        sprite = 82,
    x = flr(rnd(18)) + 35, 
    y = flr(rnd(20)),
    }
    add(toxic, toxic_smoke)
    toxic_smoke_anim_time = 0
    toxic_smoke_anim_wait = 0.1
    end
end  


function update_toxic_smoke(tab_toxic)
    if time() - toxic_smoke_anim_time > toxic_smoke_anim_wait then
        for e in all (tab_toxic) do
            e.sprite +=2
            toxic_smoke_anim_time = time()
                if e.sprite > 88 then 
                    e.sprite = 82
                end  
        end
    end 
end
        
function collision_player_toxic(p, tab_toxic)
    for e in all (tab_toxic) do
        if (p.x == e.x and p.y == e.y) then
        return true
        end
    end
    return false
end


function draw_toxic_smoke()
    for e in all (toxic) do
        spr(e.sprite,e.x*8,e.y*8,2,2)
    end
end
    

