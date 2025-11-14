function init_weaponns()
    -- デフォルト武器を設定
    send_command('gs c set MainWeapons DojikiriYasutsuna; wait 0.3; gs c set SubWeapons UtuGrip')
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 81

    -- 両手刀
    gear.DojikiriYasutsuna      = {name="童子切安綱"}
    
    -- 両手槍
    gear.ShiningOne             = {name="シャイニングワン"}
    
    -- グリップ
    gear.UtuGrip                = {name="ウトゥグリップ"}
    gear.Khonsu                 = {name="コーンスー"}
    
    -- その他
    gear.Slip                   = {name="原始刀"}
    
    -- 監視用バフ
    sets.buff['八双']           = {}
    sets.buff['星眼']           = {}
    sets.buff['心眼']           = {legs="極左近士板佩楯"}
    
    -- 待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="アダマンアーマー",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- 抜刀装備
    sets.engaged = {
        ammo="オゲルミルオーブ",
        head="極春日烏帽子形兜",
        body="極春日胴丸",
        hands={ name="バロラスミトン", augments={'Accuracy+20 Attack+20','"Store TP"+1','Accuracy+15','Attack+10',}},
        legs="極春日板佩楯",
        feet={ name="龍王脛当改", augments={'HP+65','"Store TP"+5','"Subtle Blow"+8',}},
        neck="月光の喉輪",
        waist="プラチナモグベルト",
        left_ear="アスプロピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
    }

    -- 抜刀装備　八双 : OffenseMode=Hasso  HybridMode=Normal
    sets.engaged.Hasso = set_combine(sets.engaged,{
        Legs="極春日板佩楯"
    })
    
    -- 抜刀装備　星眼 : OffenseMode=Seigan HybridMode=Normal
    sets.engaged.Seigan = set_combine(sets.engaged,{
        head="極春日烏帽子形兜",
        body="ムパカダブレット",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','System: 1 ID: 640 Val: 4',}},
     })

    -- 即時発動アビリティ
    sets.precast.JA['明鏡止水'] = {
        legs="左近士筒脛当改"
    }
    
    sets.precast.JA['黙想'] = {
        head="極脇戸桃形兜",
        hands="極左近士筒篭手",
        back="スメルトリオマント"
    }

    sets.precast.JA['先義後利'] = {
        legs="極春日筒脛当"
    }

    sets.precast.JA['護摩の守護円'] = {
        head="極脇戸桃形兜"
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
        left_ring="メダダリング",
        right_ring="ラハブリング",
    }

    sets.precast.FC.value = 40

    -- WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head={ name="ムパカキャップ", augments={'Path: A',}},
        body="越左近士胴丸",
        hands="極春日筒篭手",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="胡蝶のイヤリング",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    -- WS魔攻
    sets.precast.WS.Magic = {
        ammo="ノブキエリ",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="侍の喉輪+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="胡蝶のイヤリング",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="スメルトリオマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

end
