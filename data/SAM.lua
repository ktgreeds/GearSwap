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
    state.OffenseMode:options('Normal', 'SubtleBlow')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal', 'Hasso', 'Seigan')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'DojikiriYasutsuna','ShiningOne'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'UtuGrip','Khonsu'}
end


function job_buff_change(buff, gain)
    if buff == '八双' and gain then
        send_command('gs c set HybridMode Hasso')
 
    elseif buff == '星眼' and gain then
        send_command('gs c set HybridMode Seigan')

    elseif not state.Buff['八双'] and not state.Buff['星眼'] then
        send_command('gs c set HybridMode Normal')
    end

    if buff == '心眼' then
        IdleMelee()
    end
end


function user_customize_melee_set(meleeSet)
    if state.Buff['心眼'] then
        meleeSet =set_combine(meleeSet,sets.buff['心眼'] )
    end
    return meleeSet
end
