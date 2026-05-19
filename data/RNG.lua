function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['ダブルショット']  = buffactive['ダブルショット'] or false
    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons       = M{'ネイグリング','ペルーン','マレヴォレンス'}
    state.SubWeapons        = M{'クレパスクラナイフ','ヌスクシールド'}
    state.RangeWeapons      = M{'フォーマルハウト','板額の弓','スパロウホーク','ライトクロスボウ'}
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
    if player.equipment.ammo == gear['ホクスボクアロー'].name 
    or player.equipment.ammo == gear['ホクスボクブレット'].name then
        send_command('input /equip ammo')
    end

    if spell.action_type == 'Ranged Attack' then
        if res.items[get_item_id_by_name(player.equipment.range)]["range_type"] == "Gun" then
            equip({ammo = gear.GunPhysics})
        elseif res.items[get_item_id_by_name(player.equipment.range)]["range_type"] == "Bow" then
            equip({ammo = gear.BowPhysics})
        elseif res.items[get_item_id_by_name(player.equipment.range)]["range_type"] == "Crossbow" then
            equip({ammo = gear.CrossbowPhysics})
        end
    elseif spell.name == 'サベッジブレード' then
        equip({ammo=gear['ホクスボクアロー']})
    elseif spell.name == 'イオリアンエッジ' then
        equip({ammo=gear['ホクスボクブレット']})
    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' and 
        spell.action_type ~= 'WeaponsSkill' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
    elseif spell.name == 'トゥルーフライト' 
        or spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end

end


function job_post_aftercast(spell, action, spellMap, eventArgs)
    --誤射防止
    if spell.name == 'サベッジブレード' 
    or spell.name == 'イオリアンエッジ' then
        send_command('input /equip ammo')
    end
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end