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
    state.MainWeapons   = M{'DojikiriYasutsuna','ShiningOne'}
    state.SubWeapons    = M{'UtuGrip'}
    state.Increased     = M(true)
    state.HoxneAmpulla  = M(false)
end


function user_customize_melee_set(meleeSet)
    if state.Buff['心眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['心眼'] )
    elseif state.HoxneAmpulla then
        if state.HoxneAmpulla.value then
            equip({ammo="ホクスニアムプラ"})
            meleeSet = set_combine(meleeSet,sets.engaged.HoxneAmpulla)
            disable('ammo')
        else
            enable('ammo')
            state.CombatForm:reset()
        end
    end
    return meleeSet
end 


function job_state_change(stateField,  newValue, oldValue)
    SubtleBlowChange(stateField,newValue,oldValue)
end


function job_buff_change(buff, gain)
    if buff=='八双' then
        if gain then
            state.CombatForm:set('八双')
        else
            if not state.Buff['星眼'] then
                state.CombatForm:reset()
            end
        end
        IdleMelee()

    elseif buff=='星眼' then
        if gain then
            state.CombatForm:set('星眼')
        else
            if not state.Buff['八双'] then
                state.CombatForm:reset()
            end
        end
        IdleMelee()
    end
end
