## the library
import configparser
import telegram  ## pip install python-telegram-bot telegram-send

## READ-BOT-CONFIG
def bot_config(confile):
    config = configparser.ConfigParser()
    config.read_file(open(confile))
    return config.get('telegram', 'token'), config.get('telegram', 'chatid')

## two-returned values
TOKEN, CHATID = bot_config("/etc/telegram-send.conf")  ## global telegram config

bot = telegram.Bot(token=TOKEN)
bot.sendMessage(chat_id=CHATID, text=YOUR_MESSAGE)
