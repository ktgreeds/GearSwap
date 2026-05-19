function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff['八双'] = buffactive['八双'] or false
    state.Buff['星眼'] = buffactive['星眼'] or false
    state.Buff['心眼'] = buffactive['心眼'] or false
    state.OffenseMode:options('Normal','SubtleBlow','HoxneAmpulla')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'童子切安綱','シャイニングワン'}
    state.SubWeapons    = M{'ウトゥグリップ'}
    state.Increased     = M(true)
    state.HoxneAmpulla  = M(false)
end


function job_customize_melee_set(meleeSet)
    if state.Buff['八双'] then
        meleeSet = set_combine(meleeSet,sets.buff['八双'] )
    elseif state.Buff['星眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['星眼'] )
    end
    if state.Buff['心眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['心眼'] )
    end
    return meleeSet
end 


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField, newValue, oldValue)
end
