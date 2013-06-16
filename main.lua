function love.load()
  car = love.graphics.newImage("car.png")
  width = car:getWidth()
  height = car:getHeight()
  x = 50
  y = 50
  up = false
  down = false
  right = false
  left = false
  speed = 500
  rotation = 0
  rot = {}
  rot.up = 0
  rot.down = 180
  rot.right = 90
  rot.left = -90
  true2One = function(bool)
    if (bool) then
      return 1
    else
      return 0
    end
  end
  --love.graphics.setBackgroundColor( 255,255,255 )
end

function love.keypressed(key)
  if key == 'left' then left = true end
  if key == 'up' then up = true end
  if key == 'right' then right = true end
  if key == 'down' then down = true end
end

function love.keyreleased(key)
  if key == 'left' then left = false end
  if key == 'up' then up = false end
  if key == 'right' then right = false end
  if key == 'down' then down = false end
end

function love.draw()
  love.graphics.draw(car, x, y, math.rad(rotation), 1, 1, width/2, height/2 )
end

function love.update(dt)
  if (up) then rotation = rot.up
  elseif (down) then rotation = rot.down end
  if (right) then rotation = rot.right - true2One(up)*rot.right/2 + true2One(down)*rot.right/2
  elseif (left) then rotation = rot.left - true2One(up)*rot.left/2 + true2One(down)*rot.left/2 end
  if (up or down or left or right) then
    y = y - (speed * dt) * math.cos(math.rad(rotation))
    x = x + (speed * dt) * math.sin(math.rad(rotation))
  end
end