debug = true

require('pig')

function love.load(arg)
  -- load images
  pig.img = love.graphics.newImage('assets/pig.png')
  -- load fonts
  hieroglyphs = love.graphics.newFont( 'assets/fonts/NotoSansEgyptianHieroglyphs-Regular.ttf', 48 )
  -- setup random
  math.randomseed(os.time())

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
  love.graphics.setFont(hieroglyphs)
  love.graphics.print('𓀩  𓁸', 100, 100)
end
