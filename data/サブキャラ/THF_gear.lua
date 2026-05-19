function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ガンドリング')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('アクロンティカ'))
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 6

    --武器
    gear['ガンドリング']    = {name="ガンドリング"}
    gear['マレヴォレンス']  = {name="マレヴォレンス"}
    gear['トーレット']      = {name="トーレット"}
    gear['エーネアス']      = {name="エーネアス"}
    gear['アクロンティカ']  = {name="アクロンティカ"}

    --トレハン
    sets.TreasureHunter = {
        feet="ＳＫプーレーヌ+3",
    } 

    -- 敵対心
	sets.Enmity = {
        head="ハリタスヘルム",
        body="ＰＤベスト+3",
        body="ＰＤベスト+3",
        waist="ウォーダチャーム+1",
        right_ring="ビグラッジリング",
        back="霊亀外套"
    }
    
    --バフ
    sets.precast.JA                     = sets.Enmity
    sets.buff['不意打ち']               = {hands="ＳＫアムレット+2"}
    sets.buff['だまし討ち']             = {body="ＰＤベスト+3",hands="ＰＬアムレット+2"}
    sets.precast.JA['絶対回避']         = {hands="ＰＤアムレット+3"}
    sets.precast.JA['ぬすむ']           = {legs="アサシンキュロット",feet="ＰＬプーレーヌ+3",ammo="バラスルーム",neck="ペンタラグチャーム"}
    sets.precast.JA['アカンプリス']     = {head="ＳＫボンネット+2"}
    sets.precast.JA['不意打ち']         = {}
    sets.precast.JA['とんずら']         = {feet="ＰＬプーレーヌ+3"}
    sets.precast.JA['だまし討ち']       = {}
    sets.precast.JA['かすめとる']       = {hands="ＰＤアムレット+3"}
    sets.precast.JA['かくれる']         = {}
    sets.precast.JA['アカンプリス']     = {}
    sets.precast.JA['コラボレーター']   = {head="ＳＫボンネット+2"}
    sets.precast.JA['アサシンチャージ'] = {}
    sets.precast.JA['フェイント']       = {legs="ＰＤキュロット+3"}
    sets.precast.JA['ぶんどる']         = {legs="ＳＫキュロット+2",feet="ＳＫプーレーヌ+3"}
    sets.precast.JA['コンスピレーター'] = {}
    sets.precast.JA['まどわす']         = {}
    sets.precast.JA['ラーセニー']       = {}


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
        left_ring="メランリング",
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
        ammo="コイストボダー",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck={ name="アサシンゴルゲ+2", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="アスプロピアス",
        right_ear={ name="スカルカピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Store TP"+4',}},
        left_ring="シーリチリング+1",
        right_ring="ゲリリング",
        back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

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
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck={ name="アサシンゴルゲ+2", augments={'Path: A',}},
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="コーネリアリング",
        right_ring="エパミノダスリング",
        back={ name="トゥタティスケープ", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
    }
    
    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="コイストボダー",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="マリグナスブーツ",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="シェリダピアス",
        right_ear="オドルピアス",
        left_ring="王将の指輪",
        right_ring="イラブラットリング",
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
        left_ear="フリオミシピアス",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="コーネリアリング",
        right_ring="ディンジルリング",
        back={ name="トゥタティスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }
    
    --共通WS定義読み込み
    init_weapon_skill()

    sets.precast.WS["イオリアンエッジ"] = { Normal=sets.precast.WS.Magic,
                                            TreasureHunter=set_combine(sets.precast.WS.Magic,sets.TreasureHunter)}
    sets.precast.WS["ルドラストーム"] = { Normal=sets.precast.WS.Magic,
                                            TreasureHunter=set_combine(sets.precast.WS.Damage,sets.TreasureHunter)}
    sets.precast.WS["エヴィサレーション"] = { Normal=sets.precast.WS.Magic,
                                            TreasureHunter=set_combine(sets.precast.WS.Critical,sets.TreasureHunter)}                                            
    --ワルツ
    sets.precast.Waltz=set_combine(sets.Enmity,{
        ammo="ヤメラング",
        body="グレティキュイラス",
        legs="ダッシングサブリガ",
    })

    --遠隔攻撃
    sets.precast.RA ={range="アルビンベーン"}

    sets.midcast['精霊魔法'] = set_combine(sets.precast.WS.Magic,sets.TreasureHunter)
    sets.midcast['暗黒魔法'] = set_combine(sets.precast.WS.Magic,sets.TreasureHunter)
end