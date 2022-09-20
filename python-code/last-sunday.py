#!/opt/bin/env python3

import calendar
from datetime import datetime, date
from dotenv import dotenv_values
import telegram

from dateutil.relativedelta import relativedelta, SU, MO, TU, WE, TH, FR, SA # $ pip install python-dateutil

#today = datetime.today()

dot = dotenv_values()
bot = telegram.Bot(token=dot.get('HTTP_TOKEN'))

## logging / logs
import logging
FORMAT = '%(asctime)s - %(name)s - %(levelname)s: %(message)s'
logging.basicConfig(level=logging.INFO, format=FORMAT)
logr = logging.getLogger('patch-tuesday')

## calculate
def lsom( year=datetime.today().year, month=datetime.today().month ):
    month = calendar.monthcalendar(year, month)
    return max(month[-1][calendar.SUNDAY], month[-2][calendar.SUNDAY])

def last_sunday( year=datetime.today().year, month=datetime.today().month ):
    ## last day of the month
    now = date.today().replace(day=calendar.monthrange(year, month)[1])
    now -= relativedelta(weeks=1, weekday=SU)
    return now.day

## days to LSOM (last sunday of the month)
d2lsom = lambda x: x-datetime.today().day

ddelta = d2lsom(lsom())
MESSAGE = f"ALERT! Only {ddelta} days to the LAST SUNDAY of this month ({lsom()}th)."

logr.debug(f"DELTA: {ddelta}")
logr.debug(MESSAGE)

if ( int(ddelta) < 6 ) and ( int(ddelta) > 0 ):
    #print(MESSAGE)
    bot.send_message(dot.get('CHAT_CHANNL'), MESSAGE)

