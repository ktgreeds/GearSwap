function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['神聖の印']      = buffactive['神聖の印'] or false

    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'ブルトガング','マレヴォレンス'}
    state.SubWeapons    = M{'ドゥバン','イージス'}
    state.Increased     = M(false)
    state.KnockBack     = M(false)
    
    send_command('bind ~7 gs c cycle SubWeapons')
end


function user_unload()
    send_command('bind ~7 gs c cycle OffenseMode')
end


function job_customize_idle_set(idleSet)
    if state.SubWeapons.value == "ドゥバン" then
        idleSet = idleSet
    else
        idleSet = set_combine(idleSet,sets.idle.Magical)
    end
    
    return idleSet
end


function job_customize_melee_set(meleeSet)
    if state.SubWeapons.value == "ドゥバン" then
        meleeSet = set_combine(meleeSet,sets.engaged)
    else
        meleeSet = set_combine(meleeSet,sets.engaged.Magical)
    end
    
    if state.KnockBack.value then
        meleeSet = set_combine(meleeSet,sets.KnockBack)
    end
    return meleeSet
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end