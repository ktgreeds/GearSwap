function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons CrepuscularKnife')
    send_command('gs c set SubWeapons TernionDagger')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 161

    --短剣
    gear.CrepuscularKnife       = {name="クレパスクラナイフ"}
    gear.TernionDagger          = {name="ターニオンダガー+1"}
    gear.Acrontica              = {name="アクロンティカ"}
    gear.Tauret                 = {name="トーレット"}
    gear.TPBonus                = {name="フセット+2"}
    --片手剣
    gear.OnionSword             = {name="真オニオンソード"}
    --その他
    gear.Slip  					= {name="プライムダガー"}

    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="ＭＣトーシュー+3",
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="エアバニピアス",
        right_ear="ハーティーピアス",
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }

    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="ヘルクリアヘルム", augments={'Weapon skill damage +2%','AGI+6','"Refresh"+2','Accuracy+9 Attack+9',}},
        hands={ name="ヘルクリアグローブ", augments={'Spell interruption rate down -6%','Attack+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="ヘルクリアトラウザ", augments={'Pet: VIT+10','"Subtle Blow"+10','"Refresh"+2','Accuracy+8 Attack+8',}},
        feet={ name="ヘルクリアブーツ", augments={'"Mag.Atk.Bns."+17','STR+9','"Refresh"+2',}},
        neck="シビルスカーフ",
    })
    
    --抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="マリグナスタイツ",
        feet="ＭＣトーシュー+3",
        neck={ name="エトワールゴルゲ+2", augments={'Path: A',}},
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear="シェリダピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="ゲリリング",
        back="無の外装",
    }

    --抜刀装備（受け流し）
    sets.engaged.Parry = {
        ammo="ヤメラング",
        head="無の面",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands="トゥルムミトン+1",
        legs="ＭＣタイツ+3",
        feet="トゥルムレギンス+1",
        neck="無の喉輪",
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear="トゥイストピアス",
        left_ring="メランリング",
        right_ring="ワーデンリング",
        back={ name="セヌーナマント", augments={'VIT+20','Eva.+20 /Mag. Eva.+20','VIT+10','Enmity+10','Parrying rate+5%',}},
    }
    
    --モクシャ46
    sets.engaged.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        right_ear="シェリダピアス",--II 5
        left_ring="シーリチリング+1",--10
        right_ring="シーリチリング+1",--10
    }

    --敵対心装備
    sets.Enmity = {
        ammo="サピエンスオーブ",
        head="ハリタスヘルム",
        body="エメットハーネス+1",
        hands="クーリスグローブ",
        neck={ name="ウォーダチャーム+1", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear="クリプティクピアス",
        left_ring="ヴェクサーリング+1",
        right_ring="アイワツリング",
        back="月明の羽衣",
    }

    --監視用バフ
    sets.buff['C.フラリッシュ']         = {head="ＭＣティアラ+3"}
    sets.buff['S.フラリッシュ']         = {body="ＭＣカザク+3"}

    --即時発動系バフ
    sets.precast.JA['トランス'] = {head = "ＨＯティアラ+3"}
    sets.precast.JA['ノーフットライズ'] = {body = "ＨＯカザク+3"}
    sets.precast.JA['扇の舞い'] = {hands = "ＨＯバングル+3"}
    sets.precast.JA['剣の舞い'] = {legs = "ＨＯタイツ+3"}
    sets.precast.JA.Samba = {
        head = "ＭＸティアラ+3",
        back = "セヌーナマント"
    }
    
    sets.precast.JA.Step = {
        hands = "ＭＸバングル+3",
        feet = "ＨＯトーシュー+3"
    }

    sets.precast.JA.Step["フェザーステップ"] = {
        feet = "ＭＣトーシュー+3"
    }

    sets.precast.JA.Jig = {
        Legs="ＨＯタイツ+3",
        feet="ＭＸトーシュー+3"
    }

    sets.precast.JA["R.フラリッシュ"] = {
        hands="ＭＣバングル+3",
        back="トータッパーマント"
    }
    
    sets.precast.JA["A.フラリッシュ"] = sets.Enmity
    sets.precast.JA["挑発"] = sets.Enmity
    
    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+6','Mag. Acc.+9',}},
        body="ドレッドジュポン",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet={ name="ヘルクリアブーツ", augments={'"Fast Cast"+6','MND+2','Mag. Acc.+2',}},
        neck="オルンミラトルク",
        waist="プラチナモグベルト",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="ラハブリング",
        right_ring="メダダリング",
        back="月明の羽衣",
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="カリスフェザー",
        head="ＭＣティアラ+3",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck={ name="エトワールゴルゲ+2", augments={'Path: A',}},
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="王将の指輪",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="王将の指輪",
        right_ring="エパミノダスリング",
        back="サクロマント",
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="カリスフェザー",
        head={ name="ブリスタサリット+1", augments={'Path: A',}},
        body="グレティキュイラス",
        hands="グレティガントレ",
        legs="グレティブリーチズ",
        feet="グレティブーツ",
        neck="フォシャゴルゲット",
        waist="フォシャベルト",
        left_ear="王将の指輪",
        right_ear="オドルピアス",
        left_ring="イラブラットリング",
        right_ring="ゲリリング",
        back={ name="セヌーナマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        ammo="ペムフレドタスラム",
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="オドルピアス",
        right_ear="フリオミシピアス",
        left_ring="エパミノダスリング",
        right_ring="メダダリング",
        back="無の外装",
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
    sets.precast.JA.Waltz = {
        ammo="ヤメラング",
        head="ムンムボンネット+2",
        body="ＭＸカザク+3",
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet="ＭＸトーシュー+3",
        neck={ name="エトワールゴルゲ+2", augments={'Path: A',}},
        waist="プラチナモグベルト",
        left_ear={ name="オノワイヤリング+1", augments={'Path: A',}},
        right_ear="クリプティクピアス",
        left_ring="メランリング",
        right_ring={ name="ゼラチナスリング+1", augments={'Path: A',}},
        back={ name="トータッパーマント", augments={'"Store TP"+2','"Dual Wield"+4','"Rev. Flourish"+30',}},
    }

    --遠隔攻撃
    sets.precast.RA ={range="ラミアベーン"}

    --ファランクス
    sets.midcast.Phalanx = {
        main={ name="スキンフレア", augments={'"Avatar perpetuation cost" -2','Accuracy+28','Phalanx +3','DMG:+12',}},
        sub={ name="スキンフレア", augments={'"Cure" potency +1%','Attack+24','Phalanx +3','DMG:+12',}},
        head={ name="ヘルクリアヘルム", augments={'Accuracy+11','STR+4','Phalanx +4','Accuracy+6 Attack+6','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
        body={ name="ヘルクリアベスト", augments={'STR+10','Pet: STR+9','Phalanx +5','Mag. Acc.+3 "Mag.Atk.Bns."+3',}},
        hands={ name="ヘルクリアグローブ", augments={'Magic Damage +1','Crit. hit damage +3%','Phalanx +4','Accuracy+10 Attack+10','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
        legs={ name="ヘルクリアトラウザ", augments={'AGI+8','Attack+7','Phalanx +4','Accuracy+1 Attack+1','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="ヘルクリアブーツ", augments={'Weapon skill damage +2%','"Fast Cast"+3','Phalanx +5','Accuracy+16 Attack+16',}},
        neck="インカンタートルク",
        left_ear="ミミルピアス",
        left_ring="スティキニリング+1",
    }
end