pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
-- Pen parameters
pen_x = 64  -- Starting around the middle (centre) of the canvas
pen_y = 64  -- Starting around the middle (centre) of the canvas
pen_width = 1
pen_down = true
pendown_colour = 9  -- To indicate pen position and state
penup_colour = 5  -- To indicate pen position and state
pen_colour = 7   -- The colour that the pen writes
print_colour = 7 -- Normally 7 (White)

-- Define the 'canvas map' (i.e. a Lua table) to store "pixel" values (copied from 'game_of_life.p8')
canvas_map = {}

function _init()
   -------------------------------------------------------
   -- Initialise the drawing canvas
   -------------------------------------------------------
   for ii=0, 127 do
      canvas_map[ii] = {}
      for jj=0, 127 do
         canvas_map[ii][jj] = 0
      end
   end  -- for
   
end  -- function

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
   if (btnp(4)) pen_down = not pen_down
   
   -------------------------------------------------------
   -- Drawing different things depending
   -- upon pen state
   -------------------------------------------------------   
   if (pen_down) canvas_map[pen_x][pen_y] = pen_colour
   
end

function _draw()
   cls(0)
   
   -------------------------------------------------------
   -- Paint out the canvas_map onto the screen
   -------------------------------------------------------
   for x,row_x in pairs(canvas_map) do           -- row_x = map rows
      for y,colour_value in pairs(row_x) do            -- colour_value = cell values
         rectfill(x, y, x, y, colour_value)
      end
   end

   -------------------------------------------------------
   -- Indicate the pen position, and its state
   -------------------------------------------------------
   if (pen_down) do
      rectfill(pen_x, pen_y, pen_x, pen_y, pendown_colour)
      color(print_colour)
      print("pen down", 90, 0)
      
   else   -- Pen must be up
      rectfill(pen_x, pen_y, pen_x, pen_y, penup_colour)
      color(print_colour)
      print("pen up", 90, 0)
      
   end
   
   -------------------------------------------------------
   -- Printing info which is independent
   -- of pen state
   ------------------------------------------------------- 
   color(print_colour)  -- Belt and braces
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
