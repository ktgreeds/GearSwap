function get_sets()
    mote_include_version = 2    
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["エフラックス"]       = buffactive["エフラックス"] or false
    state.Buff["エンチェーンメント"] = buffactive["エンチェーンメント"] or false
    state.Buff["コンバージェンス"]   = buffactive["コンバージェンス"] or false
    state.Buff["ディフュージョン"]   = buffactive["ディフュージョン"] or false
    state.Buff["ブルーチェーン"]     = buffactive["ブルーチェーン"] or false
    state.Buff["ブルーバースト"]     = buffactive["ブルーバースト"] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Tizona','Naegling','Maxentius','QutrubKnife'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'SakpatasSword'}
    
    -- gs c cycle TreasureHunter
    state.TreasureHunter = M(false, 'TreasureHunter')
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '青魔法' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    end
    if state.TreasureHunter.value then
        equip(sets.TreasureHunter)
    end
end