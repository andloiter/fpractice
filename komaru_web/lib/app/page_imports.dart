// メインページ
export 'package:komaru_web/app/app_page.dart';

// ui_room
// コマル修練場
export 'package:komaru_web/app/rooms/uiroom/top_ui_page.dart';
// ui_standard
export 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_widget_page.dart';
export 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_font_page.dart';
export 'package:komaru_web/app/rooms/uiroom/ui_standard/ui_standard_theme_page.dart';
// ui_pluto_grid
export 'package:komaru_web/app/rooms/uiroom/ui_pluto_grid/ui_pluto_grid_page.dart';
// ui_fluent_ui
export 'package:komaru_web/app/rooms/uiroom/ui_fluent_ui/ui_fluent_ui_page.dart';
// ui_optimus
export 'package:komaru_web/app/rooms/uiroom/ui_optimus/ui_optimus_page.dart';
// ui_katana_form
export 'package:komaru_web/app/rooms/uiroom/ui_katana_form/ui_katana_form_page.dart';
// ui_masamune_universal_ui
export 'package:komaru_web/app/rooms/uiroom/ui_masamune_universal_ui/ui_masamune_universal_ui_page.dart';

// chatroom
// バーコロイター
export 'package:komaru_web/app/rooms/chatroom/top_chat_page.dart';
export 'package:komaru_web/app/rooms/chatroom/%5Bid%5D_chat_master_page.dart';
export 'package:komaru_web/app/rooms/chatroom/%5Bid%5D_chat_ai_page.dart';

// idearoom
// コマルノート
export 'package:komaru_web/app/rooms/idearoom/top_idea_page.dart';

// inquiryroom
// コマル問い合わせ
export 'package:komaru_web/app/rooms/inquiryroom/top_inquiry_page.dart';

// ページ定義
enum PageEnum {
  // メインページ
  app('コマル'),
  ;

  const PageEnum(this.title);
  final String title;
}

// コマル修練場ページ定義
enum PUIRoomEnum {
  // コマル修練場メインページ
  uiTop('コマル修練場'),
  // 部品群
  uiStandardWidget('標準UI―部品'),
  // GoogleFont
  uiStandardFont('GoogleFont'),
  // Theme
  uiStandardTheme('Theme'),
  // PlutoGrid
  uiPlutoGrid('PlutoGrid'),
  // FluentUi
  uiFluentUi('FluentUI'),
  // Optimus
  uiOptimus('Optimus'),
  // KatanaForm
  uiKatanaForm('KatanaUI&Form'),
  // MasamuneUniversal
  uiMasamuneUniversal('MasamuneUniversalUI'),
  ;

  const PUIRoomEnum(this.title);
  final String title;
}

// バーコロイターページ定義
enum PChatRoomEnum {
  // バーコロイターメインページ
  chatTop('バーコロイター'),
  // バーコロイターマスターページ
  chatMaster('バーコロイター マスター呼び出し'),
  // バーコロイターAIページ
  chatAI('バーコロイター AI呼び出し'),
  ;

  const PChatRoomEnum(this.title);
  final String title;
}

// コマルノートページ定義
enum PIdeaRoomEnum {
  // コマルノートメインページ
  ideaTop('コマルノート'),
  ;

  const PIdeaRoomEnum(this.title);
  final String title;
}

// コマル問い合わせページ定義
enum PInquiryRoomEnum {
  // コマル問い合わせメインページ
  inquiryTop('コマル問い合わせ'),
  ;

  const PInquiryRoomEnum(this.title);
  final String title;
}
