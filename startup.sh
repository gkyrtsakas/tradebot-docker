echo "$((`date +%s` - 172800))" > timestamp   #cheat if the container goes down and set the timestamp to 2 days ago

/etc/init.d/cron restart

echo "* * * * * cd /home/tradebot/mfl-tradebot && `env | grep TB | tr '\n' ' '` /usr/local/bin/python3 /home/tradebot/mfl-tradebot/tradebot.py > /home/tradebot/mfl-tradebot/debug.out 2>&1" > /etc/cron.d/job.cron

chmod 0644 /etc/cron.d/job.cron
crontab /etc/cron.d/job.cron
