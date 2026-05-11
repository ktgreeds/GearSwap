function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['猫足立ち']          = buffactive['猫足立ち'] or false
    state.Buff['絶対カウンター']    = buffactive['絶対カウンター'] or false
    state.Buff['インピタス']        = buffactive['インピタス'] or false


    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'Godhands'}
    state.Increased     = M(true)
end


function job_state_change(stateField,  newValue, oldValue)
    SubtleBlowChange(stateField,newValue,oldValue)
end