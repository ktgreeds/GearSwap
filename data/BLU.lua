function get_sets()
    mote_include_version = 2    
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["エフラックス"]       = buffactive["エフラックス"] or false
    state.Buff["エンチェーンメント"] = buffactive["エンチェーンメント"] or false
    state.Buff["コンバージェンス"]   = buffactive["コンバージェンス"] or false
    state.Buff["ディフュージョン"]   = buffactive["ディフュージョン"] or false
    state.Buff["ブルーチェーン"]     = buffactive["ブルーチェーン"] or false
    state.Buff["ブルーバースト"]     = buffactive["ブルーバースト"] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Kiting','Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','LockWeapons')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Tizona','Naegling','Maxentius','QutrubKnife'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'SakpatasSword'}
    
    -- gs c cycle TreasureHunter
    state.TreasureHunter = M(false)
    -- gs c cycle LockWeapons
    state.LockWeapons = M(false)

    state.Kiting = M(true)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '青魔法' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    end

    if string.find(spell.type, 'Magic') then
        local fc=80/100
        if player.sub_job == '赤' then
            fc = fc + 15/100
        end
        if fc >= 80/100 then
            fc = 80/100
        end

        equip(sets.midcast.interruption)
        local adjust=0.8
        local cast_time = (spell.cast_time*(1-fc))*adjust

        if spellMap == 'BlueMagical' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueMagical')

        elseif spellMap == 'BlueMagicAcc' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueMagicAcc')

        elseif spellMap == 'BlueHealing' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueHealing')

        elseif spellMap == 'BlueBuff' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.BlueBuff')
        
        elseif spell.name== 'アクアベール' then
            eventArgs.handled = true
            send_command('wait '..cast_time..'; gs equip sets.midcast.Aquaveil')        
        end
    end

    if state.TreasureHunter.value then
        equip(sets.TreasureHunter)
    end
end

function customize_idle_set(idleSet)
    idleSet = set_combine(idleSet, {main=gear.Nehushtan,sub=gear.Nehushtan})
    return idleSet
end

function user_customize_melee_set(meleeSet)

    return meleeSet
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            enable('main','sub')
        else
            equip({main=gear.Tizona,sub=gear.SakpatasSword})
            disable('main','sub')
        end
    end
end

function job_buff_change(buff, gain)
    if player.status == 'Idle'then
        if buff == "とんずら" and gain then 
            send_command('gs c set Kiting false')
        else
            if not state.Kiting.value and not buffactive['とんずら'] then
                send_command('gs c set  Kiting true')
            end
        end
    else
        send_command('gs c set Kiting false')
    end
end
