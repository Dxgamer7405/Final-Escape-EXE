function onCreate() -- sprite loading
	makeLuaSprite('ins', 'instruction', 240, 0)
	runTimer('fadeTimer', 3.0, 1)
    scaleObject('ins', 0.8, 0.8);
	addLuaSprite('ins', true)
	setObjectCamera('ins', 'others')
	setProperty('androidc.visible', false);
end

function onTimerCompleted(tag) -- bye bye loading screen
    if tag == 'fadeTimer' then
	    doTweenAlpha('delete', 'ins', 0, 0.5, 'backIn')
	    doTweenAlpha('c', 'androidc', 1, 0.5, 'backIn')
	end
end

function onTweenCompleted(tag) -- everything goes bye bye
    if tag == 'delete' then
	    removeLuaSprite('ins', true);
	end
end