module Branding exposing (..)

import Html exposing (Html)
import Html.Attributes as A
import Svg exposing (Svg)
import Svg.Attributes
import Tailwind as T


logo : Html msg
logo =
    Html.div
        [ T.relative ]
        [ Html.div
            [ T.max_w_xs
            , T.mx_auto
            , T.text_gray_200
            , T.w_full

            -- Dark mode
            ------------
            , T.dark__text_gray_500
            ]
            [ logoSvg ]

        -----------------------------------------
        -- Auth tag
        -----------------------------------------
        , Html.div
            [ A.style "font-size" "11px"
            , A.style "padding" "3px 4px 2px 5px"

            --
            , T.absolute
            , T.bg_pink
            , T.font_display
            , T.font_medium
            , T.neg_translate_x_2
            , T.right_0
            , T.rounded
            , T.top_0
            , T.text_xs
            , T.text_white
            , T.tracking_widest
            , T.transform
            , T.uppercase

            -- Dark mode
            ------------
            , T.dark__bg_purple_shade
            ]
            [ Html.text "Auth"
            ]
        ]


logoSvg : Svg msg
logoSvg =
    Svg.svg
        [ Svg.Attributes.height "80"
        , Svg.Attributes.style "width: 100%"
        , Svg.Attributes.viewBox "0 0 328 80"
        , Svg.Attributes.width "328"
        ]
        [ Svg.path
            [ Svg.Attributes.d "m.624518 26.4094167h12.174915v-14.9783929c0-6.2902299 3.14852-10.6343114 10.509969-10.6343114h18.453147v12.5109546h-13.042074c-1.873073 0-2.809596 1.0425691-2.809596 3.1277387v9.974011h41.623641v51.7119458h-13.111447v-39.2009912h-28.512194v39.2009912h-13.111446v-39.2009912h-12.174915zm53.922505-25.6127043h13.007388v13.0322444h-13.007388zm37.964363 40.208818c0 1.6681357.867151 2.8670902 2.601478 3.5968995s4.890755 1.3379747 9.469378 1.8245142c5.272354.5560452 9.573421 2.1372751 12.903328 4.743737 3.329908 2.6064619 4.994837 6.2380777 4.994837 10.8949563v.6255477c0 5.1434182-1.873045 9.2441901-5.619191 12.3024387-3.746147 3.0582487-9.018422 4.5873501-15.816984 4.5873501-4.023638 0-7.457554-.5212846-10.30185-1.5638694-2.844297-1.0425847-5.202946-2.3457961-7.076019-3.9096733-1.873074-1.5638771-3.312543-3.3014923-4.318453-5.2128977s-1.682287-3.7706537-2.029153-5.5778006l12.070856-3.9618023c.554985 2.2241808 1.716967 4.1703098 3.48598 5.8384454 1.769014 1.6681357 4.491866 2.502191 8.168639 2.502191 3.260535 0 5.497784-.5039084 6.711812-1.5117404 1.214029-1.0078319 1.821035-2.1025295 1.821035-3.2841256 0-.6950565-.156087-1.3379741-.468266-1.9287721-.312179-.5907981-.884498-1.1468349-1.716975-1.6681273s-1.959773-.9556962-3.381921-1.3032245c-1.422148-.3475282-3.208478-.6255467-5.359044-.8340636-5.827339-.4865396-10.457922-1.9982648-13.89189-4.5352211-3.433967-2.5369562-5.150925-6.2728289-5.150925-11.2077301v-.6255478c0-2.5717091.554976-4.8306088 1.664945-6.7767671 1.10997-1.9461582 2.566782-3.5968926 4.370483-4.9522528 1.8037-1.3553602 3.884861-2.3805532 6.243546-3.0756097 2.358684-.6950565 4.786706-1.0425796 7.284137-1.0425796 3.260534 0 6.087445.3996515 8.480816 1.1989665 2.393372.799315 4.422504 1.8418841 6.087458 3.1277387 1.664954 1.2858545 3.017709 2.710699 4.058305 4.2745761 1.040596 1.5638772 1.838374 3.0756024 2.393359 4.5352211l-11.862737 4.7958659c-.624358-1.8766525-1.699625-3.3536255-3.225833-4.4309631-1.526207-1.0773375-3.50331-1.6159983-5.931368-1.6159983-2.219939 0-3.884868.3996515-4.994837 1.1989665s-1.664946 1.7897557-1.664946 2.9713517zm50.676782 0c0 1.6681357.867151 2.8670902 2.601478 3.5968995s4.890755 1.3379747 9.469378 1.8245142c5.272354.5560452 9.573421 2.1372751 12.903329 4.743737 3.329907 2.6064619 4.994836 6.2380777 4.994836 10.8949563v.6255477c0 5.1434182-1.873045 9.2441901-5.619191 12.3024387-3.746146 3.0582487-9.018421 4.5873501-15.816983 4.5873501-4.023639 0-7.457555-.5212846-10.301851-1.5638694-2.844297-1.0425847-5.202946-2.3457961-7.076019-3.9096733-1.873073-1.5638771-3.312543-3.3014923-4.318453-5.2128977s-1.682287-3.7706537-2.029152-5.5778006l12.070855-3.9618023c.554985 2.2241808 1.716967 4.1703098 3.48598 5.8384454 1.769014 1.6681357 4.491866 2.502191 8.16864 2.502191 3.260534 0 5.497783-.5039084 6.711812-1.5117404 1.214029-1.0078319 1.821034-2.1025295 1.821034-3.2841256 0-.6950565-.156087-1.3379741-.468266-1.9287721-.312179-.5907981-.884498-1.1468349-1.716975-1.6681273s-1.959773-.9556962-3.381921-1.3032245c-1.422148-.3475282-3.208478-.6255467-5.359044-.8340636-5.827339-.4865396-10.457922-1.9982648-13.89189-4.5352211-3.433967-2.5369562-5.150925-6.2728289-5.150925-11.2077301v-.6255478c0-2.5717091.554976-4.8306088 1.664945-6.7767671 1.10997-1.9461582 2.566783-3.5968926 4.370483-4.9522528s3.884861-2.3805532 6.243546-3.0756097c2.358684-.6950565 4.786706-1.0425796 7.284137-1.0425796 3.260535 0 6.087445.3996515 8.480817 1.1989665 2.393371.799315 4.422503 1.8418841 6.087457 3.1277387 1.664954 1.2858545 3.017709 2.710699 4.058305 4.2745761 1.040596 1.5638772 1.838375 3.0756024 2.393359 4.5352211l-11.862737 4.7958659c-.624358-1.8766525-1.699625-3.3536255-3.225832-4.4309631-1.526208-1.0773375-3.503311-1.6159983-5.931369-1.6159983-2.219939 0-3.884868.3996515-4.994837 1.1989665s-1.664946 1.7897557-1.664946 2.9713517zm49.144608-2.0851591h-12.136012v-12.5109546h25.247459v51.7324021l-13.111447-.0204563zm.11646-38.1236589h13.007388v13.0322444h-13.007388zm77.728513 52.0942249c0 4.3093504-.728407 8.1147277-2.185242 11.4162461-1.456834 3.3015184-3.433937 6.0817028-5.931368 8.3406364-2.497431 2.2589337-5.359028 3.9791728-8.584876 5.1607688-3.225848 1.1815961-6.607735 1.7723853-10.145762 1.7723853-3.538028 0-6.919915-.5907892-10.145763-1.7723853-3.225848-1.181596-6.087445-2.9018351-8.584876-5.1607688-2.497431-2.2589336-4.474534-5.039118-5.931368-8.3406364-1.456835-3.3015184-2.185241-7.1068957-2.185241-11.4162461v-1.2510954c0-4.2398447.728406-8.0104697 2.185241-11.3119882 1.456834-3.3015184 3.433937-6.0990789 5.931368-8.3927654 2.497431-2.2936864 5.359028-4.0313016 8.584876-5.2128977s6.607735-1.7723853 10.145763-1.7723853c3.538027 0 6.919914.5907892 10.145762 1.7723853s6.087445 2.9192113 8.584876 5.2128977c2.497431 2.2936865 4.474534 5.091247 5.931368 8.3927654 1.456835 3.3015185 2.185242 7.0721435 2.185242 11.3119882zm-26.847248 14.1790819c1.873073 0 3.64206-.3127707 5.307014-.9383216 1.664954-.6255508 3.121766-1.5291107 4.370482-2.7107068 1.248715-1.1815961 2.237267-2.6238167 2.965684-4.3267051.728418-1.7028885 1.092621-3.6316414 1.092621-5.7863165v-2.0851591c0-2.1546752-.364203-4.0834281-1.092621-5.7863166-.728417-1.7028884-1.716969-3.145109-2.965684-4.3267051-1.248716-1.1815961-2.705528-2.085156-4.370482-2.7107068-1.664954-.6255509-3.433941-.9383216-5.307014-.9383216-1.873074 0-3.642061.3127707-5.307015.9383216-1.664954.6255508-3.121766 1.5291107-4.370482 2.7107068-1.248715 1.1815961-2.237267 2.6238167-2.965684 4.3267051-.728418 1.7028885-1.092621 3.6316414-1.092621 5.7863166v2.0851591c0 2.1546751.364203 4.083428 1.092621 5.7863165.728417 1.7028884 1.716969 3.145109 2.965684 4.3267051 1.248716 1.1815961 2.705528 2.085156 4.370482 2.7107068 1.664954.6255509 3.433941.9383216 5.307015.9383216zm49.303312 11.0513433h-13.111446v-51.7119458h13.111446v7.7150887h1.873064c1.179343-2.9192373 3.087074-5.1781371 5.723251-6.7767671s5.723233-2.397933 9.26126-2.397933c2.497431 0 4.838737.3996515 7.023989 1.1989665s4.110326 2.0330218 5.77528 3.7011574c1.664954 1.6681357 2.96568 3.7880262 3.902216 6.3597353.936537 2.5717091 1.404798 5.6299119 1.404798 9.1747001v32.7369979h-13.111446v-29.4007434c0-3.6837995-.884494-6.5856169-2.653507-8.7055392-1.769014-2.1199224-4.318436-3.1798677-7.648344-3.1798677-3.884893 0-6.781176 1.3032114-8.688935 3.9096734-1.90776 2.6064619-2.861626 6.0990684-2.861626 10.4779245z"
            , Svg.Attributes.fill "currentColor"
            ]
            []
        ]
