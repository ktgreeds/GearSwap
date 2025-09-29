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
    state.OffenseMode:options('Normal', 'Hasso', 'Seigan')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal', 'SubtleBlow', 'ThirdEye')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'DojikiriYasutsuna','ShiningOne'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'UtuGrip','Khonsu'}
end


function job_buff_change(buff, gain)
    if buff == '八双' then
        if gain then
            send_command('gs c set OffenseMode Hasso')
        else 
            send_command('gs c set OffenseMode Normal')
        end

    elseif buff == '星眼' then
        if gain then
            send_command('gs c set OffenseMode Seigan')
        else 
            send_command('gs c set OffenseMode Normal')
        end
        
    elseif buff == '心眼' then
        if gain then
            send_command('gs c set HybridMode ThirdEye')
        else
            send_command('gs c set HybridMode Normal')
        end
    end
end
