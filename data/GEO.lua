function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff['エントラスト']      = buffactive['エントラスト'] or false
    
    state.IdleMode:options('Normal','Refresh')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal', 'SubtleBlow')
    state.MainWeapons   = M{'イドリス'}
    state.SubWeapons    = M{'玄冥盾'}
    state.AutoHealing   = M(false)
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    if buffactive['エントラスト'] then
        equip(sets.buff['エントラスト'])
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