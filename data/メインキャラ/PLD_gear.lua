function init_weaponns()
    -- デフォルト武器を設定
	send_command('gs c set MainWeapons Burtgang')
	send_command('gs c set SubWeapons Duban')
end


function init_gear_sets()
	-- ロックスタイル番号
	lockstyleset = 41

	-- 片手剣
	gear.Burtgang	        = {name="ブルトガング"}
	
    -- 短剣
    gear.Malevolence        = {name="マレヴォレンス", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}}
	
    -- 盾
    gear.Duban		        = {name="ドゥバン"}
	gear.Aegis 		        = {name="イージス"}
    
    -- その他
	gear.Slip  		        = {name="カリブルヌス"}
    
	--監視用バフ
    sets.buff['神聖の印']   = {
        feet="ＣＶサバトン+3"
    }

	-- 待機装備（通常）
	sets.idle = {
        ammo="ストンチタスラム+1",
        head="ＣＶアーメット+3",
        body="サクロブレスト",
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="騎士の数珠+2", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="ズワゾピアス+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}
    
    -- 待機装備（対魔法）
	sets.idle.Magical = {
        ammo="ヴァニアバッテリー",
        head="ＣＶアーメット+3",
        body="アダマンアーマー",
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="アンムーヴカラー+1", augments={'Path: A',},priority=16},
        waist="無の腰当",
        left_ear="驕慢の耳",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ヴェクサーリング+1",
        right_ring="シュネデックリング",
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}

	-- 抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="サクパタヘルム",
        body="サクパタブレスト",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck={ name="アンムーヴカラー+1", augments={'Path: A',},priority=16},
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="テロスピアス",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="ルディアノスマント", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Damage taken-5%',}},
    }

    -- 近接対物理
	sets.engaged.Physical = {
        ammo="ストンチタスラム+1",
        head="ＣＶアーメット+3",
        body="サクロブレスト",
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="騎士の数珠+2", augments={'Path: A',}},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={ name="ズワゾピアス+1", augments={'Path: A',}},
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}

    -- 近接対魔法
    sets.engaged.Magical = {
        ammo="ヴァニアバッテリー",
        head="ＣＶアーメット+3",
        body="アダマンアーマー",
        hands="ＣＶガントレ+3",
        legs="ＣＶクウィス+3",
        feet="ＣＶサバトン+3",
        neck={ name="アンムーヴカラー+1", augments={'Path: A',},priority=16},
        waist="無の腰当",
        left_ear="驕慢の耳",
        right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
        left_ring={name="ヴェクサーリング+1",priority=15},
        right_ring={name="ヴェクサーリング+1",priority=14},
        back={ name="ルディアノスマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}},
	}
    
	-- 敵対心装備
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
	sets.precast.FC = {--73
		ammo="サピエンスオーブ",
		head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body="ＲＶサーコート+4",
		hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
		legs={ name="カマインクウィス+1", augments={'HP+80','STR+12','INT+12',}},
		feet={ name="オディシアグリーヴ", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','VIT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
		neck="オルンミラトルク",
        waist={ name="プラチナモグベルト",priority=16},
		left_ear="エテオレートピアス",
		right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
		left_ring="メダダリング",
		right_ring="ラハブリング",
		back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

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
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
		neck="シビルスカーフ",
		waist="オルペウスサッシュ",
		left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="フリオミシピアス",
		left_ring={ name="メタモルリング+1", augments={'Path: A',}},
		right_ring="メダダリング",
		back={name="月明の羽衣",priority=16},
    }

    -- WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
		body="デーゴンブレスト",
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
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
		head={ name="ＳＶシャレル+1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
		body="ＣＶキュイラス+3",
		hands="ＣＶガントレ+3",
		legs="ＣＶクウィス+3",
		feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="月光の首飾り",
		waist="オドンブラサッシュ",
		left_ear="磁界の耳",
		right_ear={ name="シバリエピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','Damage taken-5%',}},
		left_ring={ name="ゼラチナスリング+1", augments={'Path: A',},priority=16},
        right_ring={ name="月明の指輪",priority=15},
		back={ name="ルディアノスマント", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','"Fast Cast"+10','Spell interruption rate down-10%',},priority=14},
	}

	-- ファランクス
	sets.midcast.Phalanx = {
		main="サクパタソード",
		sub="プリュウェン",
		ammo="ストンチタスラム+1",
		head={ name="オディシアヘルム", augments={'"Dbl.Atk."+3','"Mag.Atk.Bns."+3','Phalanx +5',}},
		body={ name="オディシアプレート", augments={'VIT+8','Attack+1','Phalanx +5',}},
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
    
    -- 被ファランクス
    sets.midcast.IncreasedPhalanx = sets.midcast.Phalanx

    -- 被プロテス
    sets.midcast.IncreasedProtect = {
        right_ring="シェルターリング",
    }

    -- 被シェル
    sets.midcast.IncreasedShell = {
        right_ring="シェルターリング",
    }

    -- 被リジェネ
    sets.midcast.IncreasedRegenerated = {
        neck="サクロゴルゲット",
        waist = "スローダベルト",
    }

    -- 被カーズナ
    sets.midcast.IncreasedRegenerated = {
        neck = "ニカンダネックレス",
        waist = "ギシドゥバサッシュ",
        left_ring="サイダリング",
        right_ring="ピュリティーリング",
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

    --フラッシュ
    sets.midcast.Flash = set_combine(sets.Enmity,{
        waist="コーネリアの黒帯"
    })
end
