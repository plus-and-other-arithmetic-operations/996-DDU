yellowColor = rgbm(1,1,0,1)
greenColor = rgbm(0,1,0,1)
blueColor = rgbm(0,0,1,1)
lightBlueColor = rgbm(0,0.7,0.9,1)
redColor = rgbm(1,0,0,1)
blackColor = rgbm(0,0,0,1)
blueLightTreshold = 6500
turnSignalsBlinkInterval = 0.5
limiterBlinkInterval = 0.2
blinkLimiter = true
pitLimiterBlinkInterval = 0.5
blinkPit = true

local function drawShiftLight()
    rpm = car.rpm
    greenSectorColor = greenColor
    yellowSectorColor = yellowColor
    redSectorColor = redColor

    if (rpm > 5000) then
        display.rect({
            pos = vec2(36,70),
            size = vec2(107,116),
            color = greenSectorColor
        })
    end
    if (rpm > 5150) then
        display.rect({
            pos = vec2(145,65),
            size = vec2(82,120),
            color = greenSectorColor
        })
    end
    if (rpm > 5300) then
        display.rect({
            pos = vec2(233,78),
            size = vec2(84,108),
            color = greenSectorColor
        })
    end
    if (rpm > 5450) then
        display.rect({
            pos = vec2(324,76),
            size = vec2(88,107),
            color = greenSectorColor
        })
    end
    if (rpm > 5600) then
        display.rect({
            pos = vec2(418,73),
            size = vec2(90,110),
            color = greenSectorColor
        })
    end
    if (rpm > 5750) then
        display.rect({
            pos = vec2(514,71),
            size = vec2(78,103),
            color = greenSectorColor
        })
    end
    if (rpm > 5900) then
        display.rect({
            pos = vec2(597,71),
            size = vec2(90,108),
            color = yellowSectorColor
        })
    end
    if (rpm > 6050) then
        display.rect({
            pos = vec2(694,75),
            size = vec2(93,104),
            color = yellowSectorColor
        })
    end
    if (rpm > 6200) then
        display.rect({
            pos = vec2(797,69),
            size = vec2(91,113),
            color = redSectorColor
        })
    end
    if (rpm > 6350) then
        display.rect({
            pos = vec2(896,70),
            size = vec2(94,109),
            color = redSectorColor
        })
    end
end

local function blinkTopBar(color)
        display.rect({
            pos = vec2(36,70),
            size = vec2(107,116),
            color = color
        })
        display.rect({
            pos = vec2(145,65),
            size = vec2(82,120),
            color = color
        })
        display.rect({
            pos = vec2(233,78),
            size = vec2(84,108),
            color = color
        })
        display.rect({
            pos = vec2(324,76),
            size = vec2(88,107),
            color = color
        }) 
        display.rect({
            pos = vec2(418,73),
            size = vec2(90,110),
            color = color
        })
        display.rect({
            pos = vec2(514,71),
            size = vec2(78,103),
            color = color
        })
        display.rect({
            pos = vec2(597,71),
            size = vec2(90,108),
            color = color
        }) 
        display.rect({
            pos = vec2(694,75),
            size = vec2(93,104),
            color = color
        }) 
        display.rect({
            pos = vec2(797,69),
            size = vec2(91,113), 
            color = color
        })
        display.rect({
            pos = vec2(896,70),
            size = vec2(94,109),
            color = color
        })
end

local function drawTCBar()
    slip =  math.abs((car.wheels[2].slipRatio + car.wheels[3].slipRatio)/2)*20 + math.abs((car.wheels[2].slipAngle + car.wheels[3].slipAngle)/2)
    if (slip > 10) then
        display.rect({
            pos = vec2(8,907),
            size = vec2(252,106),
            color = yellowColor
        })
        display.rect({
            pos = vec2(724,851),
            size = vec2(290,128),
            color = yellowColor
        })
    end
    if (slip >  20) then
        display.rect({
            pos = vec2(20,747),
            size = vec2(212,123),
            color = yellowColor
        })
        display.rect({
            pos = vec2(723,722),
            size = vec2(279,120),
            color = yellowColor
        })
    end
    if (slip > 30) then
        display.rect({
            pos = vec2(14,605),
            size = vec2(224,124),
            color = yellowColor
        })
        display.rect({
            pos = vec2(724,600),
            size = vec2(267,104),
            color = yellowColor
        })
    end
    if (slip > 40) then
        display.rect({
            pos = vec2(8,467),
            size = vec2(233,123),
            color = yellowColor
        })
        display.rect({
            pos = vec2(719,456),
            size = vec2(277,124),
            color = yellowColor
        })
    end
    if (slip > 50) then
        display.rect({
            pos = vec2(11,313),
            size = vec2(247,116),
            color = yellowColor
        })
        display.rect({
            pos = vec2(702,312),
            size = vec2(302,125),
            color = yellowColor
        })
    end
end

local function drawABSBar()
    if car.absMode ~= 0 then
        abs = math.abs((car.wheels[0].slipRatio + car.wheels[1].slipRatio)/2)*475
    elseif car.speedKmh > 1 then
        abs = math.abs((car.wheels[0].slipRatio + car.wheels[1].slipRatio)/2)*100
    else
        abs = 0
    end
    if (abs > 10) then
        display.rect({
            pos = vec2(8,907),
            size = vec2(252,106),
            color = blueColor
        })
        display.rect({
            pos = vec2(724,851),
            size = vec2(290,128),
            color = blueColor
        })
    end
    if (abs > 30) then
        display.rect({
            pos = vec2(20,747),
            size = vec2(212,123),
            color = blueColor
        })
        display.rect({
            pos = vec2(723,722),
            size = vec2(279,120),
            color = blueColor
        })
    end
    if (abs > 40) then
        display.rect({
            pos = vec2(14,605),
            size = vec2(224,124),
            color = blueColor
        })
        display.rect({
            pos = vec2(724,600),
            size = vec2(267,104),
            color = blueColor
        })
    end
    if (abs > 60) then
        display.rect({
            pos = vec2(8,467),
            size = vec2(233,123),
            color = blueColor
        })
        display.rect({
            pos = vec2(719,456),
            size = vec2(277,124),
            color = blueColor
        })
    end
    if (abs > 80) then
        display.rect({
            pos = vec2(11,313),
            size = vec2(247,116),
            color = blueColor
        })
        display.rect({
            pos = vec2(702,312),
            size = vec2(302,125),
            color = blueColor
        })
    end
end

turnOn = false
local function drawTurnSignals()
    setInterval(
        function ()
            turnOn = not turnOn
        end, turnSignalsBlinkInterval, "key0")
        clearInterval("key0")
    if (car.turningLeftLights and turnOn) then
        display.rect({
            pos = vec2(11,313),
            size = vec2(247,116),
            color = yellowColor
        })
    end

    if (car.turningRightLights and turnOn) then
        display.rect({
            pos = vec2(702,312),
            size = vec2(302,125),
            color = yellowColor
        })
    end

    if (car.hazardLights and turnOn) then
        display.rect({
            pos = vec2(11,313),
            size = vec2(247,116),
            color = yellowColor
        })
        display.rect({
            pos = vec2(702,312),
            size = vec2(302,125),
            color = yellowColor
        })
    end
end

flagMapping = {
    Caution = rgbm.colors.yellow,
    Stop = rgbm.colors.black,
    FasterCar = rgbm.colors.blue,
    OneLapLeft = rgbm.colors.white,
}

function drawFlagLight()
    display.rect({
        pos = vec2(295,478),
        size = vec2(355,354),
        color = flagMapping[sim.raceFlagType]
    })
end

function script.update(dt)
    isSlipping = math.abs((car.wheels[2].slipRatio + car.wheels[3].slipRatio)/2)*20 + math.abs((car.wheels[2].slipAngle + car.wheels[3].slipAngle)/2) > 9
    setInterval(
        function ()
            blinkLimiter = not blinkLimiter
        end, limiterBlinkInterval, "key2")
    clearInterval("key2")
    setInterval(
        function ()
            blinkPit = not blinkPit
        end, pitLimiterBlinkInterval, "key1")
    clearInterval("key1")

    if (car.isInPitlane) then
        if blinkPit then blinkTopBar(yellowColor) end
       
    elseif (car.rpm > blueLightTreshold) then
        if blinkLimiter then blinkTopBar(lightBlueColor) else drawShiftLight() end

    else
        drawShiftLight()
    end
    if isSlipping then
        drawTCBar()
    else
        drawABSBar()
    end
    drawFlagLight()
    drawTurnSignals()
  end