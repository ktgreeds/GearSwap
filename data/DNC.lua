function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["C.フラリッシュ"]       = buffactive["C.フラリッシュ"] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')
    
     -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Parry')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons = M{'CrepuscularKnife','Tauret','OnionSword'}

    -- gs c cycle SubWeapons
    state.SubWeapons  = M{'CrepuscularKnife','TernionDagger','Acrontica','TPBonus'}
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end

    if spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end
end


function job_buff_change(buff, gain)
    if buff == '扇の舞い' and gain then
        send_command('gs c set HybridMode Parry')

    elseif buff == '扇の舞い' and not gain then
        send_command('gs c set HybridMode Normal')
    end
end