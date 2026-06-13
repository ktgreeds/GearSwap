function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    include('Mote-TreasureHunter')

    state.Buff['不意打ち'] = buffactive['不意打ち'] or false
    state.Buff['だまし討ち'] = buffactive['だまし討ち'] or false
    state.Buff['フェイント'] = buffactive['フェイント'] or false
    
    state.OffenseMode:options('Normal','Multi')
    state.IdleMode:options('Normal','Refresh')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons = M{'ガンドリング','エーネアス'}
    state.SubWeapons  = M{'アクロンティカ','トーレット','エーネアス'}
    state.TreasureHunter = M(true)
end

function job_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if state.Buff['不意打ち'] then
            equip(sets.buff['不意打ち'])
        elseif state.Buff['だまし討ち'] then
            equip(sets.buff['だまし討ち'])
        elseif spell.name == 'イオリアンエッジ' then
            equip(get_hachirin(spell.element))
        end
    end
end
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.name == 'スリプガ' then
        equip(sets.TreasureHunter)
    elseif spell.name == 'ポイゾガ' then
        equip(sets.TreasureHunter)
    end
end