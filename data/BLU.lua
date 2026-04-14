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
    state.OffenseMode:options('Normal','SubtleBlow','LockWeapons')
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Tizona','Naegling','Maxentius'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'SakpatasSword'}
    
    -- gs c cycle TreasureHunter
    state.TreasureHunter = M(false)

    -- gs c cycle LockWeapons
    state.LockWeapons = M(false)
end



function job_buff_change(buff, gain)
    if state.Buff['エンチャント'] then
        state.CombatForm:set('エンチャント')
        disable('range','ammo')
    elseif not state.Buff['エンチャント']  then
        enable('range','ammo')
    end
    IdleMelee()
end
