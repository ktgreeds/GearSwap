function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.IdleMode:options('Normal','Refresh')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'丙子椒林剣','マレヴォレンス'}
    state.SubWeapons    = M{'鶴'}
end


function job_customize_melee_set(meleeSet)
    if state.Buff["陽忍"] then
        meleeSet = set_combine(meleeSet,sets.buff['陽忍'])
    elseif state.Buff["陰忍"] then
        meleeSet = set_combine(meleeSet,sets.buff['陰忍'])
    end
    return meleeSet
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end
