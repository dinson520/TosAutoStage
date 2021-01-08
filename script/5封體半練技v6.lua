-- 脚本名称：5封體半練技v6
-- 脚本描述：
-- 存储路径：%存储路径%
-- 分辨率：	720x1280 
-- 色深：			32
-------------------------------------------------------------
--				range area	   getColor
-- 說明		x1 	y1  x2 	y2    	x  	y	0xColor  	clarify

--吃石確定	145,670	185,710		166	691	0x083D52	80
--			用以決定吃石

--回體確定	514,631	652,685		584,660	0x10556B	80

--吃石取消	525,668	570,710		547,691	0x103D5A	80
--			用以決定不吃石







--愛心位置  36,507 	45,513   	40,509 	0xFFBB84 	80
--			用以判定是否仍在關卡內？



--交友取消	526,747	575,789		546,768	0x10415A	80

--好友確定	270,740	446,797		360,771	0x08455A	80





--脚本入口
function main()

	repeat
		if EvaluateBackToDesktop() then 
			toast(string.format("Not at TosDesktop, program will stop!");
			break 
		end
		
		toast(string.format("Auto Stage Start!"));

		--火25練技
		SelectStage();

		
		--選擇戰友並進戰鬥
		SelectFriend();
		
		BattleProcessSleep();

		ExitStage();
			
		sleep(1000)
	until false

end


function SelectStage()

	-- touchClick(130,468)  --水
	touchClick(612,490)  --火
	-- touchClick(550,921)  --木
	-- touchClick(152,860)  --光
	-- touchClick(646,723)  --暗
	-- touchClick(402,660)  --中塔

	PullUp();
	
    -- touchClick(360,842)  --選擇 第一封印
    -- touchClick(360,690)  --選擇 第二封印
	touchClick(365,556)  --選擇 第三封印
	-- touchClick(336,391)  --選擇 第四封印
	-- touchClick(362,302)  --選擇 第五封印

	sleep(1500)
	
	touchClick(415,353)  --點選 第五關(最上層關卡)
	
	sleep(2000)
	
	-- 是否吃石？

	EatStone();

end

function SelectFriend()

	repeat
		sleep(2000)
	until findColorFuzzy(0x184962,80,623,196,713,252)
	
        touchClick(700,201)  --點選 過濾
        sleep(200)
        
        touchClick(149,456)  --點選火屬性
        sleep(200)

        touchClick(234,595)  --點選人類
        sleep(200)
        
        touchClick(610,460)  --點選攻擊力
		
		
        sleep(500)
        
        touchClick(478,650)  --點選第三位

        sleep(1300)
        touchClick(367,659)  --點 選擇

        sleep(2000)         
        touchClick(624,1063) --點進入戰鬥

end

function BattleProcessSleep()

	toast(string.format("Battle Start!"));
	sleep(30000)
	repeat
			sleep(10000)
		--等到離開戰鬥，邊框變深土色時才離開、判定戰鬥結束
	until findColorFuzzy(0x291C18,90,36,507,45,513)
	
	toast(string.format("Battle End!"));
	
	sleep(3000)
end

function ExitStage()

    repeat 
		
		--	若出現確定的小提示時 按四下
		if findColorFuzzy(0x526D63,80,318,645,409,817) == true then 
			touchClick(353,667)  --按 出關確定鍵
			sleep(500)
			touchClick(354,696)  --按 出關確定鍵
			sleep(500)
			touchClick(354,730)  --按 出關確定鍵
			sleep(500)
			touchClick(356,772)  --按 出關確定鍵
			sleep(500)
		end
		
		ClickConfirmButton();
        
		if EvaluateBackToDesktop() then break end

     until false
	 
	 toast(string.format("Exit Stage successful!"));
	 
	 sleep(1000)

end 


function EvaluateBackToDesktop()

		touchClick(360,1109) --按體力球
        sleep(1000)
		
		-- 若已回到desktop則回傳true，否則回傳false
        if findColorFuzzy(0x526D63,80,280,810,310,830) then 
            return true 
		else 
			return false
        end 

end


function ClickConfirmButton()

	if findColorFuzzy(0x10556B,80,514,631,652,685) == true then 
		touchClick(593,663)  --按下升技、獲得靈魂
		sleep(1500)
    end
		
	if findColorFuzzy(0x08455A,80,337,736,376,753) == true then 
		touchClick(360,771)  --按下 好友確定鍵
		sleep(1500)
    end
	
	if findColorFuzzy(0x10415A,80,526,747,575,789) then 
		touchClick(480,770)  --按下取消 並 拒決好友申請
		sleep(1500)
	end

	if findColorFuzzy(0x10415A,80,600,1040,640,1090) then 
		touchClick(624,1063)  --按下 戰鬥開始
		BattleProcessSleep();
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

function EatStone()

	if findColorFuzzy(0x083D52,80,145,670,185,710) then 
		touchClick(166,691)	-- 按下 吃石
		sleep(2000)
		touchClick(584,660)	-- 按下 確定
		sleep(500)
	end 

end
