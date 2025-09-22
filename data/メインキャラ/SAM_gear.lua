function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons DojikiriYasutsuna')
    send_command('gs c set SubWeapons Khonsu')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 81

    --武器
    gear.DojikiriYasutsuna      = {name="童子切安綱"}
    gear.ShiningOne             = {name="シャイニングワン"}
    gear.UtuGrip                = {name="ウトゥグリップ"}
    gear.Khonsu                 = {name="コーンスー"}
    
    --監視用バフ
    sets.buff['八双'] = {}
    sets.buff['星眼'] = {}
    sets.buff['心眼'] = {}

    --待機装備
    sets.idle = {
        ammo="ストンチタスラム+1",
        head={ name="ニャメヘルム", augments={'Path: B',}},
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

    --抜刀装備
    sets.engaged = {
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head="極春日烏帽子形兜",
        body="極春日胴丸",
        hands={ name="楯無篭手改", augments={'Path: A',}},
        legs={ name="楯無佩楯改", augments={'Path: A',}},
        feet={ name="楯無脛当改", augments={'Path: A',}},
        neck="月明の喉輪",
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="アスプロピアス",
        right_ear={ name="真春日耳飾り", augments={'System: 1 ID: 1676 Val: 0','Accuracy+19','Mag. Acc.+19','Weapon skill damage +4%','STR+13 DEX+13',}},
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="シーリチリング+1",
        back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
    }

    --OffenseMode=Hasso  HybridMode=Normal
    sets.engaged.Hasso              = set_combine(sets.engaged,{feet="越脇戸筒脛当"})
    
    --OffenseMode=Seigan HybridMode=Normal
    sets.engaged.Seigan             = set_combine(sets.engaged,{head="極春日烏帽子形兜",body="ムパカダブレット",hands="ムパカグローブ",back={ name="スメルトリオマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},})
    
    --OffenseMode=Normal HybridMode=ThirdEye
    sets.engaged.ThirdEye           = set_combine(sets.engaged,{legs="極左近士板佩楯"})
    
    --OffenseMode=Hasso  HybridMode=ThirdEye
    sets.engaged.Hasso.ThirdEye     = set_combine(sets.engaged.Hasso, {legs="極左近士板佩楯"})
    
    --OffenseMode=Seigan HybridMode=ThirdEye
    sets.engaged.Seigan.ThirdEye    = set_combine(sets.engaged.Seigan,{legs="極左近士板佩楯"})
    
    --OffenseMode=Normal HybridMode=SubtleBlow モクシャ42 II 20
    sets.engaged.SubtleBlow = set_combine(sets.engaged,{
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
		body="デーゴンブレスト",--II 10
        legs="ムパカホーズ",--II 5
        feet="乾闥婆脛当改",--8
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        right_ear="シェレピアス",--3
        left_ring="ニックマドゥリング",--II 5
        right_ring="シーリチリング+1",--10
    })

    --即時発動系
    sets.precast.JA['明鏡止水']     = {legs="左近士筒脛当改"}
    sets.precast.JA['黙想']         = {head="極脇戸桃形兜",hands="極左近士筒篭手",back="スメルトリオマント"}
    sets.precast.JA['先義後利']     = {legs="極春日筒脛当"}
    sets.precast.JA['護摩の守護円'] = {head="極脇戸桃形兜"}

    --FC
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

    --WSダメージ
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
    
    --WS魔攻
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


    --モクシャ42 II 20
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
		body="デーゴンブレスト",--II 10
        legs="ムパカホーズ",--II 5
        feet="乾闥婆脛当改",--8
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        right_ear="シェレピアス",--3
        left_ring="ニックマドゥリング",--II 5
        right_ring="シーリチリング+1",--10
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

end
