ButtonHit = false;
state = true;
shouldAdd = true;

function onUpdate(elapsed)
	if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') and ButtonHit == true then
		objectPlayAnimation('button', 'B pressed', true);
	else
		objectPlayAnimation('button', 'B press', true);
	end
end

function onStepHit()
    if curStep == 464 then
    ButtonHit = true;
	makeAnimatedLuaSprite('button', 'button', 1125, 562.5);
	addAnimationByPrefix('button', 'B press', 'B press', 12, false);
	addAnimationByPrefix('button', 'B pressed', 'B pressed', 12, false);
	addLuaSprite('button', true);
	setObjectCamera('button', 'other');
	scaleObject('button', 1.2, 1.2)
    end
end