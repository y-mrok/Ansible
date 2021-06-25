.. _plugin-lookup:

##################################################
lookup プラグイン
##################################################
- プレイブックから外部ソース（ファイル、データベース 等）にアクセスする機能を提供する

.. _plugin-lookup-koubun:

**************************************************
構文
**************************************************

.. code-block:: yaml

   lookup('プラグイン名', 引数)

.. _filter-dlookup-rei:

**************************************************
使用例
**************************************************

.. _filter-dlookup-rei-1:

file
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 2, 5

   * - プラグイン名
     - 引数
     - 動作
   * - file
     - ファイルのパス
     - 引数に指定したファイルの内容を取得する

テキストファイルの内容を読み取るプレイです。

.. literalinclude:: ./yaml/plugin1.yml
   :language: yaml
   :emphasize-lines: 11

コントロールノード上の読み取るファイルの内容です。

.. literalinclude:: ./yaml/testfile.txt
   :language: none

実行ログです。改行コードは \\n で表示されました。

.. literalinclude:: ./log/plugin1.log
   :language: none

.. _filter-dlookup-rei-2:

csvfile
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 3, 3

   * - プラグイン名
     - 引数
     - 動作
   * - csvfile
     - | 検索する文字列
       | file= CSV ファイルのパス
       | delimiter=区切り文字（デフォルト：タブ文字）
       | col=取り出す値のカラム番号（ゼロオリジン, デフォルト：1 ）
     - CSV ファイルの最初のカラム（ col=0 ）の中から「検索する文字列」に合致する文字列を検索し、指定したカラム番号の項目の値を返す

アカウントを作成するプレイです。アカウントのパスワードとコメントは CSV ファイルから読み取ります。

.. literalinclude:: ./yaml/plugin2.yml
   :language: yaml
   :emphasize-lines: 10-11

コントロールノード上の読み取る CSV ファイルの内容です。

.. literalinclude:: ./yaml/passwd.csv
   :language: none

実行ログです。

.. literalinclude:: ./log/plugin2.log
   :language: none

実行後の管理対象ノードの :file:`/etc/passwd` ファイルと :file:`/etc/shadow` ファイルの内容です。 CSV ファイルから取得した値がセットされています（パスワードはハッシュ化後の値）。

.. literalinclude:: ./log/plugin2-1.log
   :language: none

.. _filter-dlookup-rei-3:

env
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 2, 5

   * - プラグイン名
     - 引数
     - 動作
   * - env
     - 取得する環境変数名
     - 引数に指定した環境変数の値を取得する

環境変数 PATH の値を取得するプレイです。

.. literalinclude:: ./yaml/plugin3.yml
   :language: yaml
   :emphasize-lines: 9

コントロールノードの環境変数 PATH の値です。

.. literalinclude:: ./log/plugin3-1.log
   :language: none

実行ログです。指定した環境変数の値を取得しました。

.. literalinclude:: ./log/plugin3.log
   :language: none

.. _filter-dlookup-rei-4:

ini
==================================================
.. list-table::
   :header-rows: 1
   :widths: 1, 3, 3

   * - プラグイン名
     - 引数
     - 動作
   * - ini
     - | 検索するキー（文字列）
       | section=キーを検索するセクション
       | file= CSV ファイルのパス
     - ini ファイルから指定したキーの値を取得する

ini ファイルから製品版のユーザー名を取得するプレイです。

.. literalinclude:: ./yaml/plugin4.yml
   :language: yaml
   :emphasize-lines: 9

コントロールノード上の読み取る ini ファイルの内容です。

.. literalinclude:: ./yaml/testfile.ini
   :language: none

実行ログです。指定したセクション（ production ）内の値を表示しました。

.. literalinclude:: ./log/plugin4.log
   :language: none
