#!/usr/local/bin/perl
#
#  Date Generator
#

# 開始年月の設定
$yy_s = 1999; # start year(1997-2003)
$mm_s = 04;   # start month(01-12)
$dd_s = 01;   # start day(01-31)

# 終了年月の設定
$yy_e = 2005; # end year(1997-2003)
$mm_e = 03;   # end month(01-12)
$dd_e = 31;   # end day(01-31)

&gen_date($yy_s,$mm_s,$dd_s,$yy_e,$mm_e,$dd_e);


# 日付の連続生成
sub gen_date {
  my($yy_s,$mm_s,$dd_s,$yy_e,$mm_e,$dd_e) = @_;

  $yy = $yy_s;  # year(1997-2003)
  $mm = $mm_s;  # month(01-12)
  $dd = $dd_s;  # day(01-31)

  while (1) {
    # 年月日表示
    printf ("%04d%02d%02d\n", $yy, $mm, $dd);

    # 終了日判断
    if ($yy >= $yy_e) {
      if ($mm >= $mm_e) {
        if ($dd >= $dd_e) {
          last;
        }
      }
    }

    # 翌日計算
    $dd++;
    if ($mm == 2) {
      if ($dd > 28) {
        if ($dd > 29) {
          $mm++;
          $dd = 1;
        } else {
          if ($yy % 4) { # うるう年以外
            $mm++;
            $dd = 1;
          }
        }
      }
    } elsif (($mm == 4) || ($mm == 6) || ($mm == 9) || ($mm == 11)) {
      if ($dd > 30) {
        $mm++;
        $dd = 1;
      }
    } else {
      if ($dd > 31) {
        $mm++;
        $dd = 1;
      }
      if ($mm > 12) {
        $yy++;
        $mm = 1;
      }
    }
  }
}
