function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ロスタムB'))
    if player.sub_job == '忍' or player.sub_job == 'NIN' or player.sub_job == '踊' or player.sub_job == 'DNC' then
        send_command('wait 1; gs c set SubWeapons '..windower.to_shift_jis('クレパスクラナイフ'))
    else
        send_command('wait 1; gs c set SubWeapons '..windower.to_shift_jis('ヌスクシールド'))
    end
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 17

    -- 武器
    gear['ロスタムA']           = {name="ロスタム", augments={'Path: A'}}
    gear['ロスタムB']           = {name="ロスタム", augments={'Path: B'}}
    gear['ロスタムC']           = {name="ロスタム", augments={'Path: C'}}
    gear['グレティナイフ']      = {name="グレティナイフ"}
    gear['クレパスクラナイフ']  = {name="クレパスクラナイフ"}
    gear['ネイグリング']        = {name="ネイグリング"}
    gear['ヌスクシールド']      = {name="ヌスクシールド"}
    gear['デスペナルティ']      = {name="デスペナルティ"}
    gear['フォーマルハウト']    = {name="フォーマルハウト"}
    gear['アナーキー']          = {name="アナーキー+2"}
    gear.GunPhysics             = {name="クロノブレット"}
    gear.GunMagical             = {name="ライヴブレット"}
    gear['ホクスボクブレット']  = {name="ホクスボクブレット"}
    gear['アニミキーブレット']  = {name="アニミキーブレット"}
    gear.CorsairShot            = gear['アニミキーブレット'] 
    gear['ルザフリング']        = {name="ルザフリング"}
    gear.Slip                   = {name="プライムガン"}

    -- ジョブマント
    gear.JobMantle              = {}
    gear.JobMantle.Melee_STP    = { name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%'}}
    gear.JobMantle.Melee_Dual   = { name="カムラスマント", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dual Wield"+10','Phys. dmg. taken-10%'}}
    gear.JobMantle.Snap         = { name="カムラスマント", augments={'"Snapshot"+10'}}
    gear.JobMantle.RA           = { name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
    gear.JobMantle.WSD_STR      = { name="カムラスマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.JobMantle.WSD_AGI      = { name="カムラスマント", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
    gear.JobMantle.WSD_Magic    = { name="カムラスマント", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}

    -- モクシャ(49)
    sets.SubtleBlow = {
        hands="アデマリスト+1",
        neck="バーシチョーカー+1",
        waist="サリサフロイベルト",
        right_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }

    -- ロール
    sets.CorsairRoll={
        gear.RostamC,
        range="コンペンセーター",
        head="ＬＡトリコルヌ+3",
        hands="ＣＳガントリー+3",
        Legs="デサルタタセッツ",
        neck="王将の首飾り",
        back="ガンスリンガマント"
    }

    -- 遠隔STP
    sets.RA_STP = {
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="イスクルゴルゲット",
        waist="テレンベルト",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="昏黄の指輪",
        right_ring="シーリチリング+1",
        gear.JobMantle.RA 
    }
    
    sets.RA_ACC = {
        ammo=gear.CorsairShot,
        head="ＬＫトリコルヌ+4",
        body="ＬＫフラック+4",
        hands="ＬＫガントリー+4",
        legs="ＣＳトルーズ+3",
        feet="ＬＫブーツ+4",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="アスプロピアス",
        right_ear={ name="シャスーピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Crit.hit rate+6','STR+9 AGI+9',}},
        left_ring="王将の指輪",
        right_ring="メタモルリング+1",
        back="無の外装",
    }

    -- 待機装備（通常）
    sets.idle = {
        head="無の面",
        body="ニャメメイル",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet="ニャメソルレット", 
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="無の腰当",
        left_ear="インフューズピアス",
        right_ear="エアバニピアス",
        left_ring={ name="メランリング", augments={'Path: A',}},
        right_ring="シュネデックリング",
        back="無の外装",
    }

    -- 抜刀装備
    sets.engaged = {
        head="マリグナスシャポー",
        body="マリグナスタバード",
        hands="マリグナスグローブ",
        legs="ＣＳトルーズ+3",
        feet="マリグナスブーツ",
        neck="無の喉輪",
        waist="セールフィベルト+1",
        left_ear="アスプロピアス",
        right_ear="テロスピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back="無の外装"
    }

    -- 抜刀装備（高命中）
    sets.engaged.ACC = set_combine(sets.engaged ,{
        hands="ガズブレスレット+1",
        back="無の外装",
    })

    -- 抜刀装備（モクシャ）
    sets.engaged.SubtleBlow = set_combine(sets.engaged ,sets.SubtleBlow)
    
    -- 二刀流11（サポ忍）
    sets.engaged.dual11= { waist="霊亀腰帯",right_ear="エアバニピアス"}

    -- 二刀流21（サポ踊）
    sets.engaged.dual21= set_combine(sets.engaged.dual11,gear.JobMantle.Melee_Dual)

    -- バフ
    sets.buff['トリプルショット']                   = {body="ＣＳフラック+3"}
    sets.precast.JA["ワイルドカード"]               = {feet="ＬＡブーツ+4"}
    sets.precast.CorsairRoll                        = sets.CorsairRoll
    sets.precast.CorsairRoll.short                  = {hands=empty,neck=empty}
    sets.precast.CorsairRoll['プリッツアロール']    = set_combine(sets.precast.CorsairRoll,{head= "ＣＳトリコルヌ+3"})
    sets.precast.CorsairRoll['タクティックロール']  = set_combine(sets.precast.CorsairRoll,{body= "ＣＳフラック+3"})
    sets.precast.CorsairRoll['アライズロール']      = set_combine(sets.precast.CorsairRoll,{hands="ＣＳガントリー+3"})
    sets.precast.CorsairRoll['キャスターズロール']  = set_combine(sets.precast.CorsairRoll,{Legs= "ＣＳトルーズ+3"})
    sets.precast.CorsairRoll['コアサーズロール']    = set_combine(sets.precast.CorsairRoll,{feet= "ＣＳブーツ+3"})
    sets.precast.CorsairRoll['ボルターズロール']    = set_combine(sets.idle,{main=gear.RostamC,Legs="デサルタタセッツ",back="ガンスリンガマント"})
    sets.precast.CorsairShot                        = set_combine(sets.RA_STP,{ammo=gear.CorsairShot})
    sets.precast.CorsairShot['ライトショット']      = set_combine(sets.RA_ACC,{ammo=gear.CorsairShot})
    sets.precast.CorsairShot['ダークショット']      = set_combine(sets.RA_ACC,{ammo=gear.CorsairShot})
    sets.precast.JA["ダブルアップ"]                 = {}
    sets.precast.JA["ランダムディール"]             = {body="ＬＡフラック+4"}
    sets.precast.JA["スネークアイ"]                 = {legs="ＬＡトルーズ+3"}
    sets.precast.JA["フォールド"]                   = {hands="ＬＡガントリー+3"}
    sets.precast.JA["トリプルショット"]             = {}
    sets.precast.JA["クルケッドカード"]             = {}
    sets.precast.JA["カットカード"]                 = {}

    -- FC 54
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+6','Mag. Acc.+9',}},
        body="ドレッドジュポン",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        legs={ name="ヘルクリアトラウザ", augments={'Mag. Acc.+16','"Fast Cast"+6','STR+10',}},
        feet="カマイングリーヴ",
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="キシャールリング",
        right_ring="ラハブリング",
        back="無の外装",
    }

    -- スナップ
    sets.precast.RA = {
        head={ name="テーオンシャポー", augments={'"Snapshot"+5','"Snapshot"+5',}},
        body="ＬＫフラック+4",
        hands={ name="ＬＡガントリー+3", augments={'Enhances "Fold" effect',}},
        legs="ＬＫトルーズ+3",
        feet="メガナダジャンボ+2",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="イェマヤベルト",
        left_ring="昏黄の指輪",
        back=gear.JobMantle.Snap
    }

    -- WSダメージ
    sets.precast.WS.Damage = {
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="胡蝶のイヤリング",
        right_ear={ name="シャスーピアス+2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Crit.hit rate+6','STR+9 AGI+9',}},
        left_ring="コーネリアリング",
        right_ring="スローダリング",
        back=gear.JobMantle.WSD_STR
    }

    -- WS遠隔ダメージ
    sets.precast.WS.Range = {
        ammo=gear.GunPhysics,
        head="ニャメヘルム",
        body="ＬＫフラック+4",
        hands="ＣＳガントリー+3",
        legs="ニャメフランチャ", 
        feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},
        neck="イスクルゴルゲット",
        waist="テレンベルト",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="テロスピアス",
        left_ring="コーネリアリング",
        right_ring="ディンジルリング",
        back=gear.JobMantle.WSD_AGI
    }

    -- WS遠隔魔攻
    sets.precast.WS.Magic = {
        ammo=gear.GunMagical,
        head="ニャメヘルム",
        body="ニャメメイル",
        body="ＬＡフラック+4",
        hands="ニャメガントレ", 
        legs="ニャメフランチャ", 
        feet={ name="ＬＡブーツ+4", augments={'Enhances "Wild Card" effect',}},
        neck={ name="コモドアチャーム+2", augments={'Path: A',}},
        waist="オルペウスサッシュ",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="フリオミシピアス",
        left_ring="コーネリアリング",
        right_ring="ディンジルリング",
        back=gear.JobMantle.WSD_Magic
    }
    
    --共通WS定義読み込み
    init_weapon_skill()
    
    --個別WS定義
    sets.precast.WS["レデンサリュート"] = set_combine(sets.precast.WS.Magic,{head="妖蟲の髪飾り+1",right_ring="アルコンリング"})
    sets.precast.WS["イオリアンエッジ"] = set_combine(sets.precast.WS.Magic,{ammo=gear['ホクスボクブレット']})
    sets.precast.WS["エクゼンテレター"] = set_combine(sets.engaged.ACC,{})
    
    --遠隔攻撃
    sets.midcast.RA = sets.RA_STP
   
    --遠隔攻撃（クリティカル）
    sets.midcast.RA.Critical    = set_combine(sets.midcast.RA, {feet="オショシレギンス+1"})
end