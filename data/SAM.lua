function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff['八双']      = buffactive['八双'] or false
    state.Buff['星眼']      = buffactive['星眼'] or false
    state.Buff['心眼']      = buffactive['心眼'] or false

    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal', 'Hasso', 'Seigan')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'DojikiriYasutsuna','ShiningOne'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'UtuGrip','Khonsu'}

    -- 被強化バフ
    -- gs c cycle Increased
    state.Increased    = M(true)

end


function user_customize_melee_set(meleeSet)
    if state.Buff['八双'] then
        meleeSet = set_combine(meleeSet,sets.buff['八双'] )
    elseif state.Buff['星眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['星眼'] )
    end
    
    if state.Buff['心眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['心眼'] )
    end

    if state.HoxneAmpulla.value then
        meleeSet = set_combine(sets.engaged.HoxneAmpulla)
    end
    
    return meleeSet
end
