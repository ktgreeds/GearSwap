function get_sets()
    mote_include_version = 2
    include('Mote-Include.lua')
    set_language('japanese')
end


function job_setup()
    state.Buff['神獣の加護']            = buffactive['神獣の加護'] or false
    state.Buff['アストラルパッセージ']  = buffactive['アストラルパッセージ'] or false
    state.IdleMode:options('Normal')
    state.OffenseMode:options('Normal','SubtleBlow')
    state.WeaponskillMode:options('Normal','SubtleBlow')
    state.MainWeapons   = M{'グリダーヴォル','オパショーロ'}
    state.SubWeapons    = M{'エランストラップ'}
    state.BloadPactText = M(false, '履行テキスト')
end


function job_customize_idle_set(idleSet)
    if pet.isvalid then
        if pet.status == 'Engaged' then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Melee)
        elseif state.Buff['神獣の加護'] then
            idleSet = set_combine(idleSet, sets.idle.Avatar.Favor)
        else
            idleSet = set_combine(idleSet, sets.idle.Avatar)
        end
    else
        idleSet = set_combine(idleSet, sets.idle)
    end
    return idleSet
end


function job_buff_change(buff, gain)
    if buff=='アストラルパッセージ' then
        if gain then
            equip(sets.midcast.Pet.AvatarPhysicalPacts)
            disable('main','sub','range','ammo','head','body','hands','legs','feet','neck','waist','left_ear','right_ear','left_ring','right_ring','back')
            send_command('wait 30; gs enable all')
        end
    end
end


function custom_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'bp' then --【召喚】パッセ
        if state.Buff['アストラルパッセージ']  then
            if player.mp < 230 then
                send_command('input /ja '..windower.to_shift_jis("コンバート")..' <me>')
                send_command('input /item '..windower.to_shift_jis("ルシドエリクサーII")..' <me>')
            end
            bp_commnad(cmdParams)
            send_command('wait 1; gs c bp rage 1 t')

        else
            bp_commnad(cmdParams)
        end

    elseif cmdParams[1] == 'spirit' then --【召喚】エレ回復
        spirit_command()
        
    elseif cmdParams[1] =='BloadPactText' then --【召喚】履行技カンニングペーパー
        if state.BloadPactText.value then
            showText()
        else
            hideText()
        end
    end
end