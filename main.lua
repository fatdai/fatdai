
debug = true

-- 角色
player = {
	x = 200,
	y = 710,
	speed = 150,
	img = nil
}

-- Timers
canShoot = true
canShootTimerMax = 0.2
canShootTimer canShootTimerMax

--- Bullet 
bulletImg = nil

bullets = {}

function love.load(  )
	player.img = love.graphics.newImage("assets/Aircraft_01.png")
	bulletImg = love.graphics.newImage("assets/bullet.png")
end

function love.update( dt )
	-- 退出游戏
	if love.keyboard.isDown("escape") then
		love.event.push("quit")
	end

	-- player move
	if love.keyboard.isDown("left","a") then
		if player.x > 0 then
			player.x = player.x - (player.speed * dt)
		end
	elseif love.keyboard.isDown("right","d") then
		if player.x < (love.graphics.getWidth() - player.img:getWidth()) then
			player.x = player.x + (player.speed * dt)
		end
	end

	-- 是否可以攻击
	canShootTimer = canShootTimer - 1 * dt
	if canShootTimer < 0 then
		canShoot = true
	end

	-- 发射子弹
	if love.keyboard.isDown("space") then
		-- create some bullets
		newBullet = {x = player.x + (player.img:getWidth()/2),y = player.y,img = bulletImg}
		table.insert(bullets,newBullet)
		canShoot = false
		canShootTimer = canShootTimerMax
	end

	-- 更新子弹位置
	for i,bullet in ipairs(bullets) do
		bullet.y = bullet.y - (250 * dt)

		if bullet.y < 0 then

		end
	end
end

function love.draw(  )
	love.graphics.draw(player.img,player.x,player.y)

	-- 绘制子弹
	for _,bullet in ipairs(bullets) do
		love.graphics.draw(bullet.img,bullet.x,bullet.y)
	end
end


--- process input
-- function love.keypressed( key,scancode,isrepeat )
-- 	if scancode == 'left' then
-- 		player.x = player.x - 10
-- 	elseif scancode == 'right' then
-- 		player.x = player.x + 10
-- 	elseif scancode == 'quit' then

-- 	end
-- end