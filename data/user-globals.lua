--このファイルは全ジョブ全キャラで共通のファイルです

--■■■初期ロード
function user_setup()
    local res = require('resources')
    state.Buff['睡眠'] = buffactive['睡眠'] or false                    --監視するバフ・デバフ
    state.Buff['エンチャント'] = buffactive['エンチャント'] or false
    include(player.name .. '/weather_obi')                              --属性帯ロード
    include('smn_avatar')                                               --召喚定義ファイルロード
    init_weaponns()                                                     --武器初期化
    init_custom_spell_map()                                             --スペルマップ定義再構築

    send_command('input /chatmode party')                               --チャットモード変更
    send_command('wait 1; input /si '..res.jobs[player.main_job_id]["ens"])
    send_command('wait 2; gs c set IdleMode Normal; wait 1; gs c lockstyleset;')--待機装備着替え後にロックスタイル固定

    -- gs c cycle SortieText
    --state.SortieText = M(false)

    -- gs c cycle RuneText
    state.RuneText = M(false)

    --include('organizer-lib') 
    --table.vprint(res.jobs[player.main_job_id]["ens"])
    --print(res.jobs[player.main_job_id]["ens"])
end

--■■■サブタゲ選択時の処理
function user_post_pretarget(spell, action, spellMap, eventArgs)
end

--■■■アクション前処理（共通実装なし）
function user_post_precast(spell, action, spellMap, eventArgs)
    if spell.type == 'WeaponSkill' then
        if state.WeaponskillMode then
            if state.WeaponskillMode.value == 'SubtleBlow' then
                 --WSモクシャ着替え
                equip(sets.SubtleBlow)
            end
        end
    end
end


--■■■アクション中処理
function user_post_midcast(spell, action, spellMap, eventArgs)
    if string.find(spell.type, 'Magic') then
        if sets.midcast.interruption then
            --詠唱中断着替え
            Interruption(spell, action, spellMap, eventArgs)
        end
    elseif spell.type ~= 'WeaponSkill' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                --アビリティや魔法時のバフ＋効果の着替え
                equip(sets.buff[buff])
            end
        end
    end

    --トレハン着替え
    if state.TreasureHunter then
        if state.TreasureHunter.value then
            equip(sets.TreasureHunter)
        end
    end
end


--■■■アクション後処理（共通実装なし）
function user_post_aftercast(spell, action, spellMap, eventArgs)
end



function user_state_change(stateField,  newValue, oldValue)
    if stateField == 'Offense Mode' then
        if state.WeaponskillMode.value ~= 'SubtleBlow' and newValue == 'SubtleBlow' then
            send_command('gs c set WeaponskillMode SubtleBlow')
        elseif state.WeaponskillMode.value == 'SubtleBlow' and newValue ~= 'SubtleBlow' then
            send_command('gs c set WeaponskillMode Normal')
        end
    end
    if stateField == 'HoxneAmpulla'then
        if state.HoxneAmpulla then
            if state.HoxneAmpulla.value then
                equip({ammo="ホクスニアムプラ"})
                send_command('gs c set OffenseMode HoxneAmpulla')
                disable('ammo')
            else
                enable('ammo')
                send_command('gs c reset OffenseMode')
            end
        end
    end
end


--詠唱中段非同期処理（sets.Buffを組み込めない）
function Interruption(spell, action, spellMap, eventArgs)
    if not sets.precast.FC then
        sets.precast.FC.value = 80
    end

    local fc = sets.precast.FC.value/100
    if player.main_job == '剣' and buffactive['ファストキャスト'] then
        --フサルクトラウザ装備時メリポのインスパイア1につき+12％
        --fc = fc + 12/100 --インスパイア1
        --fc = fc + 24/100 --インスパイア2
        --fc = fc + 36/100 --インスパイア3
        --fc = fc + 48/100 --インスパイア4
        --fc = fc + 60/100 --インスパイア5
    end

    if player.sub_job == '赤' then
        fc = fc + 15/100
    elseif player.main_job == '赤' then
        fc = fc + 38/100
    end
    
    if fc >= 80/100 then
        fc = 80/100
    end
    
    eventArgs.handled = true
    
    local adjust = 0.15
    local cast_time = (spell.cast_time*(1-fc))-adjust

    --IdleMelee()
    equip(sets.midcast.interruption)

    if sets.midcast[spell.name] then
        send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis(spell.name)..']')
    elseif sets.midcast[spellMap] then
        send_command('wait '..cast_time..'; gs equip sets.midcast.'..spellMap)
    elseif sets.midcast[spell.skill] then
        send_command('wait '..cast_time..'; gs equip sets.midcast['..windower.to_shift_jis(spell.skill)..']')
    elseif sets.midcast[spell.type] then
        send_command('wait '..cast_time..'; gs equip sets.midcast.'..spell.type) 
    end
end


--■■■バフデバフ変更時の共通処理
function user_buff_change(buff, gain)
    if state.Buff['睡眠']  or (buff == "睡眠" and gain) then
        send_command('wait 1;gs c AutomaticWakeUp')
    elseif buff == "ファランクス" and not gain then
        windower.add_to_chat(167,'■■■ ファランクス切れ ■■■')
    elseif buff == "八双" and not gain then
        windower.add_to_chat(167,'■■■ 八双切れ ■■■')
    elseif buff == "星眼" and not gain then
        windower.add_to_chat(167,'■■■ 星眼切れ ■■■')
    elseif buff == "心眼" and not gain then
        windower.add_to_chat(167,'■■■ 心眼切れ ■■■')
    elseif buff == "コルア展開" and not gain then
        windower.add_to_chat(167,'■■■ インデ切れ ■■■')
    elseif buff == "ヴァレション" and not gain then
        windower.add_to_chat(167,'■■■ ヴァレション切れ ■■■')
    elseif buff == "ヴァリエンス" and not gain then
        windower.add_to_chat(167,'■■■ ヴァリエンス切れ ■■■')
    elseif buff == "エンチャント" and not gain then
        windower.add_to_chat(167,'■■■ エンチャント切れ ■■■')
    elseif buff == "ディフェンダー" and not gain then
        windower.add_to_chat(167,'■■■ ディフェンダー ■■■')
    end
end






--■■■待機攻撃装備着替え処理
function user_customize_idle_set(idleSet)
    idleSet = set_combine(idleSet,user_customize_IdleMelee_set(idleSet))
    if job_customize_idle_set then
        idleSet = job_customize_idle_set(idleSet)
    end
    return idleSet
end



--■■■攻撃装備着替え処理
function customize_melee_set(meleeSet)
    meleeSet = set_combine(meleeSet,user_customize_IdleMelee_set(meleeSet))
    if job_customize_melee_set then
        meleeSet = job_customize_melee_set(meleeSet)
    end
    return meleeSet
end


--■■■武器変更処理
function user_customize_IdleMelee_set(IdelMeleeSet)
    if player.sub_job == '忍' then
        --二刀流係数11
        IdelMeleeSet = set_combine(IdelMeleeSet,sets.engaged.dual11)
    elseif player.sub_job == '踊' then
        --二刀流係数21
        IdelMeleeSet = set_combine(IdelMeleeSet,sets.engaged.dual21)
    end

    if state.MainWeapons then
        weapon = {main=gear[state.MainWeapons.value]}
    end
    
    if state.SubWeapons then
        weapon = set_combine(weapon,{sub=gear[state.SubWeapons.value]})
    end

    if state.RangeWeapons then
        weapon = set_combine(weapon,{range=gear[state.RangeWeapons.value]})
    end

    if state.Instruments then
        weapon = set_combine(weapon,{range=gear[state.Instruments.value]})
    end

    return set_combine(IdelMeleeSet,weapon)
end


--■■■セルフコマンド
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1] == 'Idle' then                  --待機装備着替え
        IdleMelee()
    elseif cmdParams[1] == 'Medicine' then          --状態異常回復
        Medicine()
    elseif cmdParams[1] == 'cure' then              --ケアルマクロ節約
        Cure()
    elseif cmdParams[1] == 'curaga' then             --ケアルマクロ節約
        Curaga()
    elseif cmdParams[1] == 'aspir' then             --アスピルマクロ節約
        Aspir()
    elseif cmdParams[1] == 'drain' then             --ドレインマクロ節約
        Drain()
    elseif cmdParams[1] == 'Utsusemi' then          --空蝉の術節約
        Utsusemi()
    elseif cmdParams[1] == 'AutoMB' then            --ドレインマクロ節約
        AutoMB()
    elseif cmdParams[1] == 'Enmity' then            --単体ヘイトアップ処理
        ActionEnmity()
    elseif cmdParams[1] == 'EnmityRange' then       --範囲ヘイトアップ処理
        ActionEnmityRange()
    elseif cmdParams[1] == 'Lullabys' then          --魔物達のララバイ
        Lullabys()
    elseif cmdParams[1] == 'Lullaby' then           --魔物のララバイ
        Lullaby()
    elseif cmdParams[1] == 'RuneText' then          --ルーンカンニングペーパー
        if not state.RuneText.value then
            showTextRune()
        else
            hideTextRune()
        end
        send_command('gs c cycle RuneText')
    elseif cmdParams[1] == 'lockstyleset' then      --ロックスタイル固定処理
        if player.main_job ~= '学' then
            send_command('input /lockstyleset '..lockstyleset)
        end
    elseif cmdParams[1]  == 'AutomaticWakeUp' then
        if state.Buff['睡眠'] then
            equip({main=gear.Slip,range=gear.Slip,head=gear.Slip,neck=gear.Slip})
        end
    end

    if type(custom_self_command) == "function" then --カスタムセルフコマンド呼び出し
        custom_self_command(cmdParams, eventArgs)
    end
end


sets.HolyWater = {
    neck="ニカンダネックレス",
    ring1="ブレンモドリング",
    ring2="ピュリティーリング"
}


--■■■状態異常回復
function Medicine()
    if buffactive['死の宣告'] or buffactive['呪い'] then
        equip(sets.HolyWater)
        send_command('input /item '..windower.to_shift_jis('聖水')..' <me>')
        send_command('wait 3; gs c IdleMelee')
    elseif buffactive['麻痺'] then
        send_command('input /item '..windower.to_shift_jis('万能薬')..' <me>')
    elseif buffactive['静寂'] then
        send_command('input /item '..windower.to_shift_jis('やまびこ薬')..' <me>')
        send_command('input /item '..windower.to_shift_jis('万能薬')..' <me>')
    elseif buffactive['毒'] then
        send_command('input /item '..windower.to_shift_jis('毒消し')..' <me>')
        send_command('input /item '..windower.to_shift_jis('万能薬')..' <me>')
    elseif buffactive['病気'] then
        send_command('input /item '..windower.to_shift_jis('万能薬')..' <me>')
    elseif buffactive['暗闇'] then
        send_command('input /item '..windower.to_shift_jis('目薬')..' <me>')
        send_command('input /item '..windower.to_shift_jis('万能薬')..' <me>')
    elseif buffactive['ディア'] 
        or buffactive['バイオ'] 
        or buffactive['ヘヴィ'] 
        or buffactive['バインド'] 
        or buffactive['フラッシュ'] 
        or buffactive['スロウ'] 
        or buffactive['アドル'] 
        or buffactive['スロウ'] 
        or buffactive['ショック'] 
        or buffactive['ラスプ'] 
        or buffactive['チョーク'] 
        or buffactive['フロスト'] 
        or buffactive['バーン'] 
        or buffactive['ドラウン'] 
        or buffactive['火門の計'] 
        or buffactive['氷門の計'] 
        or buffactive['風門の計'] 
        or buffactive['土門の計'] 
        or buffactive['雷門の計'] 
        or buffactive['水門の計'] 
        or buffactive['光門の計'] 
        or buffactive['闇門の計'] 
        or buffactive['デイズ'] 
        or buffactive['ステップ'] 
        or buffactive['レクイエム'] 
        or buffactive['エレジー'] 
        or buffactive['スレノディ'] 
        or buffactive['ノクターン'] 
        or buffactive['STRダウン'] 
        or buffactive['DEXダウン'] 
        or buffactive['VITダウン'] 
        or buffactive['AGIダウン'] 
        or buffactive['MNDダウン'] 
        or buffactive['INTダウン'] 
        or buffactive['CHRダウン'] 
        or buffactive['攻撃力ダウン'] 
        or buffactive['防御力ダウン'] 
        or buffactive['命中率ダウン'] 
        or buffactive['回避率ダウン'] 
        or buffactive['魔法攻撃力ダウン'] 
        or buffactive['魔法防御力ダウン'] 
        or buffactive['魔法命中率ダウン'] 
        or buffactive['魔法回避率ダウン'] 
        or buffactive['回避能力ダウン'] 
        or buffactive['HPmaxダウン'] 
        or buffactive['MPmaxダウン'] 
        or buffactive['TPmaxダウン'] 
        or buffactive['被クリティカルヒット率アップ'] 
        or buffactive['インヒビットTP'] 
        or buffactive['まどわす'] then
        send_command('input /item '..windower.to_shift_jis('パナケイア')..' <me>')
    end
end


--■■■待機攻撃装備着替え
function IdleMelee()
    if player.status == 'Idle'then
        equip(get_idle_set()) 
    else
        equip(get_melee_set()) 
    end
end

--■■■ケアルマクロ節約
function Cure()
    local recasts = windower.ffxi.get_spell_recasts()
    local Cure_1 = recasts[1]/60
    local Cure_2 = recasts[2]/60
    local Cure_3 = recasts[3]/60
    local Cure_4 = recasts[4]/60
    local Cure_5 = recasts[5]/60
    local Cure_6 = recasts[6]/60

    if Cure_6 == 0 and player.last_subtarget.hpp < 20 and player.main_job == '白' then
       send_command('input /ma '..windower.to_shift_jis('ケアルVI')..' <lastst>')
    elseif Cure_5 == 0 and player.last_subtarget.hpp < 40 and player.main_job == '白' then
       send_command('input /ma '..windower.to_shift_jis('ケアルV')..' <lastst>')
    elseif Cure_4 == 0 and player.last_subtarget.hpp < 70 then
       send_command('input /ma '..windower.to_shift_jis('ケアルIV')..' <lastst>')
    elseif Cure_3 == 0 and player.last_subtarget.hpp < 85 then
       send_command('input /ma '..windower.to_shift_jis('ケアルIII')..' <lastst>')
    elseif Cure_2 == 0 and player.last_subtarget.hpp < 95 then
       send_command('input /ma '..windower.to_shift_jis('ケアルII')..' <lastst>')
    elseif Cure_1 == 0   then
       send_command('input /ma '..windower.to_shift_jis('ケアル')..' <lastst>')
    end
end

--■■■ケアルガマクロ節約
function Curaga()
    local recasts = windower.ffxi.get_spell_recasts()
    local Curaga1 = recasts[7]/60
    local Curaga2 = recasts[8]/60
    local Curaga3 = recasts[9]/60
    local Curaga4 = recasts[10]/60
    local Curaga5 = recasts[11]/60
    if Curaga5 == 0 and player.last_subtarget.hpp < 20 and player.main_job == '白' then
       send_command('input /ma '..windower.to_shift_jis('ケアルガV')..' <lastst>')
    elseif Curaga4 == 0 and player.last_subtarget.hpp < 40 then
       send_command('input /ma '..windower.to_shift_jis('ケアルガIV')..' <lastst>')
    elseif Curaga3 == 0 and player.last_subtarget.hpp < 70  and player.sub_job_level >=51 then
       send_command('input /ma '..windower.to_shift_jis('ケアルガIII')..' <lastst>')
    elseif Curaga2 == 0 and player.last_subtarget.hpp < 80 then
       send_command('input /ma '..windower.to_shift_jis('ケアルガII')..' <lastst>')
    elseif Curaga1 == 0   then
       send_command('input /ma '..windower.to_shift_jis('ケアルガ')..' <lastst>')
    end
end

--■■■アスピルマクロ節約
function Aspir()
    local recasts = windower.ffxi.get_spell_recasts()
    local recast_time_3 = recasts[881]/60
    local recast_time_2 = recasts[248]/60
    local recast_time_1 = recasts[247]/60

    if recast_time_3 == 0 and (player.main_job == '風' or player.main_job == '黒') then
       send_command('input /ma '..windower.to_shift_jis('アスピルIII')..' <stnpc>')
    elseif recast_time_2 == 0 then
        send_command('input /ma '..windower.to_shift_jis('アスピルII')..' <stnpc>')
    elseif recast_time_1 == 0 then
        send_command('input /ma '..windower.to_shift_jis('アスピル')..' <stnpc>')
    else
        windower.add_to_chat(30, 'アスピル リキャスト---> III: %.1fs, II: %.1fs, I: %.1fs':format(recast_time_3, recast_time_1, recast_time_1))
    end
end


--■■■ドレインマクロ節約
function Drain()
    local recasts = windower.ffxi.get_spell_recasts()
    local recast_time_3 = recasts[880]/60
    local recast_time_2 = recasts[246]/60
    local recast_time_1 = recasts[245]/60

    if recast_time_3 == 0 and player.main_job == '暗' then
        send_command('input /ma '..windower.to_shift_jis('ドレインIII')..' <stnpc>')
    elseif recast_time_2 == 0 and player.main_job == '暗' then
        send_command('input /ma '..windower.to_shift_jis('ドレインII')..' <stnpc>')
    elseif recast_time_1 == 0 then
        send_command('input /ma '..windower.to_shift_jis('ドレイン')..' <stnpc>')
    else
        windower.add_to_chat(30, 'ドレイン リキャスト---> III: %.1fs,II: %.1fs, I: %.1fs':format(recast_time_3, recast_time_2, recast_time_1))
    end
end


--■■■空蝉の術
function Utsusemi()
    local recasts = windower.ffxi.get_spell_recasts()
    local recast_time_3 = recasts[340]/60
    local recast_time_2 = recasts[339]/60
    local recast_time_1 = recasts[338]/60

    if recast_time_3 == 0 and player.main_job == '忍' then
        send_command('input /ma '..windower.to_shift_jis('空蝉の術:参')..' <me>')
    elseif recast_time_2 == 0 then
        send_command('input /ma '..windower.to_shift_jis('空蝉の術:弐')..' <me>')
    elseif recast_time_1 == 0 then
        send_command('input /ma '..windower.to_shift_jis('空蝉の術:壱')..' <me>')
    else
        windower.add_to_chat(30, '空蝉の術 リキャスト---> 参: %.1fs, 弐: %.1fs, 壱: %.1fs':format(recast_time_3, recast_time_2, recast_time_1))
    end
end


--■■■魔物達のララバイ
function Lullabys()
    local recasts = windower.ffxi.get_spell_recasts()
    local recast_time_2 = recasts[376]/60
    local recast_time_1 = recasts[377]/60

    if recast_time_2 == 0 then
        send_command('input /targetbnpc; input /ma '..windower.to_shift_jis('魔物達のララバイ')..' <stnpc>')
    elseif recast_time_1 == 0 then
        send_command('input /targetbnpc; input /ma '..windower.to_shift_jis('魔物達のララバイII')..' <stnpc>')
    else
        windower.add_to_chat(30, '魔物達のララバイ リキャスト---> 1:%.1fs, 2:%.1fs':format(recast_time_2, recast_time_1))
    end
end


--■■■魔物のララバイ
function Lullaby()
    local recasts = windower.ffxi.get_spell_recasts()
    local recast_time_2 = recasts[471]/60
    local recast_time_1 = recasts[463]/60

    if recast_time_2 == 0 then
        send_command('input /targetbnpc; input /ma '..windower.to_shift_jis('魔物のララバイII')..' <stnpc>')
    elseif recast_time_1 == 0 then
        send_command('input /targetbnpc; input /ma '..windower.to_shift_jis('魔物のララバイ')..' <stnpc>')
    else
        windower.add_to_chat(30, '魔物のララバイ リキャスト---> 1:%.1fs, 2:%.1fs':format(recast_time_1, recast_time_2))
    end
end


--■■■単体ヘイトアップ処理
function ActionEnmity()
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local recast_time_Flash     = spell_recasts[112]/60
    local recast_time_BlankGaze = spell_recasts[592]/60
    local recast_time_Jettatura = spell_recasts[575]/60
    local recast_time_Stun      = spell_recasts[252]/60
    local recast_time_abzotac   = spell_recasts[275]/60
    
    local ability_recasts = windower.ffxi.get_ability_recasts()
    local recast_time_Provoke = spell_recasts[5]/60

    if recast_time_Flash == 0 then
        send_command('input /ma '..windower.to_shift_jis('フラッシュ')..' <stnpc>')
    elseif player.sub_job == '青' and recast_time_Jettatura == 0 then
        send_command('input /ma '..windower.to_shift_jis('ジェタチュラ')..' <stnpc>')--0.5
    elseif player.sub_job == '青' and recast_time_BlankGaze == 0 then
        send_command('input /ma '..windower.to_shift_jis('ブランクゲイズ')..' <stnpc>')--3
    elseif player.sub_job == '戦' and recast_time_Provoke == 0 then
        send_command('input /ja '..windower.to_shift_jis('挑発')..' <stnpc>')
    elseif player.sub_job == '暗' and recast_time_Stun == 0 then
        send_command('input /ma '..windower.to_shift_jis('スタン')..' <stnpc>')
    elseif player.sub_job == '暗' and recast_time_abzotac == 0 then
        send_command('input /ma '..windower.to_shift_jis('アブゾタック')..' <stnpc>')
    end
end

--■■■範囲ヘイトアップ処理
function ActionEnmityRange()
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local recast_time_FrightfulRoar = spell_recasts[561]/60
    local recast_time_Soporific = spell_recasts[598]/60
    local recast_time_SheepSong = spell_recasts[584]/60
    local recast_time_GeistWall = spell_recasts[605]/60
    local recast_time_Stinking  = spell_recasts[537]/60
    local recast_time_Poisonga  = spell_recasts[225]/60
    local recast_time_Lullaby   = spell_recasts[376]/60
    local recast_time_Banishga  = spell_recasts[38]/60
    local recast_time_Diaga     = spell_recasts[33]/60
    
    if player.sub_job == '青' and recast_time_FrightfulRoar == 0 and player.sub_job_level >= 50 then
        send_command('input /ma '..windower.to_shift_jis('フライトフルロア')..' <stnpc>')--2
    elseif player.sub_job == '青' and recast_time_GeistWall == 0 then
        send_command('input /ma '..windower.to_shift_jis('ガイストウォール')..' <stnpc>')--3
    elseif player.sub_job == '青' and recast_time_Stinking == 0 then
        send_command('input /ma '..windower.to_shift_jis('スティンキングガス')..' <stnpc>')--4
    elseif player.sub_job == '青' and recast_time_Soporific == 0 then
        send_command('input /ma '..windower.to_shift_jis('サペリフィック')..' <stnpc>')--3
    elseif player.sub_job == '青' and recast_time_SheepSong == 0 then
        send_command('input /ma '..windower.to_shift_jis('シープソング')..' <stnpc>')--3
    elseif player.sub_job == '詩' and recast_time_Lullaby == 0 then
        send_command('input /ma '..windower.to_shift_jis('魔物達のララバイ')..' <stnpc>')--3
    elseif player.sub_job == '赤' and recast_time_Diaga == 0 then
        send_command('input /ma '..windower.to_shift_jis('ディアガ')..' <stnpc>')--3
    elseif recast_time_Banishga == 0 then
        send_command('input /ma '..windower.to_shift_jis('バニシュガ')..' <stnpc>')--3
    end
end

--被強化自動着替え
require('sets')
require('chat')

filter_mode = S{51,52}
windower.register_event("incoming text", function(original, modified, original_mode, modified_mode, blocked)
    if state.Increased and state.Increased.value then
        if filter_mode:contains(original_mode) then
            if windower.wc_match(original,windower.to_shift_jis('*リジェネ*')) then
                if sets.midcast.IncreasedRegenerated then
                    send_command('gs equip sets.midcast.IncreasedRegenerated; wait 3; gs c IdleMelee;')
                end
            elseif windower.wc_match(original,windower.to_shift_jis('*ファランクス*')) then
                if sets.midcast.IncreasedPhalanx then
                    send_command('gs equip sets.midcast.IncreasedPhalanx; wait 3; gs c IdleMelee;')
                end
            elseif windower.wc_match(original,windower.to_shift_jis('*リフレシュ*')) then
                if sets.midcast.IncreasedRefresh then
                    send_command('gs equip sets.midcast.IncreasedRefresh; wait 3; gs c IdleMelee;')
                end
            elseif windower.wc_match(original,windower.to_shift_jis('*プロテス*')) then
                if sets.midcast.IncreasedProtect then
                    send_command('gs equip sets.midcast.IncreasedProtect; wait 3; gs c IdleMelee;')
                end
            elseif windower.wc_match(original,windower.to_shift_jis('*シェル*')) then
                if sets.midcast.IncreasedShell then
                    send_command('gs equip sets.midcast.IncreasedShell; wait 3; gs c IdleMelee;')
                end
            elseif windower.wc_match(original,windower.to_shift_jis('*カーズナ*')) then
                if sets.midcast.IncreasedCursna then
                    send_command('gs equip sets.midcast.IncreasedCursna; wait 3; gs c IdleMelee;')
                end
            end
        end
    end
end)

--▼▼▼▼▼▼ その他
--■■■スペルマップ再構築取得用
function job_get_spell_map(spell, default_spell_map)
    local new_spell_map = default_spell_map
    if spell.type == 'BlueMagic' then
        new_spell_map = bm_spell_maps[spell.name]
    elseif spell.type == 'BloodPactRage' or spell.type == 'BloodPactWard' then
        new_spell_map = bp_spell_maps[spell.name]
    end
    return new_spell_map
end


--■■■青魔法スペルマップ定義再構築
function init_custom_spell_map()
    bm_spell_maps = {
    	--物理系青魔法
        ['F.リップ']='BluePhysical',['H.バラージ']='BluePhysical',['M.バイト']='BluePhysical',['S.ドライバー']='BluePhysical',['T.アッサルト']='BluePhysical',['まつぼっくり爆弾']='BluePhysical',['アシュラクロー']='BluePhysical',['アッパーカット']='BluePhysical',['エンプティスラッシュ']='BluePhysical',['キャノンボール']='BluePhysical',['クアドラストライク']='BluePhysical',['グランドスラム']='BluePhysical',['グルーティナスダート']='BluePhysical',['クローサイクロン']='BluePhysical',['ゴブリンラッシュ']='BluePhysical',['サウリアンスライド']='BluePhysical',['サドンランジ']='BluePhysical',['サブゼロスマッシュ']='BluePhysical',['シードスプレー']='BluePhysical',['ジェットストリーム']='BluePhysical',['シックルスラッシュ']='BluePhysical',['シンカードリル']='BluePhysical',['スイープガウジ']='BluePhysical',['スパイナルクリーブ']='BluePhysical',['スパイラルスピン']='BluePhysical',['スプラウトスマック']='BluePhysical',['ディセバーメント']='BluePhysical',['テールスラップ']='BluePhysical',['テラータッチ']='BluePhysical',['デスシザース']='BluePhysical',['デルタスラスト']='BluePhysical',['トゥールビヨン']='BluePhysical',['ハイドロショット']='BluePhysical',['バトルダンス']='BluePhysical',['バニティダイブ']='BluePhysical',['バーチカルクリーヴ']='BluePhysical',['パラライズトライアド']='BluePhysical',['パワーアタック']='BluePhysical',['ビルジストーム']='BluePhysical',['フットキック']='BluePhysical',['フライパン']='BluePhysical',['ブラッドレイク']='BluePhysical',['ヘッドバット']='BluePhysical',['ヘルダイブ']='BluePhysical',['ベンシクタイフーン']='BluePhysical',['ボディプレス']='BluePhysical',['マヨイタケ']='BluePhysical',['メッタ打ち']='BluePhysical',['ラムチャージ']='BluePhysical',['偃月刃']='BluePhysical',['四連突']='BluePhysical',['怒りの一撃']='BluePhysical',['怒りの旋風']='BluePhysical',['槍玉']='BluePhysical',['次元殺']='BluePhysical',['種まき']='BluePhysical',['羽根吹雪']='BluePhysical',['重い一撃']='BluePhysical',['ファイナルスピア']='BluePhysical',
        --魔法系青魔法
        ['A.ライベーション']='BlueMagical',['B.シュトラール']='BlueMagical',['B.フルゴア']='BlueMagical',['D.ワールウィンド']='BlueMagical',['F.ヒッププレス']='BlueMagical',['MP吸収キッス']='BlueMagical',['R.デルージュ']='BlueMagical',['R.ブレス']='BlueMagical',['T.アップヒーヴ']='BlueMagical',['みんなの怨み']='BlueMagical',['アイズオンミー']='BlueMagical',['アイスブレイク']='BlueMagical',['アクリッドストリーム']='BlueMagical',['アップルート']='BlueMagical',['アンビルライトニング']='BlueMagical',['ウィンドブレス']='BlueMagical',['ヴェイパースプレー']='BlueMagical',['エントゥーム']='BlueMagical',['エンバームアース']='BlueMagical',['オスモーシス']='BlueMagical',['カースドスフィア']='BlueMagical',['クラッシュサンダー']='BlueMagical',['ゲーツオブハデス']='BlueMagical',['コローシブウーズ']='BlueMagical',['サイレントストーム']='BlueMagical',['サブダックション']='BlueMagical',['サンダーブレス']='BlueMagical',['サンダーボルト']='BlueMagical',['サーマルパルス']='BlueMagical',['シアリングテンペスト']='BlueMagical',['スカウリングスペイト']='BlueMagical',['スペクトラルフロー']='BlueMagical',['セスプール']='BlueMagical',['ダークオーブ']='BlueMagical',['チャージドホイスカー']='BlueMagical',['ディフュージョンレイ']='BlueMagical',['デスレイ']='BlueMagical',['テネブラルクラッシュ']='BlueMagical',['テーリングガスト']='BlueMagical',['ネクターデルージュ']='BlueMagical',['ファイアースピット']='BlueMagical',['ファウルウォーター']='BlueMagical',['ブラッドセイバー']='BlueMagical',['ブレーズバウンド']='BlueMagical',['フロストブレス']='BlueMagical',['ヘカトンウェーブ']='BlueMagical',['ポーリングサルヴォ']='BlueMagical',['ポイズンブレス']='BlueMagical',['ポラーロア']='BlueMagical',['メイルシュトロム']='BlueMagical',['マインドブラスト']='BlueMagical',['モルトプルメイジ']='BlueMagical',['リガージテーション']='BlueMagical',['リーフストーム']='BlueMagical',['レテナグレア']='BlueMagical',['レールキャノン']='BlueMagical',['吸血']='BlueMagical',['土竜巻']='BlueMagical',['水風船爆弾']='BlueMagical',['消化']='BlueMagical',['火炎の息']='BlueMagical',['炸裂弾']='BlueMagical',['爆弾投げ']='BlueMagical',['磁鉄粉']='BlueMagical',['神秘の光']='BlueMagical',['自爆']='BlueMagical',['臭い息']='BlueMagical',['針千本']='BlueMagical',['マジックハンマー']='BlueMagical',
        --弱体系青魔法
        ['A.バースト']='BlueMagicAcc',['C.ディスチャージ']='BlueMagicAcc',['D.ロア']='BlueMagicAcc',['F.ホールド']='BlueMagicAcc',['アーフルアイ']='BlueMagicAcc',['アブソルートテラー']='BlueMagicAcc',['オーロラルドレープ']='BlueMagicAcc',['カオティックアイ']='BlueMagicAcc',['クルエルジョーク']='BlueMagicAcc',['ガイストウォール']='BlueMagicAcc',['コールドウェーブ']='BlueMagicAcc',['サウンドブラスト']='BlueMagicAcc',['サペリフィック']='BlueMagicAcc',['サンドスプレー']='BlueMagicAcc',['シープソング']='BlueMagicAcc',['ジェタチュラ']='BlueMagicAcc',['スティンキングガス']='BlueMagicAcc',['テンポラルシフト']='BlueMagicAcc',['フェザーティックル']='BlueMagicAcc',['フライトフルロア']='BlueMagicAcc',['ブランクゲイズ']='BlueMagicAcc',['ベノムシェル']='BlueMagicAcc',['ブリスターローア']='BlueMagicAcc',['モータルレイ']='BlueMagicAcc',['ヤーン']='BlueMagicAcc',['リービンウィンド']='BlueMagicAcc',['ロウイン']='BlueMagicAcc',['夢想花']='BlueMagicAcc',['吶喊']='BlueMagicAcc',['吸印']='BlueMagicAcc',['贖罪の光']='BlueMagicAcc',['超低周波']='BlueMagicAcc',
        --回復系青魔法	
        ['いやしの風']='BlueHealing',['マジックフルーツ']='BlueHealing',['P.エンブレイス']='BlueHealing',['花粉']='BlueHealing',['レストラル']='BlueHealing',['ホワイトウィンド']='BlueHealing',['ワイルドカロット']='BlueHealing',['虚無の風']='BlueHealing',['イグジュビエーション']='BlueHealing',
        --強化系青魔法
        ['N.メディテイト']='BlueBuff',['エラチックフラッター']='BlueBuff',['カウンタースタンス']='BlueBuff',['カルカリアンヴァーヴ']='BlueBuff',['コクーン']='BlueBuff',['セイリーンコート']='BlueBuff',['ゼファーマント']='BlueBuff',['ねたみ種']='BlueBuff',['バッテリーチャージ']='BlueBuff',['ファンタッド']='BlueBuff',['フェザーバリア']='BlueBuff',['プラズマチャージ']='BlueBuff',['ポーラーブルワーク']='BlueBuff',['マイティガード']='BlueBuff',['メメントモーリ']='BlueBuff',['リジェネレーション']='BlueBuff',['リフュエリング']='BlueBuff',['ワームアップ']='BlueBuff',['牙門']='BlueBuff',['共鳴']='BlueBuff',['鯨波']='BlueBuff',['甲羅強化']='BlueBuff',['反応炉冷却']='BlueBuff',['金剛身']='BlueBuff',['マジックバリア']='BlueBuff',['メタルボディ']='BlueBuff',['オカルテーション']='BlueBuff',
    }

    bp_spell_maps = {
        --召喚履行
        ['シアリングライト'] = 'AvatarMagicalPacts',['ルビーの癒し'] = 'AvatarCure',['ポイズンネイル'] = 'AvatarPhysicalPacts',['ルビーの輝き'] = 'AvatarBuffWard',['ルビーの煌き'] = 'AvatarBuffWard',
        ['プチメテオ'] = 'AvatarMagicalPacts',['ルビーの癒しII'] = 'AvatarCure',['ホーリーミスト'] = 'AvatarMagicalPacts',['ルビーの安らぎ'] = 'AvatarBuffWard',['ルビーの贖罪'] = 'AvatarBuffWard',
        ['アースフューリー'] = 'AvatarMagicalPacts',['ロックスロー'] = 'AvatarPhysicalPacts',['ストーンII'] = 'AvatarMagicalPacts',['ロックバスター'] = 'AvatarPhysicalPacts',['メガリススロー'] = 'AvatarPhysicalPacts',
        ['大地の守り'] = 'AvatarBuffWard',['ストーンIV'] = 'AvatarMagicalPacts',['マウンテンバスター'] = 'AvatarPhysicalPacts',['ジオクラッシュ'] = 'AvatarMagicalPacts',['大地の鎧'] = 'AvatarBuffWard',
        ['クラッグスロー'] = 'AvatarPhysicalPacts',
        ['タイダルウェイブ'] = 'AvatarMagicalPacts',['バラクーダダイブ'] = 'AvatarPhysicalPacts',['ウォータII'] = 'AvatarMagicalPacts',['テールウィップ'] = 'AvatarPhysicalPacts',['スロウガ'] = 'AvatarDeBuffWard',
        ['湧水'] = 'AvatarCure',['ウォータIV'] = 'AvatarMagicalPacts',['スピニングダイブ'] = 'AvatarPhysicalPacts',['グランドフォール'] = 'AvatarMagicalPacts',['タイダルロア'] = 'AvatarDeBuffWard',
        ['スージングカレント'] = 'AvatarBuffWard',
        ['エリアルブラスト'] = 'AvatarMagicalPacts',['クロー'] = 'AvatarPhysicalPacts',['エアロII'] = 'AvatarMagicalPacts',['真空の鎧'] = 'AvatarBuffWard',['風の囁き'] = 'AvatarCure',
        ['ヘイスガ'] = 'AvatarBuffWard',['エアロIV'] = 'AvatarMagicalPacts',['プレデタークロー'] = 'AvatarPhysicalPacts',['ウインドブレード'] = 'AvatarMagicalPacts',
        ['真空の具足'] = 'AvatarBuffWard',['ヘイスガII'] = 'AvatarBuffWard',
        ['インフェルノ'] = 'AvatarMagicalPacts',['パンチ'] = 'AvatarPhysicalPacts',['ファイアII'] = 'AvatarMagicalPacts',['バーニングストライク'] = 'AvatarMagicalPacts',['ダブルパンチ'] = 'AvatarPhysicalPacts',
        ['紅蓮の咆哮'] = 'AvatarBuffWard',['ファイアIV'] = 'AvatarMagicalPacts',['フレイムクラッシュ'] = 'AvatarMagicalPacts',['メテオストライク'] = 'AvatarMagicalPacts',['灼熱の咆哮'] = 'AvatarBuffWard',
        ['コンフラグストライク'] = 'AvatarMagicalPacts',
        ['ダイヤモンドダスト'] = 'AvatarMagicalPacts',['アクスキック'] = 'AvatarPhysicalPacts',['ブリザドII'] = 'AvatarMagicalPacts',['凍てつく鎧'] = 'AvatarBuffWard',['スリプガ'] = 'AvatarDeBuffWard',
        ['ダブルスラップ'] = 'AvatarPhysicalPacts',['ブリザドIV'] = 'AvatarMagicalPacts',['ラッシュ'] = 'AvatarPhysicalPacts',['ヘヴンリーストライク'] = 'AvatarMagicalPacts',
        ['ダイヤモンドストーム'] = 'AvatarDeBuffWard',['クリスタルブレシング'] = 'AvatarBuffWard',
        ['ジャッジボルト'] = 'AvatarMagicalPacts',['ショックストライク'] = 'AvatarPhysicalPacts',['サンダーII'] = 'AvatarMagicalPacts',['サンダースパーク'] = 'AvatarMagicalPacts',['雷鼓'] = 'AvatarBuffWard',
        ['雷電の鎧'] = 'AvatarBuffWard',['サンダーIV'] = 'AvatarMagicalPacts',['カオスストライク'] = 'AvatarPhysicalPacts',['サンダーストーム'] = 'AvatarMagicalPacts',
        ['スタンガ'] = 'AvatarDeBuffWard',['ボルトストライク'] = 'AvatarPhysicalPacts',
        ['ハウリングムーン'] = 'AvatarMagicalPacts',['ムーンリットチャージ'] = 'AvatarPhysicalPacts',['クレセントファング'] = 'AvatarPhysicalPacts',['ルナークライ'] = 'AvatarDeBuffWard',
        ['ルナーロア'] = 'AvatarDeBuffWard',['上弦の唸り'] = 'AvatarBuffWard',['下弦の咆哮'] = 'AvatarBuffWard',['エクリプスバイト'] = 'AvatarPhysicalPacts',['ルナーベイ'] = 'AvatarMagicalPacts',
        ['ヘヴンズハウル'] = 'AvatarBuffWard',['インパクト'] = 'AvatarMagicalPacts',
        ['ルイナスオーメン'] = 'AvatarMagicalPacts',['カミサドー'] = 'AvatarPhysicalPacts',['ソムノレンス'] = 'AvatarDeBuffWard',['ナイトメア'] = 'AvatarDeBuffWard',
        ['アルティメットテラー'] = 'AvatarDeBuffWard',['ノクトシールド'] = 'AvatarBuffWard',['ドリームシュラウド'] = 'AvatarBuffWard',['ネザーブラスト'] = 'AvatarMagicalPacts',
        ['ナイトテラー'] = 'AvatarMagicalPacts',['パボルノクターナス'] = 'AvatarDeBuffWard',['ブラインドサイド'] = 'AvatarPhysicalPacts',
        ['アルタナフェーバー'] = 'AvatarBuffWard',['リーガルスクラッチ'] = 'AvatarPhysicalPacts',['レイズII'] = 'AvatarBuffWard',['ミュインララバイ'] = 'AvatarDeBuffWard',
        ['リレイズII'] = 'AvatarBuffWard',['イアリーアイ'] = 'AvatarDeBuffWard',['レベル？ホーリー'] = 'AvatarMagicalPacts',['リーガルガッシュ'] = 'AvatarPhysicalPacts',
        ['クラーサクコール'] = 'AvatarMagicalPacts',['ウェルト'] = 'AvatarPhysicalPacts',['ルナティックボイス'] = 'AvatarDeBuffWard',['ラウンドハウス'] = 'AvatarPhysicalPacts',
        ['疾風の刃'] = 'AvatarBuffWard',['シヌーク'] = 'AvatarBuffWard',['修羅のエレジー'] = 'AvatarDeBuffWard',['ソニックバフェット'] = 'AvatarMagicalPacts',
        ['トルネドII'] = 'AvatarMagicalPacts',['風の守り'] = 'AvatarBuffWard',['ヒステリックアサルト'] = 'AvatarPhysicalPacts',
        ['斬鉄剣'] = 'AvatarDeBuffWard',['ディコンストラクション'] = 'AvatarDeBuffWard',['クロノシフト'] = 'AvatarDeBuffWard',['絶対防御'] = 'AvatarBuffWard',
    }
end


--■■■ロール情報
function define_roll_values()
    rolls = {
        ["コルセアズロール"]     = {lucky=5, unlucky=9, bonus="取得経験値量"},
        ["ニンジャロール"]       = {lucky=4, unlucky=8, bonus="回避"},
        ["ハンターズロール"]     = {lucky=4, unlucky=8, bonus="命中・飛命"},
        ["カオスロール"]         = {lucky=4, unlucky=8, bonus="攻撃力・飛攻"},
        ["メガスズロール"]       = {lucky=2, unlucky=6, bonus="魔法防御力"},
        ["ヒーラーズロール"]     = {lucky=3, unlucky=7, bonus="被ケアル回復量"},
        ["ドラケンロール"]       = {lucky=4, unlucky=8, bonus="ペット命中・飛命"},
        ["コーラルロール"]       = {lucky=2, unlucky=6, bonus="詠唱中断率ダウン"},
        ["モンクスロール"]       = {lucky=3, unlucky=7, bonus="モクシャアップ"},
        ["ビーストロール"]       = {lucky=4, unlucky=8, bonus="ペット攻撃力"},
        ["サムライロール"]       = {lucky=2, unlucky=6, bonus="ストアTP"},
        ["エボカーズロール"]     = {lucky=5, unlucky=9, bonus="リフレシュ"},
        ["ローグズロール"]       = {lucky=5, unlucky=9, bonus="クリティカルヒット確率"},
        ["ワーロックスロール"]   = {lucky=4, unlucky=8, bonus="魔法命中"},
        ["ファイターズロール"]   = {lucky=5, unlucky=9, bonus="ダブルアタック効果"},
        ["パペットロール"]       = {lucky=4, unlucky=8, bonus="ペット魔法攻撃力・魔法命中率"},
        ["ガランツロール"]       = {lucky=3, unlucky=7, bonus="防御力"},
        ["ウィザーズロール"]     = {lucky=5, unlucky=9, bonus="魔法攻撃力"},
        ["ダンサーロール"]       = {lucky=3, unlucky=7, bonus="リジェネ"},
        ["スカラーロール"]       = {lucky=2, unlucky=6, bonus="コンサーブMP"},
        ["ナチュラリストロール"] = {lucky=3, unlucky=7, bonus="被強化魔法延長"},
        ["ルーニストロール"]     = {lucky=4, unlucky=8, bonus="魔法回避率アップ"},
        ["ボルターズロール"]     = {lucky=3, unlucky=9, bonus="移動速度"},
        ["キャスターズロール"]   = {lucky=2, unlucky=7, bonus="ファストキャスト"},
        ["コアサーズロール"]     = {lucky=3, unlucky=9, bonus="スナップショット"},
        ["ブリッツァロール"]     = {lucky=4, unlucky=9, bonus="攻撃間隔"},
        ["タクティックロール"]   = {lucky=5, unlucky=8, bonus="リゲイン・リジェネ"},
        ["アライズロール"]       = {lucky=3, unlucky=10,bonus="連携ダメージ・命中"},
        ["マイザーロール"]       = {lucky=5, unlucky=7, bonus="セーブTP"},
        ["コンパニオンロール"]   = {lucky=2, unlucky=10,bonus="ペットリゲイン・リジェネ"},
        ["カウンターロール"]     = {lucky=4, unlucky=8, bonus="カウンター確率"},
    }
end

weakmagic = S{'ストーン','ストーンII','ストーンIII','ウォータ','ウォータII','ウォータIII','エアロ','エアロII','エアロIII','ファイア','ファイアII','ファイアIII','ブリザド','ブリザドII','ブリザドIII','サンダー','サンダーII','サンダーIII'}


--■■■ロール情報出力
function display_roll_info(spell)
    rollinfo = rolls[spell.japanese]
    if rollinfo then
        local desc = rolls[spell.name].bonus
        local lucky = rolls[spell.name].lucky
        local unlucky = rolls[spell.name].unlucky
        windower.add_to_chat(2, spell.name .. ' [' ..desc ..'] Lucky=' .. lucky .. ' '.. ' Unluck='.. unlucky)
    end
end

--WS
function init_weapon_skill()
    --近接物理ダメージ：sets.precast.WS.Damage
    --近接クリティカル：sets.precast.WS.Critical
    --魔攻：sets.precast.WS.Magic
    --遠隔物理ダメージ：sets.precast.WS.Range
    
    sets.precast.WS["コンボ"]                   = sets.precast.WS.Damage
    sets.precast.WS["タックル"]                 = sets.precast.WS.Damage
    sets.precast.WS["短勁"]                     = sets.precast.WS.Damage
    sets.precast.WS["バックハンドブロー"]       = sets.precast.WS.Critical
    sets.precast.WS["乱撃"]                     = sets.precast.WS.Damage
    sets.precast.WS["スピンアタック"]           = sets.precast.WS.Damage
    sets.precast.WS["空鳴拳"]                   = sets.precast.WS.Damage
    sets.precast.WS["双竜脚"]                   = sets.precast.WS.Damage
    sets.precast.WS["夢想阿修羅拳"]             = sets.precast.WS.Damage
    sets.precast.WS["闘魂旋風脚"]               = sets.precast.WS.Damage
    sets.precast.WS["ファイナルパラダイス"]     = sets.precast.WS.Damage
    sets.precast.WS["ファイナルヘヴン"]         = sets.precast.WS.Damage
    sets.precast.WS["アスケーテンツォルン"]     = sets.precast.WS.Critical
    sets.precast.WS["連環六合圏"]               = sets.precast.WS.Critical
    sets.precast.WS["ビクトリースマイト"]       = sets.precast.WS.Critical
    sets.precast.WS["四神円舞"]                 = sets.precast.WS.Damage
    sets.precast.WS["ドラゴンブロウ"]           = sets.precast.WS.Damage
    sets.precast.WS["マルカラ"]                 = sets.precast.WS.Damage

    sets.precast.WS["ワスプスティング"]         = sets.precast.WS.Damage
    sets.precast.WS["ガストスラッシュ"]         = sets.precast.WS.Magic
    sets.precast.WS["シャドーステッチ"]         = sets.precast.WS.Damage
    sets.precast.WS["バイパーバイト"]           = sets.precast.WS.Damage
    sets.precast.WS["サイクロン"]               = sets.precast.WS.Magic
    sets.precast.WS["エナジースティール"]       = sets.precast.WS.Damage
    sets.precast.WS["エナジードレイン"]         = sets.precast.WS.Damage
    sets.precast.WS["ダンシングエッジ"]         = sets.precast.WS.Damage
    sets.precast.WS["シャークバイト"]           = sets.precast.WS.Damage
    sets.precast.WS["エヴィサレーション"]       = sets.precast.WS.Critical
    sets.precast.WS["イオリアンエッジ"]         = sets.precast.WS.Magic
    sets.precast.WS["マーシーストローク"]       = sets.precast.WS.Damage
    sets.precast.WS["マンダリクスタッブ"]       = sets.precast.WS.Damage
    sets.precast.WS["モーダントライム"]         = sets.precast.WS.Damage
    sets.precast.WS["ピリッククレオス"]         = sets.precast.WS.Damage
    sets.precast.WS["ルドラストーム"]           = sets.precast.WS.Damage
    sets.precast.WS["エクゼンテレター"]         = sets.precast.WS.Damage
    sets.precast.WS["ルースレスストローク"]     = sets.precast.WS.Damage

    sets.precast.WS["ファストブレード"]         = sets.precast.WS.Damage
    sets.precast.WS["バーニングブレード"]       = sets.precast.WS.Magic
    sets.precast.WS["レッドロータス"]           = sets.precast.WS.Magic
    sets.precast.WS["フラットブレード"]         = sets.precast.WS.Damage
    sets.precast.WS["シャインブレード"]         = sets.precast.WS.Magic
    sets.precast.WS["セラフブレード"]           = sets.precast.WS.Magic
    sets.precast.WS["サークルブレード"]         = sets.precast.WS.Damage
    sets.precast.WS["スピリッツウィズイン"]     = sets.precast.WS.Damage
    sets.precast.WS["ボーパルブレード"]         = sets.precast.WS.Critical
    sets.precast.WS["スウィフトブレード"]       = sets.precast.WS.Damage
    sets.precast.WS["サベッジブレード"]         = sets.precast.WS.Damage
    sets.precast.WS["サンギンブレード"]         = sets.precast.WS.Magic
    sets.precast.WS["ナイスオブラウンド"]       = sets.precast.WS.Damage
    sets.precast.WS["ナイツオブラウンド"]       = sets.precast.WS.Damage
    sets.precast.WS["ロズレーファタール"]       = sets.precast.WS.Damage
    sets.precast.WS["ロイエ"]                   = sets.precast.WS.Damage
    sets.precast.WS["エクスピアシオン"]         = sets.precast.WS.Damage
    sets.precast.WS["ウリエルブレード"]         = sets.precast.WS.Damage
    sets.precast.WS["グローリースラッシュ"]     = sets.precast.WS.Damage
    sets.precast.WS["シャンデュシニュ"]         = sets.precast.WS.Critical
    sets.precast.WS["レクイエスカット"]         = sets.precast.WS.Damage
    sets.precast.WS["ファストブレードII"]       = sets.precast.WS.Damage
    sets.precast.WS["インペラトル"]             = sets.precast.WS.Damage

    sets.precast.WS["ハードスラッシュ"]         = sets.precast.WS.Damage
    sets.precast.WS["パワースラッシュ"]         = sets.precast.WS.Critical
    sets.precast.WS["フロストバイト"]           = sets.precast.WS.Magic
    sets.precast.WS["フリーズバイト"]           = sets.precast.WS.Magic
    sets.precast.WS["ショックウェーブ"]         = sets.precast.WS.Damage
    sets.precast.WS["クレセントムーン"]         = sets.precast.WS.Damage
    sets.precast.WS["シックルムーン"]           = sets.precast.WS.Damage
    sets.precast.WS["スピンスラッシュ"]         = sets.precast.WS.Damage
    sets.precast.WS["グラウンドストライク"]     = sets.precast.WS.Damage
    sets.precast.WS["ヘラクレススラッシュ"]     = sets.precast.WS.Magic
    sets.precast.WS["スカージ"]                 = sets.precast.WS.Damage
    sets.precast.WS["トアクリーバー"]           = sets.precast.WS.Damage
    sets.precast.WS["レゾルーション"]           = sets.precast.WS.Damage
    sets.precast.WS["デミディエーション"]       = sets.precast.WS.Damage
    sets.precast.WS["フィンブルヴェト"]         = sets.precast.WS.Damage

    sets.precast.WS["レイジングアクス"]         = sets.precast.WS.Damage
    sets.precast.WS["スマッシュ"]               = sets.precast.WS.Damage
    sets.precast.WS["ラファールアクス"]         = sets.precast.WS.Damage
    sets.precast.WS["アバランチアクス"]         = sets.precast.WS.Damage
    sets.precast.WS["スピニングアクス"]         = sets.precast.WS.Damage
    sets.precast.WS["ランページ"]               = sets.precast.WS.Critical
    sets.precast.WS["カラミティ"]               = sets.precast.WS.Damage
    sets.precast.WS["ミストラルアクス"]         = sets.precast.WS.Damage
    sets.precast.WS["デシメーション"]           = sets.precast.WS.Damage
    sets.precast.WS["ボーラアクス"]             = sets.precast.WS.Damage
    sets.precast.WS["オンスロート"]             = sets.precast.WS.Damage
    sets.precast.WS["プライマルレンド"]         = sets.precast.WS.Magic
    sets.precast.WS["クラウドスプリッタ"]       = sets.precast.WS.Magic
    sets.precast.WS["ルイネーター"]             = sets.precast.WS.Damage
    sets.precast.WS["ブリッツ"]                 = sets.precast.WS.Damage

    sets.precast.WS["シールドブレイク"]         = sets.precast.WS.Damage
    sets.precast.WS["アイアンテンペスト"]       = sets.precast.WS.Damage
    sets.precast.WS["シュトルムヴィント"]       = sets.precast.WS.Damage
    sets.precast.WS["アーマーブレイク"]         = sets.precast.WS.Damage
    sets.precast.WS["キーンエッジ"]             = sets.precast.WS.Critical
    sets.precast.WS["ウェポンブレイク"]         = sets.precast.WS.Damage
    sets.precast.WS["レイジングラッシュ"]       = sets.precast.WS.Critical
    sets.precast.WS["フルブレイク"]             = sets.precast.WS.Damage
    sets.precast.WS["スチールサイクロン"]       = sets.precast.WS.Damage
    sets.precast.WS["フェルクリーヴ"]           = sets.precast.WS.Damage
    sets.precast.WS["メタトロントーメント"]     = sets.precast.WS.Damage
    sets.precast.WS["キングズジャスティス"]     = sets.precast.WS.Damage
    sets.precast.WS["ウッコフューリー"]         = sets.precast.WS.Damage
    sets.precast.WS["アップヒーバル"]           = sets.precast.WS.Damage
    sets.precast.WS["ディザスター"]             = sets.precast.WS.Damage

    sets.precast.WS["スライス"]                 = sets.precast.WS.Damage
    sets.precast.WS["ダークハーベスト"]         = sets.precast.WS.Magic
    sets.precast.WS["シャドーオブデス"]         = sets.precast.WS.Magic
    sets.precast.WS["ナイトメアサイス"]         = sets.precast.WS.Damage
    sets.precast.WS["スピニングサイス"]         = sets.precast.WS.Damage
    sets.precast.WS["ボーパルサイス"]           = sets.precast.WS.Critical
    sets.precast.WS["ギロティン"]               = sets.precast.WS.Damage
    sets.precast.WS["クロスリーパー"]           = sets.precast.WS.Damage
    sets.precast.WS["スパイラルヘル"]           = sets.precast.WS.Damage
    sets.precast.WS["インファナルサイズ"]       = sets.precast.WS.Magic
    sets.precast.WS["カタストロフィ"]           = sets.precast.WS.Damage
    sets.precast.WS["インサージェンシー"]       = sets.precast.WS.Damage
    sets.precast.WS["クワイタス"]               = sets.precast.WS.Damage
    sets.precast.WS["エントロピー"]             = sets.precast.WS.Damage
    sets.precast.WS["ジ・オリジン"]             = sets.precast.WS.Damage

    sets.precast.WS["ダブルスラスト"]           = sets.precast.WS.Damage
    sets.precast.WS["サンダースラスト"]         = sets.precast.WS.Magic
    sets.precast.WS["ライデンスラスト"]         = sets.precast.WS.Magic
    sets.precast.WS["足払い"]                   = sets.precast.WS.Damage
    sets.precast.WS["ペンタスラスト"]           = sets.precast.WS.Damage
    sets.precast.WS["ボーパルスラスト"]         = sets.precast.WS.Critical
    sets.precast.WS["スキュアー"]               = sets.precast.WS.Critical
    sets.precast.WS["大車輪"]                   = sets.precast.WS.Damage
    sets.precast.WS["インパルスドライヴ"]       = sets.precast.WS.Damage
    sets.precast.WS["ソニックスラスト"]         = sets.precast.WS.Damage
    sets.precast.WS["ゲイルスコグル"]           = sets.precast.WS.Damage
    sets.precast.WS["雲蒸竜変"]                 = sets.precast.WS.Critical
    sets.precast.WS["カムラン"]                 = sets.precast.WS.Damage
    sets.precast.WS["スターダイバー"]           = sets.precast.WS.Damage
    sets.precast.WS["ダーマット"]               = sets.precast.WS.Damage

    sets.precast.WS["臨"]                       = sets.precast.WS.Critical
    sets.precast.WS["烈"]                       = sets.precast.WS.Damage
    sets.precast.WS["滴"]                       = sets.precast.WS.Magic
    sets.precast.WS["凍"]                       = sets.precast.WS.Magic
    sets.precast.WS["地"]                       = sets.precast.WS.Magic
    sets.precast.WS["影"]                       = sets.precast.WS.Magic
    sets.precast.WS["迅"]                       = sets.precast.WS.Critical
    sets.precast.WS["天"]                       = sets.precast.WS.Damage
    sets.precast.WS["空"]                       = sets.precast.WS.Damage
    sets.precast.WS["湧"]                       = sets.precast.WS.Magic
    sets.precast.WS["生者必滅"]                 = sets.precast.WS.Damage
    sets.precast.WS["カムハブリ"]               = sets.precast.WS.Damage
    sets.precast.WS["秘"]                       = sets.precast.WS.Critical
    sets.precast.WS["瞬"]                       = sets.precast.WS.Damage
    sets.precast.WS["是生滅法"]                 = sets.precast.WS.Damage

    sets.precast.WS["壱之太刀・燕飛"]           = sets.precast.WS.Damage
    sets.precast.WS["弐之太刀・鋒縛"]           = sets.precast.WS.Damage
    sets.precast.WS["参之太刀・轟天"]           = sets.precast.WS.Magic
    sets.precast.WS["四之太刀・陽炎"]           = sets.precast.WS.Magic
    sets.precast.WS["五之太刀・陣風"]           = sets.precast.WS.Magic
    sets.precast.WS["六之太刀・光輝"]           = sets.precast.WS.Magic
    sets.precast.WS["七之太刀・雪風"]           = sets.precast.WS.Damage
    sets.precast.WS["八之太刀・月光"]           = sets.precast.WS.Damage
    sets.precast.WS["九之太刀・花車"]           = sets.precast.WS.Damage
    sets.precast.WS["十一之太刀・鳳蝶"]         = sets.precast.WS.Damage
    sets.precast.WS["盛夏之太刀・西瓜割"]       = sets.precast.WS.Damage
    sets.precast.WS["零之太刀・回天"]           = sets.precast.WS.Damage
    sets.precast.WS["十之太刀・乱鴉"]           = sets.precast.WS.Damage
    sets.precast.WS["祖之太刀・不動"]           = sets.precast.WS.Damage
    sets.precast.WS["十二之太刀・照破"]         = sets.precast.WS.Damage
    sets.precast.WS["絶之太刀・無名"]           = sets.precast.WS.Damage

    sets.precast.WS["シャインストライク"]       = sets.precast.WS.Magic
    sets.precast.WS["セラフストライク"]         = sets.precast.WS.Magic
    sets.precast.WS["ブレインシェイカー"]       = sets.precast.WS.Damage
    sets.precast.WS["スターライト"]             = sets.precast.WS.Damage
    sets.precast.WS["ムーンライト"]             = sets.precast.WS.Damage
    sets.precast.WS["スカルブレイカー"]         = sets.precast.WS.Damage
    sets.precast.WS["トゥルーストライク"]       = sets.precast.WS.Critical
    sets.precast.WS["ジャッジメント"]           = sets.precast.WS.Damage
    sets.precast.WS["ヘキサストライク"]         = sets.precast.WS.Critical
    sets.precast.WS["ブラックヘイロー"]         = sets.precast.WS.Damage
    sets.precast.WS["フラッシュノヴァ"]         = sets.precast.WS.Magic
    sets.precast.WS["ランドグリース"]           = sets.precast.WS.Damage
    sets.precast.WS["ミスティックブーン"]       = sets.precast.WS.Damage
    sets.precast.WS["ダガン"]                   = sets.precast.WS.Damage
    sets.precast.WS["レルムレイザー"]           = sets.precast.WS.Damage
    sets.precast.WS["エクズデーション"]         = sets.precast.WS.Damage
    sets.precast.WS["ダグダ"]                   = sets.precast.WS.Damage

    sets.precast.WS["ヘヴィスイング"]           = sets.precast.WS.Damage
    sets.precast.WS["ロッククラッシャー"]       = sets.precast.WS.Magic
    sets.precast.WS["アースクラッシャー"]       = sets.precast.WS.Magic
    sets.precast.WS["スターバースト"]           = sets.precast.WS.Magic
    sets.precast.WS["サンバースト"]             = sets.precast.WS.Magic
    sets.precast.WS["シェルクラッシャー"]       = sets.precast.WS.Damage
    sets.precast.WS["フルスイング"]             = sets.precast.WS.Damage
    sets.precast.WS["スピリットテーカー"]       = sets.precast.WS.Damage
    sets.precast.WS["レトリビューション"]       = sets.precast.WS.Damage
    sets.precast.WS["カタクリスム"]             = sets.precast.WS.Magic
    sets.precast.WS["タルタロスゲート"]         = sets.precast.WS.Damage
    sets.precast.WS["ヴィゾフニル"]             = sets.precast.WS.Magic
    sets.precast.WS["ガーランドオブブリス"]     = sets.precast.WS.Magic
    sets.precast.WS["オムニシエンス"]           = sets.precast.WS.Magic
    sets.precast.WS["タルタロストーパー"]       = sets.precast.WS.Damage
    sets.precast.WS["ミルキル"]                 = sets.precast.WS.Mp
    sets.precast.WS["シャッターソウル"]         = sets.precast.WS.Damage
    sets.precast.WS["オシャラ"]                 = sets.precast.WS.Damage

    sets.precast.WS["フレイミングアロー"]       = sets.precast.WS.Magic
    sets.precast.WS["ピアシングアロー"]         = sets.precast.WS.Range
    sets.precast.WS["ダリングアロー"]           = sets.precast.WS.Range
    sets.precast.WS["サイドワインダー"]         = sets.precast.WS.Range
    sets.precast.WS["ブラストアロー"]           = sets.precast.WS.Range
    sets.precast.WS["アーチングアロー"]         = sets.precast.WS.Range
    sets.precast.WS["エンピリアルアロー"]       = sets.precast.WS.Range
    sets.precast.WS["リフルジェントアロー"]     = sets.precast.WS.Range
    sets.precast.WS["南無八幡"]                 = sets.precast.WS.Range
    sets.precast.WS["ジシュヌの光輝"]           = sets.precast.WS.Range
    sets.precast.WS["エイペクスアロー"]         = sets.precast.WS.Range
    sets.precast.WS["シャルヴ"]                 = sets.precast.WS.Range

    sets.precast.WS["ホットショット"]           = sets.precast.WS.Magic
    sets.precast.WS["スプリットショット"]       = sets.precast.WS.Range
    sets.precast.WS["スナイパーショット"]       = sets.precast.WS.Range
    sets.precast.WS["スラッグショット"]         = sets.precast.WS.Range
    sets.precast.WS["ブラストショット"]         = sets.precast.WS.Range
    sets.precast.WS["ヘヴィショット"]           = sets.precast.WS.Range
    sets.precast.WS["デトネーター"]             = sets.precast.WS.Range
    sets.precast.WS["ナビングショット"]         = sets.precast.WS.Range
    sets.precast.WS["カラナック"]               = sets.precast.WS.Range
    sets.precast.WS["トゥルーフライト"]         = sets.precast.WS.Magic
    sets.precast.WS["レデンサリュート"]         = sets.precast.WS.Magic
    sets.precast.WS["ワイルドファイア"]         = sets.precast.WS.Magic
    sets.precast.WS["ラストスタンド"]           = sets.precast.WS.Range
    sets.precast.WS["ジ・エンド"]               = sets.precast.WS.Range
end

--カンニングペーパー
local Sortietexts = require('texts')
message_sortie={
    [1] = {name='アンジュレティングショックウェーブ', desc1='氷　'},
    [2] = {name='シュリーキングゲイル', desc1='土　'},

    [3] = {name='フレミングキック', desc1='水　'},
    [4] = {name='アイシーグラスプ', desc1='火　'},
    [5] = {name='エローディングフレッシュ', desc1='風　'},
    [6] = {name='ファルミナススマッシュ', desc1='土　'},
    [7] = {name='フラッシュフラッド', desc1='雷　'},
}
text_box_sortie = Sortietexts.new('${text}',{text={font='Meiryo', size=10}, pos={x=20, y=200}, padding = 5, bg={alpha=180}})
text_box_sortie.text='弱　特殊技名（　BFボス　）\n'..
'\\cs(204, 255, 255)'..message_sortie[1].desc1..message_sortie[1].name..'\\cr'..'\n'..
'\\cs(255, 255, 204)'..message_sortie[2].desc1..message_sortie[2].name..'\\cr'..'\n'..
'\\cr'..'\n'..
'\\cr'..'弱　特殊技名（　DHボス　）\n'..
'\\cs(204, 204, 255)'..message_sortie[3].desc1..message_sortie[3].name..'\\cr'..'\n'..
'\\cs(255, 204, 204)'..message_sortie[4].desc1..message_sortie[4].name..'\\cr'..'\n'..
'\\cs(204, 255, 204)'..message_sortie[5].desc1..message_sortie[5].name..'\\cr'..'\n'..
'\\cs(255, 255, 204)'..message_sortie[6].desc1..message_sortie[6].name..'\\cr'..'\n'..
'\\cs(255, 204, 255)'..message_sortie[7].desc1..message_sortie[7].name..'\\cr'

function showTextSortie()
    text_box_sortie:show()
end

function hideTextSortie()
    text_box_sortie:hide()
end


local Runetexts = require('texts')
message_rune={
    [1] = {name='イグニス　', desc1='火：',desc2='（氷：',desc3='麻痺、バインド）'},
    [2] = {name='ゲールス　', desc1='氷：',desc2='（風：',desc3='静寂、ヘヴィ）'},
    [3] = {name='フラブラ　', desc1='風：',desc2='（土：',desc3='石化、テラー、スロウ）'},
    [4] = {name='テッルス　', desc1='土：',desc2='（雷：',desc3='スタン）'},
    [5] = {name='スルポール', desc1='雷：',desc2='（水：',desc3='毒）'},
    [6] = {name='ウンダ　　', desc1='水：',desc2='（火：',desc3='病気、悪疫、アムネジア）'},
    [7] = {name='ルックス　', desc1='光：',desc2='（闇：',desc3='呪い、睡眠）'},
    [8] = {name='テネブレイ', desc1='闇：',desc2='（光：',desc3='魅了、睡眠）'},
}
text_box_rune = Runetexts.new('${text}',{text={font='Meiryo', size=10}, pos={x=10, y=220}, padding = 5, bg={alpha=180}})
text_box_rune.text='属性　　　　　　耐性\n'..
'\\cs(255, 204, 204)'..message_rune[1].desc1..message_rune[1].name..message_rune[1].desc2..message_rune[1].desc3..'\\cr'..'\n'..
'\\cs(204, 255, 255)'..message_rune[2].desc1..message_rune[2].name..message_rune[2].desc2..message_rune[2].desc3..'\\cr'..'\n'..
'\\cs(204, 255, 204)'..message_rune[3].desc1..message_rune[3].name..message_rune[3].desc2..message_rune[3].desc3..'\\cr'..'\n'..
'\\cs(255, 255, 204)'..message_rune[4].desc1..message_rune[4].name..message_rune[4].desc2..message_rune[4].desc3..'\\cr'..'\n'..
'\\cs(255, 204, 255)'..message_rune[5].desc1..message_rune[5].name..message_rune[5].desc2..message_rune[5].desc3..'\\cr'..'\n'..
'\\cs(204, 204, 255)'..message_rune[6].desc1..message_rune[6].name..message_rune[6].desc2..message_rune[6].desc3..'\\cr'..'\n'..
'\\cs(255, 255, 255)'..message_rune[7].desc1..message_rune[7].name..message_rune[7].desc2..message_rune[7].desc3..'\\cr'..'\n'..
'\\cs(204, 204, 204)'..message_rune[8].desc1..message_rune[8].name..message_rune[8].desc2..message_rune[8].desc3..'\\cr'

function showTextRune()
    text_box_rune:show()
end

function hideTextRune()
    text_box_rune:hide()
end
