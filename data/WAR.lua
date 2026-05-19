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
    state.OffenseMode:options('Normal','SubtleBlow','RangeHunting','HoxneAmpulla')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'マレヴォレンス','ネイグリング','ライカーゴス','ゾアノン'}
    state.SubWeapons    = M{'アダパシールド','ウトゥグリップ','ブラーシールド'}
    state.Increased     = M(true)
    state.HoxneAmpulla  = M(false)
end


function job_customize_melee_set(meleeSet)
    if state.Buff['ディフェンダー'] then
        meleeSet = set_combine(meleeSet,sets.buff['ディフェンダー'] )
    end
    return meleeSet
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField, newValue, oldValue)
end