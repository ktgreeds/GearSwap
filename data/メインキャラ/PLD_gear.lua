function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ブルトガング')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('ドゥバン'))
end


function init_gear_sets()
	-- ロックスタイル番号
	lockstyleset = 7
    
	-- 武器
	gear['ブルトガング']	= {name="ブルトガング"}
    gear['マレヴォレンス']  = {name="マレヴォレンス", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}}
    gear['ドゥバン']		= {name="ドゥバン"}
	gear['イージス'] 		= {name="イージス"}
	gear.Slip  		        = {name="カリブルヌス"}
    
    -- 敵対心装備　128
	sets.Enmity = {
        ammo="サピエンスオーブ",
        head={ name="ロースバルブータ+1", augments={'Path: A',}},
        body="ＲＶサーコート+4",
        hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%'}},
        legs={ name="ＳＶディヒリン+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        feet="ＣＶサバトン+3",
        neck="月光の首飾り",
        waist={name="クリードボードリエ",priority=13},
        left_ear={name="アスプロピアス",priority=16},
        right_ear="無知の耳",
        left_ring="メランリング",
        right_ring={ name="アペリエリング+1", augments={'Path: A',}},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',},priority=15},
	}

    -- ノックバック
    sets.KnockBack = {back="リパルスマント"}

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
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
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
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="騎士の数珠+2", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="ズワゾピアス+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
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
        hands="ヴォルトブレーサー",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck="コアトゴルゲット+1",
        waist="クリードボードリエ",
        left_ear="驕慢の耳",
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring="ヴェクサーリング+1",
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

	--監視用バフ
    sets.buff['神聖の印']               = {feet="ＣＶサバトン+3"}
	sets.precast.JA                     = sets.Enmity
	sets.precast.JA['インビンシブル']   = set_combine(sets.Enmity,{legs="ＣＢブリーチズ+3"})
	sets.precast.JA['ホーリーサークル'] = set_combine(sets.Enmity,{feet="ＲＶレギンス+3"})
    sets.precast.JA['シールドバッシュ'] = set_combine(sets.Enmity,{hands="ＣＢガントレ+3"})
	sets.precast.JA['センチネル']       = set_combine(sets.Enmity,{feet="ＣＢレギンス+4"})
	sets.precast.JA['かばう']           = set_combine(sets.Enmity,{head="ＲＶコロネット+1",legs="ＣＢブリーチズ+3"})
	sets.precast.JA['ランパート']       = set_combine(sets.Enmity,{head="ＣＢコロネット+3"})
	sets.precast.JA['マジェスティ']     = sets.Enmity
    sets.precast.JA['フィールティ']     = set_combine(sets.Enmity,{body="ＣＢサーコート+3"})
	sets.precast.JA['シバルリー']       = {
        ammo="クォーツタスラム+1",
        head="ＣＶアーメット+3",
        body="ＲＶサーコート+4",
        hands={ name="ＣＢガントレ+3", augments={'Enhances "Chivalry" effect',}},
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="騎士の数珠+2", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring="スティキニリング+1",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}
	sets.precast.JA['神聖の印']         = sets.Enmity
	sets.precast.JA['セプルカー']       = sets.Enmity
	sets.precast.JA['パリセード']       = sets.Enmity
	sets.precast.JA['インターヴィーン'] = sets.Enmity

	-- FC64
	sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="ＲＶサーコート+4",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
        feet={ name="オディシアグリーヴ", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','VIT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        neck="オルンミラトルク",
        waist={ name="プラチナモグベルト",priority=16},
        left_ear={name="アスプロピアス",priority=15},
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring="キシャールリング",
        right_ring={name="月明の指輪",priority=14},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }
    sets.precast.FC.value = 64

	-- WSダメージ
	sets.precast.WS.Damage = {
		ammo="昏黄の礫",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
		neck="フォシャゴルゲット",
		waist="フォシャベルト",
		left_ear="テロスピアス",
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring="コーネリアリング",
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
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring="コーネリアリング",
        right_ring="王将の指輪",
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
        left_ring="コーネリアリング",
        right_ring="エパミノダスリング",
        back={ name="ルディアノスマント", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Magic Damage +10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
	-- 共通WS定義読み込み
    init_weapon_skill()
    
    -- 個別WS定義
    sets.precast.WS["サンギンブレード"] = set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング",})
    sets.precast.WS["ロイエ"]           = sets.Enmity

    -- 詠唱中断
	sets.midcast.interruption = {
		ammo="ストンチタスラム+1",
		head={ name="ＳＶシャレル+1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
		body="ＣＶキュイラス+3",
		hands="ＣＶガントレ+3",
		legs="ＣＶクウィス+3",
		feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="月光の首飾り",
		waist="オドンブラサッシュ",
		left_ear="磁界の耳",
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
		left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=16},
        right_ring={ name="月明の指輪",priority=15},
		back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=14},
	}

    -- フラッシュ
    sets.midcast['フラッシュ'] = set_combine(sets.Enmity,{
        left_ear={name="アスプロピアス",priority=14},
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
        head={ name="バロラスマスク", augments={'Pet: DEX+5','Weapon skill damage +3%','Phalanx +5','Accuracy+2 Attack+2',}},
        body={ name="バロラスメイル", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','STR+10','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
		hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		legs="サクパタクウィス",
		feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="月光の首飾り",
        waist={ name="プラチナモグベルト",priority=16},
		left_ear="磁界の耳",
		right_ear="ミミルピアス",
		left_ring="メランリング",
        right_ring={ name="月明の指輪",priority=15},
		back={ name="ウェルドマント", augments={'VIT+1','DEX+2','Enmity+1','Phalanx +5',}},
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
        right_ear={ name="シバリエピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+18','Mag. Acc.+18','Damage taken-7%','STR+11 VIT+11',}},
        left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=14},
        right_ring={name="月明の指輪",priority=15},
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=14},
	}

    sets.midcast['ストンスキン'] = {
        body="アダマンアーマー",
        hands="ストーンマフラ",
        legs="ヘイヴンホーズ",
		feet="サクパタレギンス",
        neck="ストーンゴルゲット",
        waist="ジーゲルサッシュ",
        left_ear="アースクライピアス",
		left_ring="メランリング",
        back={ name="月明の羽衣",priority=16},
    }

    -- 青魔法 敵対心100
	sets.midcast.BlueMagic = {
        main="ブルトガング",
        sub="ドゥバン",
        ammo="サピエンスオーブ",
        head="ＣＶアーメット+3",
        body="ＣＶキュイラス+3",
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck="月光の首飾り",
        waist={name="プラチナモグベルト",priority=16},
        left_ear={name="アスプロピアス",priority=15},
        right_ear="無知の耳",
        left_ring="メランリング",
        right_ring="アペリエリング+1",
        back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Damage taken-5%',},priority=14},
    }

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