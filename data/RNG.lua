function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['ダブルショット']  = buffactive['ダブルショット'] or false
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','SubtleBlow')

    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons       = M{'Perun','Naegling','Malevolence','KrakenClub'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons        = M{'CrepuscularKnife','KrakenClub','NuskuShield'}
    
    -- gs c cycle RangeWeapons
    state.RangeWeapons      = M{'Fomalhaut','Hangaku','TPBonus','Crossbow'}
    state.RangedMode        = M('Archery','Marksmanship')
end


function job_state_change(stateField,  newValue, oldValue)
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
    if player.equipment.ammo == gear.HauksbokArrow.name 
    or player.equipment.ammo == gear.HauksbokBullet.name then
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
        equip({ammo=gear.HauksbokArrow})
    elseif spell.name == 'イオリアンエッジ' then
        equip({ammo=gear.HauksbokBullet})
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
