function init_weaponns()
    --デフォルト武器を設定
    send_command('gs c set MainWeapons BunzisRod')
    send_command('gs c set SubWeapons AmmurapiShield')
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 11

    --武器
    gear.BunzisRod             = {name="ブンジロッド"}
    gear.AmmurapiShield        = {name="アムラピシールド"}

    
    --待機装備（通常）
    sets.idle = {
        main="ブンジロッド",
        sub="アムラピシールド",
        ammo="ストンチタスラム",
        head="無の面",
        body="ＷＣコート+3",
        hands="ニャメガントレ",
        legs="ニャメフランチャ",
        feet="ニャメソルレット",
        neck="ソーサラストール+2",
        waist="無の腰当",
        left_ear="ハーティーピアス",
        right_ear={ name="ウィッケピアス+1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+12','Enmity-2',}},
        left_ring="メランリング",
        right_ring="シュネデックリング",
        back="無の外装",
    }
    
    --待機装備（リフレ）
    sets.idle.Refresh = set_combine(sets.idle,{
        head={ name="マーリンフード", augments={'Crit. hit damage +2%','Pet: Crit.hit rate +1','"Refresh"+2','Accuracy+4 Attack+4',}},
        body="ＷＣコート+3",
        hands={ name="マーリンダスタナ", augments={'AGI+6','Pet: STR+5','"Refresh"+2','Accuracy+8 Attack+8',}},
        legs={ name="マーリンシャルワ", augments={'CHR+8','STR+3','"Refresh"+2','Mag. Acc.+2 "Mag.Atk.Bns."+2',}},
        feet={ name="マーリンクラッコー", augments={'Weapon Skill Acc.+8','"Fast Cast"+2','"Refresh"+2',}},
        neck="シビルスカーフ",
        left_ring="スティキニリング+1",}
    )
    
    --走り回る用
    sets.Kiting={right_ring="シュネデックリング",}
    
    --監視用バフ
    sets.buff['マナウォール']   = {feet="ＷＣサボ+3"}

    --即時発動系
    sets.precast.JA['魔力の泉'] = { body="ＡＲコート+3"}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="マーリンフード", augments={'"Fast Cast"+5','DEX+9','Mag. Acc.+9',}},
        body={ name="マーリンジュバ", augments={'Mag. Acc.+26','"Fast Cast"+6','MND+1',}},
        hands={ name="マーリンダスタナ", augments={'"Mag.Atk.Bns."+8','"Fast Cast"+5','CHR+6',}},
        legs={ name="サイクロスラッパ", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
        feet={ name="マーリンクラッコー", augments={'"Mag.Atk.Bns."+2','"Fast Cast"+5','AGI+6','Mag. Acc.+14',}},
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="ロケイシャスピアス",
        left_ring="キシャールリング",
        right_ring="ラハブリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --FC（インパクト）
    sets.precast.FC['インパクト'] = set_combine(sets.precast.FC,{head=empty,body="トワイライトプリス",})
    
    --強化魔法
    sets.midcast['強化魔法']={
        sub="アムラピシールド",
        head={ name="テルキネキャップ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        body={ name="テルキネシャジュブ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="テルキネブラコーニ", augments={'"Cure" potency +7%','Enh. Mag. eff. dur. +10',}},
        feet={ name="テルキネピガッシュ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        neck="インカンタートルク",
        waist="エンブラサッシュ",
        right_ear="ミミルピアス",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }
    
    --魔命
    sets.midcast.magic_acc = {
        main="ブンジロッド",
        sub="アムラピシールド",
        ammo="ペムフレドタスラム",
        head="ＷＣペタソス+3",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck="無の喉輪",
        waist="無の腰当",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="キシャールリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back="無の外装",
    }
    
    --MPブースト
    sets.precast.WS.Mp={
        ammo="ガストリタスラム",
        head="ＷＣペタソス+3",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck={ name="ソーサラストール+2", augments={'Path: A',}},
        waist="エスカンストーン",
        left_ear="エテオレートピアス",
        right_ear="王将の耳飾り",
        left_ring={ name="メタモルリング+1", augments={'Path: A',}},
        right_ring="アルコンリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --WSモクシャ
    sets.precast.WS.SubtleBlow = 
    {
        neck={ name="バーシチョーカー+1", augments={'Path: A',}},
        waist="サリサフロイベルト",
        left_ear="ディグニタリピアス",
        left_ring="シーリチリング+1",
        right_ring="シーリチリング+1",
    }
    
    --共通WS定義読み込み
    init_weapon_skill()
    sets.precast.WS["ミルキル"] = { Normal=sets.precast.WS.Mp,
                                    SubtleBlow=set_combine(sets.precast.WS.Mp,sets.precast.WS.SubtleBlow)}


    --精霊弱体系
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast.magic_acc,{legs="ＡＲトンバン+3",feet="ＡＲサボ+3"})
    sets.midcast['弱体魔法'] = sets.midcast.magic_acc
    sets.midcast['暗黒魔法'] = sets.midcast.magic_acc
    sets.midcast['インパクト'] = set_combine(sets.midcast['弱体魔法'],{head=empty,body="トワイライトプリス",})

    --精霊魔法
    sets.midcast['精霊魔法'] = {
        main="ブンジロッド",
        sub="アムラピシールド",
        ammo="ペムフレドタスラム",
        head="ＷＣペタソス+3",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck="水影の首飾り",
        waist="チャネラーストーン",
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="フレキリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="タラナスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},    
    }

    sets.midcast['デス'] = {
        ammo="ガストリタスラム",
        head="ＷＣペタソス+3",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck={ name="ソーサラストール+2", augments={'Path: A',}},
        waist="闇輪の帯",
        left_ear="エテオレートピアス",
        right_ear="王将の耳飾り",
        left_ring={ name="メタモルリング+1", augments={'Path: A',}},
        right_ring="アルコンリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --ケアル
    sets.midcast.Cure={
        head={ name="ヴァニヤフード", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        body={ name="ヴァニヤローブ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        hands={ name="テルキネグローブ", augments={'"Cure" potency +8%','Enh. Mag. eff. dur. +10',}},
        legs={ name="ヴァニヤスロップス", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        feet={ name="ヴァニヤクロッグ", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
        neck="インカンタートルク",
        waist="コーネリアの黒帯",
        left_ear="メンデカントピアス",
        right_ear="エテオレートピアス",
        left_ring="スティキニリング+1",
        right_ring="レベッチェリング",
        back="ソレムニティケープ",
    }

    --MP節約
    sets.midcast['精霊魔法'].MPsavings = {
        body="ＳＰコート+4",
    }

end
