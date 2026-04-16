function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end



function job_setup()
    --buff
    state.Buff['八双'] = buffactive['八双'] or false
    state.Buff['星眼'] = buffactive['星眼'] or false
    state.Buff['心眼'] = buffactive['心眼'] or false

    --state
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons = M{'DojikiriYasutsuna','ShiningOne'}
    state.SubWeapons = M{'UtuGrip'}
    state.Increased   = M(true)
end



function user_customize_melee_set(meleeSet)
    if state.Buff['心眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['心眼'] )
    end
    return meleeSet
end 



function job_state_change(stateField,  newValue, oldValue)
    if stateField == 'Offense Mode' then
        if state.WeaponskillMode.value ~= 'SubtleBlow' and newValue == 'SubtleBlow' then
            send_command('gs c set WeaponskillMode SubtleBlow')        
        elseif state.WeaponskillMode.value == 'SubtleBlow' and newValue ~= 'SubtleBlow' then
            send_command('gs c set WeaponskillMode Normal')        
        end
    end
end



function job_buff_change(buff, gain)
    if state.Buff['八双']  and state.Buff['星眼'] then
        if buff == '八双' and gain then
            state.CombatForm:set('八双')--星眼から八双へ
        elseif buff == '星眼' and gain then
            state.CombatForm:set('星眼')--八双から星眼へ
        end
    elseif not state.Buff['八双']  and not state.Buff['星眼'] then
        state.CombatForm:reset()        --八双星眼なし
    elseif buff == '八双' and gain then
        state.CombatForm:set('八双')    --八双単発
    elseif buff == '星眼' and gain then
        state.CombatForm:set('星眼')    --星眼単発
    end
    
    if state.Buff['エンチャント'] then
        state.CombatForm:set('エンチャント')
        disable('range','ammo')
    elseif not state.Buff['エンチャント']  then
        enable('range','ammo')
    end
    IdleMelee()
end
