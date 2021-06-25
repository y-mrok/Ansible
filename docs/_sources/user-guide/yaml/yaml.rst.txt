.. _yaml:

##################################################
YAML
##################################################

.. _yaml-toha:

**************************************************
YAML とは
**************************************************
- 構造化されたデータを表現するためのフォーマット（形式）
- 表現形式は「シーケンス」、「マッピング」の 2 種類
- 設定ファイル、データ交換用フォーマット、ログなどの記述に使用する
- Ansible ではインベントリやプレイの記述に使用する
- ファイル拡張子は :file:`.yml` または :file:`.yaml` を使用する

.. _yaml-no-kihonkozo:

**************************************************
基本構造
**************************************************
- "---" で始まる
- "..." で終わる
- ``#`` から行末までがコメント
- 半角空白 x 2 個のインデントでデータ構造のネストを表現する

.. _yaml-sequence:

**************************************************
シーケンス
**************************************************
- 先頭に "- " を付けて表現する
- 「リスト」と呼ぶこともある

.. code-block:: none

   - Hokkaido
   - Aomori
   - Ibaraki

.. _yaml-mapping:

**************************************************
マッピング
**************************************************
- "キー: 値" の形式で表現する
- 「ハッシュ」、「辞書」と呼ぶこともある

.. code-block:: none

   Hokkaido: Sapporo
   Aomori: Aomori
   Ibaraki: Mito

.. _yaml-nest:

**************************************************
ネスト
**************************************************
- シーケンスやマッピングはネストできる

.. _yaml-nest-mapping:

マッピングをネストした例
==================================================
.. code-block:: none

   Hokkaido:
     kubun: Hokkaido
     todofukencho: Sapporo
   Aomori:
     kubun: Tohoku
     todofukencho: Aomori
   Ibaraki:
     kubun: Kanto
     todofukencho: Mito

シーケンスの中にマッピングをネストした例
==================================================
.. code-block:: none

   - todofukenmei: Hokkaido
     kubun: Hokkaido
     todofukencho: Sapporo
   - todofukenmei: Aomori
     kubun: Tohoku
     todofukencho: Aomori
   - todofukenmei: Ibaraki
     kubun: Kanto
     todofukencho: Mito

マッピングの中にシーケスをネストした例
==================================================
.. code-block:: none

   todofukenmei:
     - Hokkaido
     - Aomori
     - Ibaraki
   kubun:
     - Hokkaido
     - Tohoku
     - Kanto
   todofukencho:
     - Sapporo
     - Aomori
     - Mito

複雑にネストした例
==================================================
.. code-block:: none

   - name: Install a packates
     dnf:
       name: "{{ packages }}"
       state: latest
     vars:
       packages:
         - httpd
         - mariadb-server
         - php
         - php-mbstring
         - php-mysqli
     become: yes
