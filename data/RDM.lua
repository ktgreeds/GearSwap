function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','Enn')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons   = M{'クロセアモースC','ネイグリング','マクセンチアス','トーレット','クトゥルブナイフ'}
    state.SubWeapons    = M{'玄冥盾','クレパスクラナイフ','マレヴォレンス','デイブレイクワンド','幽世の短剣'}
end


function job_customize_melee_set(meleeSet)
    if state.OffenseMode.value=='Enn' then
        meleeSet = sets.engaged.Enn
    end
    return meleeSet
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '弱体魔法' then
        if string.find(spell.name, 'スリプ') or spell.name == 'ブレイク' or spell.name == 'バインド' then
            equip(sets.midcast.EnfeeblingEffectInt)

        elseif spell.name == 'サイレス' then
            equip(sets.midcast.EnfeeblingEffectMnd)
        elseif spell.name == 'ディアIII' then
            equip(sets.TreasureHunter)
        else
            equip(sets.midcast['弱体魔法'])
        end

    elseif spell.skill == '強化魔法' then
         if spell.target.type == 'SELF' then
            if spellMap == 'Temper' or spellMap == 'EnSpell' then
                equip(set_combine(sets.midcast['強化魔法スキル']))
            end
        else
            equip(sets.midcast['強化魔法'].Other)
            if spellMap == 'Refresh' then
                equip(set_combine(sets.midcast['強化魔法'].Other ,sets.midcast.Refresh))   
            end
        end
        
    elseif spell.skill == '精霊魔法' then
        equip(get_hachirin(spell.element))
        
    elseif spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end
end

function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField,  newValue, oldValue)
end