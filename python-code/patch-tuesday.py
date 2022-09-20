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
def tues2om( year=datetime.today().year, month=datetime.today().month ):
    month = calendar.monthcalendar(year, month)
    if month[0][calendar.TUESDAY]:
        return month[1][calendar.TUESDAY]
    else:
        return month[2][calendar.TUESDAY]

def patch_tuesday( now = date.today() ):
    ## start from day: 1
    now = now.replace(day=1) # 1st day of the month
    now += relativedelta(weeks=1, weekday=TU)
    return now.day

## days to LSOM (last sunday of the month)
d2lsom = lambda x: x-datetime.today().day

ddelta = d2lsom(patch_tuesday())
MESSAGE = f"ALERT! Patch Tuesday was {abs(ddelta)} days ago."

logr.debug(f"DELTA: {ddelta}")
logr.debug(f"{MESSAGE}")

if ( int(ddelta) <= -1 ) and ( int(ddelta) >= -3 ):
    #print(MESSAGE)
    bot.send_message(dot.get('CHAT_CHANNL'), MESSAGE)

