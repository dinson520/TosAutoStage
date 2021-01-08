-- 脚本名称：honor3 simple test
-- 存储路径：%存储路径%
-- 分辨率：   720x1280 
-- 色深：         32
-------------------------------------------------------------
   
function main()

   EvaluateBackToDesktop();


end

function bak()
   if EvaluateBackToDesktop()==false then 
      toast(string.format("Not at TosDesktop, program stop!"));
   else
      repeat
         
         toast(string.format("Auto Stage Start!"));

         SelectStage("wooden", 4, 1, true);

         --選妲已
         SelectFriend( "dark", "spirit", "recovery", 5);
         --選三太子
         --SelectFriend( "fire", "human", "attack", 5);
         
         BattleProcessSleep();

         ExitStage();
         
      until false

   end
end

function SelectStage(stage, position1, position2, eatStone)
   if stage=="water" then 
      touchClick(130,468)  --水 water
      sleep(500)
      --PullUp();
      ClickLevel(position1);
      ClickStage(position2);
   elseif stage=="fire" then 
      touchClick(612,490)  --火 fire
      sleep(500)
      --PullUp();
      ClickLevel(position1);
      ClickStage(position2);      
   elseif stage=="wooden" then 
      touchClick(550,921)  --木 wooden
      sleep(500)
      --PullUp();
      ClickLevel(position1);
      ClickStage(position2);      
   elseif stage=="light" then 
      touchClick(152,860)  --光 light
      sleep(500)
      --PullUp();
      ClickLevel(position1);
      ClickStage(position2);      
   elseif stage=="dark" then 
      touchClick(646,723)  --暗 dark
      sleep(500)
      --PullUp();
      ClickLevel(position1);
      ClickStage(position2);      
   elseif stage=="central" then 
      touchClick(402,660)    --中塔 central
      sleep(2000)
      ClickStage(position1);
      ClickStage(position2);
   elseif stage=="monument" then
      touchClick(100,272)  --選擇 遺蹟(飛船) monument
      sleep(2000)
      ClickStage(position1);
      ClickStage(position2);
   elseif stage=="FlyDragon" then 
      toast(string.format("Select FlyDragon stage."));
      sleep(2000)   
      toast(string.format("FlyDragon not implements yet!."));
      --touchClick(600,260)  --選擇 旅人的記憶(飛龍) FlyDragon
   else 
      toast(string.format("Stage value is invalid!"));
      
   end 
   
   sleep(1500)
   
   -- 是否吃石？
   if eatStone==true then
      EatStone();
   end
end

function ClickLevel(level)

   sleep(1000)

   if level==1 then 
      touchClick(360,842)  --選擇 第一封印
   elseif level==2 then 
      touchClick(360,690)  --選擇 第二封印
   elseif level==3 then 
      touchClick(365,556)  --選擇 第三封印
   elseif level==4 then
      touchClick(336,391)  --選擇 第四封印
   end 
end 

function ClickStage(stage)

   sleep(1000)
   
   if stage==1 then 
      touchClick(200,371)  -- 第一關
   elseif stage==2 then
      touchClick(200,512)  -- 第二關
   elseif stage==3 then
      touchClick(200,653)  -- 第三關
   elseif stage==4 then
      touchClick(200,788)  -- 第四關
   elseif stage==5 then 
      touchClick(200,937)  -- 第五關
   end
   
end




function SelectFriend(color, category, sorting, position)
   repeat
      sleep(1000)
   until findColorFuzzy(0x184962,90,623,196,713,252)
   
      touchClick(700,201)  --點選 過濾
      sleep(300)
      
      FilterColor(color);
      FilterCategory(category);
      FilterSorting(sorting);
      SelectCisPosition(position);

      touchClick(367,659)  --點 選擇

      sleep(3000)
      touchClick(624,1063) --點進入戰鬥

end

function SelectCisPosition(position)

   if position==1 then 
      touchClick(200,371)  -- 選擇 第一位
   elseif position==2 then 
      touchClick(200,512)  -- 選擇 第二位
   elseif position==3 then 
      touchClick(200,653)  -- 選擇 第三位
   elseif position==4 then 
      touchClick(200,788)  -- 選擇 第四位
   elseif position==5 then 
      touchClick(200,937)  -- 選擇 第五位
      
   end 
   
   sleep(1000)

end

function FilterColor(color)

   if color=="water" then
      touchClick(52,464)  --點選水屬性 water
   elseif color=="fire" then 
      touchClick(143,463)  --點選火屬性 fire
   elseif color=="wooden" then 
      touchClick(231,465)  --點選木屬性 wooden
   elseif color=="light" then 
      touchClick(318,460)  --點選光屬性 light
   elseif color=="dark" then 
      touchClick(413,462)  --點選暗屬性 dark
   else 
      toast(string.format("Input FilterColor is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(200)

end

function FilterCategory(category)
      
   if category=="god" then
      touchClick(49,597)  --點選 神族 god
   elseif category=="demon" then 
      touchClick(139,598)  --點選 魔族 demon
   elseif category=="human" then 
      touchClick(234,595)  --點選 人類 human
   elseif category=="monster" then 
      touchClick(319,604)  --點選 獸類 monster
   elseif category=="dragon" then 
      touchClick(412,599)  --點選 龍類 dragon
   elseif category=="spirit" then 
      touchClick(51,677)  --點選 妖精類 spirit
   else 
      toast(string.format("Input FilterCategory is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(200)

end


function FilterSorting(sorting)

   if sorting=="attribute" then
      touchClick(614,324)  --點選 屬性 attribute
   elseif sorting=="life" then 
      touchClick(612,399)  --點選 生命力 life
   elseif sorting=="attack" then 
      touchClick(610,473)  --點選 攻擊力 attack
   elseif sorting=="recovery" then 
      touchClick(615,547)  --點選 回復力 recovery
   elseif sorting=="times" then 
      touchClick(611,618)  --點選 已被選用次數 times
   else 
      toast(string.format("Input FilterSorting is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(200)

end 



function BattleProcessSleep()
   sleep(45000)
   repeat
         sleep(5000)
      --等到離開戰鬥，邊框變深土色時才離開、判定戰鬥結束
   until findColorFuzzy(0x291C18,95,36,507,45,513)
end

function ExitStage()

   repeat 
      
      ClickConfirmButton();

   until EvaluateBackToDesktop()

end 


function EvaluateBackToDesktop()

	touchClick(360,1109) --按體力球
   sleep(1500)

   -- 若已回到desktop則回傳true，否則回傳false
   if findColorFuzzy(0x567972,80,284,830,324,870) then 
      toast(string.format("Color is found."));
      return true
	else 
      toast(string.format("Color is not found."));
      return false
   end 

end

function EatStone()

	if findColorFuzzy(0x083D52,95,145,670,185,710) then 
		touchClick(166,691)	-- 按下 吃石
		sleep(2500)
        repeat
            ClickConfirmButton();
        until findColorFuzzy(0x184962,90,623,196,713,252)   --直到好友過濾選單
	end 

end

function ClickConfirmButton()

	if findColorFuzzy(0x526D63,90,318,600,409,900) == true then 
		touchClick(353,667)  --按 出關確定鍵
		sleep(500)
		touchClick(354,696)  --按 出關確定鍵
		sleep(500)
		touchClick(354,730)  --按 出關確定鍵
		sleep(500)
		touchClick(356,772)  --按 出關確定鍵
		sleep(500)
	end

	if findColorFuzzy(0x10556B,95,514,631,652,685) == true then 
		touchClick(593,663)  --按下升技、獲得靈魂
		sleep(500)
    end
		
	if findColorFuzzy(0x08455A,95,337,736,376,753) == true then 
		touchClick(360,771)  --按下 好友確定鍵
		sleep(500)
    end
	
	if findColorFuzzy(0x10415A,95,526,747,575,789) then 
		touchClick(480,770)  --按下取消 並 拒決好友申請
		sleep(500)
	end
    
    sleep(1000)

end


function PullUp()
	sleep(1500)
	touchDown(346,790)  -- 由下往上拉
	sleep(17)
	touchMove(343,790)
	sleep(17)
	touchMove(342,790)
	sleep(17)
	touchMove(339,788)
	sleep(51)
	touchMove(340,763)
	sleep(17)
	touchMove(345,741)
	sleep(17)
	touchMove(350,711)
	sleep(17)
	touchMove(356,677)
	sleep(17)
	touchMove(364,639)
	sleep(17)
	touchMove(373,604)
	sleep(17)
	touchMove(382,577)
	sleep(17)
	touchMove(392,550)
	sleep(17)
	touchMove(401,523)
	sleep(17)
	touchMove(413,492)
	sleep(17)
	touchMove(425,457)
	sleep(15)
	touchUp()

	sleep(2000)
end 

