function init_weaponns()
    send_command('wait 0.1; gs c set SubWeapons UtuGrip')
end



function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 12

    -- 武器
    gear.DojikiriYasutsuna          = {name="童子切安綱"}
    gear.ShiningOne                 = {name="シャイニングワン"}
    gear.UtuGrip                    = {name="ウトゥグリップ"}
    gear.Slip                       = {name="フレンジーサリット"}
    
    -- バフ
    sets.buff['八双']               = {hands="越脇戸筒篭手"}
    sets.buff['星眼']               = {head="極春日烏帽子形兜"}
    sets.buff['心眼']               = {legs="極左近士板佩楯"}
    sets.precast.JA['明鏡止水']     = {legs="左近士筒脛当改"}
    sets.precast.JA['黙想']         = {head="極脇戸桃形兜",hands="極左近士筒篭手",back="スメルトリオマント"}
    sets.precast.JA['先義後利']     = {legs="極春日筒脛当"}
    sets.precast.JA['護摩の守護円'] = {head="極脇戸桃形兜"}


    -- 待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="バーシチョーカー+1",
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- モクシャ(41)
    sets.SubtleBlow = {
        neck="バーシチョーカー+1",
        waist="サリサフロイベルト",
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }

    -- 抜刀装備
    sets.engaged = {
        ammo="オゲルミルオーブ+1",
        head="極春日烏帽子形兜",
        body="極春日胴丸",
        hands="越脇戸筒篭手",
        legs="極春日板佩楯",
        feet="越脇戸筒脛当",
        neck="月光の喉輪",
        waist="ソードフェーテル+1",
        left_ear="アスプロピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="メランリング",
        right_ring="シーリチリング+1",
        back={ name="タカハマント", augments={'STR+3','"Zanshin"+5','"Store TP"+3',}},
    }
    sets.engaged['八双']        = set_combine(sets.engaged, sets.buff['八双'])
    sets.engaged['星眼']        = set_combine(sets.engaged, sets.buff['星眼'])
    sets.engaged.SubtleBlow     = set_combine(sets.engaged ,sets.SubtleBlow)
    sets.engaged.HoxneAmpulla   = {
        feet="越左近士筒脛当",
        neck="侍の喉輪+2",
        left_ring="シーリチリング+1",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
    }
    


    -- FC装備
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        body="サクロブレスト",
        hands="レイライングローブ",
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メランリング",
        right_ring="ラハブリング",
    }


    -- WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head={ name="ニャメヘルム", augments={'Path: A',}},
        body="越左近士胴丸",
        hands="ニャメガントレ",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="極春日筒脛当",
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="胡蝶のイヤリング",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="コーネリアリング",
        right_ring="ベーシルリング",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }


    -- WSダメージ（モクシャ）
    sets.precast.WS.SubtleBlow = set_combine(sets.precast.WS.Damage,sets.SubtleBlow)
    
    
    -- WS魔攻
    sets.precast.WS.Magic = {
        ammo="ノブキエリ",
        head={ name="ニャメヘルム", augments={'Path: A',}},
        body="越左近士胴丸",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear="胡蝶のイヤリング",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="コーネリアリング",
        right_ring="ベーシルリング",
        back={ name="スメルトリオマント", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }


    --共通WS定義読み込み
    init_weapon_skill()


    --被魔法強化装備
    sets.midcast.IncreasedProtect   = {right_ring="シェルターリング"}
    sets.midcast.IncreasedShell     = {right_ring="シェルターリング"}
    sets.midcast.IncreasedPhalanx   = {
        head={ name="バロラスマスク", augments={'Pet: DEX+5','Weapon skill damage +3%','Phalanx +5','Accuracy+2 Attack+2',}},
        body={ name="バロラスメイル", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','STR+10','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
        hands={ name="バロラスミトン", augments={'Pet: INT+13','Attack+13','Phalanx +3','Accuracy+1 Attack+1','Mag. Acc.+5 "Mag.Atk.Bns."+5',}},
        legs={ name="バロラスホーズ", augments={'Pet: Mag. Acc.+9','Pet: "Regen"+2','Phalanx +3','Accuracy+13 Attack+13','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
    }
end
