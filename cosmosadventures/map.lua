-----Map-----

function draw_map()
    --map(tilex,tiley,ecranx,ecrany)
    cls()
    --map(0,0,0,0,127,63) 
    map(0, 0, 0, 0, 128, 64)  
end

function change_color()
    pal(8,136,1)
end 

function check_flag(flag,x,y)
    local sprite=mget(x,y)
    return fget(sprite,flag)
end
-- renvoi true ou false

function init_camera()
    camx,camy=0,0
end 

function update_camera()
        camx=mid(0, (player.x-7.5)*8+player.ox, (60-15)*8)
        camy=mid(0, (player.y-7.5)*8+player.oy, (60-15)*8)
        camera(camx, camy) 
end

function next_tile(x,y)
    sprite=mget(x,y)
    mset(x,y,sprite+1) 	
end

function pick_up_gems(x,y)
    next_tile(x,y)
    player.gems+=1
    player.touched_gems+=1
    if (player.gems < 6) then
        sfx(1)
    elseif (player.gems == 6) then
        sfx(2)
    end
end

function loose_gems(x,y)
next_tile(x,y)
player.gems-=1
sfx(0)
end


