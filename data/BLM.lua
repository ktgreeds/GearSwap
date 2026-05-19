function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["魔力の泉"]       = buffactive["魔力の泉"] or false
    state.Buff["マナウォール"]   = buffactive["マナウォール"] or false
    state.IdleMode:options('Normal','Refresh')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons   = M{'ブンジロッド','マランスタッフ'}
    state.SubWeapons    = M{'アムラピシールド','エンキストラップ'}
    state.MPsavings     = M(true)
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == '精霊魔法' then
        if not state.Buff["魔力の泉"] then
            if state.MPsavings.value and spell.name ~= "インパクト" then
                equip(sets.midcast['精霊魔法'].MPsavings)
            end
        end
        if weakmagic:contains(spell.japanese) then
            equip(sets.midcast['精霊魔法'].weak)
        end
        equip(get_hachirin(spell.element))
    end
end


function job_buff_change(buff, gain)
    if buff == "マナウォール" then
        if gain or state.Buff["マナウォール"] then
            equip(sets.buff['マナウォール'])
            disable('feet','back')
        else
            enable('feet','back')
            IdleMelee()
        end
    end
end
