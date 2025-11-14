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
    state.OffenseMode:options('Normal','LockWeapons')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Tizona','Naegling','Maxentius','QutrubKnife'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'SakpatasSword'}
    
    -- gs c cycle TreasureHunter
    state.TreasureHunter = M(false)

    -- gs c cycle LockWeapons
    state.LockWeapons = M(false)
end

function job_post_precast(spell, action, spellMap, eventArgs)
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    Interruption(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
    end
end

function customize_idle_set(idleSet)
    idleSet = set_combine(idleSet, {main=gear.ClaidheamhSoluis,sub=gear.Nehushtan})
    return idleSet
end

function user_customize_melee_set(meleeSet)
    return meleeSet
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            enable('main','sub')
        else
            equip({main=gear.Tizona,sub=gear.SakpatasSword})
            disable('main','sub')
        end
    end
end
