local GameOverScene = require"app.scenes.GameOverScene"
local GameStartScene = class("GameStartScene", function()
    return display.newScene("GameStartScene")
end)
local scheduler = require(cc.PACKAGE_NAME..".scheduler")

function GameStartScene:ctor()
    local basicLayer = display.newNode()
    local birdNode = display.newNode()
    local landNode = display.newNode()
    --创建地面
    local land1 = display.newSprite("land.png")
    local land2 = display.newSprite("land.png")
    --背景
    local backgroud_day = display.newSprite("bg_day.png")
    --小鸟
    local bird = display.newSprite("bird0_0.png")
    --水管
    local pipeUp1 = display.newSprite("pipe_up.png")
    local pipeDown1 = display.newSprite("pipe_down.png")
    local pipeUp2 = display.newSprite("pipe_up.png")
    local pipeDown2 = display.newSprite("pipe_down.png")
    local pipeUp3 = display.newSprite("pipe_up.png")
    local pipeDown3 = display.newSprite("pipe_down.png")
    local gameOver = display.newSprite("text_game_over.png")
    local score = 0
    local time = 0.5
    local path = cc.FileUtils:getInstance():fullPathForFilename("StartGameData.txt")
    self.time = time
    self.bird = bird
    self.score = score
    self.pipeUp1 = pipeUp1
    self.pipeUp2 = pipeUp2
    self.pipeUp3 = pipeUp3
    self.pipeDown1  = pipeDown1
    self.pipeDown2 = pipeDown2
    self.pipeDown3 = pipeDown3
    self.path = path
    posX = 640
    picIndex = 0
    n = 0
    birdY = 0
    scaleX = backgroud_day:getContentSize().width
    scaleY = backgroud_day:getContentSize().height
    self:addChild(basicLayer)
    self:addChild(landNode)
    basicLayer:addChild(backgroud_day)
    basicLayer:addChild(birdNode)
    basicLayer:addChild(pipeDown1)
    basicLayer:addChild(pipeUp1)
    basicLayer:addChild(pipeDown2)
    basicLayer:addChild(pipeUp2)
    basicLayer:addChild(pipeDown3)
    basicLayer:addChild(pipeUp3)
    basicLayer:addChild(gameOver)
    landNode:addChild(land1)
    landNode:addChild(land2)
    birdNode:addChild(bird)
    
    backgroud_day:setScaleX(display.width/scaleX)--setScaleXY是设置倍率
    backgroud_day:setScaleY(display.height/scaleY)
    backgroud_day:setPosition(display.cx,display.cy)
    bird:setPosition(display.cx-250,display.cy)
    land1:setAnchorPoint(0,0)--设置锚点
    land2:setAnchorPoint(0,0)
    land2:setPosition(312,0)
    pipeUp1:setPosition(300,250)
    pipeDown1:setPosition(300,850)
    pipeUp2:setPosition(500,200)
    pipeDown2:setPosition(500,800)
    pipeUp3:setPosition(700,150)
    pipeDown3:setPosition(700,900)
    gameOver:setPosition(display.cx,display.cy) 
    gameOver:setVisible(false)
    
    --全局自定义调度器
    local function onInterval(dt)
        --下落高度及地面移动速度
            self.time = self.time +0.02
            birdDropSpeed = 0.5*9.8*self.time*self.time
            pipeMoveSpeed = 2.5
            birdX,birdY = self.bird:getPosition()
     
            -- 水管移动、在屏幕左边消失时在右边生成，高度随机?????????     
            pipeUpX1,pipeUpY1 = pipeUp1:getPosition()
            pipeDownX1,pipeDownY1 = pipeDown1:getPosition()
            pipeUpX2,pipeUpY2 = pipeUp2:getPosition()
            pipeDownX2,pipeDownY2 = pipeDown2:getPosition()
            pipeUpX3,pipeUpY3 = pipeUp3:getPosition()
            pipeDownX3,pipeDownY3 = pipeDown3:getPosition()
         
            --精灵转换成矩阵
            birdRect = self:createRect(bird)
            pipeUp1Rect = self:createRect(pipeUp1)
            pipeUp2Rect = self:createRect(pipeUp2)
            pipeUp3Rect = self:createRect(pipeUp3)
            pipeDown1Rect = self:createRect(pipeDown1)
            pipeDown2Rect = self:createRect(pipeDown2)
            pipeDown3Rect = self:createRect(pipeDown3)

            if pipeUpX1 <=-17 then
                pipeUpX1 = 700
                pipeUpY1 = 250       
            end 
            if pipeUpX2 <=-17 then
                pipeUpX2 = 700
                pipeUpY2 = 250       
            end 
            if pipeUpX3 <=-17 then
                pipeUpX3 = 700
                pipeUpY3 = 250       
            end   
            if pipeDownX1 <=-17 then
                pipeDownX1 = 700
                pipeDownY1 = 850       
            end 
            if pipeDownX2 <=-17 then
                pipeDownX2 = 700
                pipeDownY2 = 800       
            end 
            if pipeDownX3 <=-17 then
                pipeDownX3 = 700
                pipeDownY3 = 950       
            end 
            --小鸟和水管的碰撞判定
            --小鸟死亡，想终止计时器，跳转到结算场景
            if birdY <=120 then 
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                return 
            end         
            if cc.rectIntersectsRect(birdRect,pipeUp1Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return 
            end 
            if cc.rectIntersectsRect(birdRect,pipeUp2Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return
            end 
            if cc.rectIntersectsRect(birdRect,pipeUp3Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return
            end 
            if cc.rectIntersectsRect(birdRect,pipeDown1Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return
            end 
            if cc.rectIntersectsRect(birdRect,pipeDown1Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return
            end 
            if cc.rectIntersectsRect(birdRect,pipeDown1Rect) then
                io.writefile(self.path,self.score,w)
                self:ConvertGameOver()
                gameOver:setVisible(true)
                return
            end 
            bird:setPosition(birdX,birdY-birdDropSpeed)     
            pipeDown1:setPosition(pipeDownX1-pipeMoveSpeed,pipeDownY1)
            pipeUp1:setPosition(pipeUpX1-pipeMoveSpeed,pipeUpY1)
            pipeDown2:setPosition(pipeDownX2-pipeMoveSpeed,pipeDownY2)
            pipeUp2:setPosition(pipeUpX2-pipeMoveSpeed,pipeUpY2)
            pipeDown3:setPosition(pipeDownX3-pipeMoveSpeed,pipeDownY3)
            pipeUp3:setPosition(pipeUpX3-pipeMoveSpeed,pipeUpY3)
            --得分
            if birdX == pipeUpX1 then
                self.score = self.score+1
            end 
            if birdX == pipeUpX2 then
                self.score = self.score+1
            end 
            if birdX == pipeUpX3 then
                self.score = self.score+1
            end 
            print("得分:"..self.score)
        end
        local handle = scheduler.scheduleGlobal(onInterval,0.02)
        self.handle = handle
        self:tap()
    end
    --点击上升
    function GameStartScene:tap()
        --单点触摸事件
        self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
            print("ok fly")        
            local x,y = self.bird:getPosition()
            self.time = 0.5
            self.bird:setPosition(x,y+20)
        end)
        self:setTouchEnabled(true)   
    end
--将精灵坐标封装成矩阵
function GameStartScene:createRect(sprite)
    s = sprite:getContentSize()
    px = sprite:getPositionX()
    py = sprite:getPositionY()
    ap = sprite:getAnchorPoint()
    rect = cc.rect(
        px - ap.x*s.width,
        py - ap.y*s.height,
        s.width,
        s.height
    )
    return rect
end 
--跳转结算场景
function GameStartScene:ConvertGameOver()
    print("游戏结束，进入结算")
    local gameOverScene = GameOverScene.new()
    print("切换结算场景")
    display.replaceScene(gameOverScene)       
end

function GameStartScene:onExit()
    if self.handle then 
        scheduler.unscheduleGlobal(self.handle)
    end
    print("已取消计时器")
end
return GameStartScene
