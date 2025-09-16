function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal', 'SubtleBlow')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal','Hasso','Seigan','ThirdEye')

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
            send_command('gs c set HybridMode Hasso')
        else 
            send_command('gs c set HybridMode Normal')
        end

    elseif buff == '星眼' then
        if gain then
            send_command('gs c set HybridMode Seigan')
        else 
            send_command('gs c set HybridMode Normal')
        end
        
    elseif buff == '心眼' then
        if gain then
            send_command('gs c set HybridMode ThirdEye')
        else
            send_command('gs c set HybridMode Normal')
        end
    end
end