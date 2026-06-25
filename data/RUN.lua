function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['バットゥタ'] = buffactive['バットゥタ'] or false
    state.IdleMode:options('Normal','Refresh')
    state.OffenseMode:options('Normal','Stp')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'エピオラトリー','ライカーゴス'}
    state.SubWeapons    = M{'アルバーストラップ'}
    state.Increased     = M(false)
    state.KnockBack     = M(false)
end


function job_customize_melee_set(meleeSet)
    if state.Buff['バットゥタ'] then
        meleeSet = set_combine(meleeSet,sets.buff['バットゥタ'] )
    end
    if state.KnockBack.value then
        meleeSet = set_combine(meleeSet,sets.KnockBack)
    end
    return meleeSet
end 


function job_buff_change(buff, gain)
    if buff == 'エンボルド' then
        if gain then
            equip(sets.buff['エンボルド'])
            disable('back')
        else
            enable('back')
            IdleMelee()
        end
    end
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end