function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["女神の愛撫"]       = buffactive["女神の愛撫"] or false
    state.Buff["女神の慈悲"]       = buffactive["女神の慈悲"] or false
    state.Buff["ハートオブソラス"]   = buffactive["ハートオブソラス"] or false
    state.Buff["ハートオブミゼリ"]   = buffactive["ハートオブミゼリ"] or false
    
    state.OffenseMode:options('Normal')
    state.IdleMode:options('Normal','Refresh')
    state.WeaponskillMode:options('Normal')
    state.MainWeapons   = M{'クェラーロッド'}
    state.SubWeapons    = M{'デュークシールド'}
end


