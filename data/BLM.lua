function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff["魔力の泉"]       = buffactive["魔力の泉"] or false
    state.Buff["マナウォール"]   = buffactive["マナウォール"] or false
    
    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    --gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')

    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    
    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'BunzisRod'}

    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'AmmurapiShield'}
    
    --gs c cycle MPsavings
    state.MPsavings = M(true, 'MPsave')
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    for buff,active in pairs(state.Buff) do
        if active and sets.buff[buff] then
            equip(sets.buff[buff])
        end
        if spell.skill == '精霊魔法' then
            if not state.Buff["魔力の泉"] then
                if state.MPsavings.value and spell.name ~= "インパクト" then
                    equip(sets.midcast['精霊魔法'].MPsavings)
                end
            end

            equip(get_hachirin(spell.element))
        end
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
