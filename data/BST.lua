function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','SubtleBlow')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'AnkusaAxe','Dolichenus','Naegling','OnionSword','Tauret'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'KrakenClub','CrepuscularKnife','Malevolence','AdapaShield'}
end

function job_status_change(new,old)
    if new == "Engaged" then
       send_command("wait 1;input /pet "..windower.to_shift_jis('たたかえ').." <t>;wait 1;input /pet "..windower.to_shift_jis('きばれ').. " <me>")
    end
end

local race_names = {
    [1] = "Human/Hume",
    [2] = "Elvaan", 
    [3] = "Tarutaru",
    [4] = "Mithra",
    [5] = "Galka",
    [6] = "Beastman",
    [7] = "Beast",
    [8] = "Undead",
    [9] = "Lizard",
    [10] = "Vermin",
    [11] = "Plantoid",
    [12] = "Aquan",
    [13] = "Amorph",
    [14] = "Flying",
    [15] = "Dragon",
    [16] = "Demon",
    [17] = "Empty",
    [18] = "Humanoid",
    [19] = "Lumorian",
    [20] = "Luminion",
    [21] = "Arcana"
}

