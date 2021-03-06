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


commands.getstatusoutput("tail -n 10000 /root/i2c/temp.log > /root/i2c/temp10k.log")
f = open('/root/i2c/temp10k.log', 'r')
for line in f:
   #Mon Feb  4 11:29:55 2013 --> 16.5
   linespit = line.split(' --> ')
   ParsedTime = time.mktime(time.strptime(linespit[0], "%a %b %d %H-%M-%S %Y"))
   n+=1
   x.append(ParsedTime+7200) #+3600 in summer time order to get it in GMT+1
   y.append(float(linespit[1]))   
f.close()
t = pylab.matplotlib.dates.epoch2num(x)

x2 = []
y2 = []
n=0
commands.getstatusoutput("scp root@10.0.0.7:i2c/temp.log /root/i2c/temp2.log")
commands.getstatusoutput("tail -n 400 /root/i2c/temp2.log > /root/i2c/temp10k2.log")
f2 = open('/root/i2c/temp10k2.log', 'r')
for line in f2:
   #Mon Feb  4 11:29:55 2013 --> 16.5
   linespit = line.split(' --> ')
   ParsedTime = time.mktime(time.strptime(linespit[0], "%a %b %d %H-%M-%S %Y"))
   n+=1
   x2.append(ParsedTime+7200) #+3600 in summer time order to get it in GMT+1
   y2.append(float(linespit[1]))   
f2.close()
t2 = pylab.matplotlib.dates.epoch2num(x2)

plot1Format = pylab.matplotlib.dates.DateFormatter('%h')
plot2Format = pylab.matplotlib.dates.DateFormatter('%a %h')
plot3Format = pylab.matplotlib.dates.DateFormatter('%m %y')

fig = pylab.figure() #Make a figure
fig.set_size_inches(20,20)
fig.subplots_adjust(left=0.07, bottom=0.1, right=0.98, top=0.98, wspace=0.0, hspace=0.30)

#last 12hours
ax   = fig.add_subplot(2,1,1) #Add a subplot
pylab.plot_date(t,y,"--bo",None ,True, False)
pylab.plot_date(t2,y2,"--ro",None ,True, False)
ax.set_ylim([15,25])
ax.set_xlim([datetime.datetime.now()-datetime.timedelta(hours=12),datetime.datetime.now()])
ax.xaxis.set_major_locator(pylab.matplotlib.dates.HourLocator())
ax.xaxis.set_major_formatter(pylab.matplotlib.dates.DateFormatter('%H:%M'))
ax.set_ylabel('Temperature (C)', fontsize=30)
ax.set_xlabel('Time', fontsize=30)
ax.set_title('Last 12 hours',fontsize=30)
ax.grid(True)
pylab.xticks(rotation=15)

#last 2days
ax   = fig.add_subplot(2,1,2) #Add a subplot
pylab.plot_date(t,y,"--bo",None ,True, False)
pylab.plot_date(t2,y2,"--ro",None ,True, False)
ax.set_ylim([15,25])
ax.set_xlim([datetime.datetime.now()-datetime.timedelta(days=2),datetime.datetime.now()])
ax.xaxis.set_major_locator(pylab.matplotlib.dates.HourLocator(interval=6))
ax.xaxis.set_major_formatter(pylab.matplotlib.dates.DateFormatter('%a %H:%M'))
ax.xaxis.set_minor_locator(pylab.matplotlib.dates.HourLocator())
ax.set_ylabel('Temperature (C)', fontsize=30)
ax.set_xlabel('Time', fontsize=30)
ax.set_title('Last 2 days', fontsize=30)
ax.grid(True)
pylab.xticks(rotation=15)

# rotates and right aligns the x labels, and moves the bottom of the
# axes up to make room for them
#fig.autofmt_xdate()

fig.savefig("/var/www/tempall.png",dpi=72)
#fig.savefig("/var/www/tempall.pdf",dpi=72)
#pylab.show()

