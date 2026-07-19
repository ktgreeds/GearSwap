function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('クロセアモースC'))
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('wait 1; gs c set SubWeapons '..windower.to_shift_jis('クレパスクラナイフ'))
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
    gear['クレパスクラナイフ']  = {name="クレパスクラナイフ"}
	gear['クトゥルブナイフ']    = {name="クトゥルブナイフ"}
	gear['幽世の短剣'] 		    = {name="幽世の短剣"}
    gear['マクセンチアス']      = {name="マクセンチアス"}
    gear['デイブレイクワンド']  = {name="デイブレイクワンド"}
    gear['玄冥盾']    			= {name="玄冥盾"}
    gear['アムラピシールド']	= {name="アムラピシールド"}
    gear['ウルル']              = {name="ウルル"}
    gear.Slip  					= {name="カリブルヌス"}

    --モクシャ
    sets.SubtleBlow = {
    }

    sets.TreasureHunter = {
        ammo="完璧な幸運の卵",
        body="ヴォルトジュポン",
        waist="チャークベルト"
    }

	--バフ
	sets.buff['エンストーン'] 		    = {neck="クアンプネックレス"}
    sets.precast.JA['連続魔'] 		    = {body="ＶＩタバード+3"}
    sets.precast.JA['コンバート'] 		= {}
    sets.precast.JA['コンポージャー'] 	= {}
	sets.precast.JA['サボトゥール']     = {hands="ＬＴガントロ+2"}
    sets.precast.JA['クイックマジック'] = {}
    sets.precast.JA['スタイミー'] 		= {}

    --待機装備
	sets.idle = {
        ammo="ストンチタスラム+1",
        head={ name="ＶＩシャポー+3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
        body="ＬＴサヨン+3",
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
        range=empty,
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist="ウィンバフベルト+1",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

	--エン殴り装備
	sets.engaged.Enn = set_combine(sets.engaged,{
        --range="ウルル",
        --ammo=empty,
        hands="アヤモマノポラ+2",
        legs="ＶＩタイツ+3",
        waist="オルペウスサッシュ",
        right_ear="レサジーピアス+1",
        left_ring="シーリチリング+1",
        right_ring="メタモルリング+1",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
    })

	--二刀流11（サポ忍）
	sets.engaged.dual11={left_ear="素破の耳",waist="霊亀腰帯",}
	
	--二刀流21（サポ踊）
	sets.engaged.dual21=set_combine(sets.engaged.dual11,{back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},})
	
	--FC
    sets.precast.FC = {
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
		feet={ name="マーリンクラッコー", augments={'"Fast Cast"+7','MND+5',}},
		neck="オルンミラトルク",
		waist={name="プラチナモグベルト",priority=15},
		left_ear={name="オノワイヤリング+1",priority=14},
		right_ear={name="エテオレートピアス",priority=12},
		left_ring={name="月明の指輪",priority=13},
        left_ring="キシャールリング",
		right_ring="ラハブリング",
		back={name="月明の羽衣",priority=16},
    }

	--FC（ディスペガ）
	sets.precast.FC['ディスペガ'] = set_combine(sets.precast.FC,{main="デイブレイクワンド",})
	
	--FC（インパクト）
	sets.precast.FC['インパクト'] = set_combine(sets.precast.FC,{head=empty,body="クレパスクラプリス",})
	
	--遠隔攻撃
	sets.precast.RA ={range="ラミアベーン"}

	--WSダメージ
    sets.precast.WS.Damage = {
        ammo="昏黄の礫",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ＬＴウゾー+3",
        neck="共和プラチナ章",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="シェリダピアス",
        left_ring="スローダリング",
        right_ring="エパミノダスリング",
        back={ name="スセロスケープ", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
	
	--WSクリティカル
    sets.precast.WS.Critical = {
        ammo="イェットシーラ",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="マーケピアス+1",
        right_ear="シェリダピアス",
        left_ring="イラブラットリング",
        right_ring="シーリチリング+1",
        back={ name="スセロスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	}
	
	--WS魔攻
    sets.precast.WS.Magic = {
        ammo="ペムフレドタスラム",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ＬＴウゾー+3",
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="マリグナスピアス",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="イフラマドリング",
        right_ring="エパミノダスリング",
        back={ name="スセロスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
	}

    --共通WS定義読み込み
    init_weapon_skill()

    --個別WS定義
    sets.precast.WS["サンギンブレード"] = set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",})
    
	--精霊魔法
    sets.midcast['精霊魔法'] = {
		main="ブンジロッド",
		sub="アムラピシールド",
		ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
		head="ＬＴシャペル+2",
		body="ＬＴサヨン+3",
		hands="ＬＴガントロ+2",
		legs="ＬＴフュゾー+2",
		feet="ＬＴウゾー+3",
		neck="水影の首飾り",
		left_ear="マリグナスピアス",
		right_ear="王将の耳飾り",
		left_ring="メランリング",
		right_ring="メタモルリング+1",
        back={ name="スセロスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%',}},
    }
	
	--弱体魔法時間
	sets.midcast['弱体魔法'] ={
		ammo="王将の玉",
		head={ name="ＶＩシャポー+3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="ＬＴサヨン+3",
		hands="ＬＴガントロ+2",
		legs="ＬＴフュゾー+2",
		feet={ name="ＶＩブーツ+3", augments={'Immunobreak Chance',}},
		neck={ name="デュエルトルク+2", augments={'Path: A',}},
		waist={ name="オブシテナサッシュ", augments={'Path: A',}},
		left_ear="マリグナスピアス",
		right_ear="スノトラピアス",
		left_ring="キシャールリング",
		right_ring="メタモルリング+1",
		back="無の外装",
	}

	--暗黒魔法
	sets.midcast['暗黒魔法'] ={
		ammo="王将の玉",
		head="ＡＭコイフ+1",
		body="ＡＭダブレット+1",
		hands="ＡＭゲージ+1",
		legs="ＡＭスロップス+1",
		feet="ＡＭネール+1",
		neck="エーラペンダント",
		waist="コーネリアの黒帯",
		left_ear="マリグナスピアス",
		right_ear="マニピアス",
		left_ring={ name="メタモルリング+1", augments={'Path: A',}},
		right_ring="スティキニリング+1",
		back="ペリミデケープ",
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
        --sub='アムラピシールド',
        head={ name="テルキネキャップ", augments={'"Cure" potency +5%','Enh. Mag. eff. dur. +10',}},
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
        hands='ＡＴグローブ+3',
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
		feet="ＬＴウゾー+3",
		neck={ name="デュエルトルク+2", augments={'Path: A',}},
		waist="エンブラサッシュ",
		left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
		right_ear="レサジーピアス+1",
		left_ring="スティキニリング+1",
		right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}},
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +16',}},
	}

	--強化魔法（他者）
	sets.midcast['強化魔法'].Other = set_combine(sets.midcast['強化魔法'] ,{
        sub='アムラピシールド',
		head="ＬＴシャペル+2",
		body="ＬＴサヨン+3",
        hands='ＡＴグローブ+3',
		legs="ＬＴフュゾー+2",
		feet="ＬＴウゾー+3",
	})

	--強化魔法スキル
	sets.midcast['強化魔法スキル'] =
	{
        main="プクラトムージュ+1",
        sub="フォフェンド+1",
        ammo="ストンチタスラム+1",
		head="ビファウルクラウン",
		body={ name="ＶＩタバード+3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="ＶＩグローブ+3", augments={'Enhancing Magic duration',}},
		legs="ＡＴタイツ+3",
		feet="ＬＴウゾー+3",
		neck="ホクスニトルク",
		waist="エンブラサッシュ",
		left_ear="ミミルピアス",
		right_ear="アンドアーピアス",
		right_ring="スティキニリング",
        back={ name="ゴストファイケープ", augments={'Enfb.mag. skill +10','Enha.mag. skill +10','Mag. Acc.+5','Enh. Mag. eff. dur. +16',}},
	}

	sets.midcast.Refresh         = set_combine(sets.midcast['強化魔法'],{head="ＡＭコイフ+1",body="ＡＴタバード+3",Legs="ＬＴフュゾー+2"})
	sets.midcast['ストンスキン'] = set_combine(sets.midcast['強化魔法'],{legs="シェダルサラウィル", neck="ノデンズゴルゲット", left_ear="アースクライピアス", waist="ジーゲルサッシュ",})
	sets.midcast['アクアベール'] = set_combine(sets.midcast['強化魔法'],{head="ＡＭコイフ+1", hands="王将の袖飾り", legs="シェダルサラウィル"})    
end
