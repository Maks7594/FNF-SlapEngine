function onCreate()
	dodged = false;
    candodge = false;
    dodgetimer = 0;
    precacheSound('dodg');
    precacheImage('spacebar');
    precacheSound('endodg');
    
	
end

function onEvent(name, value1)
    if name == "DodgeEvent" then
    --le dodge time
    dodgetimer = (value1);
	
    --Space to dodge Sprite
	makeAnimatedLuaSprite('spacebar', 'spacebar', 400, 200);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'spacebar', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
	scaleLuaSprite('spacebar', 0.50, 0.50); 
    addLuaSprite('spacebar', true); 
	
	--this makes it able to dodge
    playSound('dodg');
	candodge = true;
	runTimer('Died', dodgetimer);
	
	end
end

function onUpdate()
   if candodge == true and keyJustPressed('space') then
   
   dodged = true;
   playSound('endodg', 0.7);
   characterPlayAnim('boyfriend', 'dodge', true);
   setProperty('boyfriend.specialAnim', true);
   removeLuaSprite('spacebar');
   candodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and dodged == true then
   dodged = false
   
   end
end