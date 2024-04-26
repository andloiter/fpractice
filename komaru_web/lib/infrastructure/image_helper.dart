// イメージ定義
enum ImageEnum {
  // コマルアイコン
  komaru('images/komaru_icon_maru.png'),
  // ラーメンアイコン
  ramen('images/food_cup_ra-men_close.png'),
  // 会議中アイコン
  kaigichu('images/text_company_kaigichu.png'),
  // クリックアイコン
  click('images/computer_cursor_finger_white.png'),
  ;

  const ImageEnum(this.path);
  final String path;
}

// 背景イメージ定義
enum IBGroundEnum {
  // 雲の上 空
  heavenSky('images/bgrounds/bg_heaven_tengoku.jpg'),
  // 昼間 空
  noonSky('images/bgrounds/time2_hiru.png'),
  // 夕方 空
  eveningSky('images/bgrounds/time3_yuu.png'),
  // 夜 空
  nightSky('images/bgrounds/time4_yoru.png'),
  // バー
  bar('images/bgrounds/smallbar.jpg'),
  // 夕方 寄り道
  loiter('images/bgrounds/bg_dote_yuyake.jpg'),
  // 野原
  nohara('images/bgrounds/bg_ground.png'),
  ;

  const IBGroundEnum(this.path);
  final String path;
}

// 本イメージ定義
enum IBookEnum {
  // 緑本閉じるアイコン
  greenClose('images/books/book1_green.png'),
  // オレンジ本閉じるアイコン
  orangeClose('images/books/book2_orange.png'),
  // 青本閉じるアイコン
  blueClose('images/books/book3_blue.png'),
  // 赤本閉じるアイコン
  redClose('images/books/book4_red.png'),
  // 赤本開くアイコン
  redOpen('images/books/book_zabuton.png'),
  // 黒歴史
  blackClose('images/books/note_kurorekishi.png'),
  ;

  const IBookEnum(this.path);
  final String path;
}

// ドアイメージ定義
enum IDoorEnum {
  // ドア閉じるアイコン
  close('images/doors/door_close.png'),
  // ドア半開きアイコン
  half('images/doors/door_half_open.png'),
  // ドア開くアイコン
  open('images/doors/door_open.png'),
  ;

  const IDoorEnum(this.path);
  final String path;
}

// 画鋲イメージ定義
enum IGabyouEnum {
  // 青
  blue('images/gabyous/gabyou_pinned_plastic_blue.png'),
  // 緑
  green('images/gabyous/gabyou_pinned_plastic_green.png'),
  // 紫
  purple('images/gabyous/gabyou_pinned_plastic_purple.png'),
  // 赤
  red('images/gabyous/gabyou_pinned_plastic_red.png'),
  // 白
  white('images/gabyous/gabyou_pinned_plastic_white.png'),
  // 黄色
  yellow('images/gabyous/gabyou_pinned_plastic_yellow.png'),
  ;

  const IGabyouEnum(this.path);
  final String path;
}

// 紙飛行機イメージ定義
enum IKamihikoukiEnum {
  // 表
  omote('images/kamihikoukis/kamihikouki_omote.png'),
  // 裏
  ura('images/kamihikoukis/kamihikouki_ura.png'),
  ;

  const IKamihikoukiEnum(this.path);
  final String path;
}

// ノートイメージ定義
enum INoteEnum {
  // ノート閉じるアイコン
  greenClose('images/notes/book_sasshi3_green.png'),
  // ノート開くアイコン
  greenOpen('images/notes/food_cup_ra-men_close.png'),
  ;

  const INoteEnum(this.path);
  final String path;
}
