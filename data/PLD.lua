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

    --gs c cycle DefenseMode
    state.DefenseMode:options('Physical', 'Magical', 'None')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal','KnockBack')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Burtgang','Malevolence'}

    state.Kiting = M(true)

    send_command('bind ~F7 gs c cycle DefenseMode')
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


function user_customize_melee_set(meleeSet)
    if state.HybridMode.value == "KnockBack" then
        meleeSet =set_combine(meleeSet,sets.engaged.KnockBack)
    end
    return meleeSet
end

function job_buff_change(buff, gain)
    if player.status == 'Idle'then
        if buff == "とんずら" and gain then 
            send_command('gs c set Kiting false')
        else
            if not state.Kiting.value then
                send_command('gs c set  Kiting true')
            end
        end
    else
        send_command('gs c set Kiting false')
    end
end
