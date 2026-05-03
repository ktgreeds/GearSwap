function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'HeishiShorinken','Malevolence'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Tsuru'}
end
