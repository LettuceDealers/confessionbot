# Lettuce's Simple Confession Bot
A simple confession bot for discord written in lua.
This bot only works in 1 server because of how its programmed and I currently have no plans to change that.

## Setup

1. Install [luvit](https://luvit.io/install.html), for windows users please use the powershell method at the top.
2. Run `lit install SinisterRectus/discordia` in your command terminal. You dont need to install anything else as discordia interactions and discordia slash are already installed in this repo.
3. Clone this repo somewhere on your computer.
4. Go [Here](https://discord.com/developers/applications), click 'New Application' and fill out all the required fields.
5. Go to the installation tab, and uncheck user install. Also make sure the application has the `application.commands` and `bot` scopes.
6. Go to the OAuth2 tab and copy the clientId. Put it into config.lua
7. Go to the bot tab, fill out the required fields and copy the token, and put it into config.lua. Don't lose it or share it with anyone. Disable 'Public Bot'.
8. Enable all the `Privileged Gateway Intents` in the bot tab.
9. Now you need the Ids of your server, and the confession channel of that server. Enable developer mode on discord, then right click the server and click `Copy Server Id`. Paste it into config.lua. Then do the same with the confession channel, click `Copy Channel Id` and paste it into config.lua.
10. Now you're ready to add the bot. To do that, go back to the installation tab, coppy the `Install Link` and paste it into your browser, and add it to your server.
11. To run the bot on windows, simple run `run.bat`. On other operating systems, use your command terminal in the bot directory and run ` luvit main.lua`
