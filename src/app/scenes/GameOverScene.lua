local GameOverScene = class("GameOverScene", function()
    return display.newScene("GameOverScene")
end)

function GameOverScene:ctor()
    local score = 0
    local bg_night = display.newSprite("bg_night.png")
    :addTo(self)
    local path = cc.FileUtils:getInstance():fullPathForFilename("StartGameData.txt")
    score = tonumber(io.readfile(path))
    local highestScore = self:scoreIO(score)
    scaleX = bg_night:getContentSize().width
    scaleY = bg_night:getContentSize().height
    bg_night:setScaleX(display.width/scaleX)--setScaleXY是设置倍率
    bg_night:setScaleY(display.height/scaleY)
    bg_night:setPosition(display.cx,display.cy)
    local scorePanel = display.newSprite("score_panel.png")
        :addTo(self)
        :setPosition(display.cx,display.cy)
    --设置TTF字体
    local label1 = display.newTTFLabel({
        text = score,
        font = "Maeker Felt",
        size = 32,
        color = cc.c4b(255,255,255),
        dimeensions = cc.size(400,200)
    })
    label1:addTo(self)
        :setPosition(display.cx+84,display.cy+18)
    --设置TTF字体
    local label2 = display.newTTFLabel({
        text = highestScore,
        font = "Maeker Felt",
        size = 32,
        color = cc.c4b(255,255,255),
        dimeensions = cc.size(400,200)
    })
    label2:addTo(self)
        :setPosition(display.cx+84,display.cy-24)
    local textOver = display.newSprite("text_game_over.png")
        :setPosition(display.cx,display.cy+150)
        :addTo(self) 


end 

--输入得分，修改游戏得分数据，返回最高分
function GameOverScene:scoreIO(number)
    local path = cc.FileUtils:getInstance():fullPathForFilename("gamedata.txt")
    highestNum = tonumber(io.readfile(path))
    if number > highestNum then
        io.writefile(path,number,w)
    end 
    highScore = tonumber(io.readfile(path))
    print(highScore)
    return highScore
end 

-- function GameOverScene:tap()
--     --单点触摸事件
--     startNode:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
--         print("restart")        
--     end)
--     startNode:setTouchEnabled(true)   
-- end

return GameOverScene