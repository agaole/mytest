'=========================================================================*
' FileName:     remind.vbs
' Author:       gaole
' Date:         2021-3-11
' Version:      1.0.0
' Copyright:    
' Description:  
'=========================================================================*/

'code style gb2312
dim msgtable(3,2) 'interval,msg,lasttime

msgtable(0,0)=45 '���ʱ��
msgtable(0,1)="����,����" '��������

msgtable(1,0)=0
msgtable(1,1)=""

msgbox "will run remind.vbs"
while true
	for i = 0 to UBound (msgtable,1)
		if(msgtable(i,0)) then 'only interval>0 is valid
			showmsg msgtable(i,1),msgtable(i,0),msgtable(i,2)
		end if
	next
	wscript.sleep 1000*20
wend

Function showmsg(text,interval,lastTime)
	dim diffMin
	if(lastTime = 0) then
		msgbox "ÿ��"&interval&"��������: "&text
		lastTime = Now
		exit Function
	end if
	diffMin = diffTime(lastTime,Now)
	if(diffMin >= interval) then
		msgbox text
		lastTime = Now
	end if
End Function 


Function diffTime(lastTime,nowTime)
	'diffTime = DateDiff("n", lastTime, nowTime)
	'exit Function
	dim lastYear,lastMonth,lastDay,lastHour,lastMinute
	dim nowYear,nowMonth,nowDay,nowHour,nowMinute
	dim diffMinute

	lastYear=Year(lastTime)
	lastMonth=Month(lastTime)
	lastDay=Day(lastTime)
	lastHour=Hour(lastTime)
	lastMinute=Minute(lastTime)
	
	nowYear=Year(nowTime)
	nowMonth=Month(nowTime)
	nowDay=Day(nowTime)
	nowHour=Hour(nowTime)
	nowMinute=Minute(nowTime)
	'����ȡÿ��31�죬���Ը��µ�ʱ�䲢��׼ȷ
	diffMinute = ((((nowYear-lastYear)*12 + nowMonth - lastMonth)*31 + nowDay - lastDay)*24 + nowHour - lastHour)*60 + nowMinute - lastMinute
	diffTime = diffMinute
	exit Function
End Function
