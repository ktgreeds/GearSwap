function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['ファストキャスト'] = buffactive['ファストキャスト'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Stp')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Parry','KnockBack')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Epeolatry'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Khonsu','AlberStrap'}
end


function job_post_midcast(spell, action, spellMap, eventArgs) 
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end

    if string.find(spell.type, 'Magic') then
        local fc=70/100 --自信のFCを左辺にセット
        if buffactive['ファストキャスト'] then
            --フサルクトラウザ装備時メリポのインスパイア1につき+12％
            fc = fc + 12/100 --インスパイア1
            --fc = fc + 24/100 --インスパイア2
            --fc = fc + 36/100 --インスパイア3
            --fc = fc + 48/100 --インスパイア4
            --fc = fc + 60/100 --インスパイア5
        end
        if player.sub_job == '赤' then
            fc = fc + 15/100
        end
        if fc >= 80/100 then
            fc = 80/100
        end

        equip(sets.midcast.interruption)
        local adjust=0.9
        local cast_time = (spell.cast_time*(1-fc))*adjust    
        
        if spellMap == 'Cure' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Cure')

        elseif spellMap == 'Phalanx' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Phalanx')

        elseif spell.name == 'ストンスキン' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Stoneskin')

        elseif spellMap == 'Regen' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Regen')

        elseif spell.skill == '強化魔法' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.EnhancingMagic')
        else
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.Enmity')
        end
    end
end


function job_buff_change(buff, gain)
    if buff == 'バットゥタ' then
        if gain then
            send_command('gs c set HybridMode Parry')
        else
            send_command('gs c set HybridMode Normal')
        end

    elseif buff == 'エンボルド' then
        if gain then
            equip(sets.buff['エンボルド'])
            disable('back')
        else
            enable('back')
            IdleMelee()
        end
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'RuneText' then
        if newValue then
            showTextRune()
        else
            hideTextRune()
        end
    end
end


