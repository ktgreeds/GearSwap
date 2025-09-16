weather = {}
weather_strong = {}
weaken_element = {}
elemental_obi = {}

-- 弱天候
weather['火'] = '熱波'
weather['水'] = '雨'
weather['雷'] = '雷'
weather['土'] = '砂塵'
weather['風'] = '風'
weather['氷'] = '雪'
weather['光'] = 'オーロラ'
weather['闇'] = '妖霧'

-- 強天候
weather_strong['火'] = '灼熱波'
weather_strong['水'] = 'スコール'
weather_strong['雷'] = '雷雨'
weather_strong['土'] = '砂嵐'
weather_strong['風'] = '暴風'
weather_strong['氷'] = '吹雪'
weather_strong['光'] = '神光'
weather_strong['闇'] = '闇'

-- 弱点属性
weaken_element['火'] = '水'
weaken_element['水'] = '雷'
weaken_element['雷'] = '土'
weaken_element['土'] = '風'
weaken_element['風'] = '氷'
weaken_element['氷'] = '火'
weaken_element['光'] = '闇'
weaken_element['闇'] = '光'

-- 所持している属性帯(所持していない場合はnil)
elemental_obi = {}
elemental_obi['火'] = {waist="火輪の帯",}
elemental_obi['水'] = {waist="水輪の帯",}
elemental_obi['雷'] = {waist="雷輪の帯",}
elemental_obi['土'] = {waist="土輪の帯",}
elemental_obi['風'] = {waist="風輪の帯",}
elemental_obi['氷'] = {waist="氷輪の帯",}
elemental_obi['光'] = {waist="光輪の帯",}
elemental_obi['闇'] = {waist="闇輪の帯",}

hachirin = nil

function get_hachirin(spell_element)
    if elemental_obi[spell_element] then -- 属性帯がある場合
        if spell_element == world.weather_element or spell_element == world.day_element then
            return elemental_obi[spell_element]
        else
            return nil
        end
    else -- 八輪の帯を使用する場合
        if weather_strong[spell_element] == world.weather then -- 強天候
            return hachirin
        elseif weather[spell_element] == world.weather 
               and world.day_element ~= weaken_element[spell_element] then -- 弱天候 かつ 弱点属性曜日でない
            return hachirin
        elseif world.day_element == spell_element
               and world.weather ~= weather_strong[weaken_element[spell_element]]
               and world.weather ~= weather[weaken_element[spell_element]] then -- 同属性曜日 かつ 天候が非干渉 
            return hachirin
        else
            return nil
        end
    end
end