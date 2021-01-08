-- 脚本名称：Sell_20cards_v2
-- 脚本描述：
-- 存储路径：%存储路径%
-- 分辨率：	720x1280
-- 色深：			32
-------------------------------------------------------------

--脚本入口
function main()
repeat

	sleep(400)
	touchClick(99,443)


	sleep(400)
	touchClick(100,604)


	sleep(400)
	touchClick(244,419)


	sleep(400)
	touchClick(223,581)


	sleep(400)
	touchClick(367,420)

	sleep(400)
	touchClick(365,595)

	sleep(400)
	touchClick(491,409)

	sleep(400)
	touchClick(495,583)

	sleep(400)
	touchClick(632,431)

	sleep(400)
	touchClick(631,572)

	sleep(400)
	touchClick(658,758)

	sleep(400)
	touchClick(630,901)

	sleep(400)
	touchClick(502,881)

	sleep(400)
	touchClick(486,719)

	sleep(400)
	touchClick(348,706)
   
	sleep(400)
	touchClick(353,859)

	sleep(400)
	touchClick(223,860)

	sleep(400)
	touchClick(243,724)

	sleep(400)
	touchClick(112,721)

	sleep(400)
	touchClick(100,849)
-----------------Select card is done.------------------
	sleep(400)
	touchClick(644,998) --To click sell button.

   if findColorFuzzy(0x0D4053,80,210,890,246,922) then   --Ensure sell confirm button is appear.
      touchClick(228,904)  --To click sell confirm button.
   else
      repeat
         toast(string.format("Waiting for sell button!"));
         sleep(2000)
      until findColorFuzzy(0x0D4053,80,210,890,246,922)
      touchClick(228,904)  --To click sell confirm button.
   end

   sleep(1500)
   if findColorFuzzy(0x121B1A,80,630,980,658,1016) then   --Ensure sell action is done.
      sleep(500)  --Sell action is done.
   else
      repeat
         toast(string.format("Waiting for sell action!"));
         sleep(2000)
      until findColorFuzzy(0x121B1A,80,630,980,658,1016)
   end
   
   toast(string.format("New round sell status is ready."));
   
until false
end