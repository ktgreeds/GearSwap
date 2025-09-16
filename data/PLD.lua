function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Multi')

     -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Sentinel')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Burtgang','Malevolence'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Duban','Aegis'}

    -- gs c cycle SubWeapons
    state.LowEnmity = M(false, 'LowEnmity')
end


function customize_idle_set(idleSet)
    if state.SubWeapons.value == 'Duban' then
        return set_combine(idleSet,sets.idle)
    else
        return set_combine(idleSet,sets.idle.Magical)
    end
end


function customize_melee_set(meleeSet)
    if state.OffenseMode.value == 'Multi'then
        return set_combine(meleeSet,sets.engaged)
    elseif state.SubWeapons.value == 'Duban' then
        return set_combine(meleeSet,sets.engaged.Physical)
    else
        return set_combine(meleeSet,sets.engaged.Magical)
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs) 
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end

    if string.find(spell.type, 'Magic') then
        local fc=73/100
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

        elseif spell.name == 'フラッシュ' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Flash')

        else
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.Enmity')
        end
    end
end
 

function job_buff_change(buff, gain)
    if buff == 'センチネル' then
        if gain then
            equip(sets.buff['センチネル'])
            disable('feet') 
        else
            enable('feet')
            IdleMelee()
        end

    elseif buff == '神聖の印' then
        if gain then
            equip(sets.buff['神聖の印'])
            disable('feet') 
        else
            enable('feet')
            IdleMelee()
        end
    end
end