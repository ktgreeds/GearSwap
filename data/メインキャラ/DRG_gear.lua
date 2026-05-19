function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('アラム')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('ウトゥグリップ'))
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 14

    --武器
    gear['アラム']              = {name="アラム"}
    gear['シャイニングワン']    = {name="シャイニングワン"}
    gear['ゲイルレズ']          = {name="ゲイルレズ"}
    gear['ウトゥグリップ']      = {name="ウトゥグリップ"}

    sets.SubtleBlow = {}

    --待機装備（通常）
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

    --抜刀装備
    sets.engaged = {
        ammo="コイストボダー",
        head="フロプトヘルム",
        body="ＰＥプラカート+3",
        hands="ＰＥバンブレス+3",
        legs="ＰＴブレー+4",
        feet="ＰＥシンバルド+3",
        neck={ name="竜騎士の首輪+2", augments={'Path: A',}},
        waist="ソードフェーテル+1",
        left_ear="アスプロピアス",
        right_ear="シェリダピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
        back={ name="ブリガンチアマント", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
    }

    sets.engaged.SubtleBlow     = set_combine(sets.engaged ,sets.SubtleBlow)

    --即時発動系バフ
    sets.precast.JA['竜剣']                 = {body="ＰＴメイル+3"}
    sets.precast.JA['コールワイバーン']     = {body="ＰＴメイル+3"}
    sets.precast.JA['エンシェントサークル'] = {}
    sets.precast.JA['ジャンプ']             = {ammo="コイストボダー",
                                               head="フロプトヘルム",
                                               body="ＶＳメイル+3",
                                               hands="ＶＳフィンガー+3",
                                               legs="ＰＥキュイソー+3",
                                               feet="オストログリーヴ",
                                               neck="コンバタントトルク",
                                               waist="ソードフェーテル+1",
                                               left_ear="シェリダピアス",
                                               right_ear="テロスピアス",
                                               left_ring="シーリチリング+1",
                                               right_ring="シーリチリング+1",
                                               back="無の外装",}
    sets.precast.JA['ハイジャンプ']         = set_combine(sets.precast.JA['ジャンプ'],{legs="ＶＳブレー+3"})
    sets.precast.JA['スーパージャンプ']     = sets.precast.JA['ジャンプ']
    sets.precast.JA['スピリットボンド']     = {}
    sets.precast.JA['ディープブリージング'] = {head="ＰＴアーメット+3"}
    sets.precast.JA['アンゴン']             = {ammo="アンゴン",hands="ＰＴフィンガー+3"}
    sets.precast.JA['スピリットジャンプ']   = set_combine(sets.precast.JA['ジャンプ'],{legs="ＰＥキュイソー+3",feet="ＰＥシンバルド+3"})
    sets.precast.JA['スピリットリンク']     = {head="ＶＳアーメット+3",body="ＰＴグリーヴ+3",hands="ＰＥバンブレス+3"}
    sets.precast.JA['スマイトブレス']       = {head="ＶＳアーメット+3"}
    sets.precast.JA['レストアブレス']       = {head="ＶＳアーメット+3"}
    sets.precast.JA['ソウルジャンプ']       = set_combine(sets.precast.JA['ジャンプ'],{legs="ＰＥキュイソー+3"})
    sets.precast.JA['ドラゴンブレイカー']   = {}
    sets.precast.JA['フライハイ']           = {}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="カマインマスク+1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
        body="サクロブレスト",
        hands={ name="レイライングローブ", augments={'Accuracy+15','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Fast Cast"+3',}},
        feet={ name="カマイングリーヴ", augments={'HP+60','STR+10','INT+10',}},
        neck="オルンミラトルク",
        left_ear="エテオレートピアス",
        right_ear="エンチャンピアス+1",
        left_ring="メランリング",
        right_ring="ラハブリング",
    }

    --WSダメージ
    sets.precast.WS.Damage = {
        ammo="ノブキエリ",
        head="ＰＥメザイユ+3",
        body={ name="ニャメメイル", augments={'Path: B',}},
        hands={ name="ニャメガントレ", augments={'Path: B',}},
        legs={ name="ニャメフランチャ", augments={'Path: B',}},
        feet={ name="ニャメソルレット", augments={'Path: B',}},
        neck="竜騎士の首輪+2",
        waist={ name="セールフィベルト+1", augments={'Path: A',}},
        left_ear={ name="胡蝶のイヤリング", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear="スラッドピアス",
        left_ring="スローダリング",
        right_ring="王将の指輪",
        back={ name="ブリガンチアマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}},
    }

    --WSクリティカル
    sets.precast.WS.Critical = {
        ammo="ノブキエリ",
        head="ＰＥメザイユ+3",
        body="グレティキュイラス",
        hands="グレティガントレ",
        legs="ＰＥキュイソー+3",
        feet="グレティブーツ",
        neck={ name="竜騎士の首輪+2", augments={'Path: A',}},
        waist="セールフィベルト+1",
        left_ear="胡蝶のイヤリング",
        right_ear={ name="ペルタスピアス+1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
        left_ring="ニックマドゥリング",
        right_ring="王将の指輪",
        back={ name="ブリガンチアマント", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Crit.hit rate+10','Phys. dmg. taken-10%',}},
    }

    --WS魔攻
    sets.precast.WS.Magic = {
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
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

    sets.midcast['スマイトブレス']       = {head="ＰＴアーメット+3"}
    sets.midcast['レストアブレス']       = {head="ＰＴアーメット+3"}
end