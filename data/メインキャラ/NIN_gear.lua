function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('丙子椒林剣')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('鶴'))
end


function init_gear_sets()
    -- ロックスタイル番号
    lockstyleset = 13

    -- 武器
    gear['ターニオンダガー']    = {name="ターニオンダガー+1"}
    gear['丙子椒林剣']          = {name="丙子椒林剣"}
    gear['鶴']                  = {name="鶴"}
    gear['マレヴォレンス']      = {name="マレヴォレンス"}

    sets.SubtleBlow = {}

    -- 待機装備（通常）
    sets.idle = {
        ammo="伊達手裏剣",
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

    -- 待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle, {
        ammo="ストンチタスラム+1",
        head={ name="ヘルクリアヘルム", augments={'Weapon skill damage +2%','AGI+6','"Refresh"+2','Accuracy+9 Attack+9',}},
        hands={ name="ヘルクリアグローブ", augments={'Spell interruption rate down -6%','Attack+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="ヘルクリアトラウザ", augments={'Pet: VIT+10','"Subtle Blow"+10','"Refresh"+2','Accuracy+8 Attack+8',}},
        feet={ name="ヘルクリアブーツ", augments={'"Mag.Atk.Bns."+17','STR+9','"Refresh"+2',}},
        neck="シビルスカーフ",
        waist={name="プラチナモグベルト",priority=16},
    })
    
    -- 抜刀装備
    sets.engaged = {
        ammo="伊達手裏剣",
        head="極服部頭巾",
        body="極服部忍着",
        hands="極蜂屋手甲",
        legs="極服部袴",
        feet="極服部脚絆",
        neck={ name="忍者の喉輪+2", augments={'Path: A',}},
        waist="ウィンバフベルト+1",
        left_ear={name="トゥイストピアス",priority=16},
        right_ear={ name="服部耳飾り改", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
        left_ring="メランリング",
        right_ring="ゲリリング",
        back="無の外装",
    }
    sets.engaged.SubtleBlow     = set_combine(sets.engaged ,sets.SubtleBlow)

    -- バフ
    sets.buff['陽忍']                   = {legs="極服部袴"}
    sets.buff['陰忍']                   = {head="極服部頭巾"}
    sets.precast.JA['微塵がくれ'] = {legs="越望月袴"}
    sets.precast.JA['陽忍'] = {head="越望月半首"}
    sets.precast.JA['陰忍'] = {head="越望月半首"}
    sets.precast.JA['散華'] = {body="越望月鎖帷子"}
    sets.precast.JA['二重'] = {hands="極服部手甲"}
    sets.precast.JA['一隻眼'] = {}
    sets.precast.JA['身影'] = {}


	sets.Enmity = {
        ammo="伊達手裏剣",
        head="ニャメヘルム",
        body="エメットハーネス+1",
        hands="クーリスグローブ",
        legs="ゾアサブリガ+1",
        feet="極望月脚絆",
        neck="月光の首飾り",
        waist="ウォーウルフベルト",
        left_ear="クリプティクピアス",
        right_ear="無知の耳",
        left_ring="アイワツリング",
        right_ring="パニシャスリング",
        back={ name="アンダルタマント", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Enmity+10','Phys. dmg. taken-10%',}},
    }

    -- FC
    sets.precast.FC = {
        head={ name="ヘルクリアヘルム", augments={'"Mag.Atk.Bns."+9','"Fast Cast"+6','Mag. Acc.+9',}},
        body="ドレッドジュポン",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        neck="オルンミラトルク",
        waist="コーネリアの黒帯",
        left_ear="エンチャンピアス+1",
        right_ear="エテオレートピアス",
        left_ring="キシャールリング",
        right_ring="ラハブリング",
        back={ name="アンダルタマント", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Spell interruption rate down-10%',}},
    }

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC,{body="望月鎖帷子改"})

    --WSダメージ
    sets.precast.WS.Damage = {
        head="ニャメヘルム",
        body="ニャメメイル",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="共和プラチナ章",
        waist="セールフィベルト+1",
        left_ear="胡蝶のイヤリング",
        right_ear={ name="服部耳飾り改", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','"Store TP"+5',}},
        left_ring="エパミノダスリング",
        right_ring="王将の指輪",
        back="無の外装",
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        head={ name="ニャメヘルム", augments={'Path: B',}},
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="シビルスカーフ",
        waist="オルペウスサッシュ",
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="フリオミシピアス",
        left_ring="エパミノダスリング",
        right_ring="王将の指輪",
        back="無の外装",
    }


    --共通WS定義読み込み
    init_weapon_skill()

    sets.midcast['Ninjutsu'] = {hands="極望月手甲"}
   
    sets.midcast.Utsusemi = set_combine(sets.midcast['Ninjutsu'],{
        feet="極服部脚絆",
        back="アンダルタマント"
    })
end