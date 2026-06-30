function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    --buff
    state.Buff['トリプルショット']  = buffactive['トリプルショット'] or false

    --state
    state.OffenseMode:options('Normal','SubtleBlow','ACC')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.RangedMode:options('Normal','SubtleBlow','Critical')
    state.MainWeapons       = M{'ロスタムA','ロスタムB','ネイグリング'}
    state.SubWeapons        = M{'ヌスクシールド','グレティナイフ','クレパスクラナイフ'}
    state.RangeWeapons      = M{'フォーマルハウト','デスペナルティ','アナーキー'}
    state.LuzafsRing        = M(true)
    state.ShortRole         = M(false)
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
    if player.equipment.ammo == gear['ホクスボクブレット'].name or player.equipment.ammo == gear['アニミキーブレット'].name then --誤射防止
        equip({ammo=empty})
    
    elseif spell.action_type == 'Ranged Attack' then --遠隔攻撃
        if res.items[get_item_id_by_name(player.equipment.range)]["range_type"] == "Gun" then
            equip({ammo = gear.GunPhysics})
        end
    
    elseif spell.type == 'CorsairRoll' then --ロール
        if state.LuzafsRing.value then
            equip({left_ring=gear['ルザフリング']})
        end
    end
end


function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.name == 'レデンサリュート' then
        equip(get_hachirin(spell.element))
    
    elseif spell.type == 'CorsairRoll' then
        --確実にロスタムCで実行
        if not buffactive[spell.name] then
            equip({main = gear['ロスタムC']})
        end

    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Ranged Attack' and spell.action_type ~= 'WeaponsSkill' then
        if state.Buff['トリプルショット'] then
            equip(sets.buff['トリプルショット'])
        end
    end
end


function job_post_aftercast(spell, action, spellMap, eventArgs)
    --誤射防止
    if player.equipment.ammo == gear['ホクスボクブレット'].name or player.equipment.ammo == gear['アニミキーブレット'].name then
        equip({ammo=empty})
    end
end


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
    RangeSubtleBlowChange(stateField,newValue,oldValue)
end


function RangeSubtleBlowChange(stateField,  newValue, oldValue)
    if stateField == 'Offense Mode' then
        if state.WeaponskillMode.value ~= 'SubtleBlow' and newValue == 'SubtleBlow' then
            send_command('gs c set RangedMode SubtleBlow')
        elseif state.WeaponskillMode.value == 'SubtleBlow' and newValue ~= 'SubtleBlow' then
            send_command('gs c set RangedMode Normal')
        end
    end
end