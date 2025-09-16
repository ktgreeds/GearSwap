function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Geirrothr','ShiningOne'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'UtuGrip','Khonsu'}
end