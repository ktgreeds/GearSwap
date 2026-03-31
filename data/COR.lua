function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['トリプルショット']  = buffactive['トリプルショット'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','ACC','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal','SubtleBlow')

    -- gs c cycle RangedMode
    state.RangedMode:options('Normal','SubtleBlow','Critical')

    -- gs c cycle MainWeapons
    state.MainWeapons       = M{'RostamA','RostamB','Naegling'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons        = M{'NuskuShield','GletisKnife','Tauret'}
    
    -- gs c cycle RangeWeapons
    state.RangeWeapons      = M{'Fomalhaut','DeathPenalty','TPBonus','HoxneAmpulla',}

    -- gs c cycle LuzafsRing
    state.LuzafsRing        = M(true)

    -- gs c cycle ShortRole
    state.ShortRole         = M(false)

end


function job_post_pretarget(spell, action, spellMap, eventArgs)
    --誤射防止
    if player.equipment.ammo == gear.HauksbokBullet.name or player.equipment.ammo == gear.AnimikiiBullet.name then
        equip({ammo=empty})
    end

    --遠隔攻撃
    if spell.action_type == 'Ranged Attack' then
        equip({ammo=gear.MarksmanshipPhysics})
    end

    --ロール
    if spell.type == 'CorsairRoll' then
        if state.LuzafsRing.value then
            equip({left_ring=gear.LuzafsRing})
        end

    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'レデンサリュート' or spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end

    if spell.type == 'CorsairRoll' then
        --確実にロスタムCで実行
        if not buffactive[spell.name] then
            equip({main = gear.RostamC})
        end

        --ショートロール用
        if state.ShortRole.value then
            equip(sets.precast.CorsairRoll.short)
        end
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' then
        if state.Buff['トリプルショット'] then
            equip(sets.buff['トリプルショット'])
        end
    end
end


function job_post_aftercast(spell, action, spellMap, eventArgs)
    --誤射防止
    if player.equipment.ammo == gear.HauksbokBullet.name or player.equipment.ammo == gear.AnimikiiBullet.name then
        equip({ammo=empty})
    end
end


function customize_idle_set(idleSet)
    return set_combine(idleSet,customize_weapon_set())
end


function user_customize_melee_set(meleeSet)
    return set_combine(meleeSet,customize_weapon_set())
end


function customize_weapon_set()
    if state.MainWeapons.value == 'Naegling' then
        return {range=gear.TPBonus}
    end
end

function job_state_change(stateField,  newValue, oldValue)
    if stateField == 'Offense Mode' then
        if state.WeaponskillMode.value ~= 'SubtleBlow' and newValue == 'SubtleBlow' then
            send_command('gs c set WeaponskillMode SubtleBlow')        
        elseif state.WeaponskillMode.value == 'SubtleBlow' and newValue ~= 'SubtleBlow' then
            send_command('gs c set WeaponskillMode Normal')        
        end
    end
end
