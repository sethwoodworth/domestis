debug = true
pig = { x = 200,
        y = 700,
        speed = 15,
        img = nil,
        directions = {up, down, left, right}
      }

function love.load(arg)
  pig.img = love.graphics.newImage('assets/pig.png')
  math.randomseed(os.time())
end

function pig.move_left(this, dt)
    this.x = this.x - (this.speed*dt)
end
function pig.move_right(this, dt)
    this.x = this.x + (this.speed*dt)
end
function pig.move_up(this, dt)
    this.y = this.y - (this.speed*dt)
end
function pig.move_down(this, dt)
    this.y = this.y + (this.speed*dt)
end
function pig.manual_control(this, dt)
  if love.keyboard.isDown('h') then
    print('h left')
    -- pig.x = pig.x - (pig.speed*dt)
    pig.move_left(pig, dt)
  elseif love.keyboard.isDown('j') then
    print('j down')
    pig.y = pig.y + (pig.speed*dt)
    pig.move_down(pig, dt)
  elseif love.keyboard.isDown('k') then
    print('k up')
    pig.move_up(pig, dt)
  elseif love.keyboard.isDown('l') then
    print('l right')
    pig.move_right(pig, dt)
  end
end

function pig.random_walk(pig, dt)
  dir = math.random(4)
  movements = {}
  movements[0] = function (pig, dt) pig.move_up(pig, dt) end
  movements[1] = function (pig, dt) pig.move_down(pig, dt) end
  movements[2] = function (pig, dt) pig.move_left(pig, dt) end
  movements[3] = function (pig, dt) pig.move_right(pig, dt) end
  movements[ math.random( #movements ) ](pig, dt)
end

function love.update(dt)
  if love.keyboard.isDown('escape') then
    love.event.push('quit')
  end

  pig.manual_control(pig, dt)
  pig.random_walk(pig, dt)
end

function love.draw(dt)
  love.graphics.draw(pig.img, pig.x, pig.y)
end
