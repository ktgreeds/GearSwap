function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["C.フラリッシュ"]       = buffactive["C.フラリッシュ"] or false
    
    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.HybridMode:options('Normal','Parry')
    state.MainWeapons = M{'クレパスクラナイフ','トーレット','真オニオンソード'}
    state.SubWeapons  = M{'クレパスクラナイフ','ターニオンダガー','アクロンティカ','フセット'}
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end


function job_customize_melee_set(meleeSet)
    if state.Buff['扇の舞い'] then
        meleeSet = set_combine(meleeSet,sets.buff['扇の舞い'] )
    elseif state.Buff['剣の舞い'] then
        meleeSet = set_combine(meleeSet,sets.buff['剣の舞い'] )
    end
    return meleeSet
end 