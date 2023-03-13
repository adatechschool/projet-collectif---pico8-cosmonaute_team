-----Main-----

function _init()
	create_player()
	init_camera()
	create_rocket_fire()
   enemies={}
   toxic={}
   create_enemies(15)
   create_toxic_smoke(5)
   init_dialogue()
   create_dialogue("Hey!I'm Jean-Loup.", "Press X to start!")
music() 
end

--dialogues={"Salut !" ,"Au revoir !"}
--dialogues[1] ça affiche "Salut !"

function _update60()

   if not dialogues[1] then
      player_movement()
   end  
	update_camera()
	update_rocket_fire()
	
   update_dialogue()
   --create_enemies(10)
   
end

function _draw()   
	cls()
   draw_map()
   change_color() 
   draw_rocket_fire()
	draw_toxic_smoke()
   draw_player()
   draw_enemies() 
   draw_ui()
   
   draw_dialogues()
   x,y=25,10
   z=2
   local dialogues={"" ,"Congrats! You Won\nPress Ctrl+R to \nstart again", "Too Bad, Game Over\nPress Ctrl+R to retry"}
   if player.gems == 6 then
      --print(dialogue_title,w,z,7)
      rectfill(15,30,#dialogues[2]*2,z+6,2)
      print(dialogues[2],x,y,7)

   elseif (player.x == enemy.x and player.y == enemy.y) or (player.touched_gems == 12) then 
      rectfill(15,20,50+ #dialogues[2]*4,z+6,2)
      print(dialogues[3],x,y,7) 
   end
    
   update_enemies(enemies)
      for e in all (enemies) do
          
         if (player.x == e.x and player.y == e.y) then 
            rectfill(22,6,39+ #dialogue_title*4,z+20,2)
            --sfx(4)
            print("Too Bad, Game Over!\nPress Ctrl+R to retry",x,y,7)
            --print ("Press Ctrl + R to retry",x,y,7) 
         end 
      end
      if player.x==5 and player.y==8 then 
      --rectfill(20,80,39+ #dialogue_title*4,z+20,2)
      print("Tu dois reparer ta fusee!\nTrouve les 6 boulons mais\nattention aux ennemis...",15,80,7)
   end

   update_toxic_smoke(toxic)

end 


--sfx(3)

