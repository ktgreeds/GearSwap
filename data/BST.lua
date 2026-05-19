function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'アンクサアクス','ドリケナス','ネイグリング','真オニオンソード','トーレット'}
    state.SubWeapons    = M{'クレパスクラナイフ','マレヴォレンス','アダパシールド'}
end

function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end
