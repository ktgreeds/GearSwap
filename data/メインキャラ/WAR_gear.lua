function init_weaponns()
    --デフォルト武器を設定
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 1

    -- 武器
    gear['マレヴォレンス']      = {name="マレヴォレンス", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}}
    gear['ゾアノン']            = {name="ゾアノン"}
    gear['ライカーゴス']        = {name="ライカーゴス"}
    gear['ネイグリング']        = {name="ネイグリング"}
    gear['ウトゥグリップ']      = {name="ウトゥグリップ"}
    gear['アダパシールド']      = {name="アダパシールド"}
    gear['ブラーシールド']      = {name="ブラーシールド+1"}
    gear.Slip                   = {name="フレンジーサリット"}

    -- ジョブマント
    gear.JobMantle                  = {}
    gear.JobMantle.Enmity           = { name="シコルマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Chance of successful block +5',}}
    gear.JobMantle.Melee_STP        = { name="シコルマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}}
    gear.JobMantle.Melee_DA         = { name="シコルマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
    gear.JobMantle.WSD_STR          = { name="シコルマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

    -- 敵対心
	sets.Enmity = {
        ammo="サピエンスオーブ",
        head="ＰＭマスク+3",
        body="ＳＶキュイラス+1",
        hands="ＰＭマフラ+3",
        legs="ＳＶディヒリン+1",
        feet="ＳＶシュー+1",
        neck="月光の首飾り",
        waist="プラチナモグベルト",
        left_ear="アスプロピアス",
        right_ear="無知の耳",
        left_ring="メランリング",
        right_ring="アペリエリング+1",
        back=gear.JobMantle.Enmity,
	}
    
    --モクシャ
    sets.SubtleBlow = {
    }
    
    -- 待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="サクパタヘルム",
        body="サクパタブレスト",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck={name="無の喉輪",priority=15},
        waist="無の腰当",
        left_ear={name="アスプロピアス",priority=16},
        right_ear={name="ズワゾピアス+1",priority=14},
        left_ring="ワーデンリング",
        right_ring="シュネデックリング",
        back=gear.JobMantle.Enmity,
    }

    
    -- 抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="ＢＩマスク+3",
        body="サクパタブレスト",
        hands="サクパタガントレ",
        legs="ＰＭクウィス+4",
        feet="サクパタレギンス",
        neck="戦士の数珠+2 ",
        waist="イオスケハベルト+1",
        left_ear="アスプロピアス",
        right_ear="ボイイピアス+1",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back=gear.JobMantle.Melee_DA
    }

    sets.engaged.RangeHunting = {
        ammo="ストンチタスラム+1",
        head="サクパタヘルム",
        body="サクパタブレスト",
        hands="サクパタガントレ",
        --legs="サクパタクウィス",
        legs="ダッシングサブリガ",
        feet="サクパタレギンス",
        neck="ホクスニトルク",
        waist="プラチナモグベルト",
        left_ear="スリオスイヤリング",
        right_ear="ズワゾピアス+1",
        left_ring="メランリング",
        right_ring="ワーデンリング",
        back=gear.JobMantle.Enmity,
    }

    sets.engaged.HoxneAmpulla = {
        ammo="ホクスニアムプラ",
        head="フロプトヘルム",
        body="ＢＩロリカ+3",
        hands="サクパタガントレ",
        legs="サクパタクウィス",
        feet="サクパタレギンス",
        neck="コンバタントトルク",
        waist="ソードフェーテル+1",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back=gear.JobMantle.Melee_STP 
    }

    sets.BoostHP={
        neck={name="アンムーヴカラー+1",priority=15},
        waist={name="プラチナモグベルト",priority=16},
        left_ear={name="アスプロピアス",priority=14},
        back={"月明の羽衣",priority=13},
    }
    --sets.buff['バーサク']                   = {feet="ＡＧカリガ+4"}
    sets.buff['ディフェンダー']             = {hands="ＡＧマフラ+4"}
    sets.buff['リタリエーション']           = {hands="ＰＭマフラ+3",feet="ＢＩカリガ+3"}
    --sets.buff['ウォリアーチャージ']         = set_combine(sets.precast.JA{legs="ＡＧクウィス+4"})
    --sets.buff['リストレント']               = set_combine(sets.precast.JA{hands="ＢＩマフラ+3"})
    sets.precast.JA                         = set_combine(sets.Enmity,sets.BoostHP)
    sets.precast.JA['マイティストライク']   = set_combine(sets.precast.JA,{hands="ＡＧマフラ+4"})
    sets.precast.JA['挑発']                 = set_combine(sets.precast.JA,sets.Enmity)
    sets.precast.JA['バーサク']             = set_combine(sets.precast.JA,{head="ＰＭロリカ+3",feet="ＡＧカリガ+3",back="シコルマント"})
    sets.precast.JA['ディフェンダー']       = set_combine(sets.precast.JA,{hands="ＡＧマフラ+4"})
    sets.precast.JA['ウォークライ']         = set_combine(sets.precast.JA,{head="ＡＧマスク+4"})
    sets.precast.JA['アグレッサー']         = set_combine(sets.precast.JA,{head="ＰＭマスク+3",body="ＡＧロリカ+3"})
    sets.precast.JA['リタリエーション']     = set_combine(sets.precast.JA,{})
    sets.precast.JA['ウォリアーチャージ']   = set_combine(sets.precast.JA,{})
    sets.precast.JA['トマホーク']           = set_combine(sets.precast.JA,{feet="ＡＧカリガ+3"})
    sets.precast.JA['リストレント']         = set_combine(sets.precast.JA,{})
    sets.precast.JA['ブラッドレイジ']       = set_combine(sets.precast.JA,{body="ＢＩロリカ+3"})
    sets.precast.JA['ブラーゼンラッシュ']   = set_combine(sets.precast.JA,{})
    sets.precast.JA.Waltz                   = set_combine(sets.Enmity,{legs="ダッシングサブリガ"})


	sets.precast.FC = {
        ammo="サピエンスオーブ",
        head="サクパタヘルム",
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs="サクパタクウィス",
        feet={ name="オディシアグリーヴ", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','VIT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        neck="オルンミラトルク",
        waist="プラチナモグベルト",
        left_ear="アスプロピアス",
        right_ear="ズワゾピアス+1",
        left_ring="ワーデンリング",
        right_ring="月明の指輪",
        back=gear.JobMantle.Enmity,
    }
    sets.precast.FC.value = 44


    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head="ＡＧマスク+4",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ＢＩクウィス+3",
        feet="ニャメソルレット",
        neck="無の喉輪",
        waist="セールフィベルト+1",
        left_ear="胡蝶のイヤリング",
        right_ear="スラッドピアス",
        left_ring="コーネリアリング",
        right_ring="ベーシルリング",
        back=gear.JobMantle.WSD_STR,
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
    }

    --WS魔攻
	sets.precast.WS.Magic = {
        ammo="ストンチタスラム+1",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="無の喉輪",
        waist="オルペウスサッシュ",
        left_ear="アスプロピアス",
        right_ear="ズワゾピアス+1",
        left_ring="メランリング",
        right_ring="コーネリアリング",
        back="無の外装",
    }

    --共通WS定義読み込み
    init_weapon_skill()

	sets.midcast.interruption = {
        ammo="ストンチタスラム+1",
        head={ name="ＳＶシャレル+1", augments={'HP+105','VIT+12','Phys. dmg. taken -4',}},
        body="アダマンアーマー",
        hands="サクパタガントレ",
        legs={ name="ファウンダホーズ", augments={'MND+3','Mag. Acc.+3','Attack+7','Breath dmg. taken -1%',}},
        feet={ name="オディシアグリーヴ", augments={'Mag. Acc.+1 "Mag.Atk.Bns."+1','"Fast Cast"+6','VIT+2','Mag. Acc.+2','"Mag.Atk.Bns."+13',}},
        neck="月光の首飾り",
        waist="オドンブラサッシュ",
        left_ear="アスプロピアス",
        right_ear="オノワイヤリング+1",
        left_ring="メランリング",
        right_ring="月明の指輪",
        back=gear.JobMantle.Enmity,
	}

	sets.midcast['ファランクス'] = {
--        main={ name="ザルフィカール", augments={'Attack+7','MND+1','Phalanx +5',}},
        head={ name="バロラスマスク", augments={'Pet: DEX+5','Weapon skill damage +3%','Phalanx +5','Accuracy+2 Attack+2',}},
        body={ name="バロラスメイル", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','STR+10','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
        hands={ name="ＳＶハントシュ+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
        legs="サクパタクウィス",
        feet={ name="ＳＶシュー+1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	}

    sets.midcast.IncreasedPhalanx = sets.midcast['ファランクス']
    sets.midcast.IncreasedProtect = {right_ring="シェルターリング"}
    sets.midcast.IncreasedShell = {right_ring="シェルターリング"}
end