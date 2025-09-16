function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons Gandring')
    send_command('gs c set SubWeapons Acrontica')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 31

    --短剣
    gear.Khonsu                 = {name="コーンスー"}
    gear.Gandring               = {name="ガンドリング"}
    gear.Malevolence            = {name="マレヴォレンス"}
    gear.Tauret                 = {name="トーレット"}
    gear.Aeneas                 = {name="エーネアス"}
    gear.Acrontica              = {name="アクロンティカ"}

    --待機装備（通常）
    sets.idle = {
        ammo="ヤメラング",
        head="無の面",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ＳＫプーレーヌ+3",
        neck="アサシンゴルゲ+2",
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="ヴェンジフルリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="ヘルクリアヘルム", augments={'Accuracy+24','INT+5','"Refresh"+2',}},
        body={ name="ヘルクリアベスト", augments={'Pet: Haste+1','"Mag.Atk.Bns."+16','"Refresh"+2',}},
        hands={ name="ヘルクリアグローブ", augments={'Mag. Acc.+4','Crit. hit damage +1%','"Refresh"+1','Accuracy+19 Attack+19','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    })
    
    --抜刀装備
    sets.engaged = {
        ammo="ヤメラング",
        head="無の面",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ＳＫプーレーヌ+3",
        neck="アサシンゴルゲ+2",
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="インフューズピアス",
        left_ring="ヴェンジフルリング",
        right_ring="ゲリリング",
        back="無の外装",
    }

    sets.engaged.Multi = {
        ammo={ name="コイストボダー", augments={'Path: A',}},
        head={ name="アデマボンネット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body={ name="アデマジャケット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        hands={ name="アデマリスト+1", augments={'Accuracy+20','Attack+20','"Subtle Blow"+8',}},
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck={ name="アサシンゴルゲ+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="エアバニピアス",
        right_ear={ name="スカルカピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Store TP"+4',}},
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装",
    }
    --トレハン
    sets.TreasureHunter = {
        hands={ name="ＰＤアムレット+3", augments={'Enhances "Perfect Dodge" effect',}},
        feet="ＳＫプーレーヌ+3",    
    }

    --トレハン抜刀
    sets.engaged.TH = set_combine(sets.engaged, sets.TreasureHunter)
    
    
    --遠隔攻撃
    sets.precast.RA ={range="アルビンベーン"}

    --バフ監視用
    sets.buff['不意打ち']               = {hands="ＳＫアムレット+2"}
    sets.buff['だまし討ち']             = {body="ＰＤベスト+3",hands="ＰＬアムレット+2"}

    --即時発動系
    sets.precast.JA['アカンプリス']     = {head="ＳＫボンネット+2"}
    sets.precast.JA['コラボレーター']   = {head="ＳＫボンネット+2"}
    sets.precast.JA['絶対回避']         = {hands="ＰＤアムレット+3"}
    sets.precast.JA['フェイント']       = {legs="ＰＤキュロット+3"}
    sets.precast.JA['とんずら']         = {feet="ＰＬプーレーヌ+3"}
    sets.precast.JA['ぬすむ']           = {legs="アサシンキュロット",feet="ＰＬプーレーヌ+3",ammo="バラスルーム",neck="ペンタラグチャーム"}
    sets.precast.JA['かすめとる']       = {hands="ＰＤアムレット+3"}
    sets.precast.JA['ぶんどる']         = {legs="ＳＫキュロット+2",feet="ＳＫプーレーヌ+3"}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="ヘルクリアヘルム", augments={'"Fast Cast"+5',}},
        body="ドレッドジュポン",
        hands={ name="レイライングローブ", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
        legs={ name="ヘルクリアトラウザ", augments={'"Fast Cast"+6','Mag. Acc.+3','"Mag.Atk.Bns."+9',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','Mag. Acc.+12',}},
        neck="オルンミラトルク",
        left_ear="ロケイシャスピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メダダリング",
        right_ring="ラハブリング",
        back={ name="トゥタティスケープ", augments={'"Fast Cast"+10',}},
    
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="コイストボダー",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="ＳＫベスト+3",
        hands="ニャメガントレ",
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ニャメソルレット",
        neck={ name="アサシンゴルゲ+2", augments={'Path: A',}},
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="王将の指輪",
        right_ring="ゲリリング",
        back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    
    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="パルーグストーン",
        head={ name="アデマボンネット+1", augments={'DEX+12','AGI+12','Accuracy+20',}},
        body="ＰＬベスト+3",
        hands={ name="ＰＤアムレット+3", augments={'Enhances "Perfect Dodge" effect',}},
        legs="ＰＬキュロット+3",
        feet="ＳＫプーレーヌ+3",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear="オドルピアス",
        left_ring="王将の指輪",
        right_ring="ゲリリング",
        back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
    }
    
    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="ペムフレドタスラム",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ＳＫプーレーヌ+3",
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
       -- waist="エスカンストーン",
        left_ear="フリオミシピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        --left_ring="メランリング",
        left_ring="ディンジルリング",
        right_ring="メダダリング",
        back={ name="トゥタティスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        right_ear="シェリダピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    --ワルツ
    sets.precast.Waltz={
        ammo="ヤメラング",
        body="グレティキュイラス",
        legs="ダッシングサブリガ",
    }
end