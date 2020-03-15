pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
pen_x = 64  -- Starting around the middle (centre) of the canvas
pen_y = 64  -- Starting around the middle (centre) of the canvas
pen_width = 1
pen_down = true
pendown_colour = 7  -- Normally 7 (White)
penup_colour = 5  -- Normally 5 (Dark grey)
print_colour = 7 -- Normally 7 (White)

function _init()
   -- Nothing to go here yet...
end

function _update()
   -------------------------------------------------------
   -- Should I move the cursor?
   -------------------------------------------------------
   if (btnp(0)) pen_x -= 1   -- Left?
   if (btnp(1)) pen_x += 1   -- Right?
   if (btnp(2)) pen_y -= 1   -- Up?
   if (btnp(3)) pen_y += 1   -- Down?
   
   -------------------------------------------------------
   -- Toggle pen up/down?
   -------------------------------------------------------
   if (btnp(4)) do
      pen_down = not pen_down
      
   end
   
end

function _draw()
   cls(0)
    
   -------------------------------------------------------
   -- Drawing/writing different things depending
   -- upon pen state
   -------------------------------------------------------   
   if (pen_down) then
      color(print_colour)
      print("pen down",90,0)
      color(pendown_colour)
      rectfill(pen_x,pen_y,pen_x+(pen_width-1),pen_y+(pen_width-1))

   else
      color(penup_colour)
      rectfill(pen_x,pen_y,pen_x+(pen_width-1),pen_y+(pen_width-1))
      color(print_colour)
      print("pen up",90,0)   -- Why does this print statement only work the first time around??

   end

   -------------------------------------------------------
   -- Printing which is independent of pen state
   ------------------------------------------------------- 
   color(print_colour)
   print("pen_x="..pen_x,0,0)
   print("pen_y="..pen_y,0,8)
   
end



__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
