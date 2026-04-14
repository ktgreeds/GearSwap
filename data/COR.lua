function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    --buff
    state.Buff['トリプルショット']  = buffactive['トリプルショット'] or false
    
    --state
    state.OffenseMode:options('Normal','ACC','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.RangedMode:options('Normal','SubtleBlow','Critical')
    state.MainWeapons       = M{'RostamA','RostamB','Naegling'}
    state.SubWeapons        = M{'NuskuShield','GletisKnife','Tauret'}
    state.RangeWeapons      = M{'Fomalhaut','DeathPenalty','TPBonus','HoxneAmpulla',}
    state.LuzafsRing        = M(true)
    state.ShortRole         = M(false)
    
    define_roll_values()--ロール情報
end



local res = require('resources')
function get_item_id_by_name(name)
    for id, item in pairs(res.items) do
        if item and item.name == name then
            return id
        end
    end
    return nil
end



function job_post_pretarget(spell, action, spellMap, eventArgs)
    --誤射防止
    if player.equipment.ammo == gear.HauksbokBullet.name or player.equipment.ammo == gear.AnimikiiBullet.name then
        equip({ammo=empty})
    end

    --遠隔攻撃
    if spell.action_type == 'Ranged Attack' then
        if res.items[get_item_id_by_name(player.equipment.range)]["range_type"] == "Gun" then
            equip({ammo = gear.GunPhysics})
        end
    end

    --ロール
    if spell.type == 'CorsairRoll' then
        display_roll_info(spell)
        if state.LuzafsRing.value then
            equip({left_ring=gear.LuzafsRing})
        end
    end
end



function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'レデンサリュート' 
    or spell.name == 'イオリアンエッジ' then
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
