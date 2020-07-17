local GameStartScene = require"app.scenes.GameStartScene"
local MainScene = class("MainScene", function()
    return display.newScene("MainScene")
end)

function MainScene:ctor()
    local basicLayer = display.newNode()
    local birdNode = display.newNode()
    local backgroud_day = display.newSprite("bg_day.png")
    local gameTitle = display.newSprite("title.png")
    local bird = display.newSprite("bird0_2.png")
    local guide = display.newSprite("tutorial.png")
    self.bird = bird
    addHeight = 0
    posX = 640
    picIndex = 0
    n = 0
    birdY = 0
    scaleX = backgroud_day:getContentSize().width
    scaleY = backgroud_day:getContentSize().height
    self:addChild(basicLayer)
    basicLayer:addChild(backgroud_day)
    basicLayer:addChild(gameTitle)
    basicLayer:addChild(birdNode)
    basicLayer:addChild(guide)
    birdNode:addChild(bird)
    backgroud_day:setScaleX(display.width/scaleX)--setScaleXY是设置倍率
    backgroud_day:setScaleY(display.height/scaleY)
    bird:setPosition(display.cx,display.cy)
    backgroud_day:setPosition(display.cx,display.cy)
    gameTitle:setPosition(display.cx,display.height*0.6)
    guide:setPosition(display.cx,display.cy-37.8)
    self:enter()
end
--点击转场
function MainScene:enter()
    --单点进入游戏场景
    self:addNodeEventListener(cc.NODE_TOUCH_EVENT, function(event) 
        print("开始游戏")
    -- 创建一个新场景
    local gameStartScene = GameStartScene.new()
    print("创建新场景")
    -- 包装过渡效果
    --local transition = display.wrapSceneWithTransition(gameStartScene, "fade", 0.5)
    print("正在过渡")
    -- 切换到新场景
    display.replaceScene(gameStartScene)       
    print("切换成功")
    end)
    self:setTouchEnabled(true)
end

return MainScene
