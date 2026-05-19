function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('マレヴォレンス')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('ドゥバン'))
end


function init_gear_sets()
	-- ロックスタイル番号
	lockstyleset = 7
    
	-- 武器
	gear['ブルトガング']	= {name="サクパタソード"}
    gear['マレヴォレンス']  = {name="マレヴォレンス", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}}
    gear.Duban		        = {name="ドゥバン"}
	gear.Aegis 		        = {name="イージス"}
	gear.Slip  		        = {name="カリブルヌス"}
    
	--監視用バフ
    sets.buff['神聖の印']   = {
        feet="ＣＶサバトン+3"
    }

    sets.BoostHP={
        ammo="ストンチタスラム+1",
        head={ name="ＳＶシャレル+1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
        body="ＲＶサーコート+4",
        hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs={ name="ＳＶディヒリン+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck={name="アンムーヴカラー+1",priority=14},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={name="アスプロピアス",priority=11},
        right_ear={name="エテオレートピアス",priority=10},
        left_ring={name="ゼラチナスリング+1",priority=12},
        right_ring={name="月明の指輪",priority=13},
        back={"月明の羽衣",priority=15},
    }

    --HP低下装備（自己ケアル用）
    sets.LowHp={
        ammo="ストンチタスラム+1",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body="エメットハーネス+1",
        hands="ＣＶガントレ+3",
        legs={ name="オディシアクウィス", augments={'"Fast Cast"+6','AGI+9','Mag. Acc.+2',}},
        feet="ＣＶサバトン+3",
        neck="オルンミラトルク",
        waist="オドンブラサッシュ",
        left_ear="メンデカントピアス",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メランリング",
        right_ring="守りの指輪",
        back={ name="ルディアノスマント", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}},
    }

	-- 待機装備（通常）
	sets.idle = {
        sub="ドゥバン",
        ammo="ストンチタスラム+1",
        head="ＣＶアーメット+3",
        body="ＣＶキュイラス+3",
        --body="アダマンアーマー",

        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck="ロリケートトルク+1",
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="ズワゾピアス+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}

    -- 待機装備（対魔法）
	sets.idle.Magical = {
        main="マリグナスソード",
        sub="イージス",
        ammo="ヴァニアバッテリー",
        head="無の面",
        body="アダマンアーマー",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck="コアトゴルゲット+1",
        waist="クリードボードリエ",
        left_ear="驕慢の耳",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ヴェクサーリング+1",
--        right_ring="シュネデックリング",
        right_ring="ヴェクサーリング+1",
        back="サルブスマント",
	}

	-- 抜刀装備
    sets.engaged = set_combine(sets.idle,{
        feet="ＣＶサバトン+3",
        right_ring="アペリエリング+1",
    })

    -- 近接対魔法
    sets.engaged.Magical = set_combine(sets.idle.Magical,{
        right_ring="ヴェクサーリング+1",
	})

    -- ノックバック
    sets.engaged.KnockBack = {
        --legs="ダッシングサブリガ",
        back="フィリドアマント",
    }

	-- 敵対心装備　149
	sets.Enmity = {
        ammo="サピエンスオーブ",
        head={ name="ロースバルブータ+1", augments={'Path: A',}},
        body={ name="ＳＶキュイラス+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%'}},
        legs={ name="ＳＶディヒリン+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="月光の首飾り",
        waist={name="クリードボードリエ",priority=13},
        left_ear="無知の耳",
        right_ear={name="クリプティクピアス",priority=14},
        left_ring={name="アイワツリング",priority=15},
        right_ring={ name="アペリエリング+1", augments={'Path: A',}},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',},priority=16},
	}

	sets.precast.JA = sets.Enmity
    
    -- 即時発動アビリティ　かばう
	sets.precast.JA['かばう'] = set_combine(sets.Enmity,{
        head="ＲＶコロネット+1",
        legs="ＣＢブリーチズ+3"
    })
    
    -- 即時発動アビリティ　センチネル
	sets.precast.JA['センチネル'] = set_combine(sets.Enmity,{
        feet="ＣＢレギンス+4"
    })
    
    -- 即時発動アビリティ　ホーリーサークル
	sets.precast.JA['ホーリーサークル'] = set_combine(sets.Enmity,{
        feet="ＲＶレギンス+3"
    })
    
    -- 即時発動アビリティ　インビンシブル
	sets.precast.JA['インビンシブル'] = set_combine(sets.Enmity,{
        legs="ＣＢブリーチズ+3"
    })
    
    -- 即時発動アビリティ　シールドバッシュ
    sets.precast.JA['シールドバッシュ'] = set_combine(sets.Enmity,{
        hands="ＣＢガントレ+3"
    })
    
    -- 即時発動アビリティ　ランパート
	sets.precast.JA['ランパート'] = set_combine(sets.Enmity,{
        head="ＣＢコロネット+3"
    })
    
    -- 即時発動アビリティ　フィールティ
	sets.precast.JA['フィールティ'] = set_combine(sets.Enmity,{
        body="ＣＢサーコート+3"
    })
    
    -- 即時発動アビリティ　シバルリー
	sets.precast.JA['シバルリー'] = {
        ammo="クォーツタスラム+1",
        head="ＣＶアーメット+3",
        body="ＲＶサーコート+4",
        hands={ name="ＣＢガントレ+3", augments={'Enhances "Chivalry" effect',}},
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="騎士の数珠+2", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="スティキニリング+1",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}

	-- FC
	sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="オディシアヘルム", augments={'Mag. Acc.+19','"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
        body="ＲＶサーコート+3",
        hands="レイライングローブ",
        legs="ＣＶクウィス+3",
        feet={ name="オディシアグリーヴ", augments={'"Fast Cast"+5','AGI+6','Mag. Acc.+14',}},
        neck="オルンミラトルク",
        waist={ name="プラチナモグベルト",priority=16},
        left_ear={name="アスプロピアス",priority=15},
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="メダダリング",
        right_ring={name="月明の指輪",priority=14},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }
    sets.precast.FC.value = 69

	-- WSダメージ
	sets.precast.WS.Damage = {
		ammo="昏黄の礫",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
		neck="フォシャゴルゲット",
		waist="フォシャベルト",
		left_ear="テロスピアス",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
		left_ring="王将の指輪",
		right_ring="エパミノダスリング",
		back={name="月明の羽衣",priority=16},
    }

	-- WSクリティカル
	sets.precast.WS.Critical = {
		ammo="昏黄の礫",
		head="サクパタヘルム",
		body="サクパタブレスト",
		hands="サクパタガントレ",
		legs="サクパタクウィス",
		feet="サクパタレギンス",
		neck="フォシャゴルゲット",
		waist="フォシャベルト",
		left_ear="テロスピアス",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
		left_ring="王将の指輪",
		right_ring="エパミノダスリング",
		back={name="月明の羽衣",priority=16},
    }

	-- WS魔攻
	sets.precast.WS.Magic = {
        ammo="ストンチタスラム+1",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck={name="アンムーヴカラー+1",prioruity=16},
        waist="オルペウスサッシュ",
        left_ear={name="アスプロピアス",priority=14},
        right_ear="フリオミシピアス",
        left_ring={name="ゼラチナスリング+1",priority=15},
        right_ring="メダダリング",
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
    }
    
	-- 共通WS定義読み込み
    init_weapon_skill()
    
    -- 個別WS定義
    sets.precast.WS["サンギンブレード"] = { Normal=set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",}),
                                            SubtleBlow=set_combine(set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",}),sets.precast.WS.SubtleBlow)}

    sets.precast.WS["ロイエ"] = { Normal=sets.Enmity,
                                  SubtleBlow=set_combine(sets.Enmity,sets.precast.WS.SubtleBlow)}

	-- 詠唱中断
	sets.midcast.interruption = {
		ammo="ストンチタスラム+1",
		head="エスカイトヘルム",
		body="ＣＶキュイラス+3",
		hands="ＣＶガントレ+3",
		legs="ファウンダホーズ",
		feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="月光の首飾り",
		waist="オドンブラサッシュ",
		left_ear="磁界の耳",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
		left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=16},
        right_ring={ name="月明の指輪",priority=15},
		back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=14},
	}

    -- フラッシュ
    sets.midcast['フラッシュ'] = set_combine(sets.Enmity,{
        waist="コーネリアの黒帯"
    })

    -- フォイル
    sets.midcast['フォイル'] = set_combine(sets.Enmity,{
        waist="コーネリアの黒帯"
    })

	-- ファランクス
	sets.midcast['ファランクス'] = {
		main="サクパタソード",
		sub="プリュウェン",
		ammo="ストンチタスラム+1",
        head={ name="オディシアヘルム", augments={'Mag. Acc.+23','"Mag.Atk.Bns."+13','Phalanx +5','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
        body={ name="バロラスメイル", augments={'Accuracy+10','DEX+10','Phalanx +5',}},
		hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="サクパタクウィス",
		feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="月光の首飾り",
        waist={ name="プラチナモグベルト",priority=16},
		left_ear="磁界の耳",
		right_ear="ミミルピアス",
		left_ring="メランリング",
        right_ring={ name="月明の指輪",priority=15},
        back={ name="ウェルドマント", augments={'VIT+1','DEX+5','Enmity+3','Phalanx +5',}},
	}
    
    -- ケアル
	sets.midcast.Cure = {
        ammo="ストンチタスラム+1",
        head={ name="ＳＶシャレル+1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
        body={ name="ＳＶキュイラス+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="ＣＶクウィス+3",
        feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        neck="月光の首飾り",
        waist="スローダベルト",
        left_ear="磁界の耳",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=14},
        right_ring={name="月明の指輪",priority=15},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=14},
	}
    
    -- 青魔法
	sets.midcast.BlueMagic = sets.Enmity

    -- プロテス
    sets.midcast.Protect = {
        right_ring="シェルターリング",
    }

    -- シェル
    sets.midcast.Shell = sets.midcast.Protect 

    -- 被ファランクス
    sets.midcast.IncreasedPhalanx = sets.midcast['ファランクス']

    -- 被プロテス
    sets.midcast.IncreasedProtect = sets.midcast.Protect

    -- 被シェル
    sets.midcast.IncreasedShell = sets.midcast.Shell

    -- 被リジェネ
    sets.midcast.IncreasedRegenerated = {
        neck="サクロゴルゲット",
        waist="スローダベルト",
    }

    -- 被カーズナ
    sets.midcast.IncreasedCursna = {
        neck = "ニカンダネックレス",
        waist = "ギシドゥバサッシュ",
        left_ring="サイダリング",
        right_ring="ピュリティーリング",
    }
end