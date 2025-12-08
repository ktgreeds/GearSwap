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
    state.HybridMode:options('Normal', 'KnockBack')
    
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

function customize_idle_set(idleSet)
    if state.SubWeapons.value == "Duban" then
        idleSet = idleSet
    else
        idleSet = set_combine(idleSet,sets.idle.Magical)
    end
    
    return idleSet
end

function user_customize_melee_set(meleeSet)
    if state.SubWeapons.value == "Duban" then
        meleeSet = set_combine(meleeSet,sets.engaged)
    else
        meleeSet = set_combine(meleeSet,sets.engaged.Magical)
    end
    
    if state.HybridMode.value == "KnockBack" then
        meleeSet = set_combine(meleeSet,sets.engaged.KnockBack)
    end
    return meleeSet
end
