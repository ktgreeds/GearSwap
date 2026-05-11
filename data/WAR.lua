function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['バーサク']              = buffactive['バーサク'] or false
    state.Buff['ディフェンダー']        = buffactive['ディフェンダー'] or false
    state.Buff['リタリエーション']      = buffactive['リタリエーション'] or false
    state.Buff['ウォリアーチャージ']    = buffactive['ウォリアーチャージ'] or false
    state.Buff['リストレント']          = buffactive['リストレント'] or false


    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'ShiningOne'}
    state.SubWeapons    = M{'UtuGrip'}
    state.Increased     = M(true)
end


function job_state_change(stateField,  newValue, oldValue)
    SubtleBlowChange(stateField,newValue,oldValue)
end