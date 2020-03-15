pico-8 cartridge // http://www.pico-8.com
version 18
__lua__
pixelpos_x = 50
pixelpos_y = 80
pixelsize = 0
pixelon = true
colour_pixelon = 6  -- Normally 6
colour_pixeloff = 0  -- Normally 0

function _init()
   -- Nothing to go here yet...
end

function _update()
   -------------------------------------------------------
   -- Should I move the cursor?
   -------------------------------------------------------
   if (btnp(0)) pixelpos_x -= 1   -- Left?
   if (btnp(1)) pixelpos_x += 1   -- Right?
   if (btnp(2)) pixelpos_y -= 1   -- Up?
   if (btnp(3)) pixelpos_y += 1   -- Down?
   
   -------------------------------------------------------
   -- Toggle cursor on/off?
   -------------------------------------------------------
   if (btnp(4)) do
      pixelon = not pixelon
      
   end
   
end

function _draw()
   cls()
   
   if (pixelon) then
      rectfill(pixelpos_x,pixelpos_y,pixelpos_x+pixelsize,pixelpos_y+pixelsize,colour_pixelon)
      
   else
      rectfill(pixelpos_x,pixelpos_y,pixelpos_x+pixelsize,pixelpos_y+pixelsize,colour_pixeloff)
      
   end
end



__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
