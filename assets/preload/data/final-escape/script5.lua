function onCreatePost()
	--if difficulty == 1 then
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		--if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, -305)
		else
		makeAnimatedLuaSprite('Left', 'noteSplashes', 0, 480)
		end
		addAnimationByPrefix('Left', 'LSplash', 'note splash purple 1', 24, false)
		setObjectCamera('Left', 'hud')
		scaleObject('Left', 1.2, 1.2);
		setProperty('Left.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, -305)
		else
		makeAnimatedLuaSprite('Down', 'noteSplashes', 100, 480)
		end
		addAnimationByPrefix('Down', 'DSplash', 'note splash blue 1', 24, false)
		setObjectCamera('Down', 'hud')
		scaleObject('Down', 1.2, 1.2);
		setProperty('Down.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, -305)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, -305)
		end
		else
		if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
		makeAnimatedLuaSprite('Up', 'noteSplashes', 215, 480)
		else
		makeAnimatedLuaSprite('Up', 'noteSplashes', 860, 480)
		end
		end
		addAnimationByPrefix('Up', 'USplash', 'note splash green 1', 24, false)
		setObjectCamera('Up', 'hud')
		scaleObject('Up', 1.2, 1.2);
		setProperty('Up.alpha', 0)
		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, -305)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, -305)
			end
		else
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
				makeAnimatedLuaSprite('Right', 'noteSplashes', 330, 480)
			else
				makeAnimatedLuaSprite('Right', 'noteSplashes', 975, 480)
			end
		end
		addAnimationByPrefix('Right', 'RSplash', 'note splash red 1', 24, false)
		setObjectCamera('Right', 'hud')
		scaleObject('Right', 1.2, 1.2);
		setProperty('Right.alpha', 0)
		this = 1
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	--if difficulty == 1 then
		if direction == 0 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Left.alpha', 1)
			addLuaSprite('Left', true)
			else
			setProperty('Left.alpha', 0.5)
			end
			objectPlayAnimation('Left', 'LSplash', false)
			runTimer('LSpl', 0.16)
		elseif direction == 1 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Down.alpha', 1)
			addLuaSprite('Down', true)
			else
			setProperty('Down.alpha', 0.5)
			end
			objectPlayAnimation('Down', 'DSplash', false)
			runTimer('DSpl', 0.16)
		elseif direction == 2 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Up.alpha', 1)
			addLuaSprite('Up', true)
			else
			setProperty('Up.alpha', 0.5)
			end
			objectPlayAnimation('Up', 'USplash', false)
			runTimer('USpl', 0.16)
		elseif direction == 3 then
			if not getPropertyFromClass('ClientPrefs', 'middleScroll', true) then
			setProperty('Right.alpha', 1);
			addLuaSprite('Right', true)
			else
			setProperty('Right.alpha', 0.5)
			end
			objectPlayAnimation('Right', 'RSplash', false)
			runTimer('RSpl', 0.16)
		end
	--end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'LSpl' then
		doTweenAlpha('Left', 'Left', 0, 0.2, 'linear');
	elseif tag == 'DSpl' then
		doTweenAlpha('Down', 'Down', 0, 0.2, 'linear');
	elseif tag == 'USpl' then
		doTweenAlpha('Up', 'Up', 0, 0.2, 'linear');
	elseif tag == 'RSpl' then
		doTweenAlpha('Right', 'Right', 0, 0.2, 'linear');
	elseif tag == 'reset' then
		this = 1	
		--debugPrint("reset");
	end
end

function onUpdate(elapsed)
	LeftX = getPropertyFromGroup('opponentStrums', 0, 'x') - 100
	DownX = getPropertyFromGroup('opponentStrums', 1, 'x') - 100
	UpX = getPropertyFromGroup('opponentStrums', 2, 'x') - 100
	RightX = getPropertyFromGroup('opponentStrums', 3, 'x') - 100
	LeftY = getPropertyFromGroup('opponentStrums', 0, 'y') - 40
	UpY = getPropertyFromGroup('opponentStrums', 1, 'y') - 40
	DownY = getPropertyFromGroup('opponentStrums', 2, 'y') - 40
	RightY = getPropertyFromGroup('opponentStrums', 3, 'y') - 40
	if this == 1 then
	doTweenX('UpdateLeftX', 'Left', LeftX, 0.001, 'linear')
	doTweenX('UpdateDownX', 'Down', DownX, 0.001, 'linear')
	doTweenX('UpdateUpX', 'Up', UpX, 0.001, 'linear')
	doTweenX('UpdateRightX', 'Right', RightX, 0.001, 'linear')
	doTweenY('UpdateLeftY', 'Left', LeftY, 0.001, 'linear')
	doTweenY('UpdateDownY', 'Down', DownY, 0.001, 'linear')
	doTweenY('UpdateUpY', 'Up', UpY, 0.01, 'linear')
	doTweenY('UpdateRightY', 'Right', RightY, 0.001, 'linear')
	--debugPrint("did");
	this = 2
	runTimer('reset', 0.02)
	end
end