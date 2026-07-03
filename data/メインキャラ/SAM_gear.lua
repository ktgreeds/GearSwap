function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('草薙剣')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('ダデュコグリップ'))
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 12

    -- 武器
    gear['草薙剣']              = {name="草薙剣"}
    gear['正宗']                = {name="正宗"}
    gear['童子切安綱']          = {name="童子切安綱"}
    gear['シャイニングワン']    = {name="シャイニングワン"}
    gear['ウトゥグリップ']      = {name="ウトゥグリップ"}
    gear['ダデュコグリップ']    = {name="ダデュコグリップ"}
    gear.Slip                   = {name="ヴィムトルク"}
    gear.TPBounus               = {head="ムパカキャップ",left_ear="胡蝶のイヤリング"}
    
    -- バフ
    sets.buff['八双']               = {hands="越脇戸筒篭手"}
    sets.buff['星眼']               = {head="極春日烏帽子形兜"}
    sets.buff['心眼']               = {legs="極左近士板佩楯"}
    sets.buff['石火之機']           = {legs="極春日筒篭手"}
    sets.precast.JA['明鏡止水']     = {legs="左近士筒脛当改"}
    sets.precast.JA['護摩の守護円'] = {head="極脇戸桃形兜"}
    sets.precast.JA['心眼']         = {}
    sets.precast.JA['八双']         = {}
    sets.precast.JA['黙想']         = {head="極脇戸桃形兜",hands="極左近士筒篭手",back="スメルトリオマント"}
    sets.precast.JA['星眼']         = {}
    sets.precast.JA['石火之機']     = {}
    sets.precast.JA['渾然一体']     = {}
    sets.precast.JA['士気昂揚']     = {legs="極左近士板佩楯"}
    sets.precast.JA['峰打ち']       = {hands="極左近士筒篭手"}
    sets.precast.JA['先義後利']     = {legs="極春日筒脛当"}
    sets.precast.JA['破魔の刃']     = {}
    sets.precast.JA['葉隠']         = {}
    sets.precast.JA['八重霞']       = {}
    
    -- モクシャ(41)
    sets.SubtleBlow = {
        neck="バーシチョーカー+1",
        waist="サリサフロイベルト",
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }

    -- 待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="ニャメヘルム",
        body="アダマンアーマー",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="バーシチョーカー+1",
        waist="無の腰当",
        left_ear="ハーティーピアス",
        right_ear="アレテデルルナ+1",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back={ name="スメルトリオマント", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity-10','Occ. inc. resist. to stat. ailments+10',}},
    }

    -- 抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="極春日烏帽子形兜",
        body="極春日胴丸",
        hands="越脇戸筒篭手",
        legs="極春日板佩楯",
--        feet="越脇戸筒脛当",    
        feet="龍王脛当改",    
        neck="月光の喉輪",
        waist="イオスケハベルト+1",
        left_ear="アスプロピアス",
        right_ear="シェレピアス",
--        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="メランリング",
        right_ring="シーリチリング+1",
        back={ name="タカハマント", augments={'STR+3','"Zanshin"+5','"Store TP"+3',}},
    }
    
    -- モクシャ
    sets.engaged.SubtleBlow     = set_combine(sets.engaged ,sets.SubtleBlow)
    
    -- ホクスニアムプラ
    sets.engaged.HoxneAmpulla   = set_combine(sets.engaged,{
        ammo="オゲルミルオーブ+1",
        feet="越左近士筒脛当",
        neck="侍の喉輪+2",
        left_ring="シーリチリング+1",
        waist="ソードフェーテル+1",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
    })
    
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
        head="ニャメヘルム",
        body="越左近士胴丸",
        hands="ニャメガントレ",
        legs="ニャメフランチャ", 
        feet="極春日筒脛当",
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="スラッドピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="イフラマドリング",
        right_ring="王将の指輪",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    -- WS魔攻
    sets.precast.WS.Magic = {
        ammo="ノブキエリ",
        head="ニャメヘルム", 
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear="スラッドピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="イフラマドリング",
        right_ring="スローダリング",
        back={ name="スメルトリオマント", augments={'STR+20','Mag. Acc+20 /Mag. Dmg.+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
    }

    --共通WS定義読み込み
    init_weapon_skill()
    sets.precast.WS["絶之太刀・無名"]           = set_combine(sets.precast.WS.Damage,{waist="ケンタークベルト+1"})

    --被魔法強化装備
    sets.midcast.IncreasedProtect   = {right_ring="シェルターリング"}
    sets.midcast.IncreasedShell     = {right_ring="シェルターリング"}
    sets.midcast.IncreasedPhalanx   = {
        head={ name="バロラスマスク", augments={'Pet: DEX+5','Weapon skill damage +3%','Phalanx +5','Accuracy+2 Attack+2',}},
        body={ name="バロラスメイル", augments={'Pet: Attack+9 Pet: Rng.Atk.+9','STR+10','Phalanx +5','Mag. Acc.+1 "Mag.Atk.Bns."+1',}},
        hands={ name="バロラスミトン", augments={'DEX+8','Pet: Mag. Acc.+6','Phalanx +4','Accuracy+11 Attack+11',}},
        legs={ name="バロラスホーズ", augments={'INT+9','"Conserve MP"+5','Phalanx +4',}},
        feet={ name="バロラスグリーヴ", augments={'Weapon Skill Acc.+10','MND+1','Phalanx +4','Accuracy+11 Attack+11',}},
    }
end