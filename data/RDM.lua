function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['エンストーン']  = buffactive['エンストーン'] or false
    
    -- gs c cycle IdleMode
    state.IdleMode:options('Normal')

    -- gs c cycle OffenseMode
    state.OffenseMode:options('Normal','Enn','SubtleBlow')
    
    -- gs c cycle HybridMode
    state.HybridMode:options('Normal')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons = M{'CroceaC','Naegling','Maxentius','Tauret','QutrubKnife'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons = M{'CrepuscularKnife','Malevolence','EtherealDagger','Genbu'}
end


function customize_melee_set(meleeSet)
    if state.OffenseMode.value=='Enn' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                meleeSet = set_combine(meleeSet,sets.buff[buff])
            end
        end
    end
    return meleeSet
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '弱体魔法' then
        if string.find(spell.name, 'スリプ') or spell.name == 'ブレイク' or spell.name == 'バインド' then
            equip(sets.midcast.EnfeeblingEffectInt)

        elseif spell.name == 'サイレス' then
            equip(sets.midcast.EnfeeblingEffectMnd)

        else
            equip(sets.midcast['弱体魔法'])
        end

    elseif spell.skill == '強化魔法' then
         if spell.target.type == 'SELF' then
            if spellMap == 'Temper' or spellMap == 'EnSpell' then
                equip(set_combine(sets.midcast.EnhancingSkill))

            elseif spellMap == 'Refresh' then
                equip(sets.midcast.Refresh)

            elseif spell.name == 'ストンスキン' then
                equip(sets.midcast['ストンスキン'])

            elseif spell.name== 'アクアベール' then
                equip(sets.midcast['アクアベール'])

            else
                equip(sets.midcast['強化魔法'] )
            end
        else
            equip(sets.midcast['強化魔法'].Other)
            if spellMap == 'Refresh' then
                equip(set_combine(sets.midcast['強化魔法'].Other ,sets.midcast.Refresh))   
            end
        end
        
    elseif spell.skill == '精霊魔法' then
        equip(get_hachirin(spell.element))

    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
        
    elseif spell.name == 'イオリアンエッジ' then
        equip(get_hachirin(spell.element))
    end
end
