function init_weaponns()
    send_command('gs c set MainWeapons '..windower.to_shift_jis('ブンジロッド')..'; wait 1; gs c set SubWeapons '..windower.to_shift_jis('アムラピシールド'))
end


function init_gear_sets()
    --ロックスタイル番号
    lockstyleset = 4

    --武器
    gear['ブンジロッド']        = {name="ブンジロッド"}
    gear['マランスタッフ']      = {name="マランスタッフ+1"}
    gear['エンキストラップ']    = {name="エンキストラップ"}
    gear['アムラピシールド']    = {name="アムラピシールド"}

    
    --待機装備（通常）
    sets.idle = {
        ammo="ストンチタスラム+1",
        head="無の面",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck="シビルスカーフ",
        waist="無の腰当",
        left_ear={ name="アスプロピアス", augments={'Path: A',}},
        right_ear="エテオレートピアス",
        left_ring={ name="メランリング", augments={'Path: A',}},
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
        
    -- バフ
    sets.buff['マナウォール']           = {feet="ＷＣサボ+3", back="タラナスケープ"}
    sets.precast.JA['魔力の泉']         = {body="ＡＲコート+3"}
    sets.precast.JA['精霊の印']         = {}
    sets.precast.JA['マナウォール']     = {}
    sets.precast.JA['カスケード']       = {}
    sets.precast.JA['エンミティダウス'] = {}
    sets.precast.JA['魔力の雫']         = {body="ＡＲコート+3"}
    sets.precast.JA['サテルソーサリー'] = {}

    --FC
    sets.precast.FC = {
        ammo="サピエンスオーブ",
        head={ name="マーリンフード", augments={'"Fast Cast"+5','DEX+9','Mag. Acc.+9',}},
        body={ name="マーリンジュバ", augments={'Mag. Acc.+26','"Fast Cast"+6','MND+1',}},
        hands={ name="アグゥゲージ", augments={'Path: A',}},
        legs="アグゥスロップス",
        feet={ name="マーリンクラッコー", augments={'"Mag.Atk.Bns."+2','"Fast Cast"+5','AGI+6','Mag. Acc.+14',}},
        neck="オルンミラトルク",
        waist="エンブラサッシュ",
        left_ear="マリグナスピアス",
        right_ear="ロケイシャスピアス",
        left_ring="メダダリング",
        right_ring="キシャールリング",
        back={ name="フィフォレケープ+1", augments={'Path: A',}},
    }

    --FC（インパクト）
    sets.precast.FC['インパクト'] = set_combine(sets.precast.FC,{head=empty,body="トワイライトプリス",})
    
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
    
    --共通WS定義読み込み
    init_weapon_skill()

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
    
    --弱体魔法
    sets.midcast['弱体魔法'] = {
        main={ name="マランスタッフ+1", augments={'Path: A',}},
        sub="エンキストラップ",
        ammo="ペムフレドタスラム",
        head="ＷＣペタソス+3",
        body="ＷＣコート+3",
        hands="ＷＣグローブ+3",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck={ name="ソーサラストール+2", augments={'Path: A',}},
        waist={ name="アキュイテベルト+1", augments={'Path: A',}},
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="キシャールリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="タラナスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},
    }
    
    --精霊弱体系
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['弱体魔法'], {hands="ＡＲグローブ+3",legs="アグゥスロップス",feet="ＡＲサボ+3",left_ring="メダダリング"})
    sets.midcast['インパクト'] = set_combine(sets.midcast.ElementalEnfeeble,{head=empty,body="トワイライトプリス",})
    sets.midcast['暗黒魔法'] = sets.midcast['弱体魔法'] 
    
    -- アスピル系
    sets.midcast.Aspir = set_combine(sets.midcast['暗黒魔法'] ,{
        head="妖蟲の髪飾り+1",
        feet="アグゥピガッシュ ",
        neck="エーラペンダント",
        waist="風鳥の帯",
        left_ring="エバネセンスリング",
        right_ring="アルコンリング",
    })

    -- ドレイン系
    sets.midcast.Drain = sets.midcast.Aspir

    --精霊魔法
    sets.midcast['精霊魔法'] = {
        main={ name="マランスタッフ+1", augments={'Path: A',}},
        sub="エンキストラップ",
        ammo={ name="ガストリタスラム+1", augments={'Path: A',}},
        head="エアハット+1",
        body="ＷＣコート+3",
        hands="アグゥゲージ",
        legs="ＷＣショウス+3",
        feet="ＷＣサボ+3",
        neck={ name="ソーサラストール+2", augments={'Path: A',}},
        waist={ name="アキュイテベルト+1", augments={'Path: A',}},
        left_ear="マリグナスピアス",
        right_ear="王将の耳飾り",
        left_ring="メダダリング",
        right_ring={ name="メタモルリング+1", augments={'Path: A',}},
        back={ name="タラナスケープ", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Occ. inc. resist. to stat. ailments+10',}},
    }

    sets.midcast['精霊魔法'].weak = sets.midcast['精霊魔法']

    sets.midcast['デス'] = set_combine(sets.midcast['精霊魔法'],{
        head="妖蟲の髪飾り+1",
        waist="闇輪の帯",
    })

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
