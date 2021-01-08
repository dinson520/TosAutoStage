-- 脚本名称：AutoStage_v4
-- 存储路径：%存储路径%
-- 分辨率：   720x1280 
-- 色深：         32
-------------------------------------------------------------
   
function main()

   if EvaluateBackToDesktop() then 

      repeat
         
         toast(string.format("Auto Stage Start!"));

         SelectStage("dark", 2, 1, true);

         --選妲已
         --SelectFriend( "dark", "spirit", "recovery", 5);
         --選三太子
         SelectFriend( "fire", "human", "attack", 5);
         
         BattleProcessSleep();

         ExitStage();
         
      until false
   else 
         toast(string.format("Not at TosDesktop, program stop!"));      
   end
end

function SelectStage(stage, position1, position2, eatStone)
   if stage=="water" then 
      touchClick(130,518)  --水 water
      sleep(2000)
      --PullUp();
      ClickLevel(position1);
      --ClickStage(position1);
      ClickStage(position2);
   elseif stage=="fire" then 
      touchClick(612,540)  --火 fire
      sleep(2000)
      --PullUp();
      ClickLevel(position1);
      --ClickStage(position1);
      ClickStage(position2);      
   elseif stage=="wooden" then 
      touchClick(550,971)  --木 wooden
      sleep(2000)
      --PullUp();
      ClickLevel(position1);
      --ClickStage(position1);
      ClickStage(position2);      
   elseif stage=="light" then 
      touchClick(152,910)  --光 light
      sleep(2000)
      --PullUp();
      ClickLevel(position1);
      --ClickStage(position1);
      ClickStage(position2);      
   elseif stage=="dark" then 
      touchClick(646,773)  --暗 dark
      sleep(2000)
      --PullUp();
      ClickLevel(position1);
      --ClickStage(position1);
      ClickStage(position2);      
   elseif stage=="central" then 
      touchClick(402,710)    --中塔 central
      sleep(2000)
      ClickStage(position1);
      --ClickStage(position1);
      ClickStage(position2);
   elseif stage=="monument" then
      touchClick(100,322)  --選擇 遺蹟(飛船) monument
      sleep(2000)
      ClickStage(position1);
      --ClickStage(position1);
      ClickStage(position2);
   elseif stage=="FlyDragon" then 
      toast(string.format("Select FlyDragon stage."));
      sleep(2000)   
      toast(string.format("FlyDragon not implements yet!."));
      --touchClick(600,310)  --選擇 旅人的記憶(飛龍) FlyDragon
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
      touchClick(360,892)  --選擇 第一封印
   elseif level==2 then 
      touchClick(360,740)  --選擇 第二封印
   elseif level==3 then 
      touchClick(365,706)  --選擇 第三封印
   elseif level==4 then
      touchClick(336,441)  --選擇 第四封印
   end 
   sleep(2000)
end 

function ClickStage(stage)

   sleep(2000)
   
   if stage==1 then 
      touchClick(200,421)  -- 第一關
   elseif stage==2 then
      touchClick(200,562)  -- 第二關
   elseif stage==3 then
      touchClick(200,703)  -- 第三關
   elseif stage==4 then
      touchClick(200,838)  -- 第四關
   elseif stage==5 then 
      touchClick(200,987)  -- 第五關
   end
   
end




function SelectFriend(color, category, sorting, position)
   if findColorFuzzy(0x0D4053,80,612,259,634,277) then
      sleep(500)
   else
      repeat
         toast(string.format("Waiting for filter friend button!"));
         sleep(3000)
      until findColorFuzzy(0x0D4053,80,612,259,634,277)
   end
   
      toast(string.format("Filter Button Found.!"));
      touchClick(700,251)  --點選 過濾
      sleep(1000)
      
      FilterColor(color);
      FilterCategory(category);
      FilterSorting(sorting);
      SelectCisPosition(position);

      
      if findColorFuzzy(0x0D4053,80,350,690,384,728) then 
         touchClick(367,709)
      else
         repeat
            toast(string.format("Waiting for Select button!"));
            sleep(1500)
         until findColorFuzzy(0x0D4053,80,350,690,384,728)
         touchClick(367,709)  --點 選擇
      end
         
      if findColorFuzzy(0x0D4053,80,610,1100,638,1126) then 
         touchClick(624,1113) --點進入戰鬥
      else
         repeat
            toast(string.format("Waiting for battle button!"));
            sleep(1500)
         until findColorFuzzy(0x0D4053,80,610,1100,638,1126)      
         touchClick(624,1113) --點進入戰鬥
      end

end

function SelectCisPosition(position)

   if position==1 then 
      touchClick(200,421)  -- 選擇 第一位
   elseif position==2 then 
      touchClick(200,562)  -- 選擇 第二位
   elseif position==3 then 
      touchClick(200,703)  -- 選擇 第三位
   elseif position==4 then 
      touchClick(200,838)  -- 選擇 第四位
   elseif position==5 then 
      touchClick(200,987)  -- 選擇 第五位
      
   end 
   
   sleep(1000)

end

function FilterColor(color)

   if color=="water" then
      touchClick(52,514)  --點選水屬性 water
   elseif color=="fire" then 
      touchClick(143,513)  --點選火屬性 fire
   elseif color=="wooden" then 
      touchClick(231,515)  --點選木屬性 wooden
   elseif color=="light" then 
      touchClick(318,510)  --點選光屬性 light
   elseif color=="dark" then 
      touchClick(413,512)  --點選暗屬性 dark
   else 
      toast(string.format("Input FilterColor is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(500)

end

function FilterCategory(category)
      
   if category=="god" then
      touchClick(49,647)  --點選 神族 god
   elseif category=="demon" then 
      touchClick(139,648)  --點選 魔族 demon
   elseif category=="human" then 
      touchClick(234,645)  --點選 人類 human
   elseif category=="monster" then 
      touchClick(319,654)  --點選 獸類 monster
   elseif category=="dragon" then 
      touchClick(412,649)  --點選 龍類 dragon
   elseif category=="spirit" then 
      touchClick(51,727)  --點選 妖精類 spirit
   else 
      toast(string.format("Input FilterCategory is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(500)

end


function FilterSorting(sorting)

   if sorting=="attribute" then
      touchClick(614,374)  --點選 屬性 attribute
   elseif sorting=="life" then 
      touchClick(612,449)  --點選 生命力 life
   elseif sorting=="attack" then 
      touchClick(610,523)  --點選 攻擊力 attack
   elseif sorting=="recovery" then 
      touchClick(615,597)  --點選 回復力 recovery
   elseif sorting=="times" then 
      touchClick(611,668)  --點選 已被選用次數 times
   else 
      toast(string.format("Input FilterSorting is a invalid value!"));
      sleep(1000)
   end 
   
   sleep(500)

end 

function EatStone()

	if findColorFuzzy(0x083D52,95,145,720,185,760) then 
		touchClick(166,691)	-- 按下 吃石
		sleep(2500)
        repeat
            ClickConfirmButton();
        until findColorFuzzy(0x184962,90,623,246,713,302)   --直到好友過濾選單
	end 

end

function ClickConfirmButton()

	if findColorFuzzy(0x526D63,90,318,650,409,950) == true then 
		touchClick(353,717)  --按 出關確定鍵
		sleep(500)
		touchClick(354,746)  --按 出關確定鍵
		sleep(500)
		touchClick(354,780)  --按 出關確定鍵
		sleep(500)
		touchClick(356,822)  --按 出關確定鍵
		sleep(500)
	end

	if findColorFuzzy(0x10556B,95,514,681,652,735) == true then 
		touchClick(593,713)  --按下升技、獲得靈魂
		sleep(500)
    end
		
	if findColorFuzzy(0x08455A,95,337,786,376,803) == true then 
		touchClick(360,821)  --按下 好友確定鍵
		sleep(500)
    end
	
	if findColorFuzzy(0x10415A,95,526,797,575,839) then 
		touchClick(480,820)  --按下取消 並 拒決好友申請
		sleep(500)
	end
    
    sleep(1000)

end


function BattleProcessSleep()
   sleep(45000)
   repeat
         sleep(5000)
   --等到離開戰鬥，邊框(愛心位位)變深土色時才離開、判定戰鬥結束
   --until findColorFuzzy(0x291C18,95,36,507,45,513)     within manu bar
   until findColorFuzzy(0x291C18,95,35,550,45,560)
   toast(string.format("Battle End!"));
end

function ExitStage()

   repeat 
      
      ClickConfirmButton();

   until EvaluateBackToDesktop()

end 


function EvaluateBackToDesktop()  --返回桌面？

	touchClick(360,1109) --按下體力球
   sleep(2000)

   -- 若已回到desktop則回傳true，否則回傳false
   if findColorFuzzy(0x567972,80,284,830,324,870) then 
      toast(string.format("Desktop color is found."));
      return true
	else 
      toast(string.format("Desktop color is not found."));
      return false
   end 

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