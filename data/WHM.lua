function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["魔力の泉"]       = buffactive["魔力の泉"] or false
    state.Buff["マナウォール"]   = buffactive["マナウォール"] or false
    
    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    --gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'QuellerRod'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'ArchdukesShield'}
    
end


