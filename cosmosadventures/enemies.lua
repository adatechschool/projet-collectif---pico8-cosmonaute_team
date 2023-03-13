function create_enemies(amount)
    for i=1, amount do
        enemy={
        x = flr(rnd(18)) + 30, 
        y = flr(rnd(20)),
        sprite = 119,  
    }
        add (enemies,enemy)
        enemies_anim_time = 0
        enemies_anim_wait = 0.2
    
    end

end 


function update_enemies(tab_enemies)
    if (time() - enemies_anim_time > enemies_anim_wait) then    
        for e in all (tab_enemies) do
            e.sprite +=1
            enemies_anim_time=time()
                
                if (e.sprite > 120) then 
                    e.sprite = 119
                end
                
        end   
    end

end    

function collision_player_enemy(p, tab_enemies)
    
    for e in all (tab_enemies) do
        if (p.x == e.x and p.y == e.y) then
        sfx(7)
        return true
        end
    end
    
    return false
    
end


function draw_enemies()
    for e in all (enemies) do
    spr(e.sprite,e.x*8,e.y*8,1,1)
    
    end
end

