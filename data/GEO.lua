function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff['エントラスト']      = buffactive['エントラスト'] or false
    
    --gs c cycle OffenseMode
    state.OffenseMode:options('Normal')
    
    --gs c cycle IdleMode
    state.IdleMode:options('Normal','Refresh')
    
    -- gs c cycle WeaponskillMode
    state.WeaponskillMode:options('Normal', 'SubtleBlow')

    -- gs c cycle MainWeapons
    state.MainWeapons   = M{'Idris'}
    
    -- gs c cycle SubWeapons
    state.SubWeapons    = M{'Genbu'}
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if buffactive['エントラスト'] then
        equip(sets.midcast.Entrust)
    end
end


function customize_idle_set(idleSet)
    if pet.isvalid then
        if state.IdleMode.value == "Normal" then
            idleSet = set_combine(idleSet,sets.idle.Luopan)
        else
            idleSet = set_combine(idleSet,sets.idle.Luopan.Refresh)
        end 
    end

    return idleSet
end