function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    include('Mote-TreasureHunter')

    state.Buff['不意打ち'] = buffactive['不意打ち'] or false
    state.Buff['だまし討ち'] = buffactive['だまし討ち'] or false
    state.Buff['フェイント'] = buffactive['フェイント'] or false
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Multi')
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
        
    -- gs c cycle MainWeapons
    state.MainWeapons = M{'Gandring','Tauret'}

    -- gs c cycle SubWeapons
    state.SubWeapons  = M{'Tauret','Aeneas','Acrontica'}
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.name == 'スリプガ' then
        equip(sets.TreasureHunter)
    elseif spell.name == 'ポイゾガ' then
        equip(sets.TreasureHunter)
    elseif spell.name == 'アブゾタック' then
        equip(sets.TreasureHunter)
    elseif spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end
end


function job_buff_change(buff, gain)
    if buff == "不意打ち" then
        if gain then
            equip(sets.buff['不意打ち'])
            disable('hands')
        else
            enable('hands')
            IdleMelee()
        end
    elseif buff == "だまし討ち" then
        if gain then
            equip(sets.buff['だまし討ち'])
            disable('body')
        else
            enable('body')
            IdleMelee()
        end
    end
end