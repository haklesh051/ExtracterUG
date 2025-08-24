from config import CHANNEL_ID, SUDO_USERS
from Extractor.core import script
from pyrogram.errors import UserNotParticipant
from pyrogram.types import InlineKeyboardMarkup, InlineKeyboardButton
from Extractor.core.mongo.plans_db import premium_users


# ✅ Premium check
async def chk_user(query, user_id):
    user = await premium_users()
    if user_id in user or user_id in SUDO_USERS:
        await query.answer("✅ Premium User!!")
        return 0
    else:
        await query.answer("❌ Sir, you don't have premium access!!", show_alert=True)
        return 1


# ✅ Generate channel invite link safely
async def gen_link(app, chat_id):
    try:
        link = await app.export_chat_invite_link(chat_id)
        return link
    except Exception as e:
        return f"⚠️ Error generating link: {str(e)}"


# ✅ Force subscribe check
async def subscribe(app, message):
    update_channel = CHANNEL_ID
    url = await gen_link(app, update_channel)

    # Agar invite link nahi bana to wahi reply kar do
    if "⚠️" in url or "Error" in url:
        await message.reply_text(url)
        return 1

    if update_channel:
        try:
            user = await app.get_chat_member(update_channel, message.from_user.id)

            if user.status == "kicked":
                await message.reply_text(
                    "🚫 Sorry Sir, You are Banned. Contact My Support Group @spidy_universe"
                )
                return 1

        except UserNotParticipant:
            await message.reply_photo(
                photo="https://telegra.ph/file/b7a933f423c153f866699.jpg",
                caption=script.FORCE_MSG.format(message.from_user.mention),
                reply_markup=InlineKeyboardMarkup(
                    [
                        [
                            InlineKeyboardButton(
                                "🤖 ᴊᴏɪɴ ᴜᴘᴅᴀᴛᴇs ᴄʜᴀɴɴᴇʟ 🤖",
                                url=f"{url}"
                            )
                        ]
                    ]
                )
            )
            return 1

        except Exception as e:
            await message.reply_text(f"⚠️ Something Went Wrong: {str(e)}")
            return 1

    return 0  # ✅ User already in channel


# ✅ Convert "1day", "2hour", etc. to seconds
async def get_seconds(time_string):
    def extract_value_and_unit(ts):
        value = ""
        index = 0
        while index < len(ts) and ts[index].isdigit():
            value += ts[index]
            index += 1
        unit = ts[index:].lstrip()
        return int(value) if value else 0, unit

    value, unit = extract_value_and_unit(time_string)

    if unit == 's':
        return value
    elif unit == 'min':
        return value * 60
    elif unit == 'hour':
        return value * 3600
    elif unit == 'day':
        return value * 86400
    elif unit == 'month':
        return value * 2592000
    elif unit == 'year':
        return value * 31536000
    else:
        return 0
