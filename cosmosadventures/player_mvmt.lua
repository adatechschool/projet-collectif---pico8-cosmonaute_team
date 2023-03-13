-----Player-----

function create_player()
    player={ 
        x = 0, --holds the horizontal position of the player
        y = 8, --holds the vertical position of the player
        ox = 0, 
        oy = 0,
        startox=0, 
        startoy=0,
        sprite = 3, --"sprite" and holds the sprite number.
        anim_t=0,
        gems=0,
        touched_gems=0
    } 
end

function player_movement()
    newx=player.x
    newy=player.y

    if (player.anim_t == 0) then
        newox,newoy= 0,0

        if (btn(➡️)) then
            newx += 1
            newox = -8
            player.flip = false

        elseif (btn(⬅️)) then
            if (player.x != 18) then
                newx -= 1
                newox = 8
                player.flip = true
            end

        elseif (btn(⬆️)) then
            if player.x > 15 then 
                newy -= 1
                newoy = 8
            end

        elseif (btn(⬇️)) then
            if player.x > 17 then
            newy += 1
            newoy = -8
            end
        end
    end
        
    interact(newx,newy)
    
    if not check_flag(0, newx, newy) and (player.x != newx or player.y != newy) and (player.gems != 6) and not collision_player_enemy(player, enemies) and (player.touched_gems != 12) then
        --on avance--
        -- vérifie qu'il y a bien déplacement sans obstacle player.x inégal à newx
        -- verifie que la case newx,newy n'est pas un flag, if not flag then ...
        
        player.x=mid(0, newx, 127)
        player.y=mid(0, newy, 63)
        player.startox=newox
        player.startoy=newoy
        player.anim_t=1
        -- verifie que player.x est entre les extremes de la map soit 0 (init) - 128 (l) - 64 (L)
    
    end

    --animation---
    player.anim_t=max(player.anim_t-0.125,0)
    player.ox=player.startox*player.anim_t
    player.oy=player.startoy*player.anim_t

end

function music()
    sfx(5)
 end

function interact(x,y)
    if check_flag(1,x,y) then
        pick_up_gems(x,y)
    end
    if collision_player_toxic(player,toxic) and (player.gems > 0) then
    -- elseif check_flag(2,x,y) and (player.gems > 0) then
        for e in all (toxic) do
            condition = player.gems <= 0
            if not condition then
                loose_gems()
            end
        end
    end
    condition = player.gems <= 0
    if not condition then
        if check_flag(3,x,y) and (player.gems > 0) then 
        loose_gems()
        end
    end
end

----------player.speed=15 pourquoi l'avoir déclaré ?

function draw_player()
    spr(player.sprite,player.x*8+ player.ox,player.y*8+ player.oy,1, 1, player.flip) 
    
    if player.anim_t>=0.7 then 
        player.sprite +=1
        if player.sprite > 7 then 
            player.sprite=3
        end
    end
     
end





  



