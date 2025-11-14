function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['神聖の印']      = buffactive['神聖の印'] or false

    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Multi', 'KnockBack')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Burtgang','Malevolence'}

    -- gs c cycle SubWeapons
    state.SubWeapons   = M{'Duban','Aegis'}

    send_command('bind ~F7 gs c cycle SubWeapons')
end


function user_unload()
    send_command('bind ~F7 gs c cycle OffenseMode')
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

        eventArgs.handled = true
        equip(sets.midcast.interruption)

        local adjust=0.07
        local cast_time = (spell.cast_time*(1-fc))-adjust
        if spellMap == 'Cure' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.Cure')

        elseif spell.name == 'フラッシュ' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('フラッシュ')..']')

        elseif spellMap == 'Banish' then
            --バニシュは詠唱中断のまま

        elseif spellMap == 'Phalanx' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('ファランクス')..']')
            
        elseif spellMap == 'Protect' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.Protect')
            
        elseif spellMap == 'Shell' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.Shell')

        elseif spellMap == 'Regen' then
            send_command('wait '..cast_time..'; gs equip sets.midcast.Regen')

        elseif spell.name == 'ストンスキン' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('ストンスキン')..']')

        elseif spell.name == 'フォイル' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('フォイル')..']')

        elseif spell.skill == '強化魔法' then
            send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis('強化魔法')..']')

        else
            send_command('wait '..cast_time..'; gs equip sets.Enmity')
        end
    end
end

function customize_idle_set(idleSet)
    if state.SubWeapons.value == "Duban" then
        idleSet = idleSet
    else
        idleSet = set_combine(idleSet,sets.idle.Magical)
    end
    
    return idleSet
end

function user_customize_melee_set(meleeSet)
    if state.HybridMode.value == "Multi" then
        meleeSet = meleeSet

    elseif state.SubWeapons.value == "Duban" then
        meleeSet = set_combine(meleeSet,sets.engaged.Physical)
    else
        meleeSet = set_combine(meleeSet,sets.engaged.Magical)
    end
    
    if state.HybridMode.value == "KnockBack" then
        meleeSet = set_combine(meleeSet,sets.engaged.KnockBack)
    end
    return meleeSet
end
