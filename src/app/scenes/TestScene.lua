

local TestScene = class("TestScene", function()
    return display.newScene("TestScene")
end)

function TestScene:ctor()
    print("测试")
    local label = display.newTTFLabel({
        text = "你好世界",
        font = "Maeker Felt",
        size = 64,
        color = cc.c4b(255,0,0),
        dimeensions = cc.size(400,200)
    })
    label:addTo(self)
        :setPosition(display.cx,display.cy)
end 
return TestScene