local Tunnel = module("vrp","lib/Tunnel")
local Proxy = module("vrp","lib/Proxy")

vRPclient = Tunnel.getInterface("vRP")
dallas = {}
Tunnel.bindInterface("Wall",dallas)
Proxy.addInterface("Wall",dallas)
vRP = Proxy.getInterface("vRP")

Config = {}

-----------------------------------------------------------------------------------------------------------------------------------------
-- GET USER ID AND STEAMHEX
-----------------------------------------------------------------------------------------------------------------------------------------	
function dallas.getId(sourceplayer)
    local sourceplayer = sourceplayer
	if sourceplayer ~= nil and sourceplayer ~= 0 then
		local user_id = vRP.getUserId(sourceplayer)
		if user_id then
			return user_id
		end
	end
end

-----------------------------------------------------------------------------------------------------------------------------------------
-- USER PERMISSION
-----------------------------------------------------------------------------------------------------------------------------------------	

function dallas.getPermissao(toogle)
    local source = source
    local user_id = vRP.getUserId(source)
    if vRP.hasPermission(user_id,Config.permissaoesp) then
        return true
    else
        return false
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--Webhook (LINES)
-----------------------------------------------------------------------------------------------------------------------------------------
function dallas.reportlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
        PerformHttpRequest(Config.webhooklines, function(err, text, headers) end, 'POST', json.encode({username = ' MiamiRP-AC ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``ativou`` o /lines**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },
                        {
							name = "**LOCALIZAÇÃO:**\n",
							value = "**"..x..", "..y..", "..z.."**"
                        }, 
                        {                        
							name = "``MiamiRP-AC``\n",
							value = "``MiamiRP-AC``"
						}
                    }, 
                    footer = { 
                        text = "MiamiRP-AC | "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
                    },
                    color = 0001
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function dallas.reportunlinesLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
        PerformHttpRequest(Config.webhooklines, function(err, text, headers) end, 'POST', json.encode({username = ' MiamiRP-AC ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``desativou`` o /lines**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },
                        {
							name = "**LOCALIZAÇÃO:**\n",
							value = "**"..x..", "..y..", "..z.."**"
                        },
                        {                        
							name = "``MiamiRP-AC``\n",
							value = "``MiamiRP-AC``"
						}
                    }, 
                    footer = { 
                        text = "MiamiRP-AC | "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
                    },
                    color = 3093194 
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

-----------------------------------------------------------------------------------------------------------------------------------------
--Webhook (WALL)
-----------------------------------------------------------------------------------------------------------------------------------------
function dallas.reportwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
        PerformHttpRequest(Config.webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' MiamiRP-AC ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``ativou`` o /Wall**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },
                        {
							name = "**LOCALIZAÇÃO:**\n",
							value = "**"..x..", "..y..", "..z.."**"
                        },
                        {                        
							name = "``MiamiRP-AC``\n",
							value = "``MiamiRP-AC``"
						}
                    }, 
                    footer = { 
                        text = "MiamiRP-AC | "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end

function dallas.reportunwallLog(toggle)
	local source = source
	local user_id = vRP.getUserId(source)
	local identity = vRP.getUserIdentity(user_id)
	local x,y,z = vRPclient.getPosition(source)
	if user_id then
        local imageurl = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
        PerformHttpRequest(Config.webhookwall, function(err, text, headers) end, 'POST', json.encode({username = ' MiamiRP-AC ', avatar_url = imageurl, embeds = {
                { 	------------------------------------------------------------
                    title = "**Um administrador ``desativou`` o /Wall**",
                    fields = {
                        { 
                            name = "**ID do Administrador:\n**",
                            value = "**"..identity.name.." "..identity.firstname.." ["..user_id.."]**"
                        },
                        {
							name = "**LOCALIZAÇÃO:**\n",
							value = "**"..x..", "..y..", "..z.."**"
                        },
                        {                        
							name = "``MiamiRP-AC``\n",
							value = "``MiamiRP-AC``"
						}
                    }, 
                    footer = { 
                        text = "MiamiRP-AC | "..os.date("%d/%m/%Y | %H:%M:%S"),
                        icon_url = "https://media.discordapp.net/attachments/1030639079768997949/1059538154752856204/logoback2.png?width=675&height=675"
                    },
                    color = 1286027
                }
            }
        }), { ['Content-Type'] = 'application/json' })
    end
end


print("^2 Wall foi iniciado! Script autenticado")