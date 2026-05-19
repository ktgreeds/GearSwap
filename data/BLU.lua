function get_sets()
    mote_include_version = 2    
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["エフラックス"]          = buffactive["エフラックス"] or false
    state.Buff["エンチェーンメント"]    = buffactive["エンチェーンメント"] or false
    state.Buff["コンバージェンス"]      = buffactive["コンバージェンス"] or false
    state.Buff["ディフュージョン"]      = buffactive["ディフュージョン"] or false
    state.Buff["ブルーチェーン"]        = buffactive["ブルーチェーン"] or false
    state.Buff["ブルーバースト"]        = buffactive["ブルーバースト"] or false
    
    state.IdleMode:options('Normal','Refresh')
    state.OffenseMode:options('Normal','SubtleBlow','HoxneAmpulla')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons       = M{'ティソーナ','ネイグリング','マクセンチアス'}
    state.SubWeapons        = M{'サクパタソード','ブンジロッド'}
    state.TreasureHunter    = M(false)
    state.HoxneAmpulla      = M(false)
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField, newValue, oldValue)
end