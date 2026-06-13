function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('クロセアモースC'))
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('wait 1; gs c set SubWeapons '..windower.to_shift_jis('ターニオンダガー'))
    else
        send_command('wait 1; gs c set SubWeapons '..windower.to_shift_jis('アムラピシールド'))
    end
end


function init_gear_sets()
	--ロックスタイル番号
	lockstyleset = 5

	--武器
    gear['クロセアモースC']     = {name="クロセアモース", augments={'Path: C'}}
    gear['ネイグリング']        = {name="ネイグリング"}
    gear['トーレット']          = {name="トーレット"}
    gear['マレヴォレンス']      = {name="マレヴォレンス"}
    gear['ターニオンダガー']    = {name="ターニオンダガー+1"}
	gear['クトゥルブナイフ']    = {name="クトゥルブナイフ"}
	gear['幽世の短剣'] 		    = {name="幽世の短剣"}
    gear['マクセンチアス']      = {name="マクセンチアス"}
    gear['デイブレイクワンド']  = {name="デイブレイクワンド"}
    gear['玄冥盾']    			= {name="玄冥盾"}
    gear['アムラピシールド']	= {name="アムラピシールド"}
    gear['ウルル']              = {name="ウルル"}
    gear.Slip  					= {name="カリブルヌス"}
    
	--待機装備
	sets.idle = {
        ammo="ストンチタスラム+1",
        head={ name="ＶＩシャポー+3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="ＬＴサヨン+2",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
	}
	
    --抜刀装備
	sets.engaged = {
    }

	--エン殴り装備
	sets.engaged.Enn = set_combine(sets.engaged,{
    })
    
	--二刀流11（サポ忍）
	sets.engaged.dual11={left_ear="素破の耳",waist="霊亀腰帯",}
	
	--二刀流21（サポ踊）
	sets.engaged.dual21=set_combine(sets.engaged.dual11,{back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},})


	--監視用バフ
	sets.buff['エンストーン'] 		= {neck="クアンプネックレス"}

	--即時発動系
	sets.precast.JA['サボトゥール'] = {hands="ＬＴガントロ+2"}
    sets.precast.JA['連続魔'] 		= {body="ＶＩタバード+3"}
	
	--FC
    sets.precast.FC = {
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
        feet={ name="マーリンクラッコー", augments={'"Mag.Atk.Bns."+2','"Fast Cast"+5','AGI+6','Mag. Acc.+14',}},
        neck="オルンミラトルク",
        right_ear="エテオレートピアス",
        left_ring="メランリング",
        right_ring="メダダリング",
        back="フィフォレケープ+1",
    }
	    sets.precast.FC.value = 47

	--FC（ディスペガ）
	sets.precast.FC['ディスペガ'] = set_combine(sets.precast.FC,{main="デイブレイクワンド",})
	
	--FC（インパクト）
	sets.precast.FC['インパクト'] = set_combine(sets.precast.FC,{head=empty,body="クレパスクラプリス",})
	
	--遠隔攻撃
	sets.precast.RA ={range="ラミアベーン"}

	--WSダメージ
    sets.precast.WS.Damage = {
    }
	
	--WSクリティカル
    sets.precast.WS.Critical = {
	}
	
	--WS魔攻
    sets.precast.WS.Magic = {
	}

	--WSモクシャ
    sets.precast.WS.SubtleBlow = sets.engaged.SubtleBlow


    --共通WS定義読み込み
    init_weapon_skill()

    --個別WS定義
    sets.precast.WS["サンギンブレード"] = { set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",})}
    
	--精霊魔法
--    sets.midcast['精霊魔法'] = {}
	
	--弱体魔法時間
	sets.midcast['弱体魔法'] ={
		ammo="ペムフレドタスラム",
		head={ name="ＶＩシャポー+3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="ＬＴサヨン+3",
		hands="ＬＴガントロ+2",
		legs="ＬＴフュゾー+2",
		feet={ name="ＶＩブーツ+3", augments={'Immunobreak Chance',}},
		neck="無の喉輪",
		waist={ name="オブシテナサッシュ", augments={'Path: A',}},
		left_ear="マリグナスピアス",
		right_ear="スノトラピアス",
		left_ring={ name="メタモルリング+1", augments={'Path: A',}},
		right_ring="キシャールリング",
		back="無の外装",
	}
	--暗黒魔法
	sets.midcast['暗黒魔法'] ={
	}

    --ディスペガ
	sets.midcast['ディスペガ']  = set_combine(sets.midcast['弱体魔法'],{main="デイブレイクワンド",})

	--インパクト
	sets.midcast["インパクト"]  = set_combine(sets.midcast['弱体魔法'],{head=empty,body="クレパスクラプリス",})

	--弱体魔法効果MND/hack
	sets.midcast.EnfeeblingEffectMnd = set_combine(sets.midcast['弱体魔法'],{
        body="ＡＴタバード+3",
		legs={ name="カイロンホーズ", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Fast Cast"+1','MND+14','Mag. Acc.+9',}},
		left_ear="ヴォルピアス",
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +16',}},
	})

	--弱体魔法効果INT/hack
	sets.midcast.EnfeeblingEffectInt = set_combine(sets.midcast['弱体魔法'],{
		left_ear="ヴォルピアス",
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +16',}},
	})

	--ケアル
	sets.midcast.Cure = {
		ammo="ストンチタスラム+1",
		head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		legs={ name="ヴァニヤスロップス", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
		neck="オルンミラトルク",
		waist="コーネリアの黒帯",
		left_ear="メンデカントピアス",
		right_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
		left_ring="スティキニリング+1",
		right_ring="レベッチェリング",
		back="ソレムニティケープ",
	}

	--強化魔法（自分）
	sets.midcast['強化魔法'] = {
        sub="アムラピシールド",
        ammo="ストンチタスラム+1",
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
        hands='ＡＴグローブ+3',
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet="ＬＴウゾー+3",
        neck="バーシチョーカー+1",
        waist="エンブラサッシュ",
        left_ear="エアバニピアス",
        right_ear={ name="レサジーピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','"Dbl.Atk."+4',}},
        left_ring="スティキニリング+1",
        right_ring="シュネデックリング",
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +7','Enha.mag. skill +9','Mag. Acc.+4','Enh. Mag. eff. dur. +18',}},
	}

	--強化魔法（他者）
	sets.midcast['強化魔法'].Other = set_combine(sets.midcast['強化魔法'] ,{
		head="ＬＴシャペル+2",
		body="ＬＴサヨン+2",
        hands='ＡＴグローブ+3',
		legs="ＬＴフュゾー+2",
		feet="ＬＴウゾー+3",
	})

	--強化魔法スキル
	sets.midcast.EnhancingSkill=
	{
		ammo="ストンチタスラム+1",
		head="ビファウルクラウン",
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="ＶＩグローブ+3", augments={'Enhancing Magic duration',}},
		legs="ＡＴタイツ+3",
		feet="ＬＴウゾー+2",
		neck="インカンタートルク",
		waist="オリンポスサッシュ",
		left_ear="ミミルピアス",
		right_ear="アンドアーピアス",
		left_ring="スティキニリング+1",
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +16',}},
	}

	sets.midcast.Refresh         = set_combine(sets.midcast['強化魔法'] ,{head="ＡＭコイフ+1",body="ＡＴタバード+3",Legs="ＬＴフュゾー+2"})
	sets.midcast['ストンスキン'] = set_combine(sets.midcast['強化魔法'] ,{legs="シェダルサラウィル", neck="ノデンズゴルゲット", left_ear="アースクライピアス", waist="ジーゲルサッシュ",})
	sets.midcast['アクアベール'] = set_combine(sets.midcast['強化魔法'] ,{head="ＡＭコイフ+1", legs="シェダルサラウィル"})
end
