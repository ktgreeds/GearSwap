function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
	set_language('japanese')
end


function job_setup()
    state.Buff['八双'] = buffactive['八双'] or false
    state.Buff['星眼'] = buffactive['星眼'] or false
    state.Buff['心眼'] = buffactive['心眼'] or false
    state.OffenseMode:options('Normal','SubtleBlow','HoxneAmpulla')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'草薙剣','正宗','童子切安綱','シャイニングワン'}
    state.SubWeapons    = M{'テロパノグリップ','ウトゥグリップ'}
    state.Increased     = M(true)
    state.HoxneAmpulla  = M(false)
    send_command('lua l bars')

end
function user_unload()
    send_command('lua u bars')
end
local tp_bonus_ws = S{
    "絶之太刀・無名",
    "祖之太刀・不動",
    "五之太刀・陣風",
    "絶之太刀・無名",
    "絶之太刀・無名"
}

function job_post_precast(spell, action, spellMap, eventArgs)
    --童子切安綱 500
    --胡蝶のイヤリング 250
    --ムパカキャップ 200
    if spell.type == 'WeaponSkill' then
        if tp_bonus_ws:contains(spell.name) then
            if state.MainWeapons.value == "童子切安綱" then
                if player.tp <= 2550 then
                    equip({left_ear=gear.TPBounus.left_ear})
                end
                if player.tp <= 2050 then
                    equip({head=gear.TPBounus.head})
                end
            else
                if player.tp <= 2750 then
                    equip({left_ear=gear.TPBounus.left_ear})
                end
                if player.tp <= 2550 then
                    equip({head=gear.TPBounus.head})
                end
            end
        end
    end
end


function job_customize_melee_set(meleeSet)
    if state.Buff['八双'] then
        meleeSet = set_combine(meleeSet,sets.buff['八双'] )
    elseif state.Buff['星眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['星眼'] )
    end
    if state.Buff['心眼'] then
        meleeSet = set_combine(meleeSet,sets.buff['心眼'] )
    end
    return meleeSet
end 


function job_state_change(stateField,  newValue, oldValue)
    user_state_change(stateField, newValue, oldValue)
end
