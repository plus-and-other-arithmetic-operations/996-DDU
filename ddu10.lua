ConsolasFont = 'Consolas'
-- PLEASE UPDATE THIS IF YOU CHANGE TYRE NAMES
tyreNameMapping = {
    SM = "R888R 275-325",
}

local fuelConsumption = 0.0032 -- Fetch this from car.ini/[FUEL] section (couldn't figure out ac.readDataFile())
currentLiters100 = (car.rpm * car.gas * fuelConsumption)/1000 --Fuel consumption. In one second the consumption is (rpm*gas*CONSUMPTION)/1000 litres
currentLitersAvailable = car.fuel - currentLiters100 --Current liters available in the tank

local function drawSpeed() -- aligned at center?
    display.text({
        text = math.floor(car.speedKmh),
        pos = vec2(396,285),
        letter = vec2(109,160),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 225,
        spacing = -47
      })
end

local function drawTyreTemps()
    xCoord1 = 50
    xCoord2 = 181
    yCoord1 = 105
    yCoord2 = 195

    tempsArray = {
        frontLeft = car.wheels[0].tyreCoreTemperature,
        frontRight = car.wheels[1].tyreCoreTemperature,
        rearLeft = car.wheels[2].tyreCoreTemperature,
        rearRight = car.wheels[3].tyreCoreTemperature
    }

    display.text({
        text = string.format("%.2f",tempsArray["frontLeft"]),
        pos = vec2(xCoord1,yCoord1),
        letter = vec2(34,50),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -15
    })

    display.text({
        text = string.format("%.2f",tempsArray["frontRight"]),
        pos = vec2(xCoord2,yCoord1),
        letter = vec2(34,50),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -15
    })

    display.text({
        text = string.format("%.2f",tempsArray["rearLeft"]),
        pos = vec2(xCoord2,yCoord2),
        letter = vec2(34,50),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -15
    })

    display.text({
        text = string.format("%.2f",tempsArray["rearRight"]),
        pos = vec2(xCoord1,yCoord2),
        letter = vec2(34,50),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -15
    })
end

function getGear()
    if car.gear == 0 then
        return 'N'
    elseif car.gear == -1 then
        return 'R'
    else
        return car.gear
    end
end

local function drawGear()
    if car.isInPitlane then
        display.text({
            text = "PIT-LANE",
            pos = vec2(406,55),
            letter = vec2(26,40),
            font = ConsolasFont,
            color = rgb(255/255,192/255,0),
            alignment = 0.5,
            width = 100,
        })
        display.rect({
            pos =  vec2(411, 95),
            size =  vec2(200, 200),
            color = rgb(255/255,192/255,0)
        })
    end

    display.text({
        text = getGear(),
        pos = vec2(438,86),
        letter = vec2(159,250),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
    })

    display.text({
        text = "GEAR",
        pos = vec2(365,106.5),
        letter = vec2(26,35),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = 1
    })
end

local function drawFuelPercentage()
    local fuelPercentage = math.floor((car.fuel/car.maxFuel)*100)
    display.text({
        text = fuelPercentage,
        pos = vec2(103,315),
        letter = vec2(33,48),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 70,
        spacing = -14
    })
end

local function drawSpeedMph()
    display.text({
        text = math.floor(car.speedKmh/1.609),
        pos = vec2(104,426),
        letter = vec2(33,50),
        font = ConsolasFont,
        color = rgb.colors.black,
        alignment = 0.5,
        width = 70,
        spacing = -14
    })
end

local function drawTemps()
    display.text({
        text = math.floor(car.oilTemperature),
        pos = vec2(42,531),
        letter = vec2(25,40),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 55,
        spacing = -9
    })
      display.text({
        text = math.floor(car.waterTemperature),
        pos = vec2(140,531),
        letter = vec2(25,40),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 55,
        spacing = -9
    })
end

local function drawTurbo()
    display.text({
        text = math.floor(car.turboWastegates[0]*100),
        pos = vec2(711,526),
        letter = vec2(25,40),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 55,
        spacing = -9
    })
end

local function drawBrakeBias()
    display.text({
        text = math.floor(car.brakeBias*100),
        pos = vec2(833,526),
        letter = vec2(25,40),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 40,
        spacing = -9
    })
end

local function drawLap()
    display.text({
        text = car.lapCount,
        pos = vec2(923,531),
        letter = vec2(25,40),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 55,
        spacing = -9
    })
end

local function drawBestLap()
    display.text({
        text = ac.lapTimeToString(car.bestLapTimeMs),
        pos = vec2(793,305),
        letter = vec2(30,48),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -11
    })
end

local function drawLastLap()
    display.text({
        text = ac.lapTimeToString(car.previousLapTimeMs),
        pos = vec2(793,191),
        letter = vec2(30,48),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 100,
        spacing = -11
    })
end

local function getLongTyreNameFromMapping(tyreShortName)
    if tyreNameMapping[tyreShortName] ~= nil then
        return tyreNameMapping[tyreShortName]
    else
        return tyreShortName
    end
end

local function drawTyreCompound()
    display.text({
        text = getLongTyreNameFromMapping(ac.getTyresName(0,-1)),
        pos = vec2(401,557),
        letter = vec2(25,35),
        font = ConsolasFont,
        color = rgb.colors.yellow,
        alignment = 0.5,
        width = 220,
        spacing = -11
      })
end

local function drawABS()
    absText = "--"
    if (car.absMode == 0) then
        absText = "OFF"
    else
        absText = "ON"
        display.rect({
            pos =  vec2(912, 25),
            size =  vec2(85, 115),
            color = rgb.colors.cyan
        })
    end

    display.text({
        text = "ABS",
        pos = vec2(845,25),
        letter = vec2(25,35),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 220,
        spacing = -11
    })

    display.text({
        text = absText,
        pos = vec2(845,70),
        letter = vec2(40,60),
        font = ConsolasFont,
        color = rgb.colors.white,
        alignment = 0.5,
        width = 220,
        spacing = -15
    })
end

local function drawLapRemain()
    currentFuelConsumption = (car.rpm * car.gas * fuelConsumption * sim.fuelConsumptionRate)/1000 --Fuel consumption. In one second the consumption is (rpm*gas*CONSUMPTION)/1000 litres
    currentLitersAvailable = car.fuel - currentFuelConsumption --Current liters available in the tank
    currentFuelUsed = car.maxFuel - currentLitersAvailable
    currentLiters100 = (currentFuelUsed * 100) / car.distanceDrivenSessionKm
    currentKmsLeft = (currentLitersAvailable * 100) / currentLiters100
    currentLapsLeft = currentKmsLeft / (sim.trackLengthM/1000)

    display.text({
        text = string.format("%.02f", currentLapsLeft),
        pos = vec2(755,410),
        letter = vec2(50,70),
        font = ConsolasFont,
        color = rgb.colors.black,
        alignment = 0.5,
        width = 220,
        spacing = -22
    })
end

local function drawTurboBar()
    boost = 264 - ((car.turboBoost/1.55)*264)
    display.image({
        image = "DDU_10_bar.png",
        pos = vec2(316,329),
        size = vec2(31,264),
        uvStart = vec2(0,0),
        uvEnd = vec2(1, 1)
    })
    display.rect({
        pos = vec2(316,329),
        size = vec2(31,boost),
        color = rgb.colors.black
    })
end

function script.update(dt)
    display.image({
        image = "DDU_10.png",
        pos = vec2(0,0),
        size = vec2(1024,617),
        uvStart = vec2(0,0),
        uvEnd = vec2(1, 1)
    })
    drawSpeed()
    drawSpeedMph()
    drawTyreTemps()
    drawGear()
    drawFuelPercentage()
    drawTemps()
    drawTurbo()
    drawBrakeBias()
    drawLap()
    drawBestLap()
    drawLastLap()
    drawTyreCompound()
    drawABS()
    drawLapRemain()
    drawTurboBar()
  end