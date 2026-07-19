function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('クレパスクラナイフ')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('ターニオンダガー'))
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 19

    --武器
    gear['クレパスクラナイフ']  = {name="クレパスクラナイフ"}
    gear['ターニオンダガー']    = {name="ターニオンダガー+1"}
    gear['アクロンティカ']      = {name="アクロンティカ"}
    gear['トーレット']          = {name="トーレット"}
    gear['フセット']            = {name="フセット+2"}
    gear['真オニオンソード']    = {name="真オニオンソード"}
    gear['プライムダガー']  	= {name="プライムダガー"}

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

    --モクシャ46
    sets.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},--11
        waist="サリサフロイベルト",--5
        left_ear="ディグニタリピアス",--5
        right_ear="シェリダピアス",--II 5
        left_ring="シーリチリング+1",--10
        right_ring="シーリチリング+1",--10
    }

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

    sets.engaged.SubtleBlow     = set_combine(sets.engaged ,sets.SubtleBlow)

    --抜刀装備（受け流し）
    sets.engaged.Parry = {
        ammo="ヤメラング",
        head="無の面",
        body="ニャメメイル",
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
    
    --バフ
    sets.buff['C.フラリッシュ']                 = {head="ＭＣティアラ+3"}
    sets.buff['S.フラリッシュ']                 = {body="ＭＣカザク+3"}
	sets.precast.JA                             = sets.Enmity
    sets.precast.JA['トランス']                 = {head="ＨＯティアラ+3"}
    sets.precast.JA.Samba                       = {head="ＭＸティアラ+3",back="セヌーナマント"}
    sets.precast.JA.Waltz                       = {head="ＨＯティアラ+3",body="ＭＸカザク+3",feet="ＭＸトーシュー+3",neck="エトワールゴルゲ+2"}
    sets.precast.JA.Step                        = {head="ＭＸティアラ+3",hands="ＭＸバングル+3",feet="ＨＯトーシュー+3"}
    sets.precast.JA.Step["フェザーステップ"]    = set_combine(sets.precast.JA.Step,{feet="ＭＣトーシュー+3"})
    sets.precast.JA["A.フラリッシュ"]           = sets.Enmity
    sets.precast.JA["D.フラリッシュ"]           = {}
    sets.precast.JA["V.フラリッシュ"]           = {body="ＨＯカザク+3"}
    sets.precast.JA["R.フラリッシュ"]           = {hands="ＭＣバングル+3",back="トータッパーマント"}
    sets.precast.JA["B.フラリッシュ"]           = {}
    sets.precast.JA["W.フラリッシュ"]           = {}
    sets.precast.JA["C.フラリッシュ"]           = {}
    sets.precast.JA["S.フラリッシュ"]           = {}
    sets.precast.JA["T.フラリッシュ"]           = {}
    sets.precast.JA.Jig                         = {Legs="ＨＯタイツ+3",feet="ＭＸトーシュー+3"}
    sets.precast.JA["プレスト"]                 = {}
    sets.precast.JA['扇の舞い']                 = {hands="ＨＯバングル+3"}
    sets.precast.JA['剣の舞い']                 = {legs="ＨＯタイツ+3"}
    sets.precast.JA['ノーフットライズ']         = {body="ＨＯカザク+3"}

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
        left_ring="メランリング",
        right_ring="ラハブリング",
        back="月明の羽衣",
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="カリスフェザー",
        head="ＭＣティアラ+3",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck={ name="エトワールゴルゲ+2", augments={'Path: A',}},
        waist={ name="ケンタークベルト+1", augments={'Path: A',}},
        left_ear="王将の指輪",
        right_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        left_ring="イフラマドリング",
        right_ring="王将の指輪",
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
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear="オドルピアス",
        right_ear="フリオミシピアス",
        left_ring="イフラマドリング",
        right_ring="エパミノダスリング",
        back="無の外装",
    }

    --共通WS定義読み込み
    init_weapon_skill()

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