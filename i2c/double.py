#!/usr/bin/python
import sys
import time
import datetime
import pylab
import commands
import pytz

x = []
y = []
n=0


#commands.getstatusoutput("tail -n 30000 /root/i2c/temp.log > /root/i2c/temp_big.log")
f = open('/root/i2c/temp.log', 'r')
for line in f:
   #Mon Feb  4 11:29:55 2013 --> 16.5
   linespit = line.split(' --> ')
   ParsedTime = time.mktime(time.strptime(linespit[0], "%a %b %d %H-%M-%S %Y"))
   n+=1
   x.append(ParsedTime+7200) #+7200 in summer time order to get it in GMT+1
   y.append(float(linespit[1]))   
f.close()
t = pylab.matplotlib.dates.epoch2num(x)

x2 = []
y2 = []
n=0
commands.getstatusoutput("scp root@10.0.0.10:i2c/temp.log /root/i2c/temp2.log")
commands.getstatusoutput("tail -n 10000 /root/i2c/temp2.log > /root/i2c/temp10k2.log")
f2 = open('/root/i2c/temp10k2.log', 'r')
for line in f2:
   #Mon Feb  4 11:29:55 2013 --> 16.5
   linespit = line.split(' --> ')
   ParsedTime = time.mktime(time.strptime(linespit[0], "%a %b %d %H-%M-%S %Y"))
   n+=1
   x2.append(ParsedTime+7200) #+7200 in summer time order to get it in GMT+1
   y2.append(float(linespit[1]))   
f2.close()
t2 = pylab.matplotlib.dates.epoch2num(x2)

fig = pylab.figure() #Make a figure
fig.set_size_inches(20,20)
fig.subplots_adjust(left=0.07, bottom=0.1, right=0.98, top=0.98, wspace=0.0, hspace=0.30)

#6 month
ax   = fig.add_subplot(2,1,1) #Add a subplot
pylab.plot_date(t,y,"--bo",None ,True, False)
pylab.plot_date(t2,y2,"--ro",None ,True, False)
ax.set_ylim([10,30])
ax.set_xlim([datetime.datetime.now()-datetime.timedelta(days=180),datetime.datetime.now()])
ax.xaxis.set_major_locator(pylab.matplotlib.dates.MonthLocator())
ax.xaxis.set_major_formatter(pylab.matplotlib.dates.DateFormatter('%b'))
ax.xaxis.set_minor_locator(pylab.matplotlib.dates.MonthLocator())
ax.grid(True)
ax.set_ylabel('Temperature (C)', fontsize=30)
ax.set_xlabel('Time', fontsize=30)
ax.set_title('6 Months', fontsize=30)
pylab.xticks(rotation=15)

#12 months
ax   = fig.add_subplot(2,1,2) #Add a subplot
pylab.plot_date(t,y,"--bo",None ,True, False)
pylab.plot_date(t2,y2,"--ro",None ,True, False)
ax.set_ylim([10,30])
ax.set_xlim([datetime.datetime.now()-datetime.timedelta(days=360),datetime.datetime.now()])
ax.xaxis.set_major_locator(pylab.matplotlib.dates.MonthLocator())
ax.xaxis.set_major_formatter(pylab.matplotlib.dates.DateFormatter('%b'))
ax.xaxis.set_minor_locator(pylab.matplotlib.dates.MonthLocator())
ax.grid(True)
ax.set_ylabel('Temperature (C)', fontsize=30)
ax.set_xlabel('Time', fontsize=30)
ax.set_title('12 Months', fontsize=30)
pylab.xticks(rotation=15)


# rotates and right aligns the x labels, and moves the bottom of the
# axes up to make room for them
#fig.autofmt_xdate()

fig.savefig("/var/www/tempall_big.png",dpi=72)
#pylab.show()

